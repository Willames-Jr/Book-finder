import 'dart:ui';

import 'package:book_finder/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  var style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Detalhes do Livro",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            "Número de páginas: " +
                                controller.books.value[controller.indexAtual]
                                    .volumeInfo.authors[0],
                            style: style),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            controller.books.value[controller.indexAtual]
                                        .saleInfo.saleability ==
                                    "FOR_SALE"
                                ? "Disponibilidade: Disponível"
                                : "Disponibilidade: Indisponível",
                            style: style),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            "Número de páginas: " +
                                controller.books.value[controller.indexAtual]
                                    .volumeInfo.pageCount
                                    .toString(),
                            style: style),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            "Editora: " +
                                controller.books.value[controller.indexAtual]
                                    .volumeInfo.publisher,
                            style: style),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            "Data de publicação: " +
                                controller.books.value[controller.indexAtual]
                                    .volumeInfo.publishedDate,
                            style: style),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                            "Idioma: " +
                                controller.books.value[controller.indexAtual]
                                    .volumeInfo.language,
                            style: style),
                        SizedBox(
                          height: 12,
                        ),
                        Center(
                          child: RaisedButton(
                            onPressed: () => launch(controller
                                .books
                                .value[controller.indexAtual]
                                .volumeInfo
                                .infoLink),
                            child: Text(
                              "Mais informações",
                              style: TextStyle(color: Colors.white),
                            ),
                            elevation: 4.0,
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
