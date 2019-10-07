//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// File field
$(function () {
  $('#file').on('change', function (e) {
    // for one image
    var file = e.target.files[0];
    var $preview = $("#img_field");

    var fileReader = new FileReader();
    fileReader.onload = function () {
      // Data URIを取得
      var dataUri = this.result;
      $preview.empty();
      $preview.append($('<img>').attr({
        "src": dataUri,
        "width": "100%",
        "class": "preview",
      }));
    };
    $("#uploaded_img").empty();
    // read file via Data URI
    fileReader.readAsDataURL(file);
  });
});

// $(function () {
//   $('#file').on('change', function (e) {
//     // for one image
//     var file = e.target.files[0];
//     var $preview = $("#img_field");

//     var fileReader = new FileReader();
//     fileReader.onload = function () {
//       // Data URIを取得
//       var dataUri = this.result;
//       $preview.empty();
//       $preview.append($('<img>').attr({
//         "src": dataUri,
//         "width": "100%",
//         "class": "preview",
//       }));
//     };
//     $("#uploaded_img").empty();
//     // read file via Data URI
//     fileReader.readAsDataURL(file);
//   });
// });