import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/models/doacao.dart';
import 'package:helpcare/size_config.dart';

class DoacaoItemCard extends StatelessWidget {
  final Doacao doacao;
  final Function press;

  const DoacaoItemCard({Key key, this.doacao, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    FlutterMoneyFormatter fmfValor =
        FlutterMoneyFormatter(amount: doacao.valor);

    return GestureDetector(
      onTap: press,
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
                    doacao.nome,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(doacao.items),
                ],
              ),
              Spacer(),
              VerticalDivider(),
              Text("R\$ ${fmfValor.output.nonSymbol}"),
            ],
          ),
        ),
      ),
    );
  }
}
