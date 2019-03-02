class PersonJson {

  static PersonJson _instance = new PersonJson.internal();

  PersonJson.internal();

  factory PersonJson() => _instance;

  static String getJson() {
    return '''
      {
        "person": {
          "apiUrl": "Local",
          "name": "Julio",
          "lastName": "Bitencourt",
          "github": "github.com/JHBitencourt",
          "twitter": "@JuliooHB",
          "website": "juliobitencourt.com"
        }
      }
    ''';
  }

}