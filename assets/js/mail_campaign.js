var globalModalValue = '';
var dt_mail_campaign_list;

$(function() {

    $("#mailTemplateSelector").select2({
        minimumResultsForSearch: -1
    });
    $("#mailSenderSelector").select2({
        minimumResultsForSearch: -1
    });
    $("#mailConfigSelector").select2({
        minimumResultsForSearch: -1
    });

    $('#datetimepicker_launch').daterangepicker({
        timePicker: true,
        defaultDate: new Date(),
        format: 'DD-MM-YYYY hh:mm A',
        startDate: moment().startOf('hour'),
        endDate: moment().startOf('hour').add(32, 'hour'),
        locale: {
        format: 'DD/MM/YYYY hh:mm A'
        }
    });

});

function pullMailCampaignFieldData() {
    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "pull_mail_campaign_field_data"
         })
    }).done(function (data) {
        console.log(data);
        if(!data['error']){  // no data error
            $.each(data.user_group, function() {
                $('#employees').append('<option value="' + this.user_group_id +'/'+this.user_group_name +'">' + this.user_group_name + '</option>');
            });

            $.each(data.mail_template, function() {
                $('#mailTemplateSelector').append('<option value="' + this.mail_template_id + '">' + this.mail_template_name + '</option>');
            });

            $.each(data.mail_sender, function() {
                if(this.status == 0){
                    $('#mailSenderSelector').append('<option value="' + this.sender_list_id + '">' + this.sender_name + ' (DEFAULT)</option>');
                }
                $('#mailSenderSelector').append('<option value="' + this.sender_list_id + '">' + this.sender_name + '</option>');
            });

            $.each(data.mail_config, function() {
                $('#mailConfigSelector').append('<option value="' + this.mconfig_id + '">' + this.mconfig_name + '</option>');
            });

            $('#mailConfigSelector').val("default").trigger('change'); 
            $('#mailConfigSelector').val("default").trigger('change'); 
            $('select[name="employees[]"]').bootstrapDualListbox({
                nonSelectedListLabel: 'Available',
                selectedListLabel: 'Selected',
                preserveSelectionOnMove: 'moved',
                moveAllLabel: 'Move all',
                removeAllLabel: 'Remove all'
             });
        }
    }); 
}

function getMailCampaignFromCampaignListId(id) {
    if (id == "new") {
        getRandomId();
        return;
    } else
        nextRandomId = id;

    $.when(pullMailCampaignFieldData()).then(function() {
        $.post({
            url: "manager/mail_campaign_manager",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({ 
                action_type: "get_campaign_from_campaign_list_id",
                campaign_id: id
             }),
        }).done(function (data) {
            if(!data.result){  // if not error response
                $('#mail_campaign_name').val(data.campaign_name);

                try {
                    $("#mailTemplateSelector").val(data.campaign_data.mail_template.id);
                    $("#mailTemplateSelector").trigger('change');
                } catch (err) {}

                try {
                    $("#mailSenderSelector").val(data.campaign_data.mail_sender.id);
                    $("#mailSenderSelector").trigger('change');
                } catch (err) {}

                try {
                    $('#mailConfigSelector').val(data.campaign_data.mail_config.id);
                    $('#mailConfigSelector').trigger('change');
                } catch (err) {}

                $("#datetimepicker_launch").val(data.scheduled_date).trigger('change');
                
                $('#range_campaign_time_min').val(data.campaign_data.msg_interval.split('-')[0]);
                $('#range_campaign_time_max').val(data.campaign_data.msg_interval.split('-')[1]);
                $('#tb_campaign_time_val').val(data.campaign_data.msg_interval);
                $('#tb_campaign_msg_retry').val(data.campaign_data.msg_fail_retry);
                $('#range_campaign_msg_retry').val(data.campaign_data.msg_fail_retry);

                // var date0 = data.date.split("-")[0]+''+data.scheduled_time+':00';
                var date0 = data.scheduled_time;
                var date = moment(date0, 'DD/MM/YYYY hh:mm:ss').format('YYYY-MM-DD hh:mm:ss');
                var diffTime = Math.abs(new Date().valueOf() - new Date(date).valueOf());
                var days = diffTime / (24*60*60*1000);
                var hours = (days % 1) * 24;
                var minutes = (hours % 1) * 60;
                var secs = (minutes % 1) * 60;
                [days, hours, minutes, secs] = [Math.floor(days), Math.floor(hours), Math.floor(minutes), Math.floor(secs)]

                if(new Date().valueOf() > new Date(date).valueOf() ){
                    $('#remainingtime').append('First batch of emails are scheduled in the Past.Please ensure the campaign is scheduled to occur in the future.');
                }else{
                    $('#remainingtime').append(`First batch of emails scheduled to deliver in: <span style="color:red;">${days} day(s), ${hours} hour(s) and ${minutes} minute(s) and ${secs} second(s)</span>.`);
                }
            }
            else
                toastr.error( 'Error getting data<br/>' + data.error);
        });         
    });
}

