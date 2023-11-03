extension ExtString on String

{

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z\d.]+@[a-zA-Z\d]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }



  bool get isValidPassword {
    // final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#><*~.-])');

  //  if( isValidPassword == null || isValidPassword == ""){
    //   return false;
    // }else if( isValidPassword.length < 0 ){
    //   return false;
    // }
    return true;
  }
}