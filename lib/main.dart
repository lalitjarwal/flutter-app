import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://demoapi.fractalite.com/api/persons?criteria='));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('200');
    print(Album.fromJson(jsonDecode(response.body)));
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print('500');
    throw Exception('Failed to load album');
  }
}

class Album {
  final dynamic id;
  final dynamic createdBy;
  final dynamic creationDate;
  final dynamic lastModifiedBy;
  final dynamic lastModifiedByDate;
  final dynamic name;
  final dynamic website;
  final dynamic preferedMedia;
  final dynamic boId;
  final dynamic personType;
  final dynamic clientSince;
  final dynamic lastpurchase;
  final dynamic blacklisted;
  final dynamic language;
  final dynamic country;
  final dynamic activityType;
  final dynamic stopMail;
  final dynamic stopEmail;
  final dynamic stopSMS;
  final dynamic stopTel;
  final dynamic classification;
  final dynamic description;
  final dynamic documents;
  final dynamic emails;
  final dynamic mainEmail;
  final dynamic phones;
  final dynamic mainphone;
  final dynamic adresses;
  final dynamic mainAddresse;
  final dynamic account;
  final dynamic segments;
  final dynamic contents;
  final dynamic photos;
  final dynamic tags;
  final dynamic audience;
  final dynamic timeToCall;
  final dynamic valid;
  final dynamic checked;
  final dynamic comment;
  final dynamic logo;
  final dynamic themeCode;
  final dynamic socialReason;
  final dynamic created;
  final dynamic capital;
  final dynamic capitalcurr;
  final dynamic currency;
  final dynamic longitude;
  final dynamic latitude;
  final dynamic timeZone;
  final dynamic ratings;
  final dynamic customerRating;
  final dynamic legalForm;
  final dynamic ice;
  final dynamic lastbooking;

  Album({
    required this.id,
    required this.createdBy,
    required this.creationDate,
    required this.lastModifiedBy,
    required this.lastModifiedByDate,
    required this.name,
    required this.website,
    required this.preferedMedia,
    required this.boId,
    required this.personType,
    required this.clientSince,
    required this.lastpurchase,
    required this.blacklisted,
    required this.language,
    required this.country,
    required this.activityType,
    required this.stopMail,
    required this.stopEmail,
    required this.stopSMS,
    required this.stopTel,
    required this.classification,
    required this.description,
    required this.documents,
    required this.emails,
    required this.mainEmail,
    required this.phones,
    required this.mainphone,
    required this.adresses,
    required this.mainAddresse,
    required this.account,
    required this.segments,
    required this.contents,
    required this.photos,
    required this.tags,
    required this.audience,
    required this.timeToCall,
    required this.valid,
    required this.checked,
    required this.comment,
    required this.logo,
    required this.themeCode,
    required this.socialReason,
    required this.created,
    required this.capital,
    required this.capitalcurr,
    required this.currency,
    required this.longitude,
    required this.latitude,
    required this.timeZone,
    required this.ratings,
    required this.customerRating,
    required this.legalForm,
    required this.ice,
    required this.lastbooking,
  });

  factory Album.fromJson(Map<dynamic, dynamic> json) {
    return Album(
      id: json['id'],
      createdBy: json['createdby'],
      creationDate: json['creationDate'],
      lastModifiedBy: json['lastModifiedBy'],
      lastModifiedByDate: json['lastModifiedByDate'],
      name: json['name'],
      website: json['website'],
      preferedMedia: json['preferedMedia'],
      boId: json['boId'],
      personType: json['personType'],
      clientSince: json['clientSince'],
      lastpurchase: json['lastpurchase'],
      blacklisted: json['blacklisted'],
      language: json['language'],
      country: json['country'],
      activityType: json['activityType'],
      stopMail: json['stopMail'],
      stopEmail: json['stopEmail'],
      stopSMS: json['stopSMS'],
      stopTel: json['stopTel'],
      classification: json['classification'],
      description: json['description'],
      documents: json['documents'],
      emails: json['emails'],
      mainEmail: json['mainEmail'],
      phones: json['phones'],
      mainphone: json['mainphone'],
      adresses: json['adresses'],
      mainAddresse: json['mainAdresse'],
      account: json['account'],
      segments: json['segments'],
      contents: json['contents'],
      photos: json['photos'],
      tags: json['tags'],
      audience: json['audience'],
      timeToCall: json['timeToCall'],
      valid: json['valid'],
      checked: json['checked'],
      comment: json['comment'],
      logo: json['logo'],
      themeCode: json['themeCode'],
      socialReason: json['SocialReason'],
      created: json['created'],
      capital: json['capital'],
      capitalcurr: json['capitalcurr'],
      currency: json['currency'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      timeZone: json['Time'],
      ratings: json['ratings'],
      customerRating: json['customerRating'],
      legalForm: json['legalForm'],
      ice: json['ice'],
      lastbooking: json['lastbooking'],
    );
  }
}

class HomePageState extends State<HomePage> {
  final String url = "http://demoapi.fractalite.com/api/persons?criteria=ayoub";
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("FractaliteBeta"),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.id);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        )
        // new ListView.builder(
        //     itemCount: data.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       return new Container(
        //         child: new Center(
        //           child: new Column(
        //             crossAxisAlignment: CrossAxisAlignment.stretch,
        //             children: <Widget>[
        //               new Card(
        //                 child: new Container(
        //                     child: new Text(data[index]['name']),
        //                     padding: const EdgeInsets.all(20.0)), //all Container
        //               )
        //             ],
        //           ),
        //         ),
        //       );
        //     }),
        );
  }
}
