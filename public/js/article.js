$(document).ready(function(){

    var numberer = 1;
    articleTable = $('#articleTable').on('preXhr.dt', function ( e, settings, data ){
            numberer = data.start + 1;
        }).on('xhr.dt', function ( e, settings, json, xhr ){
            $('#articleTable_filter').hide();
        }).DataTable({
            language: {
                url: 'https://cdn.datatables.net/plug-ins/1.10.16/i18n/Indonesian.json'
            },
            serverSide: true,
            bInfo: false,
            ajax: {
                url: document.app.site_url + 'article/get',
                type: 'POST'
            },
            columns: [
                {
                    name: 'Number',
                    width: "5%",
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        return numberer++;
                    }
                },
                { data: "title", orderable: false },
                { data: "content", orderable: false },
                { data: "author", orderable: false },
                {
                    data: 'network_id',
                    width: "12%",
                    orderable: false,
                    render: function ( data, type, full, meta ) {
                        var button = [];
                        button.push('<button onclick="updNetwork('+data+')" type="button" class="btn btn-info btn-outline btn-circle btn-sm m-r-5"><i class="fa fa-pencil"></i></button>');
                        button.push('<button onclick="delNetwork('+data+')" type="button" class="btn btn-danger btn-outline btn-circle btn-sm m-r-5"><i class="fa fa-trash"></i></button>');

                        return button.join('');
                    }
                }
            ]
        });
});

function add(){
    $('#articleForm')[0].reset();
    formPopulate('#articleForm', {
        id: 0
    })
    $('#articleModal').modal({
        backdrop: 'static',
        keyboard: false
    });
}

function updNetwork(id){
    $('.preloader').fadeIn();
    $.ajax({
        method: "POST",
        url: document.app.site_url+'/network/get/byid/'+id
    })
    .done(function( response ) {
        $('.preloader').fadeOut();
        formPopulate('#articleForm', response)
    });

    $('#articleModal').modal({
        backdrop: 'static',
        keyboard: false
    });
}

$('#btnSaveArticle').click(function(e){
    var data = serialzeForm('#articleForm');

    $('.preloader').fadeIn();
    $.ajax({
        method: "POST",
        url: document.app.site_url+'article/save',
        data: data
    })
    .done(function( response ) {
        $('.preloader').fadeOut();

        console.log(response);

        if(!response.status) {
            swal("Wuu! "+response.message, {
                icon: "warning",
            });
        } else {
            $('#articleModal').modal('toggle')
            $('#articleForm')[0].reset()
            articleTable.ajax.reload()
            swal("Wuu! "+response.message, {
                icon: "success",
            });
        }
    });
})

function delNetwork(id){
    swal({
        title: "Apakah Anda yakin?",
        text: "Anda akan menghapus artikel ini!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
    .then((willDelete) => {
        if (willDelete) {
            swal("Wuu! Artkel telah dihapus!", {
                icon: "success",
            });
        }
    });
}
