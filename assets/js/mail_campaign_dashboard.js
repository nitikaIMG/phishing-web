var dt_mail_campaign_list, dt_mail_campaign_result;
var chart_live_mailcamp, radialchart_overview_mailcamp, piechart_mail_total_sent, piechart_mail_total_mail_open, piechart_mail_total_replied;
var g_tb_data_single = true;
var reply_emails = {};
var allReportColList=[], allReportColListSelected=[];
var dic_all_col={rid:'RID', user_name:'Name', user_email:'Email', sending_status:'Status', send_time:'Sent Time', send_error:'Send Error',mail_open:'Mail Open',mail_open_count:'Mail(open count)',mail_first_open:'Mail(first open)',mail_last_open:'Mail(last open)',mail_open_times:'Mail(all open times)',public_ip:'Public IP',user_agent:'User Agent',mail_client:'Mail Client',platform:'Platform',device_type:'Device Type',all_headers:'HTTP Headers',mail_reply:'Mail Reply',mail_reply_count:'Mail (reply count)',mail_reply_content:'Mail (reply content)', country:'Country', city:'City', zip:'Zip', isp:'ISP', timezone:'Timezone', coordinates:'Coordinates'};

$("#tb_camp_result_colums_list_mcamp").select2();
$("#modal_export_report_selector").select2({
    minimumResultsForSearch: -1,
});   

$(function() {
    Prism.highlightAll();
    loadTableCampaignList();
});

var camp_status_def = {
    0: `<span class="badge badge-pill badge-dark" data-toggle="tooltip" title="Not scheduled"><i class="mdi mdi-alert"></i> Inactive</span>`,
    1: `<span class="badge badge-pill badge-warning" data-toggle="tooltip" title="Scheduled"><i class="mdi mdi-timer"></i> Scheduled</span>`,
    2: `<span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> In-progress</span> <span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Phishing campaign status"><i class="mdi mdi-fish"></i> In-progress</span>`,
    3: `<span class="badge badge-pill badge-success" data-toggle="tooltip" title="Phishing campaign status"><i class="mdi mdi-fish"></i> Completed</span>`,
    4: `<span class="badge badge-pill badge-success" data-toggle="tooltip" title="Mail sending status"><i class="mdi mdi-email"></i> Completed</span> <span class="badge badge-pill badge-primary" data-toggle="tooltip" title="Phishing campaign status"><i class="mdi mdi-fish"></i> In-progress</span>`
};

var camp_table_status_def = {
    1: `<td><span class="badge badge-pill badge-primary" data-toggle="tooltip" title="In-progress">In-progress</td>`,
    2: `<td><span class="badge badge-pill badge-success" data-toggle="tooltip" title="Sent">Sent</td>`,
    3: `<td><span class="badge badge-pill badge-danger" data-toggle="tooltip" title="Error">Error</td>`,
    4: `<td><i class="fas fa-clock fa-lg" data-toggle="tooltip" title="Waiting..."></i><span hidden>Waiting...</span></td>`
};

var ele = $("#tb_camp_result_colums_list_mcamp").parent().find("ul.select2-selection__rendered");
ele.sortable({
    containment: 'parent',
    update: function() {
        getAllReportColListSelected();
    }
});

function getAllReportColListSelected(){
    allReportColListSelected=[];
    var allReportColListSelected =["rid", "user_name", "user_email", "sending_status", "send_time", "send_error", "mail_open","public_ip","mail_client","platform","device_type","mail_reply","country"];
    $.each($("#tb_camp_result_colums_list_mcamp").find("option"), function () {
        allReportColList[$(this).text()] = $(this).val();
    });

    $.each($("#tb_camp_result_colums_list_mcamp").parent().find("ul.select2-selection__rendered").children("li[title]"), function () {
        allReportColListSelected.push(allReportColList[this.title]);
    });
}

function refreshDashboard() {
    if (g_campaign_id != '')
        campaignSelected(g_campaign_id);
    loadTableCampaignList();
}

