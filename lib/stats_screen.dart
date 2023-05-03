import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'ReusableFlipCard.dart';

DateTime now = new DateTime.now();
var year = now.year;

var isActive = true;

class LineChartSample2 extends StatefulWidget {
  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;

  bool _showFront = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation1 =
        Tween<double>(begin: 0.0, end: 2.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void toggleCard() {
    if (_showFront) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    setState(() {
      _showFront = !_showFront;
    });
  }

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: kBackgroundColorTwo,
        child: ListView(children: [
          Center(
              child: Text(
            'Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          )),
          SizedBox(
            height: 20,
          ),
          //year picker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    year--;
                  });
                },
                child: StatsButtonStyle(
                  Height: 50,
                  Width: 50,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              StatsButtonStyle(
                Height: 50,
                Width: 200,
                child: Text(
                  '$year',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    year++;
                  });
                },
                child: StatsButtonStyle(
                  Height: 50,
                  Width: 50,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          //graph
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.40,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 18,
                    left: 12,
                    top: 40,
                    bottom: 12,
                  ),
                  child: LineChart(
                    showAvg ? avgData() : mainData(),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                width: 60,
                height: 34,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      showAvg = !showAvg;
                    });
                  },
                  child: Text(
                    'avg',
                    style:
                        TextStyle(fontSize: 12, color: Colors.lightGreenAccent),
                  ),
                ),
              ),
            ],
          ),
          //switch button
          Padding(
            padding: EdgeInsets.only(right: 30, left: 30),
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                color: Colors.white70.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          toggleCard();
                          isActive = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isActive ? Colors.green : null,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        height: 50,
                        child: Center(
                          child: Text(
                            'Icome',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isActive = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isActive ? null : Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        height: 50,
                        child: Center(
                          child: Text(
                            'Spend',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedBuilder(
            animation: _animation1,
            builder: (BuildContext context, Widget? child) {
              final angle = _animation1.value * 3.1415926535897932;

              final frontOpacity = _showFront ? 1.0 : 0.0;
              final backOpacity = _showFront ? 0.0 : 1.0;

              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: frontOpacity,
                      child: Center(
                        child: IcomeCard(
                          name: 'Jane doe',
                          IncomeOrSpend: 'Income',
                          date: '2/2/2023',
                          amount: '2,000',
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: backOpacity,
                      child: Center(
                        child: Transform(
                          alignment: _showFront
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          transform: Matrix4.identity()..rotateY(angle - angle),
                          child: IcomeCard(
                            name: 'Chicken project',
                            IncomeOrSpend: 'Spend',
                            date: '2/2/2023',
                            amount: '20,000',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ]),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10, color: kDarkGreen);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('JAN', style: style);
        break;
      case 2:
        text = Text('FEB', style: style);
        break;
      case 3:
        text = Text('MAR', style: style);
        break;
      case 4:
        text = Text('APR', style: style);
        break;
      case 5:
        text = Text('MAY', style: style);
        break;
      case 6:
        text = Text('JUN', style: style);
        break;
      case 7:
        text = Text('JUL', style: style);
        break;
      case 8:
        text = Text('AUG', style: style);
        break;
      case 9:
        text = Text('SEP', style: style);
        break;
      case 10:
        text = Text('OCT', style: style);
        break;
      case 11:
        text = Text('NOV', style: style);
        break;
      case 12:
        text = Text('DEC', style: style);
        break;

      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: kDarkGreen);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 2:
        text = '20K';
        break;
      case 3:
        text = '30k';
        break;
      case 4:
        text = '40K';
        break;
      case 5:
        text = '50k';
        break;
      case 6:
        text = '60K';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: kDarkGreen,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: kDarkGreen,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 4),
            FlSpot(4, 4),
            FlSpot(5, 3),
            FlSpot(6, 4),
            FlSpot(7, 1),
            FlSpot(8, 4),
            FlSpot(9, 5),
            FlSpot(10, 4),
            FlSpot(11, 4),
            FlSpot(12, 4),
          ],
          isCurved: true,
          color: Colors.lightGreenAccent,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green.withOpacity(0.5),
                  Colors.lightGreenAccent.withOpacity(0.5),
                ]),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(1, 3.44),
            FlSpot(2, 3.44),
            FlSpot(3, 3.44),
            FlSpot(4, 3.44),
            FlSpot(5, 3.44),
            FlSpot(6, 3.44),
            FlSpot(7, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9, 3.44),
            FlSpot(10, 3.44),
            FlSpot(11, 3.44),
            FlSpot(12, 3.44),
          ],
          isCurved: true,
          color: Colors.lightGreenAccent,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green.withOpacity(0.5),
                  Colors.lightGreenAccent.withOpacity(0.5),
                ]),
          ),
        ),
      ],
    );
  }
}

class StatsButtonStyle extends StatelessWidget {
  double Height;
  double Width;
  var child;

  StatsButtonStyle({this.child, required this.Height, required this.Width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      height: Height,
      width: Width,
      child: Center(
        child: child,
      ),
    );
  }
}
