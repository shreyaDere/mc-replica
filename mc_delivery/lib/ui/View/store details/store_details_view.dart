import 'package:flutter/material.dart';
import 'package:mc_delivery/ui/View/store%20details/store_details_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/colors/colors.dart';

class StoreDetailsView extends StatelessWidget {
  final String storeName;
  StoreDetailsView({Key key, this.storeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreDetailsViewModel>.reactive(
        viewModelBuilder: () => StoreDetailsViewModel(),
        onModelReady: (model) => model.loadData(storeName),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              titleSpacing: 1,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => model.onBackPress(),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: COLOR_PRIMARY,
                ),
              ),
              title: Text(
                model.storeName,
                style: TextStyle(
                  color: COLOR_PRIMARY,
                  fontSize: 16,
                ),
              ),
              actions: [
                Center(
                  child: Text(
                    "Call us",
                    style: TextStyle(
                      color: COLOR_PRIMARY,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            body: SafeArea(
                top: true,
                child: Stack(
                  children: [StoreDetails(), GetDirectionBtn()],
                ))));
  }
}

class StoreDetails extends ViewModelWidget<StoreDetailsViewModel> {
  @override
  Widget build(BuildContext context, StoreDetailsViewModel viewModel) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[50],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Suyog Plaza Plot No. 1278,\n Jangli Maharaj Road,Shivaji \nNagar,Pune 411004",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "Timings:10:00 AM - 11:05PM ",
              ),
              SizedBox(
                width: 20,
              ),
              Text("open", style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 18,
                    )),
                    TextSpan(
                        text: 'Home Delivery',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 18,
                    )),
                    TextSpan(
                        text: 'McCafe',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 18,
                    )),
                    TextSpan(
                        text: 'Dine in',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 18,
                    )),
                    TextSpan(
                        text: 'Breakfast',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 18,
                    )),
                    TextSpan(
                        text: 'Take Away',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                        child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 18,
                    )),
                    TextSpan(
                        text: 'Drive-thru',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GetDirectionBtn extends ViewModelWidget<StoreDetailsViewModel> {
  @override
  Widget build(BuildContext context, StoreDetailsViewModel viewModel) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.red,
        child: Center(
          child: Text("GET DIRECTIONS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