function loadTableCampaignList() {
    try {
        dt_mail_campaign_list.destroy();
    } catch (err) {}
    $("#table_mail_campaign_list tbody > tr").remove();

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: 'get_campaign_list'
        })
    }).done(function (data) {
        if(!data.error){  // no data
            $.each(data, function(key, value) {
                if(value.camp_status == 2 || value.camp_status == 3 || value.camp_status == 4){ // removes inactive or scheduled
                    action_items_campaign_table = `<button type="button" class="btn btn-info btn-sm" data-toggle="tooltip" data-placement="top" title="Select" data-dismiss="modal" onClick="campaignSelected('` + value.campaign_id + `'); window.history.replaceState(null,null, location.pathname + '?mcamp=` + value.campaign_id + `');">Select</button>`;
                    $("#table_mail_campaign_list tbody").append("<tr><td></td><td>" + value.campaign_name + "</td><td data-order=\"" + getTimestamp(value.scheduled_time) + "\">" + value.scheduled_time + "</td><td>" + camp_status_def[value.camp_status] + "</td><td>" + action_items_campaign_table + "</td></tr>");
                }
            });
        }
        
        dt_mail_campaign_list = $('#table_mail_campaign_list').DataTable({
            "aaSorting": [2, 'desc'],
            "pageLength": 5,
            "lengthMenu": [5, 10, 20, 50, 100],
            'columnDefs': [{
                "targets": [3, 4],
                "className": "text-center"
            }, ],
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
}

function viewReplyMails(mail_id) {
    $('#modal_reply_mails').modal('toggle');
    $("#modal_reply_mails_body ul").html("");
    $("#modal_reply_mails_body div").html("");

    $.each(reply_emails.msg_info[mail_id].msg_time, function(i, item) {
        if (i == 0) {
            $("#modal_reply_mails_body ul").first().append(`<li class="nav-item tab-header"> <a class="nav-link active" data-toggle="tab" href="#mail_body_` + i + `" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">Message ` + (i + 1) + `</span></a> </li>`);
            $("#modal_reply_mails_body div").first().append(`<div class="tab-pane active m-t-15" id="mail_body_` + i + `" role="tabpanel">
                    <div class="row m-b-5">             
                        <div class="col-md-6">  
                            <span class="card-title">Sender: ` + mail_id + `</span>
                        </div>                     
                        <div class="col-md-6 align-items-right ml-auto">                           
                            <span>Time: ` + item + `</span>
                        </div>
                    </div>
                    <div id="summernote_reply_mail` + i + `" ></div>
                </div>`);
        } else {
            $("#modal_reply_mails_body ul").first().append(`<li class="nav-item tab-header"> <a class="nav-link" data-toggle="tab" href="#mail_body_` + i + `" role="tab"><span class="hidden-sm-up"></span> <span class="hidden-xs-down">Message ` + (i + 1) + `</span></a> </li>`);
            $("#modal_reply_mails_body div").first().append(`<div class="tab-pane m-t-15" id="mail_body_` + i + `" role="tabpanel">
                        <div class="row m-b-5">             
                        <div class="col-md-6">  
                            <span class="card-title">Sender: ` + mail_id + `</span>
                        </div>                     
                        <div class="col-md-6 align-items-right ml-auto">                           
                            <span>Time: ` + item + `</span>
                        </div>
                    </div>
                    <div id="summernote_reply_mail` + i + `" ></div>
                </div>`);
        }

        $('#summernote_reply_mail' + i).summernote({
            popover: { image: [], },
            followingToolbar: true,
            height: 350,
            codeviewFilter: false,
            focus: true,
            lang: 'en-UK',
            cache: false,
            defaultFontName: 'Arial',
            toolbar: [],
        });
        $('#summernote_reply_mail' + i).summernote('code', (reply_emails.msg_info[mail_id]['msg_body'])[i].replace(/\r\n/g, "<br/>"));
        $('#summernote_reply_mail' + i).summernote('disable');
    });
}

function startLoaders() {
    $.each(['chart_live_mailcamp','radialchart_overview_mailcamp','piechart_mail_total_sent','piechart_mail_total_mail_open','piechart_mail_total_replied','table_mail_campaign_result'], function(i, id){
        $('#'+id).attr('hidden', true);
        $('#'+id).parent().find(".loader").length==0?$('#'+id).parent().append(displayLoader("Loading...")):null;
    });
}

function campaignSelected(campaign_id) {
    g_campaign_id = campaign_id;
    //-------------
    $.each([chart_live_mailcamp,radialchart_overview_mailcamp,piechart_mail_total_sent,piechart_mail_total_mail_open,piechart_mail_total_replied,dt_mail_campaign_result], function(i, graph){
        try {
            graph.destroy();
        } catch (err) {}
    });

    startLoaders();
    getAccessInfo();
    $('#table_mail_campaign_result thead').empty();
    $("#table_mail_campaign_result tbody > tr").remove();
    loadTableCampaignResult();
    //------------------------
    $("#succ_camp").html("");
    $("#del_camp").html("");
    $("#past_camp").html("");

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_campaign_from_campaign_list_id",
            tk_id : g_tk_id,
            campaign_id: g_campaign_id,
        })
    }).done(function (data) {
        $("#ModalCampaignList").modal("toggle");
        if(!data.error){
            $('#disp_camp_name').text(data.campaign_name);
            $('#disp_camp_start').text(data.scheduled_time);
            $('#disp_camp_status').html(camp_status_def[data.camp_status]);
            $('#Modal_export_file_name').val(data.campaign_name);
            //-----------------------------     
            
            var sent_failed_count=data.live_mcamp_data.sent_failed_count;
            var sent_success_count=data.live_mcamp_data.sent_success_count;
            var sent_mail_count = sent_failed_count + sent_success_count;
            var mail_open_count = data.live_mcamp_data.mail_open_count;

            updateProgressbar(data.camp_status, data.campaign_data.mail_sender.id, data.campaign_data.user_group.id, data.campaign_data.mail_template.id, sent_mail_count, sent_success_count, sent_failed_count, mail_open_count);
            updateLiveMailCampData(data.live_mcamp_data.scatter_data, data.live_mcamp_data.timestamp_conv, data.timezone);

            $("#succ_camp").append(data.total);
            $("#del_camp").append(data.year_count);
            $("#past_camp").append(data.past_camp);
        
            var months = { 01:0, 02:0, 03:0 ,04:0,05:0,06:0,07:0,08:0,09:0,10:0,11:0,12:0};
            $.each(data.phishingmail, function(key, value) {
             var date = value.scheduled_time;
             var newDate = moment(date, 'YYYY-MM-DD').format('MM');
            if(months[parseInt(newDate)] == '0'){
                var arr = [];
                var sent = 0;
                if(value.sending_status=='2'){
                 sent = sent+1;
                }

                var open = 0;
                if(value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null){
                }else{
                    open = open+1;
                }

                
                var payload = 0;
                if(value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null){
                }else{
                    payload = payload+1;
                }

                
                var comp = 0;
                if(value.employees_compromised == '' || value.employees_compromised == 'NULL' ||value.employees_compromised == null){
                }else{
                    comp = comp+1;
                }

                
                var reported = 0;
                if(value.emails_reported == '' || value.emails_reported == 'NULL' ||value.emails_reported == null){
                }else{
                    reported = reported+1;
                }
                

                arr['sent'] = sent;
                arr['open'] = open;
                arr['payload'] = payload;
                arr['comp'] = comp;
                arr['reported'] = reported;

                months[parseInt(newDate)] = arr;
            }else{
                if(value.sending_status=='2'){
                    months[parseInt(newDate)]['sent'] = months[parseInt(newDate)]['sent']+1;
                }

                if(value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null){
                }else{
                    months[parseInt(newDate)]['open'] = months[parseInt(newDate)]['open']+1;
                }

                if(value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null){
                }else{
                    months[parseInt(newDate)]['payload'] = months[parseInt(newDate)]['payload']+1;
                }

                if(value.employees_compromised == '' || value.employees_compromised == 'NULL' ||value.employees_compromised == null){
                }else{
                    months[parseInt(newDate)]['comp'] = months[parseInt(newDate)]['comp']+1;;
                }

                
                if(value.emails_reported == '' || value.emails_reported == 'NULL' ||value.emails_reported == null){
                }else{
                    months[parseInt(newDate)]['reported'] = months[parseInt(newDate)]['reported']+1;;
                }
                

            }
   
            });
            mailchart(months);

        }
        else
            toastr.warning('', data.live_mcamp_data.error);            
    }); 
}

function updateProgressbar(mailcamp_status, sender_list_id, user_group_id, mail_template_id, sent_mail_count, sent_success_count, sent_failed_count, mail_open_count) {
    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_user_group_data",
            tk_id : g_tk_id,
            campaign_id: g_campaign_id,
        })
    }).done(function (data) {
        if(!data.error){
            $('#user_group_name').val(data.user_group_name);

            var sent_mail_percent = +(sent_success_count / sent_mail_count * 100).toFixed(2);
            var sent_mail_success_percent = +(sent_success_count / sent_mail_count * 100).toFixed(2);

            $("#progressbar_status").children().width(sent_mail_percent + "%");
            $("#progressbar_status").children().text(sent_success_count + "/" + sent_mail_count + " (" + sent_mail_percent + "%)");

            if (sent_mail_percent == 100)
                $("#progressbar_status").children().addClass("bg-success");
            else
                $("#progressbar_status").children().removeClass("bg-success");


            updatePieTotalSent(sent_mail_count, sent_success_count, sent_failed_count);
            var mail_open_percent = +(mail_open_count / sent_mail_count * 100).toFixed(2);
            updatePieTotalMailOpen(sent_mail_count, mail_open_count, mail_open_percent);
            updatePieOverViewEmail(sent_mail_success_percent, mail_open_percent);

            if (mailcamp_status != 0 && $('input[name="radio_mail_reply_check"]:checked').val() == "reply_yes")
                updatePieTotalMailReplied(sent_mail_count);
            else{
                $("#piechart_mail_total_replied").attr("hidden", false);
                $("#piechart_mail_total_replied").parent().children().remove('.loadercust');
            }
        }
        $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
    }); 
}


