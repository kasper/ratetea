var TEAS = {};

TEAS.show = function(){

    $('#teas tr:gt(0)').remove();

    var table = $('#teas tbody');

    $.each(TEAS.list, function (index, tea) {

        table.append('<tr>'
                     + '<td>' + tea.name + '</td>'
                     + '<td>' + tea.variety.name + '</td>'
                     + '<td>' + tea.brewery.name + '</td>'
                     + '</tr>')
    });
};

TEAS.compareString = function (a, b) {

    if (a.toUpperCase() === b.toUpperCase()) {
        return 0;
    }

    return a.toUpperCase() > b.toUpperCase() ? 1 : -1;
}

TEAS.sortByName = function () {

    TEAS.list.sort(function (a, b) {

        return TEAS.compareString(a.name, b.name);
    });
};

TEAS.sortByVariety = function () {

    TEAS.list.sort(function (a, b) {

        return TEAS.compareString(a.variety.name, b.variety.name);
    });
};

TEAS.sortByBrewery = function () {

    TEAS.list.sort(function (a, b) {

        return TEAS.compareString(a.brewery.name, b.brewery.name);
    });
};

$(document).ready(function () {

    $('#name').click(function (event) {

        event.preventDefault();

        TEAS.sortByName();
        TEAS.show();
    });

    $('#variety').click(function (event) {

        event.preventDefault();

        TEAS.sortByVariety();
        TEAS.show();
    });

    $('#brewery').click(function (event) {

        event.preventDefault();

        TEAS.sortByBrewery();
        TEAS.show();
    });

    if ($('#teas')) {

        $.getJSON('teas.json', function (teas) {

            TEAS.list = teas;
            TEAS.show();
        });
    }
});
