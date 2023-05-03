import 'package:flutter/material.dart';
import 'ReusableFlipCard.dart';

class FlippableCard extends StatefulWidget {
  @override
  _FlippableCardState createState() => _FlippableCardState();
}

class _FlippableCardState extends State<FlippableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _showFront = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation =
        Tween<double>(begin: 0.0, end: 2.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _toggleCard() {
    if (_showFront) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    setState(() {
      _showFront = !_showFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          final angle = _animation.value * 3.1415926535897932;

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
      ),
    );
  }
}
