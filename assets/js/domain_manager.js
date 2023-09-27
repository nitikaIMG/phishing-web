function loadTableDomainListAdmin() {
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_domain_list_admin"
         })
    }).done(function (data) {
          
        if(!data.error){  // no data
            $.each(data, function(key, value) {
                var cust_header = "";
                if(!$.isEmptyObject(value.cust_headers)) 
                    $.each(value.cust_headers, function(header_name, header_value) {
                        cust_header += header_name + ": " + header_value + "</br>";
                    });
                else
                    cust_header = "-";
                   
                var action_items_sender_table = '<div class="d-flex no-block align-items-center"><a class="" style="margin: 6px;" data-toggle="tooltip" data-placement="top" title="" onclick="document.location=\'edit_domain_admin?action=edit&sender=' + value['id'] + '\'" data-original-title="Edit"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg></a></div>';

                $("#table_mail_sender_list tbody").append("<tr><td>"+ value.count +"</td><<td>" + value.name + "</td><td>" + value.path + "</td><td>" + value.created_at + "</td><td>" + value.modified_at + "</td><td>" + action_items_sender_table + "</td></tr>");
            });
        }
        dt_mail_sender_list = $('#table_mail_sender_list').DataTable({
            "aaSorting": [5, 'asc'],
            'pageLength': 20,
            'lengthMenu': [[20, 50, 100, -1], [20, 50, 100, 'All']],
            'columnDefs': [{
                "targets": 5,
                "className": "dt-center"
            }],
            "preDrawCallback": function(settings) {
                $('#table_mail_sender_list tbody').hide();
            },

            "drawCallback": function() {
                $('#table_mail_sender_list tbody').fadeIn(500);
                $('[data-toggle="tooltip"]').tooltip({ trigger: "hover" });
            },

            "initComplete": function() {
                $("label>select").select2({minimumResultsForSearch: -1, });
            }
        }, {
            "order": [[1, 'asc']]
        }); 

        dt_mail_sender_list.on('order.dt_mail_sender_list search.dt_mail_sender_list', function() {
            dt_mail_sender_list.column(0, {
                search: 'applied',
                order: 'applied'
            }).nodes().each(function(cell, i) {
                cell.innerHTML = i + 1;
            });
        }).draw();
    });   
}

function saveDomainByAdmin(e,val){
    var domain_name = $('#domain_name_admin_default').val().trim();
    var domain_path = $('#domain_path_admin_default').val().trim();
    var sender_id = $('#smtp_server').val().trim();

    if (domain_name == '') {
        toastr.error( 'Domain name is required!');
        return;
    }
    else if (domain_path == '') {
        toastr.error( 'Domain path is required!');
        return;
    } 
        enableDisableMe(e);
        $.post({
            url: "manager/userlist_campaignlist_mailtemplate_manager",
            data: JSON.stringify({ 
                action_type: "save_domain_by_admin",
                name: domain_name,
                path: domain_path,
                sender_id:sender_id,
             }),
            contentType: 'application/json; charset=utf-8'
        }).done(function (response) {
            if(response.result == "success"){
                location.reload();
                toastr.success( 'Added successfully!');
                $('#mailIntemodal').modal('hide');
            }
            else
                toastr.error( 'Error saving data!');
            enableDisableMe(e);
        });
}

function getDomainById(id) {
    $.post({
        url: "manager/userlist_campaignlist_mailtemplate_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_domain_by_id",
            domain_id: id,
         })
    }).done(function (data) {
        if(!data['error']){  // no data
            $('#domain_name_admin_default').val(data['name']);
            $('#domain_path_admin_default').val(data['path']);

            $('[data-toggle="tooltip"]').tooltip();
        }
    }); 
}

function updateDomainById(e,val){
    var domain_name = $('#domain_name_admin_default').val().trim();
    var domain_path = $('#domain_path_admin_default').val().trim();
    var domain_id = $('#domain_id_admin_default').val().trim();
    var sender_id = $('#smtp_server').val().trim();

    if (domain_name == '') {
        toastr.error( 'Domain name is required!');
        return;
    }
    else if (domain_path == '') {
        toastr.error( 'Domain path is required!');
        return;
    } 
        enableDisableMe(e);
        $.post({
            url: "manager/userlist_campaignlist_mailtemplate_manager",
            data: JSON.stringify({ 
                action_type: "update_domain_by_id",
                name: domain_name,
                path: domain_path,
                domain_id:domain_id,
                sender_id:sender_id,
             }),
            contentType: 'application/json; charset=utf-8'
        }).done(function (response) {
            if(response.result == "success"){
                toastr.success( 'Updated successfully!');
            }
            else
                toastr.error( 'Error saving data!');
            enableDisableMe(e);
        });
}

function get_smtp_list(id){
    $("#smtp_name").val("");
    $.post({
        url: "manager/settings_manager",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ 
            action_type: "get_smtp_domain",
            id:id
         })
    }).done(function (data) {
       
        if(!data['error']){  
            var smtp_server = data.smtp_server;
            var smtp_id = data.smpt_id;
        
            $.each(smtp_server, function(key, val) {
                console.log(smtp_id,val);
                if (smtp_id == val.sender_list_id) {
                    $("#smtp_server").append("<option value='" + val.sender_list_id + "' selected>" + val.sender_name+" ("+val.sender_smtp_server+")" + "</option>");
                }else{
                  
                    $("#smtp_server").append("<option value='" + val.sender_list_id + "'>" + val.sender_name+" ("+val.sender_smtp_server+")" + "</option>");
                }
                $("#smtp_name").val(val.sender_smtp_server);
                });
        }
    }); 
}

