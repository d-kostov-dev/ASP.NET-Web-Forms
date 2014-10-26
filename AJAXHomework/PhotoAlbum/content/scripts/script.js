(function () {
    $("#imageSlider").on("click", ".Image", function (ev) {
        var attr = $("#mainContent_currentImage").attr("src");
        
        window.open(attr, 'Popup', 'toolbar=no, location=yes, status=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=750, left=430, top=23');
    });
})();