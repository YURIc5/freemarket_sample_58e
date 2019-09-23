  $(document).on('turbolinks:load', function(){
    $(function(){
    $('.input-default').on('keyup', function(){
        var input = $(this).val();
        var fee = Math.floor(input * 0.1);
        var gain = input - fee ;
        if (input >= 300 && input <= 9999999){
          $('.list-right-fee').html("¥" + fee);
          $('.list-right-profit').html("¥" + gain);
        } else { 
          $(".list-right-fee").text("-");
          $(".list-right-profit").text("-");
        }      
    });
  });
});