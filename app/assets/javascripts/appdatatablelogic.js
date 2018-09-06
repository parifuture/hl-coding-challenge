var cols = [];
cols.push({ title: 'address'});
cols.push({ title: 'listing_date'});
cols.push({ title: 'listing_price'});
cols.push({ title: 'selling_date'});
cols.push({ title: 'selling_price'});

$(document).ready(function() {
    $('#table').dataTable({
        processing: true,
        serverSide: true,
        ajax: $('#table').data('source'),
        // dom: 'lfrtBip',
        columns: cols,
        searching: true,
        ordering: true,
        lengthMenu: [10,25,50,100],
        fixedHeader: {
            header: true,
            footer: true
        },
        bAutoWidth: true,
        pagingType:'input',
        language: {
            emptyTable: "No data available in table"
        },
    });
    const table = $('#table').DataTable();

});


