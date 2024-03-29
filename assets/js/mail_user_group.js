var row_index;
var dt_user_group_list;
var action_items = '<a class="" data-toggle="tooltip" data-placement="top" title="" onclick="editRow($(this))" data-original-title="Edit"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg></a><a class="" data-toggle="tooltip" data-placement="top" title="" onclick="deleteRow($(this))" data-original-title="Delete"> <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></a> ';

dt_user_list = $('#table_user_list').DataTable({
    "preDrawCallback": function(settings) {
        $('#table_user_list tbody').hide();
    },

    "drawCallback": function() {
        $('#table_user_list tbody').fadeIn(500);
    },
});

$(function() {
    $("#modal_export_report_selector").select2({
        minimumResultsForSearch: -1,
    }); 
    $('#section_adduser').click(function(){
        g_deny_navigation = '';
    });
});  

function exportUserAction() {
    if(dt_user_list.rows().count() > 0){
        var file_name = $('#user_group_name').val().trim();
        
        $.post({
            url: "manager/userlist_campaignlist_mailtemplate_manager",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify({ 
                action_type: "download_user",
                user_group_id: nextRandomId,
            })
        }).done(function (response) {
            if(response.error)
                toastr.error( 'Error adding user!');
            else{
                var a = window.document.createElement('a');
                a.href = window.URL.createObjectURL(new Blob([response],{ type: 'text/csv'}));
                a.download = file_name + '.csv';

                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
            }
        }); 
    }
}

function addUserToTable(e) {
    var user_group_name = $('#user_group_name').val().trim();
    var field_fname = $('#tablevalue_fname').val().trim();
    var field_lname = $('#tablevalue_lname').val().trim();
    var field_email = $('#tablevalue_email').val();
    var field_company = $('#tablevalue_companyname').val().trim()
    var field_job = $('#tablevalue_jobtitle').val().trim()

    if (RegTest(user_group_name,'COMMON') == false) {
        $("#user_group_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character!');
        return;
    } else
        $("#user_group_name").removeClass("is-invalid");

    if (field_fname == "")
        field_fname = "Empty";
    if (field_lname == "")
        field_lname = "Empty";

    if (RegTest(field_email, "EMAIL") == false) {
        $("#tablevalue_email").addClass("is-invalid");
        return;
    } else
        $("#tablevalue_email").removeClass("is-invalid");

    enableDisableMe(e);
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "add_user_to_table",
            user_group_id: nextRandomId,
            user_group_name: user_group_name,
            fname: field_fname,
            lname: field_lname,
            email: field_email,
            company: field_company,
            job:field_job
        })
    }).done(function (response) {
        if(response.error)
            toastr.error( 'Error adding user!');
        else{
            getUserGroupFromGroupId(nextRandomId);
            window.history.replaceState(null,null, location.pathname + '?action=edit&user=' + nextRandomId);
        }
        enableDisableMe(e);
    }); 
}

function deleteRow(arg) {
    row_index = dt_user_list.row(arg.parents('tr')).index();    
    $('#modal_row_delete').modal('toggle');
}

function deleteRowAction(e) {
    var uid = dt_user_list.row(row_index).data().uid;

    enableDisableMe(e);
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "delete_user",
            user_group_id: nextRandomId,
            uid: uid,
        })
    }).done(function (response) {
        if(response.result == "success"){
            toastr.success( 'Deleted successfully!');
            $('#modal_row_delete').modal('toggle');
            getUserGroupFromGroupId(nextRandomId);
        }
        else
            toastr.error( response.error);
        enableDisableMe(e);
    }); 
}

function editRow(arg) {
    row_index = dt_user_list.row(arg.parents('tr')).index();

    $('#modal_tablevalue_fname').val(dt_user_list.row(row_index).data().fname);
    $('#modal_tablevalue_lname').val(dt_user_list.row(row_index).data().lname);
    $('#modal_tablevalue_email').val(dt_user_list.row(row_index).data().email);
    $('#modal_tablevalue_company').val(dt_user_list.row(row_index).data().company);
    $('#modal_tablevalue_job').val(dt_user_list.row(row_index).data().job);
    $('#modal_modify_row').modal('toggle');
}

