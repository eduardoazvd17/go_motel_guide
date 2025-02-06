import 'package:flutter/material.dart';
import 'package:go/src/features/home/presentation/pages/widgets/slider_motel_tile_widget.dart';

import '../../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)),
        title: const TabButtonsWidget(),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
        ],
      ),
      body: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: MyLocationButton(),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.grey.shade50,
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SliderMotelTileWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          color: const Color.fromARGB(252, 252, 252, 255),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: FiltersBarWidget(),
                              ),
                              Divider(color: Colors.grey.shade200, height: 0),
                              MotelTileWidget(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
