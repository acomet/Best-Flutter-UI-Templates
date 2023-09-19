import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './view_model_2.dart';

class ProviderPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
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
                  heroTag: "other",
                  label: Text("Change"));
            }),
          ],
        ),
      ),
    );
  }
}
