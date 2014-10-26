(function () {
    $("#EmployeesUpdatePanel").on("click", ".selectButton a", function () {
        $("#OrdersGridView").remove("#OrdersGridView");
    });
})();