function updateLiveMailCampData(scatter_data, timestamp_conv, timezone) {
    $("#chart_live_mailcamp").attr("hidden", false);
    $("#chart_live_mailcamp").parent().children().remove('.loadercust');

    var graph_data = {'in_progress': {"hit_time":[],"user_email":[],"user_name":[]},
                       'sent_success': {"hit_time":[],"user_email":[],"user_name":[]},
                       'send_error': {"hit_time":[],"user_email":[],"user_name":[]},
                       'mail_open': {"hit_time":[],"user_email":[],"user_name":[]}};

    $.each(scatter_data, function(i, item) {
        switch (item.sending_status) {
            case 1:     //In progress
                graph_data.in_progress.hit_time.push([Number(item.send_time), 1]);
                graph_data.in_progress.user_email.push(item.user_email);
                graph_data.in_progress.user_name.push(item.user_name);
                break;
            case 2:     //Sent success
                graph_data.sent_success.hit_time.push([Number(item.send_time), 1]);
                graph_data.sent_success.user_email.push(item.user_email);
                graph_data.sent_success.user_name.push(item.user_name);
                break;
            case 3:     //Send error
                graph_data.send_error.hit_time.push([Number(item.send_time), 1]);
                graph_data.send_error.user_email.push(item.user_email);
                graph_data.send_error.user_name.push(item.user_name);
                break;
        }
        
        var arr_mail_open_times = item.mail_open_times;
        $.each(arr_mail_open_times, function(i, mail_open_time) {            
            if(g_tb_data_single){
                if ($.inArray(item.user_email,  graph_data.mail_open.user_email) <= -1 ) {
                    graph_data.mail_open.hit_time.push([Number(mail_open_time), 1]);
                    graph_data.mail_open.user_email.push(item.user_email);
                    graph_data.mail_open.user_name.push(item.user_name);
                }
            }
            else{
                graph_data.mail_open.hit_time.push([Number(mail_open_time), 1]);
                graph_data.mail_open.user_email.push(item.user_email);
                graph_data.mail_open.user_name.push(item.user_name);
            }
        });
    });

    var options = {
        chart: {
            height: 130,
            type: 'scatter',
        },
        series: [{
                name: 'In-progress',
                data: graph_data.in_progress.hit_time
            },
            {
                name: 'Success',
                data: graph_data.sent_success.hit_time
            },
            {
                name: 'Opened',
                data: graph_data.mail_open.hit_time
            },
            {
                name: 'Error',
                data: graph_data.send_error.hit_time
            },
        ],
        dataLabels: {
            enabled: false,
        },
        grid: {
            xaxis: {
                showLines: true,
            },
            yaxis: {
                showLines: true,
            },
        },
        xaxis: {
            type: 'datetime',
            labels: {
                formatter: function(val) {
                    return Unix2StdDateTime(val/1000,timezone);
                },
                tickPlacement: 'on'
            },
            tooltip: {
                enabled: false,
            },
        },
        yaxis: {
            max: 5,
            show: false,
        },
        tooltip: {
            custom: function({
                series,
                seriesIndex,
                dataPointIndex,
                w
            }) {
                var localdate = timestamp_conv[w.config.series[seriesIndex].data[dataPointIndex][0]];
                switch (seriesIndex) {
                   case 0:     //In progress
                        return `<div class="chart-tooltip">Time: ` + localdate + "<br/>Name: " + graph_data.in_progress.user_name[dataPointIndex] + ` <br/>Email: ` + graph_data.in_progress.user_email[dataPointIndex] + `</div>`;
                        break;
                    case 1:     //Sent success
                        return `<div class="chart-tooltip">Time: ` + localdate + "<br/>Name: " + graph_data.sent_success.user_name[dataPointIndex] + ` <br/>Email: ` + graph_data.sent_success.user_email[dataPointIndex] + `</div>`;
                        break;
                    case 2:     //Mail opened
                        return `<div class="chart-tooltip">Time: ` + localdate + "<br/>Name: " + graph_data.mail_open.user_name[dataPointIndex] + ` <br/>Email: ` + graph_data.mail_open.user_email[dataPointIndex] + `</div>`;
                        break;
                    case 3:     //Send error
                        return `<div class="chart-tooltip">Time: ` + localdate + "<br/>Name: " + graph_data.send_error.user_name[dataPointIndex] + ` <br/>Email: ` + graph_data.send_error.user_email[dataPointIndex] + `</div>`;
                        break;
                }
            }
        },
        grid: {
            show: false,
            padding: {
                left: 50,
                right: 15
            }
        },
        legend: {
            show: true,
            height: 30,
        },
        colors: ['#7460ee', '#4CAF50', '#e6b800', '#FA4443']
    }

    chart_live_mailcamp = new ApexCharts(
        document.querySelector("#chart_live_mailcamp"),
        options
    );
    chart_live_mailcamp.render();
}

function updatePieOverViewEmail(sent_mail_percent, open_mail_percent) {
    $("#radialchart_overview_mailcamp").attr("hidden", false);
    $("#radialchart_overview_mailcamp").parent().children().remove('.loadercust');

    var options = {
        series: [sent_mail_percent, open_mail_percent, 0], //value 0 updated in another function
        chart: {
            type: 'radialBar',
        },
        plotOptions: {
            radialBar: {
                offsetY: 0,
                //offsetX: -15,
                hollow: {
                    size: '45%',
                },
                dataLabels: {
                    name: {
                        fontSize: '14px',
                    },
                    value: {
                        fontSize: '12px',
                    },
                }
            }
        },
        legend: {
            show: true,
            position: 'bottom',
            floating: true,
            itemMargin: {
                horizontal: 5,
                vertical: 2,
            },
            onItemClick: {
                toggleDataSeries: true
            },
            onItemHover: {
                highlightDataSeries: true
            },

        },
        labels: ['Sent', 'Opened', 'Replied'],
        colors: ['#4CAF50', '#e6b800', '#F86624'],
    };

    radialchart_overview_mailcamp = new ApexCharts(
        document.querySelector("#radialchart_overview_mailcamp"),
        options
    );
    radialchart_overview_mailcamp.render();
}

