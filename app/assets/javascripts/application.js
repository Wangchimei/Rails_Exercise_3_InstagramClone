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
    // 1枚だけ表示する
    var file = e.target.files[0];
    var $preview = $("#img_field");

    // ファイルリーダー作成
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
    // ファイルをData URIとして読み込む
    fileReader.readAsDataURL(file);
  });
});