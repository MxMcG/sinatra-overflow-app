$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // $('.upvote_question').on('click', function(e){
  //   e.preventDefault();

  //   var path = $(this).attr('href');

  //   $.ajax({
  //     url: path,
  //     method: 'get'
  //   }).done(function(response){
  //     $('#question_vote_tally').html(response)
  //   })

  // })

  // $('.downvote_question').on('click', function(e){
  //   e.preventDefault();

  //   var path = $(this).attr('href');

  //   $.ajax({
  //     url: path,
  //     method: 'get'
  //   }).done(function(response){
  //     $('#question_vote_tally').html(response)
  //   })

  // })

  $('.login_link').one('click', function(event){
    event.preventDefault();

    var path = $(this).attr('href');
      console.log(path)
    $.ajax({
      url: path,
      method: 'get'
    }).done(function(response){
      $('.login_div').append(response);
      $('.login_div').css('display', 'block');
      $('.register_div').hide();
    })

  });

  $('.reg_link').one('click', function(event){
    event.preventDefault();

    var path = $(this).attr('href');
      console.log(path)
    $.ajax({
      url: path,
      method: 'get'
    }).done(function(response){
      $('.register_div').append(response);
      $('.login_div').hide();
      $('.register_div').css('display', 'block');
    })

  });

  $('.upvote_answer').on('click', function(e){
    e.preventDefault();

    var path = $(this).attr('href');

    $.ajax({
      url: path,
      method: 'get',
      dataType: 'json'
    }).done(function(response){
      console.log($(response.answer_id + "-vote-tally"))
    })
  })

  $('.downvote_answer').on('click', function(e){
    e.preventDefault();

    var path = $(this).attr('href');

    $.ajax({
      url: path,
      method: 'get'
    }).done(function(response){
      $('.answer_vote_tally').html(response)
    })
  })

  // $('.upvote_comment').on('click', function(e){
  //   e.preventDefault();

  //   var path = $(this).attr('href');

  //   $.ajax({
  //     url: path,
  //     method: 'get'
  //   }).done(function(response){
  //     $('#comment_vote_tally').html(response)
  //   })

  // })

  // $('.downvote_comment').on('click', function(e){
  //   e.preventDefault();

  //   var path = $(this).attr('href');

  //   $.ajax({
  //     url: path,
  //     method: 'get'
  //   }).done(function(response){
  //     $('#comment_vote_tally').html(response)
  //   })

  // })

  $(".answer_button").click(function(e){
    e.preventDefault();

    $.ajax({
      url: $(this).attr('href'),
      method: 'get'
    }).done(function(response){
      console.log($(response).find("form"))
      $('.answer-form-here').append(response)
      $(".answer_button").css("display", "none")
    })
  })
  // end doc ready

  $( "p.answer-form-here" ).on( "click", ".answer-form", function(banana) {
    banana.preventDefault();

    $.ajax({
      url: $(this).attr('action'),
      method: 'post',
      data: $(".answer-form").serialize()
    }).done(function(response){
      // console.log(response)
      $('body').append(response)
    })
  });

});