function promptSaveMailCampaign() {
    var date = $("#datetimepicker_launch").val();
    var time = $("#start_time").val();
    var date1 = date.split("-")[0]+''+time+':00';
    var date = moment(date1, 'DD/MM/YYYY hh:mm:ss').format('YYYY-MM-DD hh:mm:ss');

    if ($("#cb_act_deact_campaign").is(':checked') && (new Date(date).valueOf()) <= (new Date($.now()))) {
        $('#modal_prompts').modal('toggle');
        $("#modal_prompts_body").text("");
        $("#modal_prompts_body").append("The scheduled time is in past. This will start the campaign immediately. Do you want to save and start campaign \"" + $('#mail_campaign_name').val() + "\"?<br/><br/><i>Note: This will delete previous results of this campaign</i>");
        $("#modal_prompts_confirm_button").replaceWith(`<button type="button" class="btn btn-danger" id="modal_prompts_confirm_button" onClick="saveMailCampaignAction()">Save</button>`);
    } else
        saveMailCampaignAction();
}

function saveMailCampaignAction() {
    var employees1 = $('#employees').val();

    var id=[];
    var name=[];
    $.each(employees1, function(key,val) {
        var emp = val.split("/")
        id.push(emp[0]);
        name.push(emp[1]);
    });

    var emp_id = id.join();
    var emp_name = name.join();

    var campaignData = {};

    var campaign_name = $('#mail_campaign_name').val();
    campaignData.user_group = {id:emp_id, name:emp_name};
    campaignData.mail_template = {id:$('#mailTemplateSelector').val(), name:$('#mailTemplateSelector :selected').text()};
    campaignData.mail_sender = {id:$('#mailSenderSelector').val(), name:$('#mailSenderSelector :selected').text()};
    campaignData.mail_config = {id:$('#mailConfigSelector').val(), name:$('#mailConfigSelector :selected').text()};
    campaignData.msg_interval = $('#tb_campaign_time_val').val();
    campaignData.msg_fail_retry = $('#range_campaign_msg_retry').val();
    
    var employees = {};
    employees.user_group = {id:emp_id, name:emp_name};
    employees.mail_template = {id:$('#mailTemplateSelector').val(), name:$('#mailTemplateSelector :selected').text()};
    employees.mail_sender = {id:$('#mailSenderSelector').val(), name:$('#mailSenderSelector :selected').text()};
    employees.mail_config = {id:$('#mailConfigSelector').val(), name:$('#mailConfigSelector :selected').text()};
    employees.msg_interval = $('#tb_campaign_time_val').val();
    employees.msg_fail_retry = $('#range_campaign_msg_retry').val();
   
    
    var emp_type=$('#emp_type').val();

    if(emp_type==0){
        if(($('#employees').val()).length === 0){
            $("#employees").parent().css("border", "1px solid red");
            toastr.error( 'None Choosen!');
            return;
        }
    }

    var scheduled_date = $("#datetimepicker_launch").val();

    if ($("#cb_act_deact_campaign").is(':checked'))
        var cb_act_deact_campaign = 1;
    else
        var cb_act_deact_campaign = 0;

    if (RegTest(campaign_name, 'COMMON') == false) {
        $("#mail_campaign_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character!');
        return;
    } else
        $("#mail_campaign_name").removeClass("is-invalid");

    if ($('#mailTemplateSelector').val() == null) {
        $("#mailTemplateSelector").parent().css("border", "1px solid red");
        toastr.error( 'None selected!');
        return;
    } else
        $("#mailTemplateSelector").parent().css("border", "0px");

    if ($('#mailSenderSelector').val() == null) {
        $("#mailSenderSelector").parent().css("border", "1px solid red");
        toastr.error( 'None selected!');
        return;
    } else
        $("#mailSenderSelector").parent().css("border", "0px");

    enableDisableMe($("#bt_saveMailCamp"));

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "save_campaign_list",
            campaign_id: nextRandomId,
            campaign_name: campaign_name,
            scheduled_date: scheduled_date,
            campaign_data: campaignData,
            camp_status: cb_act_deact_campaign,
            employees:employees
         }),
    }).done(function (response) {
        if(response.result == "success"){ 
            if($('#modal_new_config').hasClass('show'))   {     
                $('#modal_new_config').modal('toggle');
            }                
            toastr.success( 'Saved successfully!');   
            setTimeout(function() {
                document.location = "mailcampaignlist";
            }, 1000);
        }
        else
            toastr.error( response.error);
        enableDisableMe($("#bt_saveMailCamp"));
    }); 
}

