import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html/style.dart';
import 'package:mc_delivery/ui/View/terms_condition/tearms_condition_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../constants/colors/colors.dart';

class TearmsAndConditionView extends StatelessWidget {
  const TearmsAndConditionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TearmsAndConditionViewModel>.reactive(
        viewModelBuilder: () => TearmsAndConditionViewModel(),
        onModelReady: (model) => model.loadData(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
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
              backgroundColor: Colors.black,
              titleSpacing: 1,
              centerTitle: true,
              title: Text(
                "Tearms and Conditions",
                style: TextStyle(
                  color: COLOR_PRIMARY,
                  fontSize: 16,
                ),
              ),
            ),
            body: SafeArea(
                top: true,
                child: Stack(
                  children: [TermsConditionWidget()],
                ))));
  }
}

class TermsConditionWidget
    extends ViewModelWidget<TearmsAndConditionViewModel> {
  @override
  Widget build(BuildContext context, TearmsAndConditionViewModel viewModel) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Html(
              data: "Terms and Conditions",
              defaultTextStyle: TextStyle(
                color: COLOR_GRAY,
                // textAlign: TextAlign.center,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Html(
                data:
                    "1. By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Wyndham Grand Manama.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "2. Wyndham Grand Manama is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "3. The Wyndham Grand Manama app stores and processes personal data that you have provided to us, in order to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Wyndham Grand Manama app won’t work properly or at all.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "4. You should be aware that there are certain things that Wyndham Grand Manama will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but Wyndham Grand Manama cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "5. If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "6. Along the same lines, Wyndham Grand Manama cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Wyndham Grand Manama cannot accept responsibility.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "7. With respect to Wyndham Grand Manama’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Wyndham Grand Manama accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "8. At some point, we may wish to update the app. The app is currently available on Android & iOS – the requirements for both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Wyndham Grand Manama does not promise that it will always update the app so that it is relevant to you and/or works with the Android & iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data: "9. Changes to This Terms and Conditions",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "10.We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "11. These terms and conditions are effective as of 2020-10-07",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data: "12. Contact Us",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "13. If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at P O Box 17224, Manama Seafront, Bahrain.",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
            Html(
                data:
                    "14. This Terms and Conditions page was generated by App Privacy Policy Generators",
                defaultTextStyle: TextStyle(
                  color: COLOR_GRAY,
                  fontSize: 14,
                )),
          ],
        ),
      ),
    );
  }
}
