class Queries {
  String fetchPhonePrefix(){
    return'''
      query{
        getActiveCountries(){
          callingCode,
          name,
          flag
        }
      }
    ''';
  }
}