// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mc_delivery/constants/colors/colors.dart';
import 'package:mc_delivery/ui/View/dashboard_view/dashboard_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: COLOR_PRIMARY,
            elevation: 0,
          ),
          /*BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index) => model.bottomNavigation(index),
              items: [
                BottomNavigationBarItem(
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.yellow),
                  ),
                  icon: Image.asset(
                    "assets/icons/m_logo.png",
                    height: 20,
                    // width: 30,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Search",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Menu",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Image.asset(
                    "assets/icons/list.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Offers",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Image.asset(
                    "assets/icons/discount.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "My Mod",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Image.asset(
                    "assets/icons/user.png",
                    height: 20,
                    width: 20,
                  ),
                ),
              ]),
         */
          body: SafeArea(
            top: true,
            child: Stack(
              children: <Widget>[
                DashboardWidgetList(),
                Visibility(
                    visible: model.openDrawer, child: DrawerBottomSheet()),
                BottomNavigation(),
                // Visibility(visible: true, child: DeliveryTypeBottomSheet()),
              ],
            ),
          )),
    );
  }
}

class BottomNavigation extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        height: viewModel.openDrawer ? 0.0 : 55,
        width: viewModel.openDrawer ? 0.0 : MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.only(top: 4, bottom: 4.0),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Image.asset(
                  "assets/icons/m_logo.png",
                  height: 20,
                  // width: 30,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Home",
                  style: TextStyle(color: Colors.yellow),
                ),
              ],
            )),
            Expanded(
                child: GestureDetector(
              onTap: () => viewModel.navigateToSearch(),
              child: Column(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () => viewModel.onMenuPressed(),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/list.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () => viewModel.onOfferPressed(),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/discount.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Offers",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () => viewModel.onDrawerClick(),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/user.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "My Mod",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends ViewModelWidget<DashboardViewModel> {
  final String icon;
  final String label;
  DrawerItem(this.icon, this.label);
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Image.asset(
          icon,
          color: COLOR_PRIMARY,
          height: 20,
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class DashboardWidgetList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return SingleChildScrollView(
      key: PageStorageKey("DashboardWidgetList"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: COLOR_PRIMARY,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 22),
              TopCarousel(),
              SizedBox(height: 20),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              viewModel.getDateInterval(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          CategoryRow(),
          SizedBox(height: 20),
          CategoryList(),
          SizedBox(
            height: 20,
          ),
          LunchTimeMeal(),
          SizedBox(
            height: 20,
          ),
          RecommendedProductList(),
        ],
      ),
    );
  }
}

class RecommendedProductList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Image.asset(
                "assets/icons/m_logo.png",
                // height: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Recommended Products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 40,
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
                  Text("Calorie"),
                  SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 40.0,
                    height: 20.0,
                    toggleSize: 15.0,
                    borderRadius: 30.0,
                    padding: 3.5,
                    inactiveColor: Colors.grey[350],
                    value: viewModel.calorieToggle,
                    onToggle: (val) => viewModel.onCalorieToggel(val),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Veg Only"),
                  SizedBox(
                    width: 8,
                  ),
                  FlutterSwitch(
                    width: 40.0,
                    height: 20.0,
                    toggleSize: 15.0,
                    borderRadius: 30.0,
                    padding: 3.5,
                    inactiveColor: Colors.grey[350],
                    value: viewModel.vegOnlyToggle,
                    onToggle: (val) => viewModel.onVegOnlyToggleToggel(val),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
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
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 2),
                                            decoration: BoxDecoration(
                                                color: COLOR_PRIMARY,
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: Center(child: Text("Add")),
                                          ),
                                          Text(
                                            "customizable",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            margin: EdgeInsets.only(
                                                top: 10, bottom: 2),
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
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class LunchTimeMeal extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      padding: EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            viewModel.getJumboMeal(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          GridListJumboMeal(),
          Container(
              // height: 20,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 0, right: 20),
              color: Colors.white,
              child: Center(
                  child: Image.asset(
                "assets/images/mc_cafe.jpg",
                width: 120,
              ))),
          Container(
              // height: 150,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 0, right: 20),
              padding: EdgeInsets.only(bottom: 30, top: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0))),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  CoffeeItem("assets/images/mc_hot.png", "Keep it hot"),
                  SizedBox(
                    width: 10.0,
                  ),
                  CoffeeItem("assets/images/cafe_coffe.png", "Keep it cold"),
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 0, right: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8.0))),
              child: Text(
                "#VocalForLocal - All our ingredients are locally sourced and traceable for your safety.",
                style: TextStyle(color: Colors.white, letterSpacing: 0.8),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 20.0),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctc, index) {
                  return Container(
                    // padding: EdgeInsets.only(
                    //     left: 20, right: 20, top: 10, bottom: 10),
                    margin: EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipPath(
                          clipper: LinePathBanner(),
                          child: Container(
                            width: 100,
                            height: 25,
                            color: COLOR_GRAY_BLACK,
                            padding: EdgeInsets.only(left: 10, top: 3),
                            child: Text(
                              "Safety",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: COLOR_PRIMARY,
                                  fontSize: 38),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              " All our crew member use the \n arogya setu app and undergo \n temperature check befor starting",
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}

class LinePathBanner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(1.0, 0.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.5, size.height);
    path.lineTo(1.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CoffeeItem extends ViewModelWidget<DashboardViewModel> {
  final String iconName;
  final String iconTitle;
  CoffeeItem(this.iconName, this.iconTitle);
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: COLOR_PRIMARY,
              radius: 45,
              // margin: EdgeInsets.only(left: 20),
            ),
            Positioned(
              bottom: -4,
              left: 0,
              right: 0,
              child: Image.asset(
                iconName,
                height: 90,
                width: 80,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(iconTitle)
      ],
    );
  }
}

class GridListJumboMeal extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 20),
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8.0))),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? 3
                    : 6,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/m_logo.png",
                    height: 30,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "McSavers",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class TopCarousel extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20, right: 20),
        color: Colors.red,
        child: Image.asset(
          "assets/icons/m_logo.png",
          height: 100,
          width: 100,
        ));
    /* CarouselSlider.builder(
      options: CarouselOptions(
        pageViewKey: PageStorageKey('carousel_slider'),
        viewportFraction: 1,
        enlargeCenterPage: false,
        initialPage: 1,
        aspectRatio: 3.0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          // viewModel.onCarousalPageChanged(index, reason);
        },
        scrollDirection: Axis.horizontal,
      ),
      itemCount: 4,
      itemBuilder: (ctx, index, i) {
        return Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
                child: Container(
                    color: Colors.red,
                    child: Image.asset("assets/icons/m_logo.png")),
                onTap: () {}),
            decoration: BoxDecoration());
      },
    );
  */
  }
}

