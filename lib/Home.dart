import 'package:flutter/material.dart';
import 'package:casetube/CustomSearchDelegate.dart';
import 'package:casetube/screens/Emalta.dart';
import 'package:casetube/screens/biblioteca.dart';
import 'package:casetube/screens/inicio.dart';
import 'package:casetube/screens/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _btnBarIndex = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          "images/youtube.png",
          width: 100,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async {
                String res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
                print("resultado: digitado " + res);
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _telas[_btnBarIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          currentIndex: _btnBarIndex,
          onTap: (inidice) {
            setState(() {
              _btnBarIndex = inidice;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(label: "Inicio", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Em Alta", icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                label: "Inscrições", icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                label: "Blibioteca", icon: Icon(Icons.folder)),
          ]),
    );
  }
}
