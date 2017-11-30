$(function () {
    var current_id = 0;
    var table = $('#userTable').DataTable({
        "aLengthMenu": [[5, 10, 25, 50, 75, -1], [5, 10, 25, 50, 75, "All"]],
        "iDisplayLength": 5,
        "language": {
            "processing": "Veuillez patienter...",
            "lengthMenu": "Afficher _MENU_ utilisateur",
            "zeroRecords": "Aucun utilisateur ",
            "info": "Page _PAGE_ sur _PAGES_",
            "infoEmpty": "Aucun utilisateur",
            "infoFiltered": "(filtered from _MAX_ total records)"
        },
        "fnPreDrawCallback": function (oSettings) {

        },
        "fnDrawCallback": function (oSettings) {
        },
        processing: true,
        "ajax":
                {
                    "url": Routing.generate('eco_job_admin_users_dashoard'),
                    "dataSrc": ""
                },
        "columns": [
            {"data": "id"},
            {"data": "username"},
            {"data": "email"},
            {"data": "type.libelle"},
            {"data": ""},
        ],
        "columnDefs": [{
                "targets": -1,
                "data": null,
                "defaultContent": "<button class='btn btn-view'><span class='glyphicon glyphicon-eye-open'></span> </button>\n\
                <button class='btn btn-danger btn-delete'><span class='glyphicon glyphicon-remove'></span></button>\n\
"

            }]
    });
    table.on('xhr', function () {
        var json = table.ajax.json();
    });

    $('#userTable tbody').on('click', 'button', function () {
        current_id = $(this).parent().parent().children('td:nth(0)').text();

        if ($(this).is('.btn-delete ')) {
            $("#globModal").modal('show');
        } else {
            $.ajax({
                type: 'GET',
                url: Routing.generate('eco_job_admin_showuser', {id: current_id}),
                timeout: 300000,
                success: function (response) {
                    $('#profilModal .modal-body').children().remove();
                    $('#profilModal .modal-body').append(response);
                    $('#profilModal.modal-header h4').text("Utilisateur n° " + current_id)
                    $('#profilModal').modal('show');
                },
                error: function () {
                    alert("La requête n'a pas abouti. Le candidat n'a pas encore ajouté son CV. Rappelez vous aussi qu'un recruteur n'a pas de CV");

                }
            });
        }

    }
    );
    $('.valider').click(function () {
        $.ajax({
            type: 'GET',
            url: Routing.generate('eco_job_admin_users_delete_existing', {id: current_id}),
            timeout: 300000,
            beforeSend: function () {
                $.blockUI({
                    message: '<p class="loader"></p>',
                    css: {border: 'none', backgroundColor: 'transparent', width: '66px', top: ($(window).height() - 100) / 2 + 'px', left: ($(window).width() - 100) / 2 + 'px', }
                });
            },
            success: function (response) {
                $('#globModal').modal('hide');
                table.ajax.reload();
                table.ajax.json();

            },
            error: function () {
                alert('La requête n\'a pas abouti');
            },
            complete: function () {
                $.unblockUI();
            }
        });
    });
});