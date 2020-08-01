import 'package:flutter/material.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/models/doacao.dart';
import 'package:helpcare/screens/doacao/components/doacao_item.dart';
import 'package:helpcare/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Qual kit você deseja doar hoje?",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Unidos venceremos!"),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: doacoes.length,
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
                itemBuilder: (context, index) => DoacaoItemCard(
                  doacao: doacoes[index],
                  press: () {},
                ),
              ),
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
                'DOAR !',
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
      ),
    );
  }
}
