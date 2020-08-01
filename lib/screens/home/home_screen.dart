import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpcare/screens/home/components/body.dart';
import 'package:helpcare/screens/profile/profile_screen.dart';
import 'package:helpcare/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      appBar: buildAppBar(defaultSize, context),
      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(double defaultSize, BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: Text("HelpCare"),
      centerTitle: true,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              bottom: defaultSize,
            ),
            height: defaultSize * 5,
            width: defaultSize * 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: defaultSize * 0.5,
              ),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  "assets/images/pic.png",
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize * 0.5,
        ),
      ],
    );
  }
}
// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // final _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double defaultSize = SizeConfig.defaultSize;

//     return Scaffold(
//       appBar: buildAppBar(defaultSize),
//       body: Body(),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }

//   AppBar buildAppBar(double defaultSize) {
//     return AppBar(
//       leading: IconButton(
//         icon: SvgPicture.asset(
//           "assets/icons/menu.svg",
//           color: Colors.white,
//         ),
//         onPressed: () {},
//       ),
//       title: Text("HelpCare"),
//       centerTitle: true,
//       actions: <Widget>[
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           },
//           child: Container(
//             margin: EdgeInsets.only(
//               bottom: defaultSize,
//             ),
//             height: defaultSize * 5,
//             width: defaultSize * 5,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: Colors.white,
//                 width: defaultSize * 0.5,
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.contain,
//                 image: AssetImage(
//                   "assets/images/pic.png",
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: SizeConfig.defaultSize * 0.5,
//         ),
//       ],
//     );
//   }
// }
