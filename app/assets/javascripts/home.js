// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function() {
    $('.available_players').on('click', function(){
        $('#select').modal()
    });

    $('#show_player').bind('ajax:before', function() {
        $(this).hide();
        $('.player-content').append('<i class="fa fa-spinner fa-pulse player_loading"></i><div class="spinner-text"></div>');
    });

    $('#show_player').bind('ajax:success', function(evt, data, status, xhr) {
        $('.spinner-text').html('Please wait.. While your request is processing..');
        setTimeout(function(){ results(); }, 5000);

        function results() { 
            $('.player-content').html(data.html)
        };
    });
    
});
