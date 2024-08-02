import 'package:dpboss/Screen/web_view/app_url.dart';
import 'package:dpboss/Screen/web_view/dpboss_servcess.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Widget drawer(BuildContext context) {
  return Drawer(
      backgroundColor: Color(0xFFFFCC99),
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowWeb(
                                urll: AppUrl.home,
                              )));
                  // Handle tap
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile', style: TextStyle(color: Colors.blue)),
                // onTap: () {
                //   Navigator.pop(context);
                //   context.push("/home/profile");
                //   // Navigator.push(context,
                //   //     MaterialPageRoute(builder: (context) => VechicleScreen()));
                //   // Handle tap
                // },
              ),
              ListTile(
                leading: Icon(Icons.sports_esports),
                title: Text('Free Game', style: TextStyle(color: Colors.blue)),
                // onTap: () {
                //   Navigator.pop(context);
                //   context.push('/home/history');
                //   // Navigator.push(context,
                //   //     MaterialPageRoute(builder: (context) => BookingHistory()));
                //   // Handle tap
                // },
              ),
              ListTile(
                //
                // onTap: () {
                //   Navigator.pop(context);
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               ShowWeb(urll: AppUrl.trickZone)));
                // Handle tap
                // },
                leading: Icon(Icons.subscriptions),
                title: Text('Trick Zone', style: TextStyle(color: Colors.blue)),
              ),
              ListTile(
                leading: Icon(Icons.forum),
                title: const Text('Guessing Forum',
                    style: TextStyle(color: Colors.blue)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowWeb(
                                urll: AppUrl.guessin_forum,
                              )));
                  //
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Golden Ank', style: TextStyle(color: Colors.blue)),
                // onTap: () {
                //   // Handle tap
                // },
              ),
              ListTile(
                leading: Icon(Icons.smartphone),
                title: Text('Online Make Play',
                    style: TextStyle(color: Colors.blue)),
                // onTap: () {
                //   // Handle tap
                // },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share', style: TextStyle(color: Colors.blue)),
                onTap: () {
                  // Handle tap
                  Share.share('https://dpbosssss.services/');
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Contact Us"),
              TextButton(
                  onPressed: () {
                    launch('tel:+44 7453819877');
                  },
                  child:
                      Text("7453819877", style: TextStyle(color: Colors.pink))),
              Text("App version 3.0.3"),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
            ],
          )
        ],
      ));
}
