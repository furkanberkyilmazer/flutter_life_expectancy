import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'icon_cinsiyet.dart';
import 'my_container.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara=0;
  double sporGunu=0;
  int boy=180;
  int kilo=60;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(

              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child:buildRowOutlinedButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton("KİLO"),
                  ),

                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child:Column(
                      children: <Widget>[
                        Text(
                          'Haftada kaç kez spor yapıyorsunuz?',
                          style: kMetinStili,
                        ),
                        Text(
                          sporGunu.round().toString(),
                          style: kSayiStili,
                        ),
                        Slider(
                          min:0,
                          max:7,
                          value: sporGunu,
                          onChanged: (double newValue){
                            setState(() {
                              sporGunu=newValue.roundToDouble();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child:Column(
                      children: <Widget>[
                        Text(
                          "Günde kaç sigara içiyorsunuz?",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                            icilenSigara.round().toString(),
                          style: kSayiStili,
                        ),
                        Slider(
                            min:0,
                            max:30,
                          value: icilenSigara,
                          onChanged: (double newValue){
                              setState(() {
                                icilenSigara=newValue.roundToDouble();
                              });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onPress: (){
                      setState(() {
                        seciliCinsiyet='KADIN';
                      });
                    },
                    renk: seciliCinsiyet=='KADIN'?Colors.lightBlue:Colors.white,
                    child: IconCinsiyet(
                        cinsiyet: 'KADIN', icon: FontAwesomeIcons.venus),
                  ),
                ),
                Expanded(
                  child: MyContainer(

                    onPress: (){
                      setState(() {
                        seciliCinsiyet='ERKEK';
                      });
                    },
                    renk: seciliCinsiyet=='ERKEK'
                        ? Colors.lightBlue
                        : Colors.white,
                    child: IconCinsiyet(
                        cinsiyet: 'ERKEK', icon: FontAwesomeIcons.mars),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,

            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                textStyle:kMetinStili,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(

                  UserData(icilenSigara,sporGunu,seciliCinsiyet,boy,kilo)
                )));
              },
              child: Text('HESAPLA'),


            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(String text) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    RotatedBox(
                        quarterTurns:-1,
                        child: Text(
                            text,
                          style: kMetinStili,

                        ),
                    ),
                      SizedBox(width:3,),
                      RotatedBox(
                        quarterTurns:-1,
                        child: Text(

                          text=='BOY'?'$boy':'$kilo',
                          style:kSayiStili,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 26,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color:Colors.lightBlue,),
                              ),
                              onPressed: (){
                                          setState(() {
                                            text=='BOY'?boy++:kilo++;
                                          });
                                },
                              child: Icon(
                                  FontAwesomeIcons.plus,
                              color:Colors.black,
                              size:15),

                            ),
                          ),
                          ButtonTheme(
                            minWidth: 26,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color:Colors.lightBlue,),
                              ),
                                onPressed:  (){
                                  setState(() {
                                    if(text=='BOY'&&boy>100)boy--;
                                    else if(text=='KİLO'&&kilo>10)kilo--;

                                  });
                                },
                               child: Icon(FontAwesomeIcons.minus,color:Colors.black,
                                   size:15),
                            ),
                          ),
                        ],
                      ),
                  ],
                  );
  }
}