function editRowAction(e) {
    var field_fname = $('#modal_tablevalue_fname').val().trim();
    var field_lname = $('#modal_tablevalue_lname').val().trim();
    var field_email = $('#modal_tablevalue_email').val().trim();
    var field_company = $('#modal_tablevalue_company').val().trim();
    var field_job = $('#modal_tablevalue_job').val().trim();
    var uid = dt_user_list.row(row_index).data().uid;

    if (field_fname == "")
        field_fname = "Empty";
    if (field_lname == "")
        field_lname = "Empty";

    if (RegTest(field_email, "EMAIL") == false) {
        $("#modal_tablevalue_email").addClass("is-invalid");
        return;
    } else
        $("#modal_tablevalue_email").removeClass("is-invalid");

    enableDisableMe(e);
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "update_user",
            user_group_id: nextRandomId,
            uid: uid,
            fname: field_fname,
            lname: field_lname,
            email: field_email,
            company: field_company,
            job:field_job
        })
    }).done(function (response) {
        if(response.result == "success"){
            toastr.success( 'Updated successfully!');
            $('#modal_modify_row').modal('toggle');
            getUserGroupFromGroupId(nextRandomId);
            g_deny_navigation = null;
        }
        else
            toastr.error( response.error);
        enableDisableMe(e);
    }); 
}

function addUserFromFile() {
    if (RegTest($('#user_group_name').val(),'COMMON') == false) {
        $("#user_group_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character! Provide a valid name first.');
        return;
    } else{
        $("#user_group_name").removeClass("is-invalid");
        $('input[type=file]').trigger('click');
    }
}

// $('input[type=file]').change(function() {
//     if (RegTest($('#user_group_name').val(),'COMMON') == false) {
//         $("#user_group_name").addClass("is-invalid");
//         toastr.error( 'Empty/Unsupported character!');
//         return;
//     } else
//         $("#user_group_name").removeClass("is-invalid");

//     var file = $('#fileinput').prop('files')[0];

//     var fileExtension = ['csv', 'txt', 'lst', 'rtf'];
//     if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
//         toastr.error( 'Unsupported file type!');
//         return;
//     }

//     if (file) {
//         var reader = new FileReader();
//         reader.readAsText(file, "UTF-8");
//         reader.onload = function(evt) {
//             var user_data = evt.target.result;

//             $.post({
//                 url: "manager/userlist_campaignlist_mailtemplate_manager",
//                 contentType: 'application/json; charset=utf-8',
//                 data: JSON.stringify({ 
//                     action_type: "upload_user",
//                     user_group_id: nextRandomId,
//                     user_data : user_data,
//                     user_group_name: $('#user_group_name').val().trim()
//                 })
//             }).done(function (response) {
//                 if(response.result == "success"){
//                     toastr.success( 'User list added successfully!');
//                     getUserGroupFromGroupId(nextRandomId);
//                 }
//                 else
//                     toastr.error( response.error);
//             }); 
//         }
//         reader.onerror = function(evt) {
//             toastr.error( 'Error reading file!');
//         }
//     }
// });


$('#addcsvdata').click(function() {
    
    if (RegTest($('#user_group_name').val(),'COMMON') == false) {
        $("#user_group_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character!');
        return;
    } else
        $("#user_group_name").removeClass("is-invalid");

    var file = $('#fileinput').prop('files')[0];

    var fileExtension = ['csv', 'txt', 'lst', 'rtf'];
    if ($.inArray($('#fileinput').val().split('.').pop().toLowerCase(), fileExtension) == -1) {
        toastr.error( 'Unsupported file type!');
        return;
    }

    if (file) {
        var reader = new FileReader();
        reader.readAsText(file, "UTF-8");
        reader.onload = function(evt) {
            var user_data = evt.target.result;

            $.post({
                url: "manager/userlist_campaignlist_mailtemplate_manager",
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ 
                    action_type: "upload_user",
                    user_group_id: nextRandomId,
                    user_data : user_data,
                    user_group_name: $('#user_group_name').val().trim()
                })
            }).done(function (response) {
                if(response.result == "success"){
                    toastr.success( 'User list added successfully!');
                    getUserGroupFromGroupId(nextRandomId);
                }
                else
                    toastr.error( response.error);
            }); 
        }
        reader.onerror = function(evt) {
            toastr.error( 'Error reading file!');
        }
    }
});