function updatePieTotalSent(total_user_email_count, sent_mail_count, sent_failed_count) {
 
    $("#piechart_mail_total_sent").attr("hidden", false);
    $("#piechart_mail_total_sent").parent().children().remove('.loadercust');

    var sent_percent = +((sent_mail_count-sent_failed_count) / total_user_email_count * 100).toFixed(2);
    var non_sent_percent = +(100 - sent_percent).toFixed(2);
    var options = {
        series: [sent_percent, non_sent_percent],
        chart: {
            type: 'donut',
        },
        plotOptions: {
            pie: {
                offsetY: 0,
                customScale: 1,
                donut: {
                    size: '80%',
                    labels: {
                        show: true,
                        name: {
                            show: false,
                        },
                        value: {
                            show: true,
                            fontSize: '14px',
                            formatter: function(val) {
                                return val + "%";
                            }
                        },
                        total: {
                            show: true,
                            label: 'Total',
                            formatter: function(w) {
                                return +(sent_mail_count/total_user_email_count*100).toFixed(2) + "% (" + (sent_mail_count-sent_failed_count) + "/" + total_user_email_count + ")";
                            }
                        }
                    }
                }
            }
        },
        dataLabels: {
            enabled: false,
        },
        legend: {
            show: false
        },
        tooltip: {
            enabled: true,
            custom: function({
                series,
                seriesIndex,
                dataPointIndex,
                w
            }) {
                if (seriesIndex == 0)
                    return `<div class="chart-tooltip">Sent success: ` + series[seriesIndex] + `%</div>`;
                else
                    return `<div class="chart-tooltip">Send error: ` + series[seriesIndex] + `%</div>`;
            },
        },
        colors: ['#4CAF50', '#d9d9d9'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    piechart_mail_total_sent = new ApexCharts(
        document.querySelector("#piechart_mail_total_sent"),
        options
    );
    piechart_mail_total_sent.render();
}

function updatePieTotalMailOpen(total_user_email_count, open_mail_count, open_mail_percent) {
    $("#piechart_mail_total_mail_open").attr("hidden", false);
    $("#piechart_mail_total_mail_open").parent().children().remove('.loadercust');
    var non_open_percent = +(100 - open_mail_percent).toFixed(2);
    var options = {
        series: [open_mail_percent, non_open_percent],
        chart: {
            type: 'donut',
        },
        plotOptions: {
            pie: {
                offsetY: 0,
                customScale: 1,
                donut: {
                    size: '80%',
                    labels: {
                        show: true,
                        name: {
                            show: false,
                        },
                        value: {
                            show: true,
                            fontSize: '14px',
                            formatter: function(val) {
                                return val + "%";
                            }
                        },
                        total: {
                            show: true,
                            label: 'Total',
                            formatter: function(w) {
                                return w.globals.series[0] + "% (" + open_mail_count + "/" + total_user_email_count + ")";
                            }
                        }
                    }
                }
            }
        },
        dataLabels: {
            enabled: false,
        },
        legend: {
            show: false
        },
        tooltip: {
            enabled: true,
            custom: function({
                series,
                seriesIndex,
                dataPointIndex,
                w
            }) {
                if (seriesIndex == 0)
                    return `<div class="chart-tooltip">Opened: ` + series[seriesIndex] + `%</div>`;
                else
                    return `<div class="chart-tooltip">Not opened: ` + series[seriesIndex] + `%</div>`;
            },
        },
        colors: ['#e6b800', '#d9d9d9'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    piechart_mail_total_mail_open = new ApexCharts(
        document.querySelector("#piechart_mail_total_mail_open"),
        options
    );
    piechart_mail_total_mail_open.render();
}

function updatePieTotalMailReplied(total_user_email_count) {
    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_mail_replied",
            tk_id : g_tk_id,
            campaign_id: g_campaign_id,
        }),
    }).done(function (data) {
        loadTableCampaignResult();
        $("#piechart_mail_total_replied").attr("hidden", false);
        $("#piechart_mail_total_replied").parent().children().remove('.loadercust');
        if (!data.error) {
            window.reply_emails = data;

            var reply_count_unique = Object.keys(data.msg_info).length;
            var reply_percent = +(reply_count_unique / total_user_email_count * 100).toFixed(2);
            var non_reply_percent = +(100 - reply_percent).toFixed(2);
            var options = {
                series: [reply_percent, non_reply_percent],
                chart: {
                    type: 'donut',
                },
                plotOptions: {
                    pie: {
                        offsetY: 0,
                        customScale: 1,
                        donut: {
                            size: '80%',
                            labels: {
                                show: true,
                                name: {
                                    show: false,
                                },
                                value: {
                                    show: true,
                                    fontSize: '14px',
                                    formatter: function(val) {
                                        return val + "%";
                                    }
                                },
                                total: {
                                    show: true,
                                    label: 'Total',
                                    formatter: function(w) {
                                        return w.globals.series[0] + "% (" + reply_count_unique + "/" + total_user_email_count + ")";
                                    }
                                }
                            }
                        }
                    }
                },
                dataLabels: {
                    enabled: false,
                },
                legend: {
                    show: false
                },
                tooltip: {
                    enabled: true,
                    custom: function({
                        series,
                        seriesIndex,
                        dataPointIndex,
                        w
                    }) {
                        if (seriesIndex == 0)
                            return `<div class="chart-tooltip">Replied: ` + series[seriesIndex] + `%</div>`;
                        else
                            return `<div class="chart-tooltip">Not Replied: ` + series[seriesIndex] + `%</div>`;
                    },
                },
                colors: ['#F86624', '#d9d9d9'],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };

            piechart_mail_total_replied = new ApexCharts(
                document.querySelector("#piechart_mail_total_replied"),
                options
            );
            piechart_mail_total_replied.render();

            var arr_chart_data = radialchart_overview_mailcamp.w.globals.series.slice();
            arr_chart_data[2] = reply_percent;
            radialchart_overview_mailcamp.updateSeries(arr_chart_data)
        }
        else{
            toastr.error( data.error);
            $("#piechart_mail_total_replied").text('Loading error!');
        }
    }).fail(function(response) {
        toastr.error(  response.statusText);
        $("#piechart_mail_total_replied").parent().children().remove('.loadercust');
    }); 
}


function loadTableCampaignResult() {
    try {
        dt_mail_campaign_result.destroy();
    } catch (err) {}


    $("#table_mail_campaign_result").attr("hidden", false);
    $("#table_mail_campaign_result").parent().children().remove('.loadercust');

    $('#table_mail_campaign_result thead').empty();
    $("#table_mail_campaign_result tbody > tr").remove();

    getAllReportColListSelected();
    $('input[name="radio_table_data"]:checked').val() == "radio_table_data_single"?g_tb_data_single=true:g_tb_data_single=false;

    var arr_tb_heading=[];  
    arr_tb_heading.push({ data: 'sn', title: "SN" });

    var allReportColListSelected =["user_name", "user_email", "sending_status", "send_time", "send_error", "mail_open","public_ip","mail_client","platform","device_type","mail_reply","country"];
 
    $.each(allReportColListSelected, function(index, item) {
        if (item.startsWith("Field"))
            arr_tb_heading.push({ data: item, title : 'Field-' + item});
        else
            arr_tb_heading.push({ data: item, title : dic_all_col[item]});
    });
 

    dt_mail_campaign_result = $('#table_mail_campaign_result').DataTable({
        'processing': true,
        'serverSide': true,
        'ajax': {
            url:'manager/mail_campaign_manager',
            type: "POST",
            contentType: "application/json; charset=utf-8",
            data: function (d) {   //request parameters here
                    d.action_type = 'multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data';
                    d.tk_id = g_tk_id;
                    d.campaign_id = g_campaign_id;
                    d.selected_col = allReportColListSelected;
                    d.tb_data_single = g_tb_data_single;
                    return JSON.stringify(d);
                },
            dataSrc: function ( resp ){
             console.log(resp);

                for (var i=0; i<resp.data.length; i++){
                    resp.data[i]['sn'] = i+1;
                    if(resp.data[i].mail_open==true)
                        resp.data[i].mail_open = "<center><i class='fas fa-check fa-lg text-success' data-toggle='tooltip' title='Yes'></i></center>";
                    else
                        resp.data[i].mail_open = "<center><i class='fas fa-times fa-lg text-danger' data-toggle='tooltip' title='No'></i></center>";
                        resp.data[i].sending_status= camp_table_status_def[resp.data[i].sending_status];
                        if(Object.keys(reply_emails).length >= 0 &&  reply_emails.hasOwnProperty('msg_info') && reply_emails.msg_info.hasOwnProperty(resp.data[i].user_email) ){
                        resp.data[i].mail_reply = `<center><i class='fas fa-check fa-lg text-success' data-toggle='tooltip' title='Yes'></i></center>`;
                        resp.data[i].mail_reply_count = reply_emails.msg_info[resp.data[i].user_email].msg_time.length;
                        resp.data[i].mail_reply_content = `<center><i class="fas fa-eye fa-lg cursor-pointer" data-toggle="tooltip" title="View" onclick="viewReplyMails('` + resp.data[i].user_email + `')"></i></center>`;
                    }
                    else{
                        resp.data[i].mail_reply = `<center><i class='fas fa-times fa-lg text-danger' data-toggle='tooltip' title='No'></i></center>`;
                        resp.data[i].mail_reply_count = 0;
                    }
                }
                return resp.data
            }
        },
        'columns': arr_tb_heading,
        'pageLength': 20,
        'lengthMenu': [[20, 50, 100, 500, 1000, -1], [20, 50, 100, 500, 1000, "All"]],
        'aoColumnDefs': [{'bSortable': false, 'aTargets': [0]}],
        drawCallback:function(){
            $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
            $("label>select").select2({minimumResultsForSearch: -1, });
        }
    });
}

