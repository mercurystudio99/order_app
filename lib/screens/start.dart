import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:preorder/utils/globals.dart' as globals;
import 'package:preorder/utils/navigation_router.dart';
import 'package:preorder/utils/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<Map<String, String>> _countryList = [
    {
      'link': 'https://mylightspeed.app/APPMJKZX/C-ordering',
      'name': 'Viimsi, Kalluri tn'
    },
    {
      'link': 'https://mylightspeed.app/DEBRUBIV/C-ordering',
      'name': 'Majaka, Katusepapi tn'
    },
    {
      'link': 'https://mylightspeed.app/WXELSPWK/C-ordering',
      'name': 'Põhja Tallinn, Kopli tn'
    },
    {
      'link': 'https://mylightspeed.app/BKFIZHYM/C-ordering',
      'name': 'Kesklinn, Tare tn'
    },
    {
      'link': 'https://mylightspeed.app/OUDHACZS/C-ordering',
      'name': 'Mustamäe, Sõpruse pst'
    },
  ];

  int _cCurrentValue = 5;
  final int _cInitValue = 5;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: size.height * 0.2,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: const Color(0xFFCACD32).withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.zero,
                  bottomLeft: Radius.circular(size.width),
                  bottomRight: Radius.zero),
            ),
          )),
      Positioned(
          left: 0,
          bottom: size.height * 0.4,
          child: Container(
            width: size.height * 0.2,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              color: const Color(0xFF80CC28).withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(size.width),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.circular(size.width)),
            ),
          )),
      Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: size.height * 0.3,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: const Color(0xFFCACD32).withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width),
                  topRight: Radius.zero,
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero),
            ),
          )),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/logo.png', width: size.width / 2)),
          Center(
              child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: 'Please choose the nearest location to you.',
                        style: GoogleFonts.leagueSpartan(
                            color: CustomColor.primaryColor.withOpacity(0.85),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ))),
          Center(
              child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'We deliver',
                          style: GoogleFonts.leagueSpartan(
                              color: CustomColor.primaryColor.withOpacity(0.85),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: ' within 5km radius.',
                          style: GoogleFonts.leagueSpartan(
                              color: CustomColor.primaryColor.withOpacity(0.85),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ]),
                  ))),
          const SizedBox(height: 40),
          WheelSlider.customWidget(
            horizontal: false,
            verticalListWidth: size.width,
            verticalListHeight: 240.0,
            totalCount: _countryList.length,
            initValue: _cInitValue,
            isInfinite: true,
            scrollPhysics: const BouncingScrollPhysics(),
            onValueChanged: (val) {
              setState(() {
                _cCurrentValue = val;
              });
              globals.link = _countryList[val]['link'].toString();
              globals.name = _countryList[val]['name'].toString();
            },
            hapticFeedbackType: HapticFeedbackType.heavyImpact,
            showPointer: false,
            itemSize: 50,
            perspective: 0.002,
            listWidth: size.width,
            children: List.generate(
                _countryList.length,
                (index) => InkWell(
                    onTap: () {
                      if (globals.link.isNotEmpty) {
                        NavigationRouter.switchToView(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please choose the restaurant.')),
                        );
                      }
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: _cCurrentValue == index
                            ? Text(_countryList[index]['name'].toString(),
                                style: GoogleFonts.leagueSpartan(
                                    color: CustomColor.primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                            : Text(_countryList[index]['name'].toString(),
                                style: GoogleFonts.leagueSpartan(
                                    color: CustomColor.primaryColor,
                                    fontSize: 18))))),
          ),
          const SizedBox(height: 40),
          Center(
            child: Container(
                height: 40, //height of button
                width: size.width / 2, //width of button
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xFF27963C).withOpacity(0.9),
                      const Color(0xFFCAC65E).withOpacity(0.9)
                    ]),
                    borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      elevation: 0, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(8)),
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.all(
                          5) //content padding inside button
                      ),
                  onPressed: () {
                    if (globals.link.isNotEmpty) {
                      NavigationRouter.switchToView(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please choose the restaurant.')),
                      );
                    }
                  },
                  child: const Text(
                    'order now',
                    style: TextStyle(
                        color: CustomColor.buttonTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )),
          ),
          const Spacer(),
          Center(
              child: Text('All rights reserved Mango LTD. 2024',
                  style: GoogleFonts.inter(
                      color: Colors.black54,
                      fontSize: 12,
                      decoration: TextDecoration.underline))),
          const SizedBox(height: 20)
        ],
      )
    ]));
  }
}
