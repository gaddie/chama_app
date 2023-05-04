import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusableCard.dart';
import 'imageAvatar.dart';
import 'bigCard.dart';
import 'stats_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: kBackgroundColor,
        child: ListView(children: [
          //main column
          Column(
            children: [
              //dashboard
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigCard(
                    fName: 'balance',
                    lName: '10,000',
                    icon: Icons.payments,
                    firstTextSize: 16,
                    secondTextSize: 40,
                  ),
                  Column(
                    children: [
                      ReusableCard(
                        iconSize: 30,
                        label: 'Chat',
                        icon: Icons.forum,
                        cardHeight: 80,
                        cardWidth: 100,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      ReusableCard(
                        iconSize: 30,
                        label: 'Meetings',
                        icon: Icons.group,
                        cardHeight: 80,
                        cardWidth: 100,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      'Members',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Text(
                      'View all',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              //members
              Container(
                height: 100,
                // color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Row(children: [
                        MembersAvatar(
                          name: 'joe',
                          image: 'download.jpeg',
                        ),
                        MembersAvatar(
                          name: 'mike',
                          image: 'download.jpeg',
                        ),
                        MembersAvatar(
                          name: 'john',
                          image: 'download.jpeg',
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: Icon(Icons.add)),
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ReusableCard(
                        iconSize: 40,
                        label: 'Loans',
                        cardHeight: 80.0,
                        cardWidth: 100.0,
                        icon: Icons.money,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LineChartSample2()));
                        },
                        child: ReusableCard(
                          iconSize: 40,
                          label: 'Statistic',
                          cardHeight: 80.0,
                          cardWidth: 100.0,
                          icon: Icons.bar_chart,
                        ),
                      ),
                    ],
                  ),
                  BigCard(
                      fName: 'Latest',
                      lName: 'Transactions',
                      firstTextSize: 20,
                      secondTextSize: 30,
                      icon: Icons.currency_exchange)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white70.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Project 1',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Starting date',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.green,
                              size: 40,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white.withOpacity(0.2),
                              size: 40,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