function loadTableCampaignResult1(){

    try {
        dt_mail_campaign_result.destroy();
    } catch (err) {}

    $("#table_mail_campaign_result1 tbody > tr").remove();
    $("#succ_camp").html("");
    $("#del_camp").html("");
    $("#past_camp").html("");

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data1",
         }),
    }).done(function (data) {
        $(function() {
            if(!data.error){
                $("#succ_camp").append(data.total);
                $("#del_camp").append(data.year_count);
                $("#past_camp").append(data.past_camp);

                $.each(data.resp, function(key, value) {
                    var count = JSON.parse(value.campaign_data);
                    var emp_count = (count.user_group.id).split(",");
                    var date = value.scheduled_datetime;
                    var start_date = new Date(date[0]['start_date']);
                    var end_date = new Date(date[0]['end_date']);
                    var newDate = moment(start_date, 'YYYY-MM-DD').format('DD/MM/YYYY');
                    var newDate1 = moment(end_date, 'YYYY-MM-DD').format('DD/MM/YYYY');

                    switch (value.sending_status) {
                        case 1:     //In progress
                            var status = '<span class="label label-table label-warning" style="color:black"><b>In Progress</b></span>';
                            var delivered = (emp_count.length);
                            break;
                        case 2:     //Sent success
                            var status = '<span class="label label-table label-success"><b>Finished</b></span>';
                            var delivered = (emp_count.length);
                            break;
                        case 3:     //Send error
                            var status = '<span class="label label-table label-danger"><b>Error</b></span>';
                            var delivered = (emp_count.length);
                            break;
                        case null:
                            var status = '<span class="label label-table label-danger"><b>Error</b></span>';
                            var delivered = (emp_count.length);
                            break;

                    }

                    if(emp_count.length != 0){
                        if(value.sending_status==2){
                        var perc = (emp_count.length/delivered)*100;
                        }else{
                            var perc = 0; 
                        }
                    }else{
                        var perc = 0;
                    }

                    if(perc  == 100){
                        var newper = '✓';
                        var signper = '';
                    }else{
                        var newper = perc;
                        var signper = '%';
                    }
                    
                    var html = `<div class="card2">
                                    <div class="percent2">
                                    <svg>
                                        <circle cx="25" cy="25" r="22"></circle>
                                        <circle cx="25" cy="25" r="22" style="--percent: ${perc};"></circle>
                                    </svg>
                                    <div class="number2">
                                        <h6>${newper}<span>${signper}</span></h6>
                                    </div>
                                    </div>
                                </div>`;

                    if (value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null) {
                        var mail_open = '0';
                        var mailnewper = mail_open;
                        var mailsignper = '%';
                        var mailpercentage = 0;
                    }else{
                        var mail_open = '1';
                        var mailnewper = '✓';
                        var mailsignper = '';
                        var mailpercentage = 100;
                    }

                    if (value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null) {
                        var payloads_clicked_open = '0';
                        var mailnewperpay = payloads_clicked_open;
                        var mailsignperpay = '%';
                        var mailpercentagepay = 0;
                    }else{
                        var payloads_clicked_open = '1';
                        var mailnewperpay = '✓';
                        var mailsignperpay = '';
                        var mailpercentagepay = 100;
                    }

                    if (value.employees_compromised	 == '' || value.	employees_compromised	 == 'NULL' ||value.	employees_compromised	 == null) {
                        var employees_compromised = '0';
                        var mailnewperexp = employees_compromised;
                        var mailsignperexp = '%';
                        var mailpercentageexp = 0;
                    }else{
                        var employees_compromised = '1';
                        var mailnewperexp = '✓';
                        var mailsignperexp = '';
                        var mailpercentageexp = 100;
                    }

                    if (value.emails_reported	 == '' || value.	emails_reported	 == 'NULL' ||value.	emails_reported	 == null) {
                        var emails_reported = '0';
                        var mailnewperexprep = emails_reported;
                        var mailsignperexprep = '%';
                        var mailpercentageexprep = 0;
                    }else{
                        var emails_reported = '1';
                        var mailnewperexprep = '✓';
                        var mailsignperexprep = '';
                        var mailpercentageexprep = 100;
                    }
                  
                    var mailhtml = `<div class="card2">
                                <div class="percent2">
                                <svg>
                                    <circle cx="25" cy="25" r="22"></circle>
                                    <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentage};"></circle>
                                </svg>
                                <div class="number2">
                                    <h6>${mailnewper}<span>${mailsignper}</span></h6>
                                </div>
                                </div>
                            </div>`;

                    var mailhtmlpay = `<div class="card2">
                                <div class="percent2">
                                <svg>
                                    <circle cx="25" cy="25" r="22"></circle>
                                    <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentagepay};"></circle>
                                </svg>
                                <div class="number2">
                                    <h6>${mailnewperpay}<span>${mailsignperpay}</span></h6>
                                </div>
                                </div>
                            </div>`;

                    var mailhtmlexprep = `<div class="card2">
                            <div class="percent2">
                            <svg>
                                <circle cx="25" cy="25" r="22"></circle>
                                <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentageexprep};"></circle>
                            </svg>
                            <div class="number2">
                                <h6>${mailnewperexp}<span>${mailsignperexprep}</span></h6>
                            </div>
                            </div>
                        </div>`;

                    var mailhtmlexp = `<div class="card2">
                            <div class="percent2">
                            <svg>
                                <circle cx="25" cy="25" r="22"></circle>
                                <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentageexp};"></circle>
                            </svg>
                            <div class="number2">
                                <h6>${mailnewperexprep}<span>${mailsignperexp}</span></h6>
                            </div>
                            </div>
                        </div>`;

                    $("#table_mail_campaign_result1 tbody").append("<tr><td></td><td>" + value.campaign_name + "</td><td>" + status + "</td><td>" + (newDate)+' - '+(newDate1)+ "</td><td>" + emp_count.length + "</td><td>" + delivered +" "+html+ "</td><td>" + mail_open + " "+mailhtml +"</td><td>" + payloads_clicked_open + " "+mailhtmlpay +"</td><td>" + employees_compromised + " "+mailhtmlexp +"</td><td>" + emails_reported + " "+mailhtmlexprep +"</td></tr>");
                });
            }

            dt_mail_campaign_list = $('#table_mail_campaign_result1').DataTable({
                "aaSorting": [6, 'desc'],
                'pageLength': 20,
                'lengthMenu': [[20, 50, 100, -1], [20, 50, 100, 'All']],
                'columnDefs': [{
                    // "targets": [9,10],
                    "className": "dt-center"
                }],
                "dom": 'Bfrtip',
                "buttons": [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdfHtml5'
                ],
                "preDrawCallback": function(settings) {
                    $('#table_mail_campaign_result1 tbody').hide();
                },
    
                "drawCallback": function() {
                    $('#table_mail_campaign_result1 tbody').fadeIn(500);
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

            var months = { 01:0, 02:0, 03:0 ,04:0,05:0,06:0,07:0,08:0,09:0,10:0,11:0,12:0};
            $.each(data.phishingmail, function(key, value) {
             var date = value.scheduled_time;
             var newDate = moment(date, 'YYYY-MM-DD').format('MM');
             if(months[parseInt(newDate)] == '0'){
                var arr = [];
                var sent = 0;
                if(value.sending_status=='2'){
                 sent = sent+1;
                }

                var open = 0;
                if(value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null){
                }else{
                    open = open+1;
                }

                
                var payload = 0;
                if(value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null){
                }else{
                    payload = payload+1;
                }

                
                var comp = 0;
                if(value.employees_compromised == '' || value.employees_compromised == 'NULL' ||value.employees_compromised == null){
                }else{
                    comp = comp+1;
                }

                
                var reported = 0;
                if(value.emails_reported == '' || value.emails_reported == 'NULL' ||value.emails_reported == null){
                }else{
                    reported = reported+1;
                }
                

                arr['sent'] = sent;
                arr['open'] = open;
                arr['payload'] = payload;
                arr['comp'] = comp;
                arr['reported'] = reported;

                months[parseInt(newDate)] = arr;
            }else{
                if(value.sending_status=='2'){
                    months[parseInt(newDate)]['sent'] = months[parseInt(newDate)]['sent']+1;
                }

                if(value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null){
                }else{
                    months[parseInt(newDate)]['open'] = months[parseInt(newDate)]['open']+1;
                }

                if(value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null){
                }else{
                    months[parseInt(newDate)]['payload'] = months[parseInt(newDate)]['payload']+1;
                }

                if(value.employees_compromised == '' || value.employees_compromised == 'NULL' ||value.employees_compromised == null){
                }else{
                    months[parseInt(newDate)]['comp'] = months[parseInt(newDate)]['comp']+1;;
                }

                
                if(value.emails_reported == '' || value.emails_reported == 'NULL' ||value.emails_reported == null){
                }else{
                    months[parseInt(newDate)]['reported'] = months[parseInt(newDate)]['reported']+1;;
                }
                

            }
   
            });

            mailchart(months);
          
            var sent_mail_percent = ((data.year_count)/data.total)*100;
            var open_mail_percent = ((data.opend_mail)/data.total)*100;
            var mail_replies_percent = ((data.mail_replies)/data.total)*100;
            updatePieOverViewEmail(sent_mail_percent, open_mail_percent);
            updatePieTotalSent(data.total, data.year_count, data.sent_failed_count)
            updatePieTotalMailOpen(data.total, data.opend_mail, open_mail_percent)
            updatePieTotalMailReplied1(data.total,data.mail_replies,mail_replies_percent)
        });
    })
}

function loadTableCampaignResultadmin(){

    try {
        dt_mail_campaign_result.destroy();
    } catch (err) {}

    $("#table_mail_campaign_result1 tbody > tr").remove();
    $("#succ_camp").html("");
    $("#del_camp").html("");
    $("#past_camp").html("");

    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data_admin",
         }),
    }).done(function (data) {
        console.log(data);
        $(function() {
            if(!data.error){
                $("#succ_camp").append(data.total);
                $("#del_camp").append(data.year_count);
                $("#past_camp").append(data.past_camp);

                $.each(data.resp, function(key, value) {
                    var count = JSON.parse(value.campaign_data);
                    var emp_count = (count.user_group.id).split(",");
                    var date = value.scheduled_datetime;
                    var start_date = new Date(date[0]['start_date']);
                    var end_date = new Date(date[0]['end_date']);
                    var newDate = moment(start_date, 'YYYY-MM-DD').format('DD/MM/YYYY');
                    var newDate1 = moment(end_date, 'YYYY-MM-DD').format('DD/MM/YYYY');

                    switch (value.sending_status) {
                        case 1:     //In progress
                            var status = '<span class="label label-table label-warning" style="color:black"><b>In Progress</b></span>';
                            var delivered = (emp_count.length);
                            break;
                        case 2:     //Sent success
                            var status = '<span class="label label-table label-success"><b>Finished</b></span>';
                            var delivered = (emp_count.length);
                            break;
                        case 3:     //Send error
                            var status = '<span class="label label-table label-danger"><b>Error</b></span>';
                            var delivered = (emp_count.length);
                            break;
                        case null:
                            var status = '<span class="label label-table label-danger"><b>Error</b></span>';
                            var delivered = (emp_count.length);
                            break;

                    }

                    if(emp_count.length != 0){
                        if(value.sending_status==2){
                        var perc = (emp_count.length/delivered)*100;
                        }else{
                            var perc = 0; 
                        }
                    }else{
                        var perc = 0;
                    }

                    if(perc  == 100){
                        var newper = '✓';
                        var signper = '';
                    }else{
                        var newper = perc;
                        var signper = '%';
                    }
                    
                    var html = `<div class="card2">
                                    <div class="percent2">
                                    <svg>
                                        <circle cx="25" cy="25" r="22"></circle>
                                        <circle cx="25" cy="25" r="22" style="--percent: ${perc};"></circle>
                                    </svg>
                                    <div class="number2">
                                        <h6>${newper}<span>${signper}</span></h6>
                                    </div>
                                    </div>
                                </div>`;

                if (value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null) {
                    var mail_open = '0';
                    var mailnewper = mail_open;
                    var mailsignper = '%';
                    var mailpercentage = 0;
                }else{
                    var mail_open = '1';
                    var mailnewper = '✓';
                    var mailsignper = '';
                    var mailpercentage = 100;
                }

                if (value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null) {
                    var payloads_clicked_open = '0';
                    var mailnewperpay = payloads_clicked_open;
                    var mailsignperpay = '%';
                    var mailpercentagepay = 0;
                }else{
                    var payloads_clicked_open = '1';
                    var mailnewperpay = '✓';
                    var mailsignperpay = '';
                    var mailpercentagepay = 100;
                }

                if (value.employees_compromised	 == '' || value.	employees_compromised	 == 'NULL' ||value.	employees_compromised	 == null) {
                    var employees_compromised = '0';
                    var mailnewperexp = employees_compromised;
                    var mailsignperexp = '%';
                    var mailpercentageexp = 0;
                }else{
                    var employees_compromised = '1';
                    var mailnewperexp = '✓';
                    var mailsignperexp = '';
                    var mailpercentageexp = 100;
                }

                if (value.emails_reported	 == '' || value.	emails_reported	 == 'NULL' ||value.	emails_reported	 == null) {
                    var emails_reported = '0';
                    var mailnewperexprep = emails_reported;
                    var mailsignperexprep = '%';
                    var mailpercentageexprep = 0;
                }else{
                    var emails_reported = '1';
                    var mailnewperexprep = '✓';
                    var mailsignperexprep = '';
                    var mailpercentageexprep = 100;
                }
              
                var mailhtml = `<div class="card2">
                            <div class="percent2">
                            <svg>
                                <circle cx="25" cy="25" r="22"></circle>
                                <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentage};"></circle>
                            </svg>
                            <div class="number2">
                                <h6>${mailnewper}<span>${mailsignper}</span></h6>
                            </div>
                            </div>
                        </div>`;

                var mailhtmlpay = `<div class="card2">
                            <div class="percent2">
                            <svg>
                                <circle cx="25" cy="25" r="22"></circle>
                                <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentagepay};"></circle>
                            </svg>
                            <div class="number2">
                                <h6>${mailnewperpay}<span>${mailsignperpay}</span></h6>
                            </div>
                            </div>
                        </div>`;

                var mailhtmlexprep = `<div class="card2">
                        <div class="percent2">
                        <svg>
                            <circle cx="25" cy="25" r="22"></circle>
                            <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentageexprep};"></circle>
                        </svg>
                        <div class="number2">
                            <h6>${mailnewperexp}<span>${mailsignperexprep}</span></h6>
                        </div>
                        </div>
                    </div>`;

                var mailhtmlexp = `<div class="card2">
                        <div class="percent2">
                        <svg>
                            <circle cx="25" cy="25" r="22"></circle>
                            <circle cx="25" cy="25" r="22" style="--percent: ${mailpercentageexp};"></circle>
                        </svg>
                        <div class="number2">
                            <h6>${mailnewperexprep}<span>${mailsignperexp}</span></h6>
                        </div>
                        </div>
                    </div>`;


                    $("#table_mail_campaign_result1 tbody").append("<tr><td></td><td>" + value.campaign_name + "</td><td>" + status + "</td><td>" + (newDate)+' - '+(newDate1)+ "</td><td>" + emp_count.length + "</td><td>" + delivered +" "+html+ "</td><td>" + mail_open + " "+mailhtml +"</td><td>" + payloads_clicked_open + " "+mailhtmlpay +"</td><td>" + employees_compromised + " "+mailhtmlexp +"</td><td>" + emails_reported + " "+mailhtmlexprep +"</td></tr>");
                });
            }

            dt_mail_campaign_list = $('#table_mail_campaign_result1').DataTable({
                "aaSorting": [6, 'desc'],
                'pageLength': 20,
                'lengthMenu': [[20, 50, 100, -1], [20, 50, 100, 'All']],
                'columnDefs': [{
                    // "targets": [9,10],
                    "className": "dt-center"
                }],
                "dom": 'Bfrtip',
                "buttons": [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdfHtml5'
                ],
                "preDrawCallback": function(settings) {
                    $('#table_mail_campaign_result1 tbody').hide();
                },
    
                "drawCallback": function() {
                    $('#table_mail_campaign_result1 tbody').fadeIn(500);
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

            var months = { 01:0, 02:0, 03:0 ,04:0,05:0,06:0,07:0,08:0,09:0,10:0,11:0,12:0};
            $.each(data.phishingmail, function(key, value) {
             var date = value.scheduled_time;
             var newDate = moment(date, 'YYYY-MM-DD').format('MM');
             if(months[parseInt(newDate)] == '0'){
                var arr = [];
                var sent = 0;
                if(value.sending_status=='2'){
                 sent = sent+1;
                }

                var open = 0;
                if(value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null){
                }else{
                    open = open+1;
                }

                
                var payload = 0;
                if(value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null){
                }else{
                    payload = payload+1;
                }

                
                var comp = 0;
                if(value.employees_compromised == '' || value.employees_compromised == 'NULL' ||value.employees_compromised == null){
                }else{
                    comp = comp+1;
                }

                
                var reported = 0;
                if(value.emails_reported == '' || value.emails_reported == 'NULL' ||value.emails_reported == null){
                }else{
                    reported = reported+1;
                }
                

                arr['sent'] = sent;
                arr['open'] = open;
                arr['payload'] = payload;
                arr['comp'] = comp;
                arr['reported'] = reported;

                months[parseInt(newDate)] = arr;
            }else{
                if(value.sending_status=='2'){
                    months[parseInt(newDate)]['sent'] = months[parseInt(newDate)]['sent']+1;
                }

                if(value.mail_open_times == '' || value.mail_open_times == 'NULL' ||value.mail_open_times == null){
                }else{
                    months[parseInt(newDate)]['open'] = months[parseInt(newDate)]['open']+1;
                }

                if(value.payloads_clicked == '' || value.payloads_clicked == 'NULL' ||value.payloads_clicked == null){
                }else{
                    months[parseInt(newDate)]['payload'] = months[parseInt(newDate)]['payload']+1;
                }

                if(value.employees_compromised == '' || value.employees_compromised == 'NULL' ||value.employees_compromised == null){
                }else{
                    months[parseInt(newDate)]['comp'] = months[parseInt(newDate)]['comp']+1;;
                }

                
                if(value.emails_reported == '' || value.emails_reported == 'NULL' ||value.emails_reported == null){
                }else{
                    months[parseInt(newDate)]['reported'] = months[parseInt(newDate)]['reported']+1;;
                }
                

            }
   
            });

            mailchart(months);
          
            var sent_mail_percent = ((data.year_count)/data.total)*100;
            var open_mail_percent = ((data.opend_mail)/data.total)*100;
            var mail_replies_percent = ((data.mail_replies)/data.total)*100;
            updatePieOverViewEmail(sent_mail_percent, open_mail_percent);
            updatePieTotalSent(data.total, data.year_count, data.sent_failed_count)
            updatePieTotalMailOpen(data.total, data.opend_mail, open_mail_percent)
            updatePieTotalMailReplied1(data.total,data.mail_replies,mail_replies_percent)
        });
    })
}

function updatePieTotalMailReplied1(total_user_email_count, mail_replies, mail_replies_percent) {
    $("#piechart_mail_total_replied1").attr("hidden", false);
    $("#piechart_mail_total_replied1").parent().children().remove('.loadercust');
    var non_open_percent = +(100 - mail_replies_percent).toFixed(2);
    var options = {
        series: [mail_replies_percent, non_open_percent],
        chart: {
            type: 'donut',
        },
        plotOptions: {
            pie: {
                offsetY: 0,
                customScale: 1,
                donut: {
                    size: '80%',
                    labels: {
                        show: true,
                        name: {
                            show: false,
                        },
                        value: {
                            show: true,
                            fontSize: '14px',
                            formatter: function(val) {
                                return val + "%";
                            }
                        },
                        total: {
                            show: true,
                            label: 'Total',
                            formatter: function(w) {
                                return w.globals.series[0] + "% (" + mail_replies + "/" + total_user_email_count + ")";
                            }
                        }
                    }
                }
            }
        },
        dataLabels: {
            enabled: false,
        },
        legend: {
            show: false
        },
        tooltip: {
            enabled: true,
            custom: function({
                series,
                seriesIndex,
                dataPointIndex,
                w
            }) {
                if (seriesIndex == 0)
                    return `<div class="chart-tooltip">Opened: ` + series[seriesIndex] + `%</div>`;
                else
                    return `<div class="chart-tooltip">Not opened: ` + series[seriesIndex] + `%</div>`;
            },
        },
        colors: ['#e6b800', '#d9d9d9'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    piechart_mail_total_replied1 = new ApexCharts(
        document.querySelector("#piechart_mail_total_replied1"),
        options
    );
    piechart_mail_total_replied1.render();
}

function mailchart(months) {
  
    var data1 = [];
    var data2 = [];
    var data3 = [];
    var data4 = [];
    var data5 = [];
    $.each(months, function(key, value) {

      if(value=='0'){
        data1.push(value);
        data2.push(value);
        data3.push(value);
        data4.push(value);
        data5.push(value);
      }else{
        data1.push(value.sent);
        data2.push(value.open);
        data3.push(value.payload);
        data4.push(value.comp);
        data5.push(value.reported);
      }

    });
  

    var options = {
        series: [
            {
          name: "Email Delivered",
          data: data1,
            },{
                name: "Email Viewed",
                data: data2,
            },{
                name: "Payloads Clicked",
                data: data3,
            },{
                name: "Employees Compromised",
                data: data4,
            },{
                name: "Emails Reported",
                data: data5,
            }
       ],
        chart: {
        height: 350,
        type: 'area',
        zoom: {
          enabled: false
        }
      },
        dataLabels: {
          enabled: false,
        },
      stroke: {
        curve: 'smooth',
        width:2,
      },markers: {
        size: 2,
      },
      title: {
        // text: 'Product Trends by Month',
        align: 'left'
      },
      grid: {
        row: {
          opacity: 0.5
        },
      },
      colors: ['#666869','#67686a', '#f39e18' ,'#ff3000','#249f27'],
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep','Oct','Nov','Dec'],
      }
      };

      var chart = new ApexCharts(document.querySelector("#chartmail"), options);
      chart.render();

}

function exportReportAction(e) {
    if(dt_mail_campaign_result.rows().count() > 0){
        var file_name = $('#Modal_export_file_name').val().trim();
        var file_format = $('#modal_export_report_selector').val();
        getAllReportColListSelected();

        if(file_format == 'csv')
            content_type='text/csv';
        else
        if(file_format == 'pdf')
            content_type='application/pdf';
        else
        if(file_format == 'html')
            content_type='text/html';

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'manager/mail_campaign_manager', true);
        xhr.responseType = 'arraybuffer';

        enableDisableMe(e);        
        xhr.send(JSON.stringify({ 
            action_type: "download_report",
            campaign_id: g_campaign_id,
            selected_col: allReportColListSelected,
            dic_all_col: dic_all_col,
            file_name: file_name,
            file_format: file_format,
            tb_data_single: g_tb_data_single
        }));

        xhr.onload = function() {
            if (this.status == 200) {
                var link=document.createElement('a');
                link.href = window.URL.createObjectURL(new Blob([this.response],{ type: content_type}));
                link.download=file_name + '.' + file_format;
                link.click();
                $('#ModalExport').modal('toggle');
           }
           enableDisableMe(e);
        };
    }
    else
        toastr.error( 'Table is empty!');
}

//------------------------Public Access---------------

var t1 = new ClipboardJS('#btn_copy_quick_tracker', {
    target: function(trigger) {
        return document.querySelector('#dashboard_link_url');
    }
});

t1.on('success', function(event) {
    event.clearSelection();
    event.trigger.textContent = 'Copied';
    window.setTimeout(function() {
        event.trigger.textContent = '';
    }, 2000);

});

$("#cb_act_dashboard_link").change(function() {
    enableDisablePublicAccess();
});

function enableDisablePublicAccess(new_tk_id=false){
    if(g_campaign_id == ""){
        toastr.error( 'Error: No campaign selected');
        $('#cb_act_dashboard_link').prop('checked', false);
        return;
    }
    $('#cb_act_dashboard_link').closest('.modal-content').find('.modal-footer').append(displayLoader("Updating...","small"))
    $.post({
        url: "manager/session_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "manage_dashboard_access",  
            ctrl_val:$('#cb_act_dashboard_link').prop('checked'),
            tk_id : new_tk_id==true?getRandomId():g_tk_id,
            campaign_id: g_campaign_id,  
         })
    }).done(function (response) {
        if(response.result == "success"){
            g_tk_id = response.tk_id;
            if($("#cb_act_dashboard_link").prop('checked'))
                toastr.success( 'Public access link activated!');   
            else
                toastr.warning('', 'Public access link deactivated!'); 
        }
        else
            toastr.error( 'Error changing public access');

        $('#dashboard_link_url').html(location.href.split('?')[0] + "?mcamp=" + g_campaign_id + "&tk=" + g_tk_id);
        $("#modal_dashboard_link").find('.loader').remove();
    });    
}

