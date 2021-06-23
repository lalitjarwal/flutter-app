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
  final response = await http.get(
      Uri.parse('http://demoapi.fractalite.com/api/persons?criteria=ayoub'),
      headers: {});

  if (response.statusCode == 200) {
    // If the server did return a 2indexindex OK response,
    // then parse the json['content'][index].
    print('2indexindex');
    print(jsonDecode(response.body));
    //print(Album.fromjson['content'][index](json['content'][index]Decode(response.body)));
    return Album.fromjson(jsonDecode(response.body),0);
  } else {
    // If the server did not return a 2indexindex OK response,
    // then throw an exception.
    print('5indexindex');
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

  factory Album.fromjson(Map<dynamic, dynamic> json,int index) {
    return Album(
      id: json['content'][index]['id'],
      createdBy: json['content'][index]['createdby'],
      creationDate: json['content'][index]['creationDate'],
      lastModifiedBy: json['content'][index]['lastModifiedBy'],
      lastModifiedByDate: json['content'][index]['lastModifiedByDate'],
      name: json['content'][index]['name'],
      website: json['content'][index]['website'],
      preferedMedia: json['content'][index]['preferedMedia'],
      boId: json['content'][index]['boId'],
      personType: json['content'][index]['personType'],
      clientSince: json['content'][index]['clientSince'],
      lastpurchase: json['content'][index]['lastpurchase'],
      blacklisted: json['content'][index]['blacklisted'],
      language: json['content'][index]['language'],
      country: json['content'][index]['country'],
      activityType: json['content'][index]['activityType'],
      stopMail: json['content'][index]['stopMail'],
      stopEmail: json['content'][index]['stopEmail'],
      stopSMS: json['content'][index]['stopSMS'],
      stopTel: json['content'][index]['stopTel'],
      classification: json['content'][index]['classification'],
      description: json['content'][index]['description'],
      documents: json['content'][index]['documents'],
      emails: json['content'][index]['emails'],
      mainEmail: json['content'][index]['mainEmail'],
      phones: json['content'][index]['phones'],
      mainphone: json['content'][index]['mainphone'],
      adresses: json['content'][index]['adresses'],
      mainAddresse: json['content'][index]['mainAdresse'],
      account: json['content'][index]['account'],
      segments: json['content'][index]['segments'],
      contents: json['content'][index]['contents'],
      photos: json['content'][index]['photos'],
      tags: json['content'][index]['tags'],
      audience: json['content'][index]['audience'],
      timeToCall: json['content'][index]['timeToCall'],
      valid: json['content'][index]['valid'],
      checked: json['content'][index]['checked'],
      comment: json['content'][index]['comment'],
      logo: json['content'][index]['logo'],
      themeCode: json['content'][index]['themeCode'],
      socialReason: json['content'][index]['SocialReason'],
      created: json['content'][index]['created'],
      capital: json['content'][index]['capital'],
      capitalcurr: json['content'][index]['capitalcurr'],
      currency: json['content'][index]['currency'],
      longitude: json['content'][index]['longitude'],
      latitude: json['content'][index]['latitude'],
      timeZone: json['content'][index]['Time'],
      ratings: json['content'][index]['ratings'],
      customerRating: json['content'][index]['customerRating'],
      legalForm: json['content'][index]['legalForm'],
      ice: json['content'][index]['ice'],
      lastbooking: json['content'][index]['lastbooking'],
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
                print(snapshot.data);
                return Text("${snapshot.data!.id}");
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
        //                     padding: const EdgeInsets.all(2index.index)), //all Container
        //               )
        //             ],
        //           ),
        //         ),
        //       );
        //     }),
        );
  }
}
