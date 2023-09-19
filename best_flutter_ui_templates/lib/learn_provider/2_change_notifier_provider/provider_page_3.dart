import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider_page_4.dart';
import './view_model_2.dart';

class ProviderPage3 extends StatelessWidget {
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
            Consumer<ViewModel2>(builder: (context, model, child) {
              return Text(
                model.count.toString(),
                style: TextStyle(fontSize: 30),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Consumer<ViewModel2>(builder: (context, model, child) {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderPage4()));
                },
                heroTag: "one",
                label: Text("Next"))
          ],
        ),
      ),
    );
  }
}
