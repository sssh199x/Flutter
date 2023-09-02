import 'package:bikebyme/utils/text_utils.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  final List<String> items = ['TOP SPEED', 'ENGINE', 'WEIGHT'];
  final List<String> items1 = ['120 MPH', '350 CC', '150 Kg'];

  List<Widget> getDescriptionButtons() {
    List<Widget> descriptionButtonList = [];
    for (int i = 0; i < items.length; i++) {
      var container = Container(
        width: 100,
        height: 55,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color(0xff4f6361),
                  offset: Offset(20, 10),
                  blurRadius: 10)
            ],
            color: const Color(0xff708985),
            borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextUtil(
            text: items[i],
            weight: true,
            size: 12,
          ),
          const SizedBox(
            height: 2,
          ),
          TextUtil(
            text: items1[i],
            weight: true,
            size: 15,
          ),
        ]),
      );
      descriptionButtonList.add(container);
    }
    return descriptionButtonList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 40.0, left: 0),
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Card(
                            margin: EdgeInsets.all(2),
                            elevation: 15.0,
                            shape: CircleBorder(
                                // eccentricity: 1.0,
                                side:
                                    BorderSide(color: Colors.white, width: 2)),
                            color: Colors.teal,
                            child: ClipOval(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 14.0),
                                  child: TextUtil(
                                    text: 'JAWA',
                                    size: 40,
                                    weight: true,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 310,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal,
                            blurRadius: 20,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: Color(0xff708985),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: -240,
                  child: SizedBox(
                    height: 350,
                    child: Hero(
                        tag: '0',
                        child: Image.asset(
                          'assets/images/bike.png',
                          scale: 1,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUtil(text: 'THE JAWA BIKE', weight: true, size: 20),
                const SizedBox(
                  height: 20,
                ),
                const TextUtil(
                  text:
                      "A MOTORCYCLE,OFTEN CALLED A MOTERBIKE,BIKE OR CYCLE, IS A TW0-OR THREE-WHEELED MOTOR VEHICLE.[1] MOTORCYCLE DESIGN VARIES GREATLY TO SUIT A RANGE OF DIFFERENT PURPOSES",
                  weight: true,
                  color: Color(0xffabb6b6),
                  size: 16,
                ),
                const Spacer(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: getDescriptionButtons()),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white),
                          color: const Color(0xffe8e4e3)),
                      child: Icon(Icons.lock_outline,
                          color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xff4f6361),
                                  offset: Offset(0, 10),
                                  blurRadius: 10)
                            ],
                            color: Theme.of(context).primaryColor),
                        alignment: Alignment.center,
                        child: const TextUtil(
                          text: "ADD TO CART",
                          weight: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
