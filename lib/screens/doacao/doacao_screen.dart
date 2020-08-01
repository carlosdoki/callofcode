import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpcare/screens/doacao/components/body.dart';
import 'package:helpcare/screens/profile/profile_screen.dart';
import 'package:helpcare/size_config.dart';

class DoacaoScreen extends StatefulWidget {
  DoacaoScreen({Key key}) : super(key: key);

  @override
  _DoacaoScreenState createState() => _DoacaoScreenState();
}

class _DoacaoScreenState extends State<DoacaoScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return AppBar(
      // backgroundColor: Colors.black,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          color: Colors.white,
        ),
        onPressed: () {},
      ),
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
      ],
      centerTitle: true,
      title: Text(
        'Doação',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
