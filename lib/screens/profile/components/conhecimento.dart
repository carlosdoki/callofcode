import 'package:flutter/material.dart';
import 'package:helpcare/size_config.dart';
import 'package:helpcare/models/conhecimento.dart';

class BuildConhecimento extends StatelessWidget {
  const BuildConhecimento({
    Key key,
    @required this.conhecimentos,
  }) : super(key: key);

  final Future<List<Conhecimento>> conhecimentos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Container(
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              width: double.infinity,
              child: Text("Conhecimentos"),
              color: Colors.blueAccent,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultSize * 2,
              ),
              child: SizedBox(
                height: SizeConfig.defaultSize * 10,
                child: Container(
                  color: Colors.white,
                  child: FutureBuilder<List<Conhecimento>>(
                    future: conhecimentos,
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? ConhecimentoBoxList(items: snapshot.data)
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConhecimentoBoxList extends StatelessWidget {
  final List<Conhecimento> items;

  const ConhecimentoBoxList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        items.length,
        (index) {
          return ConhecimentoCard(
            conhecimento: items[index],
          );
        },
      ),
    );
  }
}

class ConhecimentoCard extends StatelessWidget {
  final Conhecimento conhecimento;

  const ConhecimentoCard({Key key, this.conhecimento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Center(
          child: Text(
            conhecimento.nome,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
      ),
    );
  }
}
