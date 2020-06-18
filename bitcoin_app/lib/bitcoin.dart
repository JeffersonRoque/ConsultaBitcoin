import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class bitcoin extends StatefulWidget {
  @override
  _bitcoinState createState() => _bitcoinState();
}

class _bitcoinState extends State<bitcoin> {
  @override

  String _preco = "0";

  _bitcoinValor() async {
      String url = "https://blockchain.info/ticker";
      http.Response response = await http.get(url);
      Map<String, dynamic> returno = json.decode(response.body);

      setState(() {
        this._preco = returno["BRL"]["buy"].toString();
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Image.asset("images/bitcoin.png"),
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                      "R\$ ${this._preco}",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                  ),
              ),
              RaisedButton(
                  child: Text(
                      "Atualizar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                  ),
                  color: Colors.orange,
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: this._bitcoinValor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
