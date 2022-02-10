import 'package:flutter/material.dart';

void main() {
  runApp(meuApp());
}

class meuApp extends StatefulWidget {
  const meuApp({Key? key}) : super(key: key);

  @override
  _meuAppState createState() => _meuAppState();
}

class _meuAppState extends State<meuApp> {
  @override
  int numero = 0;
  String msg = 'Pode Entrar';

  void entrou() {
    setState(() {
      numero++;
    });
  }

  void saiu() {
    setState(() {
      numero--;
    });
  }

  void limpar() {
    setState(() {
      numero = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
          actions: [
            IconButton(
                onPressed: limpar,
                padding: EdgeInsets.only(right: 10),
                icon: Icon(Icons.refresh, size: 30)),
          ],
          title: Text('Controle de pessoas'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/img/img1.jpeg'),
                fit: BoxFit.cover
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numero > 19 ? 'Limite atingido!' : msg,
                style: TextStyle(fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$numero',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size(100, 50),
                        backgroundColor: Colors.pinkAccent,
                        elevation: 10,
                        shadowColor: Colors.black,
                        primary: Colors.white,
                        //shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: numero <= 19 ? entrou : null,
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        fixedSize: Size(100, 50),
                        backgroundColor: Colors.pinkAccent,
                        elevation: 10,
                        shadowColor: Colors.black,
                        primary: Colors.white,
                      ),
                      onPressed: numero != 0 ? saiu : null,
                      child: Text(
                        'Saiu',
                        style: TextStyle(
                            color: numero != 0 ? Colors.white : Colors.black),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