function promptMailCampActDeact(id, campaign_name, action_value, curr_element) {
    $('#modal_prompts').modal('toggle');
    if (action_value == 0)
        $("#modal_prompts_body").html("Activate Email campaign \"" + campaign_name + "\"?<br/><br/><i>Note: If you have run this campaign before, this will delete previous results of the campaign. Instead, create a copy of the campaign and run.</i>");
    if (action_value == 1)
        $("#modal_prompts_body").text("Deactivate Email campaign \"" + campaign_name + "\"?");
    if (action_value == 2 || action_value == 4)
        $("#modal_prompts_body").text("Stop running Email campaign \"" + campaign_name + "\"?");

    $("#modal_prompts_confirm_button").replaceWith(`<button type="button" class="btn btn-danger" id="modal_prompts_confirm_button" onClick="mailCampStartStopAction('` + id + `','` + campaign_name + `','` + action_value + `')">Confirm</button>`);
    globalModalValue = curr_element;
}

function mailCampStartStopAction(id, campaign_name, action_value) {
    if (action_value == 2 || action_value == 4) // if in progress or mail sending completed, stop it and finish
        var new_action_value = 3;
    if (action_value == 1) //if scheduled, then inactivate it
        var new_action_value = 0;
    if (action_value == 0) //if inactive, then schedule it
        var new_action_value = 1;

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "start_stop_mailCampaign",
            campaign_id: id,
            action_value: new_action_value
         })
    }).done(function (response) {
        if(response.result == "success"){
            loadTableCampaignList();
            $('#modal_prompts').modal('toggle');

            if (new_action_value == 3)
                toastr.success( 'Success. Campaign Stopped!');
            if (new_action_value == 0)
                toastr.success( 'Success. Cmapaign deactivated!');
            if (new_action_value == 1)
                toastr.success( 'Success. Campaign scheduled!');
        }
        else
            toastr.error("", "Error making chnages!<br/>" + response.error);
    }); 
}

