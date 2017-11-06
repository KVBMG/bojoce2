$(function () {
    var current_id = 0,
        _selectedRow = null;
    var table = $('#offreTable').DataTable({
        "aLengthMenu": [[5, 10, 25, 50, 75, -1], [5, 10, 25, 50, 75, "All"]],
        "iDisplayLength": 5,
        "language": {
            "processing": "Veuillez patienter...",
            "lengthMenu": "Afficher _MENU_ offres",
            "zeroRecords": "Aucune offre",
            "info": "Page _PAGE_ sur _PAGES_",
            "infoEmpty": "Aucune offre",
            "infoFiltered": "(filtered from _MAX_ total records)"
        },
        "fnPreDrawCallback": function (oSettings) {

        },
        "fnDrawCallback": function (oSettings) {
        },
        scrollY:        "300px",
        scrollX:        true,
        scrollCollapse: true,        
        processing: true,
        "ajax":
            {
                "url": Routing.generate('eco_job_admin_offres_all'),
                "dataSrc": ""
            },
        "columns": [
            {"data": "id"},
            {"data": "titre"},
            {"data": "categorie_designation"},
            {"data": "createdAt"},
            {"data": "recruteur_username"},
            {"data": "recruteur_email"},
            {"data": ""},
        ],
        "columnDefs": [{
            "targets": -1,
            "data": null,
            "width": "20%",
            "defaultContent": " <button class='btn btn-danger btn-delete'><span class='glyphicon glyphicon-remove'></span></button>\n\
"

        }]         
    });
    table.on('xhr', function () {
        var json = table.ajax.json();
    });

    $('#offreTable tbody').on('click', 'button', function () {
            current_id = $(this).parent().parent().children('td:nth(0)').text();
            _selectedRow = $(this).parent().parent();
            if ($(this).is('.btn-delete ')) {
                $("#globModal").modal('show');
            } else {
                $.ajax({
                    type: 'GET',
                    url: Routing.generate('eco_job_admin_showuser', {id: current_id}),
                    timeout: 3000,
                    success: function (response) {
                        $('#profilModal .modal-body').children().remove();
                        $('#profilModal .modal-body').append(response);
                        $('#profilModal.modal-header h4').text("Utilisateur n° " + current_id)
                        $('#profilModal').modal('show');
                    },
                    error: function () {
                        alert('La requête n\'a pas abouti');

                    }
                });
            }
        }
    );
    $('.valider').click(function () {
       $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_admin_offre_delete_ajax', {id: current_id}),
            timeout: 30000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $('#globModal').modal('hide');
                _selectedRow.hide();
                table.ajax.json();
            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
                _selectedRow = null;
            }
        });
    });
});