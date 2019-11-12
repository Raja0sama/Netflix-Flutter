import 'package:flix/pages/home.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  var i ;
  Detail(this.i);


  
  @override
  _DetailState createState() => _DetailState(i);
}

class _DetailState extends State<Detail> {
    var i ;
  _DetailState(this.i);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 30, left: 40),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 60.0,
                          spreadRadius: 1),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    child: Image.network(
                        i.image,
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 30,
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.yellow[500],
                    child: Icon(Icons.star),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 30, left: 30, bottom: 30),
              child: Column(
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
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            i.rating,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 88, 40, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Score",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: 1,
                      color: Colors.black,
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                              i.released,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              
                            ],
                          ),
                          Text(
                            "Released On",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: 1,
                      color: Colors.black,
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                              i.runtime,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            
                            ],
                          ),
                          Text(
                            "Runtime !",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    onPressed: (){
                          Navigator.pop(context);
                    },
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
