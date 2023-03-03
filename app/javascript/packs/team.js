document.addEventListener("turbolinks:load", function() {
  $(document).on('click', '.add_players_button', function(event){
    console.log("Add Player");
    event.preventDefault()
    var players_count = $(".nested-players-form").length
    if (players_count >= 5){
      //$('.add_players_button').attr('aria-disabled', true)
      $('.add_players_button').css('display', "none")
    }
    else{
      //$('.add_players_button').attr('aria-disabled', false)
      $('.add_players_button').css('display', "")
    }
  });

  $(document).on('click', '.remove_player_button', function(){
    console.log("Remove Player");
    $(this).parents('.nested-players-form').remove()
    var players_count = $(".nested-players-form").length
    if (players_count < 5){
      //$('.add_players_button').attr('aria-disabled', true)
      $('.add_players_button').css('display', "")
    }
  })
});
