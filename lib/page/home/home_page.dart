import 'package:flutter/material.dart';
import 'package:new_app/page/home/widgets/item_menu_bottom.dart';
import 'package:new_app/page/home/widgets/menu_app.dart';
import 'package:new_app/page/home/widgets/my_app_bar.dart';
import 'package:new_app/page/home/widgets/my_dots_app.dart';
import 'package:new_app/page/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu;
  late int _currentIndex;
  late double _yPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
    _yPosition = 0;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == 0) {
      _yPosition = screenHeight * .24;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(
              showMenu: _showMenu,
              onTap: () {
                setState(() {
                  _showMenu = !_showMenu;
                  _yPosition = _showMenu ? screenHeight * .9 : screenHeight * .24;
                });
              }),
          MenuApp(
            showMenu: _showMenu,
            top: screenHeight * .20,
          ),
          PageViewApp(
            showMenu: _showMenu,
            top: _yPosition,
            //!_showMenu ? screenHeight * .24 : screenHeight * .75,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBL = screenHeight * .9;
              double positionTL = screenHeight * .24;
              double midleP = (positionBL - positionTL) / 2;
              setState(() {
                _yPosition += details.delta.dy;
                _yPosition = _yPosition < positionTL ? positionTL : _yPosition;
                _yPosition = _yPosition > positionBL ? positionBL : _yPosition;

                if (_yPosition != positionBL && details.delta.dy > 0) {
                  _yPosition = _yPosition > positionTL + midleP - 50
                      ? positionBL
                      : _yPosition;
                }

                if (_yPosition != positionTL && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBL - midleP
                      ? positionTL
                      : _yPosition;
                }

                if (_yPosition == positionBL) {
                  _showMenu = true;
                } else if (_yPosition == positionTL) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(top: screenHeight * .70, currentIndex: _currentIndex, showMenu: _showMenu,),
          Positioned(
            bottom: 0 + MediaQuery.of(context).padding.bottom,
            left: 0,
            right: 0,
            height: screenHeight * .15,
            child: Container(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  ItemMenuBottom(icon: Icons.person_add,  text:'Indicar amigos',),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
