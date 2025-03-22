import 'package:flutter/material.dart';
import 'package:tallergorouter/views/base_view.dart';

class TabbarView1 extends StatelessWidget {
  const TabbarView1({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Tab Bar',
      body: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.cloud_outlined)),
                Tab(icon: Icon(Icons.beach_access_sharp)),
                Tab(icon: Icon(Icons.brightness_5_sharp)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Text("It's cloudy here")),
              Center(child: Image.network('https://picsum.photos/250?image=9')),
              Center(child: Text("It's sunny here")),
            ],
          ),
        ),
      ),
    );
  }
}
