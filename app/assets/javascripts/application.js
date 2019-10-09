//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require_tree .

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


$(function () {
  $('#profile').on('change', function (e) {
    // for one image
    var file = e.target.files[0];
    var $preview = $("#avatar_field");

    var fileReader = new FileReader();
    fileReader.onload = function () {
      // Data URIを取得
      var dataUri = this.result;
      $preview.empty();
      $preview.append($('<img>').attr({
        "src": dataUri,
        "class": "preview image_box",
      }));
    };
    $("#imgProfile").empty();
    $('#btnChangePicture').removeClass('d-none');
    // read file via Data URI
    fileReader.readAsDataURL(file);
  });
});


// Favorites
// $(function () {
//   $('#like-mark').on('click', function () {
//     if ($(this).hasClass('fas fa-heart ml-3')) {
//       $(this).removeClass('fas fa-heart ml-3')
//         .addClass('far fa-heart ml-3');
//     } else if ($(this).hasClass('far fa-heart ml-3')) {
//       $(this).removeClass('far fa-heart ml-3')
//       .addClass('fas fa-heart ml-3');
//     } 
//   });
// });