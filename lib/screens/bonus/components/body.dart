import 'package:flutter/material.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/models/bonus.dart';
import 'package:helpcare/screens/bonus/components/bonus_Item.dart';
import 'package:helpcare/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemCount: bonus.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    SizeConfig.orientation == Orientation.landscape ? 2 : 1,
                mainAxisSpacing: 20,
                crossAxisSpacing:
                    SizeConfig.orientation == Orientation.landscape
                        ? SizeConfig.defaultSize * 2
                        : 0,
                childAspectRatio: 5,
              ),
              itemBuilder: (context, index) => BonusItemCard(
                bonus: bonus[index],
                press: () {},
              ),
            ),
          ),
          Container(
            height: 50,
            color: kTextColor,
            child: Row(
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Text(
                  "0.00 bonus",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            elevation: 5.0,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => HomeScreen()),
              // );
            },
            padding: EdgeInsets.only(
              left: 30.0,
              top: 10.0,
              bottom: 10.0,
              right: 30.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: kTextColor,
            child: Text(
              'Resgatar Bonus',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
