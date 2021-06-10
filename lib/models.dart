import 'dart:convert';

CovidData CovidDataFromJson(String str) => CovidData.fromJson(json.decode(str));
String CovidDataToJson(CovidData data) => json.encode(data.toJson());



class CovidData {
  String id;
  String message;
  Global global;
  List<Countries> countries;
  String date;
  CovidData({
    required this.id,
    required this.message,
    required this.global,
    required this.countries,
    required this.date,
  });



  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Message': message,
      'Global': global.toMap(),
      'Countries': countries.map((x) => x.toMap()).toList(),
      'Date': date,
    };
  }

  factory CovidData.fromMap(Map<String, dynamic> map) {
    return CovidData(
      id: map['ID'],
      message: map['Message'],
      global: Global.fromMap(map['Global']),
      countries: List<Countries>.from(map['Countries']?.map((x) => Countries.fromMap(x))),
      date: map['Date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CovidData.fromJson(String source) => CovidData.fromMap(json.decode(source));
}

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;
  Global({
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
  });



  Map<String, dynamic> toMap() {
    return {
      'NewConfirmed': newConfirmed,
      'TotalConfirmed': totalConfirmed,
      'NewDeaths': newDeaths,
      'TotalDeaths': totalDeaths,
      'NewRecovered': newRecovered,
      'TotalRecovered': totalRecovered,
      'Date': date,
    };
  }

  factory Global.fromMap(Map<String, dynamic> map) {
    return Global(
      newConfirmed: map['NewConfirmed'],
      totalConfirmed: map['TotalConfirmed'],
      newDeaths: map['NewDeaths'],
      totalDeaths: map['TotalDeaths'],
      newRecovered: map['NewRecovered'],
      totalRecovered: map['TotalRecovered'],
      date: map['Date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Global.fromJson(String source) => Global.fromMap(json.decode(source));
}

class Countries {
  String id;
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;
  Countries({
    required this.id,
    required this.country,
    required this.countryCode,
    required this.slug,
    required this.newConfirmed,
    required this.totalConfirmed,
    required this.newDeaths,
    required this.totalDeaths,
    required this.newRecovered,
    required this.totalRecovered,
    required this.date,
  });

 

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Country': country,
      'CountryCode': countryCode,
      'Slug': slug,
      'NewConfirmed': newConfirmed,
      'TotalConfirmed': totalConfirmed,
      'NewDeaths': newDeaths,
      'TotalDeaths': totalDeaths,
      'NewRecovered': newRecovered,
      'TotalRecovered': totalRecovered,
      'Date': date,
    };
  }

  factory Countries.fromMap(Map<String, dynamic> map) {
    return Countries(
      id: map['ID'],
      country: map['Country'],
      countryCode: map['CountryCode'],
      slug: map['Slug'],
      newConfirmed: map['NewConfirmed'],
      totalConfirmed: map['TotalConfirmed'],
      newDeaths: map['NewDeaths'],
      totalDeaths: map['TotalDeaths'],
      newRecovered: map['NewRecovered'],
      totalRecovered: map['TotalRecovered'],
      date: map['Date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Countries.fromJson(String source) => Countries.fromMap(json.decode(source));
}
