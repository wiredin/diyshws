var internationals = $( "input[name$='international]'][type='checkbox']" );
$( "input[name$='international]'][type='checkbox']" ).click(function(){
 
  if ( this.checked ){
    $(this).parents(".band-fields").children(".country-div").removeClass("hide");
    $(this).parents(".band-fields").children(".state-div").hide();
  }else{
    $(this).parents(".band-fields").children(".state-div").show();
    $(this).parents(".band-fields").children(".country-div").addClass("hide");
  } 

});

console.log(internationals);
