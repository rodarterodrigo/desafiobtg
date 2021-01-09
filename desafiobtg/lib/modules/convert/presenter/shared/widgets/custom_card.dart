import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  CurrencyCard({@required this.currency, @required this.onTap});

  final Currency currency;
  final GestureTapCallback onTap;

  @override
  _CurrencyCardState createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 10,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: 100,
            width: MediaQuery.of(context).size.width /1.1,
            decoration: BoxDecoration(
              border: Border.all( color: Colors.teal, width: 2, style: BorderStyle.solid),
              color: widget.currency.isTaped? Colors.teal: Colors.white,
              // color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.currency.currency,
                  style: TextStyle(
                    fontSize: 35,
                    color: widget.currency.isTaped? Colors.white: Colors.teal,
                    // color:  Colors.teal
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.currency.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: widget.currency.isTaped? Colors.white: Colors.teal,
                          // color:  Colors.teal
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
