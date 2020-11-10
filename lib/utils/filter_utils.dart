import 'package:currency_exchanger/blocs/display_bloc.dart';
import 'package:currency_exchanger/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterUtils {
  static filterQuotes(BuildContext context, String text,
      List<MapEntry<String, double>> quotes) {
    List<MapEntry<String, double>> filteredQuotes = [];
    for (MapEntry<String, double> quote in quotes) {
      String code = quote.key.substring(3);
      bool isQuote = code.contains(text);
      String fullForm =
          Currency.currencyList[quote.key.substring(3)].toLowerCase();
      bool isFullForm = fullForm.contains(text);

      if (isQuote || isFullForm) {
        filteredQuotes.add(quote);
      }
    }

    Provider.of<DisplayBloc>(context, listen: false)
        .updateQuotes(filteredQuotes);
  }
}
