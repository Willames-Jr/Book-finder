import 'package:book_finder/app/modules/home/home_controller.dart';
import 'package:book_finder/app/widgets/about_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ItemInfoPage extends StatefulWidget {
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  final controller = Modular.get<HomeController>();
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: controller.indexAtual, viewportFraction: 1.6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do livro"),
      ),
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (_) {
              return Container(
                color:
                    controller.getAtualBook.saleInfo.saleability == "FOR_SALE"
                        ? Colors.green
                        : Colors.red,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Observer(
                builder: (_) {
                  return SizedBox(
                    height: double.maxFinite,
                    width: MediaQuery.of(context).size.width - 25,
                    child: Text(
                      controller
                          .books.value[controller.indexAtual].volumeInfo.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: SizedBox(
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  controller.setAtualBook(index);
                },
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) {
                  return Observer(
                    builder: (_) {
                      String url = controller
                          .getAtualBook.volumeInfo.imageLinks.smallThumbnail;
                      return CachedNetworkImage(
                        height: 100,
                        width: 80,
                        placeholder: (context, url) => Container(
                          color: Colors.transparent,
                        ),
                        imageUrl: url,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SlidingSheet(
            elevation: 8,
            cornerRadius: 30,
            maxWidth: MediaQuery.of(context).size.width - 20,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: AboutPage(),
              );
            },
          ),
        ],
      ),
    );
  }
}
