import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mc_delivery/constants/colors/colors.dart';
import 'package:mc_delivery/ui/View/menu/menu_view_model.dart';
import 'package:stacked/stacked.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MenuViewModel>.reactive(
      viewModelBuilder: () => MenuViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            top: true,
            child: Stack(
              children: [
                AppBar(),
                MenuListView(),
                MenuBtn(),
                model.openMenu ? MenuBottomSheet() : Container()
              ],
            )),
      ),
    );
  }
}

class AppBar extends ViewModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel viewModel) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20, right: 20),
        // color: Colors.blue,
        child: Column(
          children: [
            Expanded(
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
                    "Eid Special Combos",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Spacer(),
                  Image.asset(
                    "assets/icons/fire.png",
                    height: 15,
                    width: 15,
                    color: COLOR_PRIMARY,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    "Calorie",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 50.0,
                    height: 25.0,
                    toggleSize: 20.0,
                    borderRadius: 30.0,
                    padding: 3.5,
                    inactiveColor: Colors.grey[350],
                    value: viewModel.calorieToggle,
                    onToggle: (val) => viewModel.onCalorieToggel(val),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Veg Only",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 50.0,
                    height: 25.0,
                    toggleSize: 20.0,
                    borderRadius: 30.0,
                    padding: 3.5,
                    inactiveColor: Colors.grey[350],
                    value: viewModel.vegOnlyToggle,
                    onToggle: (val) => viewModel.onVegOnlyToggleToggel(val),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuListView extends ViewModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel viewModel) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 140,
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListView.builder(
            itemCount: 10,
            // shrinkWrap: true,
            // physics: ClampingScrollPhysics(),
            itemBuilder: (ctx, index) {
              return GestureDetector(
                  onTap: () => viewModel.onRecommendedProductItemClick(),
                  child: viewModel.selected.contains(index)
                      ? Container(
                          height: 320,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 8, top: 8),
                          // color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.blue[50],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: viewModel.calorieToggle,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Image.asset(
                                          "assets/icons/fire.png",
                                          height: 18,
                                          width: 18,
                                          color: COLOR_PRIMARY,
                                        ),
                                      )),
                                      TextSpan(
                                          text: '460 Cal',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "McAloo Tikki Double Patty Burger",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "The World's favourite Indian \n burger! Two Crunchy potato ",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Icon(
                                    Icons.monetization_on,
                                    size: 20,
                                  ),
                                  Text("75"),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, bottom: 2),
                                        decoration: BoxDecoration(
                                            color: COLOR_PRIMARY,
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(child: Text("Add")),
                                      ),
                                      Text(
                                        "customizable",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 8, top: 8),
                          // color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.blue[50],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Visibility(
                                    visible: viewModel.calorieToggle,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Image.asset(
                                              "assets/icons/fire.png",
                                              height: 18,
                                              width: 18,
                                              color: COLOR_PRIMARY,
                                            ),
                                          )),
                                          TextSpan(
                                              text: '460 Cal',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "McAloo Tikki Double Patty Burger",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "The World's favourite Indian \n burger! Two Crunchy potato ",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 80,
                                      ),
                                      Icon(
                                        Icons.monetization_on,
                                        size: 20,
                                      ),
                                      Text("75"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        margin:
                                            EdgeInsets.only(top: 10, bottom: 2),
                                        decoration: BoxDecoration(
                                            color: COLOR_PRIMARY,
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        child: Center(child: Text("Add")),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "customizable",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
            }),
      ),
    );
  }
}

class MenuBtn extends ViewModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel viewModel) {
    return Positioned(
        bottom: MediaQuery.of(context).size.height / 7,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: GestureDetector(
              onTap: () => viewModel.openBottomSheet(),
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class MenuBottomSheet extends ViewModelWidget<MenuViewModel> {
  @override
  Widget build(BuildContext context, MenuViewModel viewModel) {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => viewModel.closeBottomSheet(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black38,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            bottom: MediaQuery.of(context).size.height / 7,
            right: 100,
            left: 100,
            child: Container(
              width: 200,
              height: viewModel.menuItems.length * 10 + 0.0,
              padding: EdgeInsets.only(left: 20, right: 20, top: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListView.builder(
                  itemCount: viewModel.menuItems.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(
                        children: [
                          viewModel.menuItems[index].isSelexted
                              ? CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.amber,
                                )
                              : Container(
                                  width: 10,
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () => viewModel.onSingleItemClick(index),
                              child: Text(viewModel.menuItems[index].menuName)),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
