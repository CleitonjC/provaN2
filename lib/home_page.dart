import 'package:flutter/material.dart';
import 'package:prova/detalhes_page.dart';
import 'package:http/http.dart' as http;
import 'package:prova/models.dart';



class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

  class _HomePageState extends State<HomePage>{
    bool _carregando = false;
    CovidData? _covidData;
    List<Countries> filteredList = [];

    @override 
    void initState(){
      _getData();
      super.initState();
    }

    @override
    Widget build(BuildContext context){
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Dados mundiais do Covid'),),
          body: Container(
            child: this. _carregando ? _createLoading(): _createBody(),
          ),
        ),
      );
    }


    Widget _createBody(){
      return Column(
        children: [
          _createGlobalContainer(),
          Divider(),
          _createInputSearch(),
          Divider(),
          Expanded(child: _createListCountrys())
        ],
      );
    }


    Widget _createGlobalContainer(){
      return Column(children: [
        ListTile(
          title: Text('Dados Globais: '),
          subtitle: Text(this._covidData!.global.date),
        ),
        Column(
          children: [
            ListTile(
              leading: Image.asset('assets/images/angry.png'),
              title: Text(
                    'Total confirmados: ${this._covidData!.global.totalConfirmed}'),
            ),
            ListTile(
              leading: Image.asset('assets/images/happy.png'),
              title: Text(
                    'Total confirmados: ${this._covidData!.global.totalRecovered}'),
            ),
            ListTile(
              leading: Image.asset('assets/images/sad.png'),
              title: Text(
                    'Total confirmados: ${this._covidData!.global.totalDeaths}'),
            ),
          ],
        ),
      ]);
    }


    Widget _createInputSearch(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value){
            setState(() {
                this.filteredList = this._covidData!.countries.where((country) => country.country == value).toList();
                        });
          }
        ),
      );
    }

/*
    Widget _createInputSearch(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      );
    }
*/
    Future<void> _getData() async{
      this._toggleCarregando(carregando: true);
      var url = Uri.parse('https://api.covid19api.com/summary');
      var response = await http.get(url);
      this._dataCreater(response);
      this._toggleCarregando(carregando: false);
    }

    _toggleCarregando({bool carregando = false}){
      setState((){
        this._carregando = carregando;
      });
    }

    void _dataCreater(http.Response response){
      setState(() {
        if (response.statusCode == 200) {
          _covidData = CovidData.fromJson(response.body);
          filteredList = _covidData!.countries;
        }
        });
    }

    Widget _createLoading(){
      return Center(child: CircularProgressIndicator());
    }


    Widget _createListCountrys(){
      return _covidData != null
        ? ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: _createItemBuilder,
          )
        : Text('Não foi possível trazer os dados');
    }


    Widget _createItemBuilder(BuildContext context, int index){
      final country = filteredList[index];
      return ListTile(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => DetalhesPage(countrie: country)));
        },
        title: Text('${country.country} - ${country.countryCode}'),
        subtitle: Text(country.date),
      );
    }


  }