function promptMailCampaignDeletion(id, campaign_name) {
    globalModalValue = id;
    $('#modal_prompts').modal('toggle');
    $("#modal_prompts_body").text("This will delete Email campaign \"" + campaign_name + "\" and the action can't be undone!");
    $("#modal_prompts_confirm_button").replaceWith(`<button type="button" class="btn btn-danger" id="modal_prompts_confirm_button" onClick="mailCampaignDeletionAction()">Confirm</button>`);
}

function mailCampaignDeletionAction() {
    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "delete_campaign_from_campaign_id",
            campaign_id: globalModalValue
         })
    }).done(function (response) {
        if(response.result == "success"){
            $('#modal_prompts').modal('toggle');
            toastr.success( 'Deleted successfully!');
            loadTableCampaignList();
        }
        else
            toastr.error( 'Error deleting data!');
    }); 
}

function promptMailCampaignCopy(id) {
    globalModalValue = id;
    $('#modal_mail_campaign_copy').modal('toggle');
}

function mailCampaignCopyAction() {
    var modal_mail_campaign_name = $('#modal_mail_campaign_name').val();

    if (RegTest(modal_mail_campaign_name, 'COMMON') == false) {
        $("#modal_mail_campaign_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character!');
        return;
    } else
        $("#modal_mail_campaign_name").removeClass("is-invalid");

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "make_copy_campaign_list",
            campaign_id: globalModalValue,
            new_campaign_id: getRandomId(),
            new_campaign_name: modal_mail_campaign_name
         })
    }).done(function (response) {
        if(response.result == "success"){
            toastr.success( 'Copy success!');
            $('#modal_mail_campaign_copy').modal('toggle');
            loadTableCampaignList();
        }
        else
            toastr.error( 'Error making copy!');
    }); 
}

