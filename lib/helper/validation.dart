






class Validation{
  static bool emailValidation(String value) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value) &&( value.endsWith(".com")||value.endsWith(".in"));
  }



  static bool passwordValidation(String value) {
    return value.length >= 6;
  }
  static bool confirmPasswordValidation(String confirm,String password) {
    return ( confirm.length >= 6&& password.compareTo(confirm)==0);
  }





 static String? emailValidationResult(String? value){
    if(value!.isEmpty){
      return "Email field is required";
    }else if(!Validation.emailValidation(value)){
      return "Wrong email format";
    }else{
      return null;
    }
  } static String? passwordValidationResult(String? value){
    if(value!.isEmpty){
      return "Password field is required";
    }else if(!Validation.passwordValidation(value)){
      return "Password is too short";
    }else{
      return null;
    }
  }
}