import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'count_model.dart';

class ProviderPage2 extends StatelessWidget {
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
          ],
        ),
      ),
    );
  }
}
