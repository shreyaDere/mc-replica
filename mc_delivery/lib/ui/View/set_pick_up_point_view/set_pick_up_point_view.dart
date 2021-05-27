import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mc_delivery/constants/colors/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:google_maps_webservice/places.dart';
import 'set_pick_up_point_view_model.dart';

class SetPickUpView extends StatelessWidget {
  const SetPickUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetPickUpViewModel>.reactive(
      viewModelBuilder: () => SetPickUpViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: GestureDetector(
              onTap: () => model.onBackPress(),
              child: Icon(
                Icons.arrow_back_ios,
                color: COLOR_PRIMARY,
              ),
            ),
            title: Text(
              "Set Pick-Up Point",
              style: TextStyle(color: COLOR_PRIMARY),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              top: true,
              child: Column(
                children: [
                  // SizedBox(height: 10),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 10, right: 10),
                  //   child: Text(
                  //     "We will kepp your order ready.Pick it up On The Go",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 8),
                  //   height: 0.6,
                  //   color: Colors.grey,
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: BoxDecoration(
                  //       color: Color(0xFFF3E5D4).withOpacity(0.4),
                  //       border: Border(bottom: BorderSide(color: Colors.grey))),
                  //   padding: EdgeInsets.only(left: 10, bottom: 10),
                  //   child: Align(
                  //     alignment: Alignment.bottomLeft,
                  //     child: Text(
                  //       "Find a McDonald's on your route",
                  //       style: TextStyle(
                  //           color: Colors.black38,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // LocationWidget(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                      height: MediaQuery.of(context).size.height - 150,
                      width: MediaQuery.of(context).size.width,
                      child:
                          /*GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) =>
                          model.onMapCreated(controller),
                      myLocationEnabled: true,
                      tiltGesturesEnabled: true,
                      compassEnabled: true,
                      scrollGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      markers: Set<Marker>.of(model.markers.values),
                      polylines: Set<Polyline>.of(model.polylines.values),
                    ),*/
                          GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                                model.originLatitude, model.originLongitude),
                            zoom: 15),
                        myLocationEnabled: true,
                        tiltGesturesEnabled: true,
                        compassEnabled: true,
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        onMapCreated: model.onMapCreated,
                        markers: Set<Marker>.of(model.markers.values),
                        polylines: Set<Polyline>.of(model.polylines.values),
                      ))
                ],
              ))),
    );
  }
}

class LocationWidget extends ViewModelWidget<SetPickUpViewModel> {
  @override
  Widget build(BuildContext context, SetPickUpViewModel viewModel) {
    return Container(
      // color: Colors.green,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 150,
            // color: Colors.blue[50],
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.radio_button_checked,
                  color: Colors.grey,
                ),
                Image.asset(
                  "assets/icons/dotted-barline.png",
                  color: Colors.grey,
                  height: 25,
                  width: 35,
                ),
                Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.place,
                        color: Colors.red,
                        size: 35,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Center(
                        child: Image.asset(
                          "assets/icons/m_logo.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                    )
                  ],
                ),
                Image.asset(
                  "assets/icons/dotted-barline.png",
                  color: Colors.grey,
                  height: 25,
                  width: 35,
                ),
                Icon(
                  Icons.radio_button_checked,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () async {
                          Prediction p = await PlacesAutocomplete.show(
                            context: context,
                            mode: Mode.fullscreen,
                            apiKey: "AIzaSyAcVTUdWoryiBnFCTBnhk_kIDSpeLRBF4U",
                            types: ["IN"],
                            components: [Component(Component.country, "IN")],
                            strictbounds: false,
                          );
                          // viewModel.displayPrediction(p);
                        }, //=> viewModel.onStartingLocationSelected(),
                        child: Text(
                          viewModel.currentLocation,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14),
                        ),
                      )),
                      GestureDetector(
                        onTap: () => viewModel.getCurrentLocation(),
                        child: Icon(
                          Icons.my_location,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "We'll show pick-up points on your route",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                              onTap: () {}, child: Text("fdsdsgsfdg"))),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