function saveUserGroup(e) {
    if (RegTest($('#user_group_name').val(),'COMMON') == false) {
        $("#user_group_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character!');
        return;
    } else
        $("#user_group_name").removeClass("is-invalid");

    enableDisableMe(e);
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "save_user_group",
            user_group_id: nextRandomId,
            user_group_name: $('#user_group_name').val().trim()
        })
    }).done(function (response) {
        if(response.result == "success"){
            toastr.success( 'Saved successfully!');
            window.history.replaceState(null,null, location.pathname + '?action=edit&user=' + nextRandomId);
            g_deny_navigation = null;
        }
        else
            toastr.error( 'Error saving data!');
        enableDisableMe(e);
    }); 
}

function getUserGroupFromGroupId(id) {
    if (id == "new") {
        getRandomId();
        return;
    } else
        nextRandomId = id;

    try{
        dt_user_list.destroy();
    }catch{}

    dt_user_list = $('#table_user_list').DataTable({
        'processing': true,
        'serverSide': true,
        'ajax': {
           url:'manager/userlist_campaignlist_mailtemplate_manager',
           type: "POST",
           contentType: "application/json; charset=utf-8",
           data: function (d) {   //request parameters here
                    d.action_type="get_user_group_from_group_Id_table";
                    d.user_group_id=id;
                    return JSON.stringify(d);
                },
            dataSrc: function ( resp ){
                for ( var i=0, ien=resp.data.length ; i<ien ; i++ ) {
                    resp.data[i]['sn'] = i+1;
                    resp.data[i]['action'] = action_items;
                }
                $('#user_group_name').val(resp.user_group_name);
                $('#Modal_export_file_name').val(resp.user_group_name);
                return resp.data
            }
        },
        'columns': [
           { data: 'sn' }, 
           { data: 'fname' },
           { data: 'lname' },
           { data: 'email' },
           { data: 'company' },
           { data: 'job' },
           { data: 'action' },
        ],
        'columnDefs': [{ 'className':'dt-center'}],
        'pageLength': 20,
        'lengthMenu': [[20, 50, 100, 500, 1000, -1], [20, 50, 100, 500, 1000, 'All']],
        drawCallback:function(){
            $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
        },
        "initComplete": function() {
            $('label>select').select2({minimumResultsForSearch: -1, });
        }
  });
}


//===============================================
function promptUserGroupDeletion(id) {
    globalModalValue = id;
    $('#modal_user_group_delete').modal('toggle');
}

function userGroupDeletionAction() {
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "delete_user_group_from_group_id",
            user_group_id: globalModalValue
        })
    }).done(function (response) {
        if(response.result == "success"){
           $('#modal_user_group_delete').modal('toggle');
            toastr.success( 'Deleted successfully!');
            dt_user_group_list.destroy();
            $("#table_user_group_list tbody > tr").remove();
            loadTableUserGroupList();
        }
        else
            toastr.error("", response.error);
    }); 
}

function promptUserGroupCopy(id) {
    globalModalValue = id;
    $('#modal_user_group_copy').modal('toggle');
}

function UserGroupCopy() {
    if (RegTest($('#modal_new_user_group_name').val(), 'COMMON') == false) {
        $("#modal_new_user_group_name").addClass("is-invalid");
        toastr.error( 'Empty/Unsupported character!');
        return;
    } else
        $("#modal_new_user_group_name").removeClass("is-invalid");

    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "make_copy_user_group",
            user_group_id: globalModalValue,
            new_user_group_id: getRandomId(),
            new_user_group_name: $("#modal_new_user_group_name").val()
         })
    }).done(function (response) {
        if(response.result == "success"){
            toastr.success( 'Copy success!');
            $('#modal_user_group_copy').modal('toggle');
            dt_user_group_list.destroy();
            $("#table_user_group_list tbody > tr").remove();
            loadTableUserGroupList();
        }
        else
            toastr.error("", response.error);
    }); 
}

