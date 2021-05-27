import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:mc_delivery/constants/colors/colors.dart';
import 'package:mc_delivery/ui/View/Invite_share/invite_share_view_model.dart';
import 'package:stacked/stacked.dart';

class InviteAndShareView extends StatelessWidget {
  const InviteAndShareView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InviteAndShareViewModel>.reactive(
      viewModelBuilder: () => InviteAndShareViewModel(),
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
              "Refer a friend",
              style: TextStyle(color: COLOR_PRIMARY),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      "assets/images/mc_burger.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    color: Colors.black87.withOpacity(0.65),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "The more we share,the more we have!",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 25),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/mc-referral-code.png",
                                width: MediaQuery.of(context).size.width - 100,
                                height: MediaQuery.of(context).size.height / 2,
                              ),
                              Positioned(
                                top: 170,
                                left: 0,
                                right: 20,
                                child: Center(
                                  child: Text(
                                    "code",
                                    style: TextStyle(
                                        color: COLOR_PRIMARY, fontSize: 18),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 200,
                                left: 0,
                                right: 20,
                                child: Center(
                                  child: Text(
                                    model.getRandomString(6),
                                    style: TextStyle(
                                        color: COLOR_PRIMARY, fontSize: 23),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Now help your friends enjoy McDonald's in a safe and contactless way,backed by our Golden Guarantee!",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: COLOR_PRIMARY, fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "with our new contactless Delivery,Takeout and on The Go options,there are morer ways to get one's favorites...",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: COLOR_PRIMARY, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // FlutterShare.share(
                        //     title: 'share code',
                        //     text:
                        //         'Invite code ,Please Use this code while create account.',
                        //     linkUrl: model.value,
                        //     chooserTitle: 'Invite pepole and earn rewards');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "INVITE FRIENDS",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
