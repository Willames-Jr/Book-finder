import 'package:book_finder/app/shared/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRepository extends Disposable {
  final Dio _client;

  HomeRepository(this._client);

  Future<List<Items>> fetchBooks(String value) async {
    final response = await _client.get(
        'https://www.googleapis.com/books/v1/volumes?q=' +
            value +
            "&maxResults=16");
    List<Items> list = [];

    for (var json in (response.data['items']) as List) {
      List<String> _authors = ["Autor não encontrado"];
      String _publishedDate = "Desconhecido";
      try {
        _authors = json['volumeInfo']['authors'][0] != null
            ? [json['volumeInfo']['authors'][0]]
            : ["Autor não encontrado"];
        _publishedDate = json['volumeInfo']['publishedDate'] != null
            ? json['volumeInfo']['publishedDate']
            : "";
      } catch (e) {
        print(e);
      }

      Items items = Items(
        id: json['id'],
        volumeInfo: VolumeInfo(
          title: json['volumeInfo']['title'],
          imageLinks: ImageLinks(
              smallThumbnail: json['volumeInfo']['imageLinks']
                  ['smallThumbnail']),
          pageCount: json['volumeInfo']['pageCount'],
          authors: _authors,
          infoLink: json['volumeInfo']['infoLink'],
          publisher: json['volumeInfo']['publisher'],
          publishedDate: _publishedDate,
          language: json['volumeInfo']['language'],
        ),
        saleInfo: SaleInfo(saleability: json['saleInfo']['saleability']),
      );
      list.add(items);
    }

    return list;
  }

  @override
  void dispose() {}
}
