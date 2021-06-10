import 'package:flutter/material.dart';
import 'package:prova/models.dart';

class DetalhesPage extends StatelessWidget{
  final Countries countrie;
  
  const DetalhesPage({Key? key, required this.countrie}) : super(key: key);

@override
Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
            ListTile(
              title: Text('${this.countrie.country} - ${this.countrie.countryCode}'),
              subtitle: Text(this.countrie.date),
            ),
            Column(
              children: [
                ListTile(
                  leading: Image.asset('assets/images/angry.png'),
                  title: Text('total confirmados: ${this.countrie.totalConfirmed}'),
                ),
                ListTile(
                  leading: Image.asset('assets/images/happy.png'),
                  title: Text('total recuperados: ${this.countrie.totalRecovered}'),
                ),
                ListTile(
                  leading: Image.asset('assets/images/sad.png'),
                  title: Text('total de mortes: ${this.countrie.totalDeaths}'),
                ),
              ],
            ),
        ]),
      );
}
}