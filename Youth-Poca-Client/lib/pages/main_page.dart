import 'package:flutter/material.dart';

import 'package:youth_poca/components/card_slider.dart';
import 'package:youth_poca/pages/write_page.dart';

import '../components/portfolio.dart';
import '../model/poca_info.dart';
import '../services/api_service.dart';

class MainPage extends StatefulWidget {
  var file;
  MainPage({this.file});

  @override
  State<MainPage> createState() => _MainPageState(file);
}

class _MainPageState extends State<MainPage> {
  var file;

  _MainPageState(this.file);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadPocas(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WritePage(),
            ),
          );
        },
        backgroundColor: const Color(0xAF06A66C),
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }

  Widget loadPocas() {
    return FutureBuilder(
        future: APIService.getPocas(),
        builder: (BuildContext context, AsyncSnapshot<List<PocaInfo>?> model) {
          if (model.hasData) {
            // MainPage 수정이 필요한 부분
            print("hi");
            return pocaList(model.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget pocaList(pocas) {
    print(pocas.length);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: pocas.length,
            itemBuilder: (context, index) {
              //setState(() {});
              return CardSlider(
                model: pocas[index],
                modelLen: pocas.length,
                // onDelete: (ProductModel model) {
                //   setState(() {
                //     isApiCallProcess = true;
                //   });
                //
                //   APIService.deleteProduct(model.id).then(
                //     (response) {
                //       setState(() {
                //         isApiCallProcess = false;
                //       });
                //     },
                //   );
                // },
              );
            },
          ),
        ],
      ),
    );
  }
}