//-------------------------------------
function loadTableCampaignList() {
   
    try {
        dt_mail_campaign_list.destroy();
    } catch (err) {}
    $('#table_mail_campaign_list tbody > tr').remove();

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_campaign_list"
         })
    }).done(function (data) {
        $(function() {
            if(!data.error){
                $.each(data, function(key, value) {
                    var action_items_campaign_table = '';
                
                    if (value.camp_status == 0)
                        action_items_campaign_table += `<button type="button" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="top" title="Activate" onClick="promptMailCampActDeact('` + value.campaign_id + `','` + value.campaign_name + `','` + value.camp_status + `',$(this))"><i class="mdi mdi-play"></i></button>`;
                    if (value.camp_status == 2 || value.camp_status == 4)
                        action_items_campaign_table += `<button type="button" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Stop and Finish" onClick="promptMailCampActDeact('` + value.campaign_id + `','` + value.campaign_name + `','` + value.camp_status + `',$(this))"><i class="mdi mdi-stop"></i></button>`;
                    if (value.camp_status == 3)
                        action_items_campaign_table += `<button type="button" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="top" title="Start action disabled" disabled><i class="mdi mdi-play"></i></button>`;
                    if (value.camp_status == 1)
                        action_items_campaign_table += `<button type="button" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Deactivate" onClick="promptMailCampActDeact('` + value.campaign_id + `','` + value.campaign_name + `','` + value.camp_status + `',$(this))"><i class="mdi mdi-stop"></i></button>`;
                    
                    if(value.camp_status == 0 || value.camp_status == 3)
                        var option_edit = `<a class="dropdown-item" href="#" onClick="document.location='mailcampaignlist?action=edit&campaign=` + value.campaign_id + `','` + value.campaign_name + `'">Edit</a>`;
                    else
                        var option_edit = `<a class="dropdown-item" href="#" disabled>Edit</a>`;
    
                    action_items_campaign_table += `<div class="btn-group ml-sm-1 btn-group-table">
                            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More</button>
                            <div class="dropdown-menu">` +
                                option_edit +                             
                                `<a class="dropdown-item" href="#" onClick="promptMailCampaignDeletion('` + value.campaign_id + `','` + value.campaign_name + `')">Delete</a>
                                <a class="dropdown-item" href="#" onClick="promptMailCampaignCopy('` + value.campaign_id + `','` + value.campaign_name + `')">Copy</a>
                        </div></div></div>`;
                     

                    switch (value.camp_status) {
                        case "0":
                            var camp_status = `<span class="ff badge badge-pill badge-dark" data-toggle="tooltip" title="Not scheduled"><i class="mdi mdi-alert"></i> Inactive</span>`;
                            break;
                        case "1":
                            var camp_status = `<span class="badge badge-pill badge-warning" data-toggle="tooltip" title="Scheduled"><i class="mdi mdi-timer"></i> Scheduled</span>`;
                            break;
                        case "2":
                            var camp_status = `<span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Phishing status"><i class="mdi mdi-fish"></i> In-progress</span> <span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> In-progress</span>`;
                            break;
                        case "3":
                            var camp_status = `<span class="badge badge-pill badge-success" data-toggle="tooltip" title="Phishing status"><i class="mdi mdi-fish"></i> Completed</span>`;
                            break;
                        case "4":

                                var end_date = value.scheduled_datetime[0]['end_date'];
                                var end_time = value.scheduled_datetime[0]['end_time'];
                                
                                // Get the current date and time
                                var currentDate = new Date();
                                var currentTime = currentDate.getTime();
                                
                                // Parse the end date and time into a Date object
                                var endDate = new Date(end_date);
                                var endTime = new Date(end_time);
                                  
                                
                                if (endDate > currentDate) {
                                    var camp_status = `<span class="badge badge-pill badge-success" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> Completed</span> <span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Phishing status"><i class="mdi mdi-fish"></i> In-progress</span>`;
                                } else {
                                    if( endTime.getTime() > currentTime){
                                        var camp_status = `<span class="badge badge-pill badge-success" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> Completed</span> <span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Phishing status"><i class="mdi mdi-fish"></i> In-progress</span>`;
                                    }else{
                                        var camp_status = `<span class="badge badge-pill badge-success" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> Completed</span><span class="badge badge-pill badge-success" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> Completed</span> `;
                                    }
                                }
                         
                            break;
                    }                
                    
                    var date0 = value.scheduled_time;
                    var days = moment(moment(date0, 'DD/MM/YYYY hh:mm:ss').format('YYYY-MM-DD hh:mm:ss')).diff((moment.utc().format('YYYY-MM-DD hh:mm:ss')), 'days');
                    var hours = moment(moment(date0, 'DD/MM/YYYY hh:mm:ss').format('YYYY-MM-DD hh:mm:ss')).diff((moment.utc().format('YYYY-MM-DD hh:mm:ss')), 'hours');
                    var minutes = moment(moment(date0, 'DD/MM/YYYY hh:mm:ss').format('YYYY-MM-DD hh:mm:ss')).diff((moment.utc().format('YYYY-MM-DD hh:mm:ss')), 'minutes');
                    var secs = moment(moment(date0, 'DD/MM/YYYY hh:mm:ss').format('YYYY-MM-DD hh:mm:ss')).diff((moment.utc().format('YYYY-MM-DD hh:mm:ss')), 'seconds');

                    if(days>0){
                        if(hours>0){
                            if(minutes>0){
                                if(secs>0){
                                    var next_del = days+' days'+hours+' hours'+minutes+' minutes'+secs+' secs';
                                }
                                var next_del = days+' days'+hours+' hours'+minutes+' minutes';
                            }
                            var next_del = days+' days'+hours+' hours';
                        }
                        var next_del = days+' days';
                    }else{
                        if(hours>0){
                            var next_del = hours+' hours';
                        }else{
                            if(minutes>0){
                                var next_del = minutes+' minutes';
                            }else {
                                    if(secs>0){
                                       var next_del = secs+' sec';
                                    }else{
                                        var next_del = '-';
                                    }
                            }
                        }
                    }
                  
                    var start_date = value.scheduled_datetime[0]['start_date'];
                    var end_date = value.scheduled_datetime[0]['end_date'];
                    var start_time = value.scheduled_datetime[0]['start_time'];
                    var end_time = value.scheduled_datetime[0]['end_time'];

                    $("#table_mail_campaign_list tbody").append("<tr><td></td><td>" + value.campaign_name + "</td><td>" + value.campaign_data.mail_template.name + "</td><td data-order=\"" +start_date+ "\">" + (start_date==null?'-':(start_date)+' / '+end_date) + "</td><td data-order=\"" + (start_time) + "\">" + (start_time==null?'-':(start_time)+' - '+(end_time)) + "</td><td>"+ camp_status + "</td><td>"+ next_del+ "</td><td>" + action_items_campaign_table + "</td></tr>");
                });
            }
            dt_mail_campaign_list = $('#table_mail_campaign_list').DataTable({
                "aaSorting": [6, 'desc'],
                'pageLength': 20,
                'lengthMenu': [[20, 50, 100, -1], [20, 50, 100, 'All']],
                'columnDefs': [{
                    // "targets": [9,10],
                    "className": "dt-center"
                }],
                "preDrawCallback": function(settings) {
                    $('#table_mail_campaign_list tbody').hide();
                },
    
                "drawCallback": function() {
                    $('#table_mail_campaign_list tbody').fadeIn(500);
                    $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
                },

                "initComplete": function() {
                    $("label>select").select2({minimumResultsForSearch: -1, });
                }
            }); //initialize table
    
            dt_mail_campaign_list.on('order.dt_mail_campaign_list search.dt_mail_campaign_list', function() {
                dt_mail_campaign_list.column(0, {
                    search: 'applied',
                    order: 'applied'
                }).nodes().each(function(cell, i) {
                    cell.innerHTML = i + 1;
                });
            }).draw();            
        });
    });   
}