class CategoryList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              margin: EdgeInsets.only(right: 20),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Mac Tikki Burgure"),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 20,
                      ),
                      Text("75"),
                      Spacer(),
                      Container(
                        width: 90,
                        height: 35,
                        margin: EdgeInsets.only(top: 10, bottom: 2),
                        decoration: BoxDecoration(
                            color: COLOR_PRIMARY,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Center(child: Text("Add")),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "customizable",
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CategoryRow extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => viewModel.setFlagForCategory(0),
              child: Container(
                width: 85,
                decoration: BoxDecoration(
                    // color: Colors.redAccent,
                    border: Border(
                        bottom: BorderSide(
                            color: viewModel.category == 0
                                ? COLOR_PRIMARY
                                : Colors.transparent,
                            width: 2))),
                child: Text(
                  "Trending",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: viewModel.category == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              )),
          GestureDetector(
            onTap: () => viewModel.setFlagForCategory(1),
            child: Container(
              width: 70,
              padding: EdgeInsets.only(left: 8.0),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: viewModel.category == 1
                            ? COLOR_PRIMARY
                            : Colors.transparent,
                        width: 2)),
              ),
              child: Text(
                "Deals",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: viewModel.category == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerBottomSheet extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
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
              color: Colors.black26,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Shreya dere",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "987654321",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: COLOR_PRIMARY,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/shopping.png", "My Orders"),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/chat.png", "Track Order"),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/file.png", "Payment History"),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/discount.png", "Offers"),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/invitation.png", "Get free burgers"),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/placeholder.png", "Store locator"),
                  SizedBox(
                    height: 30,
                  ),
                  DrawerItem("assets/icons/settings.png", "Settings"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DeliveryTypeBottomSheet extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
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
              color: Colors.black26,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6,
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListView.builder(
                  itemCount: 4,
                  // ignore: missing_return
                  itemBuilder: (ctx, index) {
                    if (index == 0) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[400], width: 0.8),
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  color: Colors.blue[50],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Enjoy safe and contactless delivery to your doorstep with exciting offers!",
                                        // maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 19,
                                            letterSpacing: 0.4,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Get a FREE Mcaloo Tikki Burger or Chicken kebab Burger on order above Rs.299 .Use code -B299",
                              // maxLines: 4,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      );
                    } else if (index == 1) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[400], width: 0.8),
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  color: Colors.blue[50],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "On The Go",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "Delivered to your car at a pick-up point on your way", // maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 19,
                                            letterSpacing: 0.4,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Get a FREE Mcaloo Tikki Burger or Chicken kebab Burger on order above Rs.599 .Use code -OTG17",
                              // maxLines: 4,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      );
                    } else if (index == 2) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[400], width: 0.8),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              color: Colors.blue[50],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Takeout",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Order and pick-up from one of our restaurants",
                                    // maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 19,
                                        letterSpacing: 0.4,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (index == 3) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(bottom: 20, top: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[400], width: 0.8),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              color: Colors.blue[50],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dine In",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Order online and dine in the restaurant",
                                    // maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 19,
                                        letterSpacing: 0.4,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                )),
          )
        ],
      ),
    );
  }
}
