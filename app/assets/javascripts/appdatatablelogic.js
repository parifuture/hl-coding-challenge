var cols = [];
cols.push({ title: 'Address'});
cols.push({ title: 'Listed'});
cols.push({ title: 'Listing Price'});
cols.push({ title: 'Sold'});
cols.push({ title: 'Selling Price'});

function commaSeparateNumber(val) {
    if (val != null && val != undefined && val != '') {
        while (/(\d+)(\d{3})/.test(val.toString())) {
            val = val.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
        }
    }
    return val;
}

$(document).ready(function() {
    // $('#table').dataTable({
    //     "order": [
    //         [0, "desc"]
    //     ],
    //     dom: 'lfrtBip',
    //     scrollX: true,
    //     columns: cols,
    //     fixedHeader: {
    //         header: true,
    //         footer: true
    //     },
    //     responsive: false,
    //     bAutoWidth: true,
    //     pagingType:'input',
    //     language: {
    //         emptyTable: "No data available in table"
    //     },
    //     columnDefs: [{
    //         "render": function (datenter, code, herea, type, row) {
    //             return commaSeparateNumber(datenter);
    //         },
    //         "targets": [2,4]
    //     }]
    // });
    // const table = $('table').DataTable();

});


