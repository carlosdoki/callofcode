import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpcare/constants.dart';
import 'package:helpcare/models/conhecimento.dart';
import 'package:helpcare/screens/profile/components/conhecimento.dart';
import 'package:helpcare/screens/profile/components/dados_pessoais.dart';
import 'package:helpcare/screens/profile/components/mapa.dart';
import 'package:helpcare/size_config.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';

  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<List<Conhecimento>> conhecimentos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    conhecimentos = fetchConhecimento();
  }

  @override
  Widget build(BuildContext context) {
    double _value = 2;

    return Scaffold(
      appBar: buildAppBar(context),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      DadosPessoais(),
                      Mapa(),
                      BuildConhecimento(conhecimentos: conhecimentos),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.white,
        iconSize: 28.0,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.more_horiz),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
      centerTitle: true,
      title: Text(
        'Perfil',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