function getAccessInfo(){
    $.post({
        url: "manager/session_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_access_info",
            tk_id : g_tk_id,
            campaign_id: g_campaign_id,  
         })
    }).done(function (response) {
        if(response.pub_access == true){
            $('#cb_act_dashboard_link').prop('disbled', false);
            $('#cb_act_dashboard_link').prop('checked', true);
            g_tk_id=response.tk_id;
        }
        else
            $('#cb_act_dashboard_link').prop('checked', false);
        
        $('#dashboard_link_url').html(location.href.split('?')[0] + "?mcamp=" + g_campaign_id + "&tk=" + g_tk_id);
    });
}

function hideMeFromPublic(){
    $(".left-sidebar").hide();
    $(".topbar").hide();
    $(".page-wrapper").css('margin-left',0);
    $(".item_private").hide();
}

function loadTableCampaignResultAccToWeek(){
    $('#act_camp').html("");
    $('#userDelMail').html("");
    $('#past_comp').html("");
    $('#mail_open').html("");
    $('#past_camp_last_week').html("");

    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "multi_get_mcampinfo_from_mcamp_list_id_get_live_mcamp_data_acc_to_week",
         }),
    }).done(function (data){

        $('#act_camp').append(data.total);
        $('#userDelMail').append(data.deliver_mail);
        $('#past_comp').append(data.past_campaigns);
        $('#mail_open').append(data.mail_open_count);
        $('#past_camp_last_week').append(data.past_camp_last_week);
        
        loadDashChart(data.day1,data.day2);
        loadSuccessChart(data.mail_open,data.payloads_clicked,data.employees_compromised);

    });
}

