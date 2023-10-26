import 'package:expense_manager/view/constant/colors/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  // height: height * 0.2,
                  // width: width * 0.2,
                  child:  CircleAvatar(
                    radius: height*0.04,
                      backgroundImage: const AssetImage(
                    'assets/images/user.jpeg',
                  )),
                ),
                SizedBox(height: height*0.3,),
                Column(
                  children: [
                    const Text('UserName', style: TextStyle(color: Pallete.grey)),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text('Anikha',
                        style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(width: width*.4,),
                Image.asset('assets/images/Button_Icon.png'),
              
              ],
            ),
          ),

          // SizedBox(height: height*0.1,),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              width: width * .9,
              height: height * 0.4,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.09),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/wallet.png',height: height*0.1,),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Text(
                            'Account',
                            style: textStyleSettings(height),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/settings.png',height: height*0.1,),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Text(
                            'Settings',
                            style: textStyleSettings(height),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/logout.png',height: height*0.1,),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          Text(
                            'Log out',
                            style: textStyleSettings(height),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle textStyleSettings(double height) =>
      TextStyle(fontSize: height * 0.02, fontWeight: FontWeight.bold);
}
