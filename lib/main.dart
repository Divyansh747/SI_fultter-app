import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Interest Calculator App',
        home: SIForm(),
        theme: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent
        ),
      )//Material APP
  );
}

class SIForm extends StatefulWidget {

  State<StatefulWidget> createState() {

    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {

  var _currencies = ['Rupees','Dollar','Yuan','Pound'];
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      //resizeToAvoidBottomPadding: false, //this will remove overflowed issue
      appBar: AppBar(
        title: Text("SI Calculator"),
      ),

      body: Container(
        margin: EdgeInsets.all(_minimumPadding*2),
        child: ListView(
          children: <Widget>[
            getImageAsset(),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                child: TextField(
              keyboardType: TextInputType.number,
              style: textStyle,
              decoration: InputDecoration(
                  labelText: 'Principal',
                  hintText: 'Enter Principal e.g. 10000',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
              )
              ),
            )),

            Padding(
                padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                child: TextField(
              keyboardType: TextInputType.number,
              style: textStyle,
              decoration: InputDecoration(
                  labelText: 'Rate of Interest',
                  hintText: 'Enter Percent',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
              ),
            )),

          Padding(
              padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
              child:Row(
            children: <Widget>[

              Expanded(child:TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Term',
                    hintText: 'Time in Years',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              )),

              Container(width: _minimumPadding*5,),

              Expanded(child: DropdownButton<String>(
                items: _currencies.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );

                }).toList(),

                  value: 'Rupees',

                    onChanged: (String newValueSelected){
      },

              ))

            ],
          )),

            Padding(

                padding: EdgeInsets.only(bottom: _minimumPadding,top: _minimumPadding),
                child: Row(children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('Calculate'),
                  onPressed: (){

                  },
                ),
              ),

              Expanded(
                child: RaisedButton(
                  child: Text('Reset'),
                  onPressed: (){

                  },
                ),
              ),

            ],)),

            Padding(padding: EdgeInsets.all(_minimumPadding*2),
            child: Text('Todo Text'),
            )

          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(image: assetImage, width: 125.0,height: 125.0,);
    return Container(child: image,margin: EdgeInsets.all(_minimumPadding*10),);
  }

}