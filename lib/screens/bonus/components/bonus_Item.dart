import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:helpcare/models/bonus.dart';
import 'package:helpcare/size_config.dart';

class BonusItemCard extends StatelessWidget {
  final Bonus bonus;
  final Function press;

  const BonusItemCard({Key key, this.bonus, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    FlutterMoneyFormatter fmfValor = FlutterMoneyFormatter(amount: bonus.valor);

    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFC2C2B5),
            // color: Color(0xFF373737),
            borderRadius: BorderRadius.circular(
              defaultSize * 1.8,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bonus.titulo,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bonus.descricao,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ],
                ),
                Spacer(),
                VerticalDivider(),
                Text("R\$ ${fmfValor.output.nonSymbol}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
