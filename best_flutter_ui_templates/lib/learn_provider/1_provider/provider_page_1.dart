import 'package:best_flutter_ui_templates/learn_provider/1_provider/count_model.dart';
import 'package:best_flutter_ui_templates/learn_provider/1_provider/provider_page_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Provider",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CountModel>(builder: (context, model, child) {
              return Text(
                model.count.toString(),
                style: TextStyle(fontSize: 30),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Consumer<CountModel>(builder: (context, model, child) {
              return FloatingActionButton.extended(
                  onPressed: () {
                    model.increment();
                  },
                  label: Text("Change"));
            }),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderPage2()));
                },
                label: Text("Next"))
          ],
        ),
      ),
    );
  }
}
