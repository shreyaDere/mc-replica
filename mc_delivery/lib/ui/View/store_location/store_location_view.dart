import 'package:flutter/material.dart';
import 'package:mc_delivery/ui/View/store_location/store_location_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/colors/colors.dart';

class StoreLocationView extends StatelessWidget {
  const StoreLocationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreLocationViewModel>.reactive(
        viewModelBuilder: () => StoreLocationViewModel(),
        onModelReady: (model) => model.loadData(),
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
                "Store Locator",
                style: TextStyle(
                  color: COLOR_PRIMARY,
                  fontSize: 16,
                ),
              ),
            ),
            body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 150,
                      child: Image.asset(
                        "assets/images/map.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    StoreList()
                  ],
                ))));
  }
}

class StoreList extends ViewModelWidget<StoreLocationViewModel> {
  @override
  Widget build(BuildContext context, StoreLocationViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.only(left: 25.0),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, border: Border.all(color: Colors.grey)),
            child: TextFormField(
              initialValue: viewModel.searchString,
              onChanged: (value) => viewModel.searchStringValue(value),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.all(14.0),
                  hintText: "Enter a locality",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  )),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: viewModel.searchString.contains("pune") ? 4 : 0,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () => viewModel.navigateToLocationDetails(),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "JM Road",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Suyog Plaza Plot No. 1278, Jangli Maharaj Road,Shivaji Nagar,Pune 411004",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Timings:10:00 AM - 11:05PM ",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("open",
                                  style: TextStyle(color: Colors.green)),
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
                            height: 20,
                          ),
                          Divider(
                            height: 3,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.directions,
                                        color: Colors.red,
                                        size: 18,
                                      )),
                                      TextSpan(
                                          text: 'GET DIRECTIONS',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 2, right: 10),
                                height: 40,
                                width: 0.7,
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.call,
                                        color: Colors.red,
                                        size: 18,
                                      )),
                                      TextSpan(
                                          text: 'CALL',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
