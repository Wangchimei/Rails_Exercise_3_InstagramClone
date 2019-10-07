//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(document).ready(function () {
  $imgSrc = $('#imgFeed').attr('src');
  function readURL(input) {

    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#imgFeed').attr('src', e.target.result);
      };

      reader.readAsDataURL(input.files[0]);
    }
  }
  $('#btnChangePicture').on('click', function () {
    // document.getElementById('profilePicture').click();
    if (!$('#btnChangePicture').hasClass('changing')) {
      $('#profilePicture').click();
    }
    else {
      // change
    }
  });

  $('#profilePicture').on('change', function () {
    readURL(this);
    $('#btnChangePicture').addClass('changing');
    $('#btnChangePicture').attr('value', 'Confirm');
    $('#btnDiscard').removeClass('d-none');
    // $('#imgProfile').attr('src', '');
  });
  $('#btnDiscard').on('click', function () {
    // if ($('#btnDiscard').hasClass('d-none')) {
    $('#btnChangePicture').removeClass('changing');
    $('#btnChangePicture').attr('value', 'Change');
    $('#btnDiscard').addClass('d-none');
    $('#imgProfile').attr('src', $imgSrc);
    $('#profilePicture').val('');
    // }
  });
});