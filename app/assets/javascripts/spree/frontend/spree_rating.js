$(document).ready(function(){
  $('#fast_rating_form').on('ajax:success', function(xhr, data, status){
    if(data.status == 'ok'){
      $('#fast_rating_form').replaceWith(data.message);
    }
  });
});