function loadTableUserGroupList() {
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_user_group_list"
         })
    }).done(function (data) {
        console.log(data);
        if(!data.error){  // no data
             $.each(data, function(key, value) { 
                var action_items_user_group_table = `<a class="" data-toggle="tooltip" data-placement="top" style="margin: 6px;" onclick="document.location='employeelist?action=edit&user=` + value.user_group_id + `'" title="View/Edit"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg></a><a class="" data-toggle="tooltip"  style="margin: 6px;"  data-placement="top" title="Copy" onclick="promptUserGroupCopy('` + value.user_group_id + `')"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-copy"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg></a><a class="" data-toggle="tooltip"   style="margin: 0px;"  data-placement="top" title="Delete" onclick="promptUserGroupDeletion('` + value.user_group_id + `')"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></a>`;
                $("#table_user_group_list tbody").append("<tr><td></td><td>" + value.user_group_name + "</td><td>" + value.user_count + "</td><td>"+value.user_data+"</td><td data-order=\"" + getTimestamp(value.date) + "\">" + value.date + "</td><td>" + action_items_user_group_table + "</td></tr>");
            });
        }
        dt_user_group_list = $('#table_user_group_list').DataTable({
            "bDestroy": true,
            "aaSorting": [3, 'asc'],
            'columnDefs': [{
                "targets": 4,
            }],
            
            "preDrawCallback": function(settings) {
                $('#table_user_group_list tbody').hide();
            },

            "drawCallback": function() {
                $('#table_user_group_list tbody').fadeIn(500);
                $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
            },   

            "initComplete": function() {
                $('label>select').select2({minimumResultsForSearch: -1, });
            }       
        });

        dt_user_group_list.on('order.dt_user_group_list search.dt_user_group_list', function() {
            dt_user_group_list.column(0, {
                search: 'applied',
                order: 'applied'
            }).nodes().each(function(cell, i) {
                cell.innerHTML = i + 1;
            });
        }).draw();        
    });   
}

function loadTableUsersList() {
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_users_list"
         })
    }).done(function (data) {
        console.log(data);
        if(!data.error){  // no data
             $.each(data, function(key, value) { 
                var action_items_user_group_table = `<a class="" data-toggle="tooltip" data-placement="top" style="margin: 6px;" onclick="window.open('useraccess?action=login&id=` + value.id + `','_blank')" title="" target="_blank"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-send"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg></a>`;

                $("#table_user_group_list tbody").append("<tr><td></td><td>" + value.name + "</td><td>" + value.username + "</td><td>"+value.contact_mail+"</td><td>" + action_items_user_group_table + "</td></tr>");
            });
        }
        dt_user_group_list = $('#table_user_group_list').DataTable({
            "bDestroy": true,
            "aaSorting": [3, 'asc'],
            'columnDefs': [{
                "targets": 4,
            }],
            
            "preDrawCallback": function(settings) {
                $('#table_user_group_list tbody').hide();
            },

            "drawCallback": function() {
                $('#table_user_group_list tbody').fadeIn(500);
                $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
            },   

            "initComplete": function() {
                $('label>select').select2({minimumResultsForSearch: -1, });
            }       
        });

        dt_user_group_list.on('order.dt_user_group_list search.dt_user_group_list', function() {
            dt_user_group_list.column(0, {
                search: 'applied',
                order: 'applied'
            }).nodes().each(function(cell, i) {
                cell.innerHTML = i + 1;
            });
        }).draw();        
    });   
}

function domainverification() {
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "user_group_domain_verify"
        })
    }).done(function (response) {
        console.log(response)
        $('#verificationbody').html(response.msg);
        // if(response.result == "success"){
        //    $('#modal_user_group_delete').modal('toggle');
        //     toastr.success( 'Deleted successfully!');
        //     dt_user_group_list.destroy();
        //     $("#table_user_group_list tbody > tr").remove();
        //     loadTableUserGroupList();
        // }
        // else
        //     toastr.error("", response.error);
    });
}