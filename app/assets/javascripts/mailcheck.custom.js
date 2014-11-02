$(document).ready(function(){
  var $email = $('input.email');
  $email.after( "<div class='mailcheck-hint'></div>" );
  var $hint = $email.next();

  $email.on('blur',function() {

    $(this).mailcheck({
      suggested: function(element, suggestion) { 

        if(!$hint.html()) {

              // First error - fill in/show entire hint element
              var suggestion = "<span class='mailcheck'>Yikes! Did you mean <a href='#' class='mailcheck-suggestion'>" + suggestion.full + 
              "</a>?</span>";

              $hint.html(suggestion).fadeIn(150);
            } else {
              // Subsequent errors
              $("a.mailcheck-suggestion").html(suggestion.full);
            }

            $hint.on('click', '.mailcheck', function() {
          // On click, fill in the field with the suggestion and remove the hint
          $email.val($(".mailcheck-suggestion").text());
          $hint.fadeOut(200, function() {
            $(this).empty();
          });
          return false;
        });

          },
          empty: function() {
            $hint.empty();
          }
        });
  });
});
