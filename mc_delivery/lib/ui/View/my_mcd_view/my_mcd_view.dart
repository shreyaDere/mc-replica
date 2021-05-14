import 'package:flutter/material.dart';
import 'package:mc_delivery/ui/View/my_mcd_view/my_mcd_view_model.dart';
import 'package:stacked/stacked.dart';

class MyMcdView extends StatelessWidget {
  // const MyMcdView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyMcdViewModel>.reactive(
      viewModelBuilder: () => MyMcdViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black26,
                )
              ],
            )),
      ),
    );
  }
}
