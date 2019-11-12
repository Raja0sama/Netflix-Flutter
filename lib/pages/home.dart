import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flix/pages/detail.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int a = 0;
  int j = 0;
  double b = 0;
  Model c;
  @override
  void initState() {
    super.initState();
    var a = fetchPost();
    a.then((val) {
      setState(() {
        c = val;
      });
    });
  }

  Future<Model> fetchPost() async {
    return Model.fromJson(json.decode("""{
	"COUNT": "65",
	"ITEMS": [
		{
			"netflixid": "70307407",
			"title": "The Jungle",
			"image": "https://cdn.virily.com/wp-content/uploads/2017/11/jungle.jpg",
			"synopsis": "While a documentary team searches remote parts of the Indonesian jungle looking for an endangered leopard, they soon realize they&#39;re being stalked.",
			"rating": "9",
			"type": "movie",
			"released": "2014",
			"runtime": "1h24m",
			"largeimage": "",
			"unogsdate": "2017-08-11",
			"imdbid": "tt3502172",
			"download": "5"
		},
		{
			"netflixid": "423744",
			"title": "Dawn of the Dead",
			"image": "https://images-na.ssl-images-amazon.com/images/I/91J9bJj-pAL._RI_.jpg",
			"synopsis": "Picking up where &#39;Night of the Living Dead&#39; left off, this horror classic begins with a flesh-eating zombie army invading every major American city.",
			"rating": "7.8",
			"type": "movie",
			"released": "1978",
			"runtime": "2h6m",
			"largeimage": "",
			"unogsdate": "2017-08-11",
			"imdbid": "tt0077402",
			"download": "0"
		},
		{
			"netflixid": "70307747",
			"title": "Once Upon a Time in Vietnam",
			"image": "https://i.pinimg.com/originals/0c/fb/2a/0cfb2a063995136fb52a0d1914f21a20.jpg",
			"synopsis": "Wandering the countryside, brooding warrior-monk Dao takes up arms to protect a village beleaguered by a crime boss. But Dao has his own past to face.",
			"rating": "2.5",
			"type": "movie",
			"released": "2013",
			"runtime": "1h46m",
			"largeimage": "",
			"unogsdate": "2017-08-11",
			"imdbid": "tt2531258",
			"download": "0"
		},
		{
			"netflixid": "80112565",
			"title": "Allied",
			"image": "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fewedit.files.wordpress.com%2F2016%2F08%2Fstranger-things_0.jpg&w=400&c=sc&poi=face&q=85",
			"synopsis": "Allied agent Max Vatan falls for a French spy during World War II. When Vatan learns she might be a double agent, he strives to prove her innocence.",
			"rating": "9.5",
			"type": "movie",
			"released": "2016",
			"runtime": "2h4m",
			"largeimage": "",
			"unogsdate": "2017-08-11",
			"imdbid": "tt3640424",
			"download": "0"
		}
		
		
	]
}
"""));
  }

  Active(i) {
    setState(() {
      a = i;
    });
  }

  SecondPage(i) {
    setState(() {
      double e = (200 / int.parse(c.cOUNT));
      b = e * i;
      j = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildContainer(),
                c.cOUNT == "none" ? Text('Hey') : buildCarouselSlider(),
                new Info(c.iTEMS[j]),
                Container(
                  margin: EdgeInsets.only(
                      top: 40,
                      right: (MediaQuery.of(context).size.width - 200) / 2,
                      left: (MediaQuery.of(context).size.width - 200) / 2),
                  width: 200,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20.0,
                            spreadRadius: 1),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          child: Container(
                              margin: EdgeInsets.only(left: b),
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10))))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      onPageChanged: (e) => SecondPage(e),
      height: 450.0,
      items: c.iTEMS.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(i)),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 1.0),
                // decoration: BoxDecoration(color: Colors.amber),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 410,
                      margin: EdgeInsets.fromLTRB(25, 40, 25, 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(100)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 20.0,
                                spreadRadius: 1),
                          ]),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topRight: Radius.circular(100)),
                        child: Image.network(i.image, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      child: No(c.iTEMS.indexOf(i) + 1),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: buildRating(i),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Container buildRating(i) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.fromLTRB(20, 0, 10, 20),
      height: 100,
      decoration: BoxDecoration(boxShadow: [
        new BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 1),
      ], color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            i.rating,
            style: TextStyle(
                fontFamily: "Noto Sans JP",
                color: Color.fromRGBO(255, 88, 40, 1),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      padding: EdgeInsets.only(
          left: 70, top: MediaQuery.of(context).size.height / 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Ranking',
            style: TextStyle(
                fontFamily: "Noto Sans JP",
                color: Color.fromRGBO(255, 88, 40, 1),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () => Active(0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Movie',
                        style: TextStyle(
                            fontFamily: "Noto Sans JP",
                            fontSize: a == 0 ? 20 : 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: a == 0
                                ? Color.fromRGBO(255, 88, 40, 1)
                                : Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Active(1),
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Series',
                        style: TextStyle(
                            fontFamily: "Noto Sans JP",
                            fontSize: a == 1 ? 20 : 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: a == 1
                                ? Color.fromRGBO(255, 88, 40, 1)
                                : Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  var i;
  Info(this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 70, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            i.title,
            style: TextStyle(
                fontFamily: "Noto Sans JP",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Text(
            i.synopsis,
            style: TextStyle(
                fontFamily: "Noto Sans JP",
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class No extends StatelessWidget {
  final int i;
  No(this.i);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(5, 0, 10, 20),
      height: 100,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 88, 40, 1),
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'NO.',
            style: TextStyle(
                fontFamily: "Noto Sans JP",
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          Text(
            i.toString(),
            style: TextStyle(
                fontFamily: "Noto Sans JP",
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Model {
  String cOUNT = "none";
  List<ITEMS> iTEMS;

  Model({this.cOUNT, this.iTEMS});

  Model.fromJson(Map<String, dynamic> json) {
    cOUNT = json['COUNT'];
    if (json['ITEMS'] != null) {
      iTEMS = new List<ITEMS>();
      json['ITEMS'].forEach((v) {
        iTEMS.add(new ITEMS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COUNT'] = this.cOUNT;
    if (this.iTEMS != null) {
      data['ITEMS'] = this.iTEMS.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ITEMS {
  String netflixid;
  String title;
  String image;
  String synopsis;
  String rating;
  String type;
  String released;
  String runtime;
  String largeimage;
  String unogsdate;
  String imdbid;
  String download;

  ITEMS(
      {this.netflixid,
      this.title,
      this.image,
      this.synopsis,
      this.rating,
      this.type,
      this.released,
      this.runtime,
      this.largeimage,
      this.unogsdate,
      this.imdbid,
      this.download});

  ITEMS.fromJson(Map<String, dynamic> json) {
    netflixid = json['netflixid'];
    title = json['title'];
    image = json['image'];
    synopsis = json['synopsis'];
    rating = json['rating'];
    type = json['type'];
    released = json['released'];
    runtime = json['runtime'];
    largeimage = json['largeimage'];
    unogsdate = json['unogsdate'];
    imdbid = json['imdbid'];
    download = json['download'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['netflixid'] = this.netflixid;
    data['title'] = this.title;
    data['image'] = this.image;
    data['synopsis'] = this.synopsis;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['released'] = this.released;
    data['runtime'] = this.runtime;
    data['largeimage'] = this.largeimage;
    data['unogsdate'] = this.unogsdate;
    data['imdbid'] = this.imdbid;
    data['download'] = this.download;
    return data;
  }
}
