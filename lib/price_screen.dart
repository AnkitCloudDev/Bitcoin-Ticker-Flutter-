import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:io' as pt show Platform ;
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var selectedValue="USD";
  double rate;

  List<String> printedRates=['?','?','?'];
  Map<String,double> rates={};
 CoinData coinData=CoinData();
  List<Widget> list;
  String dropdownValue;
    List<Widget> getDropDownItems(){
      list=List<DropdownMenuItem<String>>();
      for(String i in currenciesList){
        list.add(buildDropdownMenuItem(i));
      }
      return list;
    }
  DropdownButton<String> getDropDownButton(){
      return DropdownButton<String>(
          items: getDropDownItems(

          )
      ,
      value: selectedValue,
      onChanged: (value) async{

        // printedRate=

        rates['BTC']=await coinData.getCoinData(selectedValue,'BTC');
        rates['ETH']=await coinData.getCoinData(selectedValue,'ETH');
        rates['LTC']=await coinData.getCoinData(selectedValue,'LTC');
        printedRates[0]=rates['BTC'].toStringAsFixed(3);
        printedRates[1]=rates['ETH'].toStringAsFixed(3);
        printedRates[2]=rates['LTC'].toStringAsFixed(3);
        print(printedRates[0]);
            setState(()  {

              selectedValue=value;
            });
      print(value);
      },

      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          CardWidget(printedRate: printedRates[0], selectedValue: selectedValue,crypto: 'BTC',),
          CardWidget(printedRate: printedRates[1], selectedValue: selectedValue,crypto: 'ETH',),
          CardWidget(printedRate: printedRates[2], selectedValue: selectedValue,crypto: 'LTC',),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }

  CupertinoPicker buildIosPicker() {
    return CupertinoPicker(
            itemExtent: 32.0 ,
            onSelectedItemChanged: (index)async {

              setState(()  {
                selectedValue=list.getRange(index, index+1) as String;

              });
              rates['BTC']=await coinData.getCoinData(selectedValue,'BTC');
              rates['ETH']=await coinData.getCoinData(selectedValue,'ETH');
              rates['LTC']=await coinData.getCoinData(selectedValue,'LTC');

              printedRates[0]=rates['BTH'].toString();
              printedRates[1]=rates['ETH'].toString();
              printedRates[2]=rates['LTC'].toString();
            },
            children: getDropDownItems(),

          );
  }

  DropdownMenuItem<String> buildDropdownMenuItem(String t) => DropdownMenuItem(child: Text(t, style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),),value:t ,);

  Widget getPicker() {

    if(pt.Platform.isIOS){
      return buildIosPicker();
    }
    else if(pt.Platform.isAndroid){
      return getDropDownButton();
    }

  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
    @required this.printedRate,
    @required this.selectedValue,
    @required this.crypto,
  }) : super(key: key);

  final String printedRate;
  final String selectedValue;
  final String crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $printedRate $selectedValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


