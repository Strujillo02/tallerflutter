import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:tallergorouter/views/base_view.dart';

class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'gridview',
      body: MaterialApp(
        home: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 8.0,
            child: GridView.builder(
              padding: const EdgeInsets.all(12.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 1.0,
              ),
              // Try uncommenting some of these properties to see the effect on the grid:
              // itemCount: 20, // The default is that the number of grid tiles is infinite.
              // scrollDirection: Axis.horizontal, // The default is vertical.
              // reverse: true, // The default is false, going down (or left to right).
              itemBuilder: (BuildContext context, int index) {
                final math.Random random = math.Random(index);
                return GridTile(
                  header: GridTileBar(
                    title: Text(
                      '$index',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(12.0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      gradient: const RadialGradient(
                        colors: <Color>[Color(0x0F88EEFF), Color(0x2F0099BB)],
                      ),
                    ),
                    child: FlutterLogo(
                      style:
                          FlutterLogoStyle.values[random.nextInt(
                            FlutterLogoStyle.values.length,
                          )],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
