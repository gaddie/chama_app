import 'package:flutter/material.dart';

class IcomeCard extends StatelessWidget {
  String IncomeOrSpend;
  String name;
  String amount;
  String date;

  IcomeCard(
      {required this.name,
      required this.amount,
      required this.date,
      required this.IncomeOrSpend});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  IncomeOrSpend,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text('View all',
                    style: TextStyle(color: Colors.white, fontSize: 20))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(name, style: TextStyle(color: Colors.white)),
                      Text(date, style: TextStyle(color: Colors.white))
                    ],
                  ),
                ]),
                Text('Ksh $amount', style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
