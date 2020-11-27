import 'dart:convert';

import 'package:http/http.dart' as http;
const kApi_key="?apikey=99770410-5E5F-4643-8F7D-929DAF71CA5E";
// TODO: GOTO https://www.coinapi.io/Pricing, scroll down and click get a free API key. Create an account and you will get a free API key mailed to you,
const kurl="https://rest.coinapi.io/v1/exchangerate/";


//List of all the crypto's we want the rates for
const List<String> crpytoList=[
  'BTC',
  'ETH',
  'LTC',
];
//List of Currencies to Choose from
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {

  Future<double> getCoinData(String currency,String cryptocurrency) async{
    String url = kurl + '$cryptocurrency/' + currency + kApi_key;
    //Building the REST API String by adding the coin Detail and API key
    print(url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var exchangeData = jsonDecode(response.body);
      print(exchangeData['rate']);
      return exchangeData['rate'];
    }
    else {
      print("Sorry!! Something went wrong");
    }

  }
  // Future<double> getLTCData(String currency) async {
  //   String url = kurl + 'LTC/' + currency + kApi_key;
  //   http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     var exchangeData = jsonDecode(response.body);
  //     print(exchangeData['rate']);
  //     return exchangeData['rate'];
  //   }
  //   else {
  //     print("Sorry!! Something went wrong");
  //   }
  // }
  //   Future<double> getETHData(String currency) async{
  //     String url=kurl+'ETH/'+currency+kApi_key;
  //     http.Response response=await http.get(url) ;
  //     if(response.statusCode==200){
  //       var exchangeData=jsonDecode(response.body);
  //       print(exchangeData['rate']);
  //       return exchangeData['rate'];
  //     }
  //     else{
  //       print("Sorry!! Something went wrong");
  //
  //     }
  //
  // }

}
