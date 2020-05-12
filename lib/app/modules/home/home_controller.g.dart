// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  Computed<dynamic> _$getAtualBookComputed;

  @override
  dynamic get getAtualBook =>
      (_$getAtualBookComputed ??= Computed<dynamic>(() => super.getAtualBook))
          .value;

  final _$booksAtom = Atom(name: '_HomeBase.books');

  @override
  ObservableFuture<List<Items>> get books {
    _$booksAtom.context.enforceReadPolicy(_$booksAtom);
    _$booksAtom.reportObserved();
    return super.books;
  }

  @override
  set books(ObservableFuture<List<Items>> value) {
    _$booksAtom.context.conditionallyRunInAction(() {
      super.books = value;
      _$booksAtom.reportChanged();
    }, _$booksAtom, name: '${_$booksAtom.name}_set');
  }

  final _$_atualBookAtom = Atom(name: '_HomeBase._atualBook');

  @override
  Items get _atualBook {
    _$_atualBookAtom.context.enforceReadPolicy(_$_atualBookAtom);
    _$_atualBookAtom.reportObserved();
    return super._atualBook;
  }

  @override
  set _atualBook(Items value) {
    _$_atualBookAtom.context.conditionallyRunInAction(() {
      super._atualBook = value;
      _$_atualBookAtom.reportChanged();
    }, _$_atualBookAtom, name: '${_$_atualBookAtom.name}_set');
  }

  final _$_indexAtualBookAtom = Atom(name: '_HomeBase._indexAtualBook');

  @override
  int get _indexAtualBook {
    _$_indexAtualBookAtom.context.enforceReadPolicy(_$_indexAtualBookAtom);
    _$_indexAtualBookAtom.reportObserved();
    return super._indexAtualBook;
  }

  @override
  set _indexAtualBook(int value) {
    _$_indexAtualBookAtom.context.conditionallyRunInAction(() {
      super._indexAtualBook = value;
      _$_indexAtualBookAtom.reportChanged();
    }, _$_indexAtualBookAtom, name: '${_$_indexAtualBookAtom.name}_set');
  }

  final _$fetchBooksAsyncAction = AsyncAction('fetchBooks');

  @override
  Future<dynamic> fetchBooks(String value) {
    return _$fetchBooksAsyncAction.run(() => super.fetchBooks(value));
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  dynamic setAtualBook(int index) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setAtualBook(index);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({Items item}) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getImage(item: item);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'books: ${books.toString()},getAtualBook: ${getAtualBook.toString()}';
    return '{$string}';
  }
}
