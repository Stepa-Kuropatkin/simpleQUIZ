import 'package:flutter/material.dart';
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Быстрый квест',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var counter = 0;

  List qList = [
    Questions("1. Слева снизу Игорян?", false),
    Questions("2. У Архангела есть кролик?", true),
    Questions("3. Вадик пьет пиво сейчас?", false),
    Questions("4. Гранатовый сок вкусный на любимова?", false),
    Questions("5. Даник дома?", false),
    Questions("6. Вадик махает нунчаками в лесу?", true),
    Questions("7. Наруто живет у игоряна в комнате?", true),
    Questions("8. Сыра было 5кг сьедено за 6 дней?", false),
    Questions("9. Миша заходил вчера?", false),
    Questions("10. Че там с деньгами?", true),
  ];

  var score = 0;

  checkWin(bool userChoice, BuildContext context) {
    if (userChoice == qList[counter].isCorrect) {
      print('правильно');

      score = score + 1;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text('Прально!'),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      print('не правильно');
      score = score + 0;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content: Text('Не прально!'),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }

    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Квест "В касание"',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'получил $score-очкy',
                      style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        "Заново?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: reset,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Color(0xFFF7C229))),
                height: 90.0,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FittedBox(
                      child: Text(qList[counter].qText,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => checkWin(true, context),
                    padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
                    child: Text(
                      'Соглы',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => checkWin(false, context),
                    padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
                    child: Text(
                      "Нет",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Color(0xFFF7C229),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