function loadEmpReportData(){
    $.post({
        url: "manager/mail_campaign_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_employee_report"
         })
    }).done(function (data) {

        $(function() {
            console.log(data)
            
            if(!data.error){
                $.each(data, function(key, value) {
                        $("#table_mail_report_list tbody").append("<tr><td>" +0+ "</td><td>" + 0+ "</td><td>" +0+ "</td><td>" + 0 + "</td></tr>");
                });
            }else{
                $("#table_mail_report_list tbody").append('<tr class="odd"><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
            }
            
            loadEmpReportData1(data);

            dt_mail_campaign_list = $('#table_mail_report_list').DataTable({
                "aaSorting": [6, 'desc'],
                'pageLength': 20,
                'lengthMenu': [[20, 50, 100, -1], [20, 50, 100, 'All']],
                'columnDefs': [{
                    // "targets": [9,10],
                    "className": "dt-center"
                }],
                "preDrawCallback": function(settings) {
                    $('#table_mail_report_list tbody').hide();
                },
    
                "drawCallback": function() {
                    $('#table_mail_report_list tbody').fadeIn(500);
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

function loadEmpReportData1(data){

            if(!data.error){
                $.each(data, function(key, value) {
                        $("#table_mail_search_history_list tbody").append("<tr><td>" +0+ "</td><td>" + 0+ "</td><td>" +0+ "</td><td>" + 0 + "</td><td>" + 0+ "</td><td>" +0+ "</td><td>" + 0 + "</td></tr>");
                });
            }else{
                $("#table_mail_search_history_list tbody").append('<tr class="odd"><td valign="top" colspan="7" class="dataTables_empty">No data available in table</td></tr>');
            }
            
            dt_mail_campaign_list = $('#table_mail_search_history_list').DataTable({
                "aaSorting": [6, 'desc'],
                'pageLength': 20,
                'lengthMenu': [[20, 50, 100, -1], [20, 50, 100, 'All']],
                'columnDefs': [{
                    // "targets": [9,10],
                    "className": "dt-center"
                }],
                "preDrawCallback": function(settings) {
                    $('#table_mail_search_history_list tbody').hide();
                },
    
                "drawCallback": function() {
                    $('#table_mail_search_history_list tbody').fadeIn(500);
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
              
}

function loadDashChart(day1,day2){
    var options = {
        series: [{
          name: "Desktops",
          data: day2
              }],
        chart: {
        height: 250,
        type: 'line',
        zoom: {
          enabled: false
        }
      },
      dataLabels: {
        enabled: false
      },
      stroke: {
        curve: 'smooth',
        width:4,
      },markers: {
        size:4,
      },
      title: {
        text: '',
        align: 'left'
      },
      grid: {
        xaxis: {
            lines: {
                show: true
            }
        },  
        strokeDashArray: 4, 
        yaxis: {
            lines: {
                show: true
            }
        },  
        row: {
        //   colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
          opacity: 0.5
        },
      },
      xaxis: {
        // categories: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        categories : day1,
      }
      };

      var chart = new ApexCharts(document.querySelector("#dashboardchartmail"), options);
      chart.render();
}

function loadSuccessChart(mail_open,payload,comp){
    // var hidden = 100-(data.mail_open)-payload-comp; 
    
    var total = 100 - (mail_open + payload + comp);
    var options = {
        series: [mail_open, payload, comp, total],
        chart: {
        width: 900,
        height: 200,
        type: 'donut',
        },
        plotOptions: {
        pie: {
            startAngle: -90,
            endAngle: 270,
            expandOnClick: false
        }
        },
        dataLabels: {
        enabled: false
        },
        fill: {
        type: 'gradient',
        },
        legend: {
        formatter: function(val, opts) {
            return val + " - " + opts.w.globals.series[opts.seriesIndex]+ "%"
        }
        },
        title: {
        text: '',
        },
        labels: ['Email Viewed', 'Email Viewed + Payload Clicked', 'Email Viewed + Payload Clicked + Employee Compromised',''],
        colors: ['#6c757e', '#ffb749', '#da552e', '#858aa9'],
        // colors: ['#6c757e', '#ffb749', '#da552e', '#ffff'],
        responsive: [{
        breakpoint: 480,
        options: {
            chart: {
            width: 800
            },
            legend: {
            position: 'bottom'
            }
        }
        }]
        };

        var chart = new ApexCharts(document.querySelector("#roundchartmail"), options);
        chart.render();
    
}
