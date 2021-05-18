import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mc_delivery/ui/View/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/colors/colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
        viewModelBuilder: () => SettingsViewModel(),
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
                "Settings",
                style: TextStyle(
                  color: COLOR_PRIMARY,
                  fontSize: 16,
                ),
              ),
            ),
            body: SafeArea(
                top: true,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SettingTile(
                          "Push notificaction",
                          FlutterSwitch(
                            width: 65.0,
                            height: 40.0,
                            toggleSize: 30.0,
                            borderRadius: 30.0,
                            padding: 3.5,
                            inactiveColor: Colors.grey[300],
                            activeColor: Colors.lightGreenAccent[400],
                            value: model.onPushNotification,
                            onToggle: (val) =>
                                model.onPushNotificationToggelClick(val),
                          ),
                          0),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SettingTile(
                          "Share your location",
                          FlutterSwitch(
                            width: 65.0,
                            height: 40.0,
                            toggleSize: 30.0,
                            borderRadius: 30.0,
                            padding: 3.5,
                            inactiveColor: Colors.grey[300],
                            activeColor: Colors.lightGreenAccent[400],
                            value: model.shareLocation,
                            onToggle: (val) =>
                                model.onshareLocationToggelClick(val),
                          ),
                          1),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SettingTile("Terms and conditions",
                          Icon(Icons.chevron_right_sharp), 2),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SettingTile("Faqs", Icon(Icons.chevron_right_sharp), 3),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SettingTile("About", Icon(Icons.chevron_right_sharp), 4),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SettingTile("Version", Text("0.0.0"), 5),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 1.5,
                      )
                    ],
                  ),
                ))));
  }
}

class SettingTile extends ViewModelWidget<SettingsViewModel> {
  final String title;
  final Widget widget;
  final int index;

  SettingTile(this.title, this.widget, this.index);

  @override
  Widget build(BuildContext context, SettingsViewModel viewModel) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        Spacer(),
        GestureDetector(
            onTap: () => viewModel.onIconClick(index), child: widget)
      ],
    );
  }
}
