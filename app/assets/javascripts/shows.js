var internationals = $( "input[name$='international]'][type='checkbox']" );
$( "input[name$='international]'][type='checkbox']" ).click(function(){
 
  if ( this.checked ){
    $(this).parents(".band-fields").children("select[name$='country]']").removeClass("hide");
    $(this).parents(".band-fields").children("select[name$='state]']").hide();
  }else{
    $(this).parents(".band-fields").children("select[name$='state]']").show();
    $(this).parents(".band-fields").children("select[name$='country]']").addClass("hide");
  } 

});

console.log(internationals);
