import 'package:flutter/material.dart';
import 'package:mc_delivery/constants/colors/colors.dart';
import 'package:stacked/stacked.dart';
import 'faq_view_model.dart';

class FaqView extends StatelessWidget {
  const FaqView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FaqViewModel>.reactive(
      viewModelBuilder: () => FaqViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => model.onBackPressed(),
              child: Text(
                "Cancel",
                textAlign: TextAlign.center,
                style: TextStyle(color: COLOR_PRIMARY),
              ),
            ),
          ),
          title: Text(
            "Faqs",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, letterSpacing: 0.3, color: COLOR_PRIMARY),
          ),
        ),
        body: SafeArea(
            top: true,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  WidgetList(),
                ],
              ),
            )),
      ),
    );
  }
}

class WidgetList extends ViewModelWidget<FaqViewModel> {
  @override
  Widget build(BuildContext context, FaqViewModel viewModel) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 16),
            child: ExpansionTile(
              leading: viewModel.onExpansion
                  ? Icon(
                      Icons.remove,
                      size: 30,
                    )
                  : Icon(
                      Icons.add,
                      size: 30,
                    ),
              onExpansionChanged: (value) => viewModel.onExpansionTile(value),
              trailing: Container(
                width: 0,
                height: 0,
              ),
              title: Text("Faq question",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: COLOR_GRAY, fontSize: 14)),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, left: 16, bottom: 16),
                  child: Text(
                    "Faq Ans",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 0.3, color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
