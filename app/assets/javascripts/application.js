// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


jQuery(document).on('turbolinks:load', function() {
  jQuery("#injury").click(function() {
    let twenty_sided = Math.floor(Math.random() *20);
    let injury = "OK";

    switch(twenty_sided) {
      case 3:
      case 4:
        injury = "REM";
        break;
      case 5:
      case 6:
      case 7:
      case 8:
        injury = "1";
        break;
      case 9:
      case 10:
      case 11:
        injury = "2";
        break;
      case 12:
      case 13:
        injury = "3";
        break;
      case 14:
        injury = "4*";
        break;
      case 15:
        injury = "5*";
        break;
      case 16:
        injury = "6*";
        break;
      case 17:
        injury = "7*";
        break;
      case 18:
        injury = "8*";
        break;
      case 19:
        injury = "10*";
        break;
      case 20:
        injury = "15*";
        break;
      default:
        injury = "OK";
    }
    jQuery("#injury-result").html("<h2>" + injury + "</h2>");
    jQuery("#injury-result").append("<p>*If the total of this player's at-bats plus walks is grater than 599, the player is only injured for 3 games.</p>");

  });

  // ========== STANDINGS TABLES ========== //
  jQuery(".conf-button").click(function() {
    jQuery('.conf-button').removeClass('active');
    jQuery(this).addClass('active');
  });

  jQuery('.west-div-button').click(function() {
    jQuery('.west-div-button').removeClass('active');
    jQuery('.stand-table-west').css('display', 'none');
    jQuery(this).addClass('active');
  });

  jQuery('.east-div-button').click(function() {
    jQuery('.east-div-button').removeClass('active');
    jQuery('.stand-table-east').css('display', 'none');
    jQuery(this).addClass('active');
  });

  
  jQuery("#stand-west").click(function() {
    jQuery('#east-conf').css('display', 'none');
    jQuery('#west-conf').css('display', 'block');
    jQuery('#east-table').css('display', 'none');
    jQuery('#west-table').css('display', 'block');
  });

  jQuery("#stand-east").click(function() {
    jQuery('#west-conf').css('display', 'none');
    jQuery('#east-conf').css('display', 'block');
    jQuery('#west-table').css('display', 'none');
    jQuery('#east-table').css('display', 'block');
  });

  
  jQuery("#sou-div").click(function() {
    jQuery('#stand-sou').css('display', 'block');
  });

  jQuery("#nor-div").click(function() {
    jQuery('#stand-nor').css('display', 'block');
  });

  jQuery("#eur-div").click(function() {
    jQuery('#stand-eur').css('display', 'block');
  });

  jQuery("#afr-div").click(function() {
    jQuery('#stand-afr').css('display', 'block');
  });

  jQuery("#asi-div").click(function() {
    jQuery('#stand-asi').css('display', 'block');
  });

  jQuery("#oce-div").click(function() {
    jQuery('#stand-oce').css('display', 'block');
  });

  // ========== LEAGUE LEADERS ========== //

  jQuery('.league-leaders-button').click(function() {
    jQuery('.league-leaders-button').removeClass('active');
    jQuery(this).addClass('active');
    jQuery('.player-stats').css('display', 'none');
  })

  jQuery("#leaders-pitching").click(function() {
    jQuery('#pitching-stats').css('display', 'block');
  });

  jQuery("#leaders-hitting").click(function() {
    jQuery('#hitting-stats').css('display', 'block');
  });


})
