import 'package:flutter/material.dart';

class DadosPessoais extends StatefulWidget {
  // final double distValue;
  DadosPessoais({
    Key key,
  }) : super(key: key);

  @override
  _DadosPessoaisState createState() => _DadosPessoaisState();
}

class _DadosPessoaisState extends State<DadosPessoais> {
  @override
  Widget build(BuildContext context) {
    double distValue = 2;
    return Container(
      child: Column(
        children: [
          TextFormField(
            initialValue: "Carlos Doki",
            decoration: InputDecoration(
              labelText: "Nome",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
              // helperText: "Enter App ID",
            ),
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: "carlosdoki@gmail.com",
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "E-mail",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
              // helperText: "Enter App ID",
            ),
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: "(11) 1111-1111",
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Telefone",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide()),
              // helperText: "Enter App ID",
            ),
            style: Theme.of(context).textTheme.body1,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text("Distância"),
              Flexible(
                child: TextFormField(
                  initialValue: "50 km",
                ),
              ),
              Slider(
                min: 0,
                max: 100,
                value: distValue,
                onChanged: (value) {
                  setState(() {
                    distValue = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
