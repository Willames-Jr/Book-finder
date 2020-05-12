import 'package:book_finder/app/modules/home/home_controller.dart';
import 'package:book_finder/app/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite o nome do livro, autor ...",
                  suffixIcon: Icon(Icons.search)),
              onChanged: (value) {
                controller.fetchBooks(value);
              },
            ),
            SizedBox(height: 50),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (controller.books.error != null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        Text(
                          "Ocorreu algum erro",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    );
                  }

                  if (controller.books.value == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    var list = controller.books.value;

                    return AnimationLimiter(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(12),
                        addAutomaticKeepAlives: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: 1,
                            child: ScaleAnimation(
                              child: GestureDetector(
                                child: BookItem(
                                  title: list[index].volumeInfo.title,
                                  index: index,
                                  image: controller.getImage(item: list[index]),
                                  color: list[index].saleInfo.saleability ==
                                          "FOR_SALE"
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                onTap: () {
                                  controller.setAtualBook(index);
                                  Modular.to.pushNamed("/bookInfo");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
