$.ajax({
  method: 'GET',
  url: 'https://hello-heroku-tf2017.herokuapp.com/api/projects',
  dataType: 'json',
  data: {}
}).done(function(project) {
    console.log("Project Created", project);
  })
  .fail(function() {
    console.log("error");
  });

// $.getJSON( "ajax/test.json", function( data ) {
//   var projects_api = "https://hello-heroku-tf2017.herokuapp.com/api/projects";
//   $.each( data, function( key, val ) {
//     items.push( "<li id='" + key + "'>" + val + "</li>" );
//   });
//
//   $( "<ul/>", {
//     "class": "task-list",
//     html: items.join( "" )
//   }).appendTo( "body" );
// });
