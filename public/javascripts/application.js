// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function unlock(){ var form = '<div style=\'margin-top:20px;margin-left:10px;\'><form action="/session" method="post">\n  <p><input id="user_email" name="user_email" type="text" value="email" size="20" onFocus=\'if(this.value=="email"){this.value=""}\' autocomplete="OFF" />\n <input id="user_pwd" name="user_pwd" type="text" value="password" onFocus=\'if(this.value=="password"){this.type="password";this.value=""}\' size="20" autocomplete="OFF" /></p>\n <input type="submit" value=" ENTRA " id="search_btn">\n</form>'; if ( $('k1').value == '1' && $('k2').value == '2' && $('k3').value == '3' ){ $('login').innerHTML = form } }

function MM_jumpMenu(targ,selObj,restore){
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
