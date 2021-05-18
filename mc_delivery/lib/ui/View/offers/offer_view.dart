import 'package:flutter/material.dart';
import 'package:mc_delivery/constants/colors/colors.dart';
import 'package:mc_delivery/ui/View/offers/offer_view_model.dart';
import 'package:stacked/stacked.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OffersViewModel>.reactive(
      viewModelBuilder: () => OffersViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            top: true,
            child: Stack(
              children: [
                AppBar(),
                Positioned(
                  top: 50,
                  left: 0,
                  right: MediaQuery.of(context).size.width / 1.7,
                  child: Container(
                    // width: MediaQuery.of(context).size.width / 3,
                    height: 30,
                    decoration: BoxDecoration(
                        // color: Colors.redAccent,
                        border: Border(
                            bottom:
                                BorderSide(color: COLOR_PRIMARY, width: 2))),
                    margin: EdgeInsets.only(left: 20.0, top: 10),
                    child: Text(
                      "Promo Codes",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: TextFormField(
                      initialValue: model.searchString,
                      onChanged: model.searchStringValue,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          // border: InputBorder.none,
                          // contentPadding: EdgeInsets.all(14.0),
                          hintText: "Search for promocode",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                            ),
                            onPressed: () {},
                          )),
                    ),
                  ),
                ),
                MenuListView()
              ],
            )),
      ),
    );
  }
}

class AppBar extends ViewModelWidget<OffersViewModel> {
  @override
  Widget build(BuildContext context, OffersViewModel viewModel) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20, right: 20),
        // color: Colors.blue,
        child: Row(
          children: [
            GestureDetector(
                onTap: () => viewModel.onBackPress(),
                child: Icon(Icons.arrow_back_ios)),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              "Offers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
          ],
        ),
      ),
    );
  }
}

class MenuListView extends ViewModelWidget<OffersViewModel> {
  @override
  Widget build(BuildContext context, OffersViewModel viewModel) {
    return Positioned(
      top: 150,
      left: 0,
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 230,
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: COLOR_PRIMARY),
                      ),
                      child: Center(
                        child: Text(
                          "MCEGG100",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get a free Masala McEgg on offers above Rs.100",
                      style: TextStyle(
                          letterSpacing: 0.4,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "+MORE",
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Min Cart Value excluding delivery",
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text("fees Rs. 100.0"),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          elevation: 0.0,
                          hoverElevation: 0,
                          focusElevation: 0,
                          disabledElevation: 0,
                          highlightElevation: 0,
                          onPressed: () {},
                          child: Text(
                            "Apply",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          color: COLOR_PRIMARY,
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
