import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:mc_delivery/ui/View/search_location/search_location_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchLocationView extends StatelessWidget {
  const SearchLocationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchLocationViewModel>.reactive(
        viewModelBuilder: () => SearchLocationViewModel(),
        onModelReady: (model) => model.loadData(),
        builder: (context, model, child) => Scaffold(
            body: SafeArea(
                top: true,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () => model.onBackPress(),
                          child: Icon(Icons.arrow_back_ios)),
                      Expanded(
                          child: GestureDetector(
                              onTap: () async {
                                var p = await PlacesAutocomplete.show(
                                    context: context,
                                    mode: Mode.fullscreen,
                                    apiKey: model.kGoogleApiKey);
                                // model.displayPrediction(p);
                              },
                              child: Text("Enter Store Location")))
                    ],
                  ),
                ))));
  }
}