function rangeCampTimeChange(e) {
    range_campaign_time_min = Number($('#range_campaign_time_min').val());
    range_campaign_time_max = Number($('#range_campaign_time_max').val());

    if (range_campaign_time_max < range_campaign_time_min && event.srcElement.id == "range_campaign_time_max")
        $('#range_campaign_time_min').val(range_campaign_time_max);
    else
    if (range_campaign_time_max < range_campaign_time_min && event.srcElement.id == "range_campaign_time_min")
        $('#range_campaign_time_max').val(range_campaign_time_min);

    $('#tb_campaign_time_val').val(("0000" + range_campaign_time_min).slice(-4) + "-" + ("0000" + range_campaign_time_max).slice(-4));
}

$('#tb_campaign_time_val').on('keyup', function() {
    var min = $('#tb_campaign_time_val').val().split('-')[0];
    var max = $('#tb_campaign_time_val').val().split('-')[1];

    if(!Number(max) || min>max)
        $("#tb_campaign_time_val").addClass("is-invalid");
     else{
        $("#tb_campaign_time_val").removeClass("is-invalid");
        $('#range_campaign_time_min').val(min);
        $('#range_campaign_time_max').val(max);
    }
});

function rangeCampRetryFailChange(e){
    $('#tb_campaign_msg_retry').val($('#range_campaign_msg_retry').val());
}

$('#tb_campaign_msg_retry').on('keyup', function() {
    var tb_campaign_msg_retry = $('#tb_campaign_msg_retry').val();

    if(isNaN(tb_campaign_msg_retry) || tb_campaign_msg_retry>10 || tb_campaign_msg_retry<0 || tb_campaign_msg_retry == "")
        $("#tb_campaign_msg_retry").addClass("is-invalid");
     else{
        $("#tb_campaign_msg_retry").removeClass("is-invalid");
        $('#range_campaign_msg_retry').val(tb_campaign_msg_retry);
    }
});