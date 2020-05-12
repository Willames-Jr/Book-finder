import 'package:book_finder/app/modules/home/home_repository.dart';
import 'package:book_finder/app/shared/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final HomeRepository repository;

  _HomeBase(this.repository) {
    fetchBooks("flutter");
  }

  @observable
  ObservableFuture<List<Items>> books;

  @observable
  Items _atualBook;

  @observable
  int _indexAtualBook;

  get indexAtual => _indexAtualBook;

  @action
  setAtualBook(int index) {
    _atualBook = books.value[index];
    _indexAtualBook = index;
  }

  @computed
  get getAtualBook => _atualBook;

  @action
  Widget getImage({Items item}) {
    String url = item.volumeInfo.imageLinks.smallThumbnail;
    return CachedNetworkImage(
      height: 100,
      width: 80,
      placeholder: (context, url) => Container(
        color: Colors.transparent,
      ),
      imageUrl: url,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  @action
  Future fetchBooks(String value) async {
    try {
      books = repository.fetchBooks(value).asObservable();
    } catch (e) {
      print(e);
    }
  }
}
