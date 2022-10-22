

class FormValidator {


  validTitle(String value, {bool req=true}){
    if(value != ''){
      if (value.isNotEmpty) {
        return true;
      }
      else {return false;}
    }else{
      if(req){return false;}
      return true;
    }
  }

  validShortDescription(String value, {bool req=false}){
    if(value != ''){
      if (value.isNotEmpty) {
        return true;
      }
      else {return false;}
    }else{
      if(req)return false;
      return true;
    }
  }

  validContent(String value, {bool req=true}){
    if(value != ''){
      if (value.isNotEmpty) {
        return true;
      }
      else {return false;}
    }else{
      if(req){return false;}
      return true;
    }
  }


  validFullName(String value, {bool req=true}){
    if(value != ''){

      var valChecked = value.trim().split(' ');
      if (valChecked.length >= 2) {
        return true;
      }
      else {return false;}
    }else{
      if(req)return false;
      return true;
    }
  }

  validEmail(String value, {bool req=false}){
    if(value != ''){
      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    }else{
      if(req)return false;
      return true;
    }
  }


  validPassword(String value, int length, {bool req=true}){
    if(value != ''){
      if (value.length >= length) {
        return true;
      }
      else {return false;}
    }else{
      if(req){return false;}
      return true;
    }
  }

}