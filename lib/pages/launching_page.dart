import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

import '../models/furniture_model.dart';
import 'single_furniture_page.dart';

const List<FurnitureModel> furnitureList = [
  FurnitureModel(
      price: 20.0,
      id: 1,
      description:
          "We have amazing Quality Lamp Wide range.", //uality Lamp Wide range
      is_liked: false,
      image: "lamp.png",
      title: "Stylish Lamp"),
  FurnitureModel(
      price: 20.0,
      id: 2,
      description:
          "New style of tables for your Homes and office.", //uality Lamp Wide range
      is_liked: false,
      image: "sofa.png",
      title: "Modern Table"),
  FurnitureModel(
      price: 20.0,
      id: 3,
      description:
          "Amazing stylish in multiple Most selling item of this year. We have easy returns product Options at our all stores in India.", //uality Lamp Wide range
      is_liked: false,
      image: "chair.png",
      title: "Wodden Chair"),
];

class LaunchingPage extends StatelessWidget {
  const LaunchingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBottomBar(),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(50)),
                    color: kPrimaryColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      // appbar
                      const CustomAppBar(),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomLaunchingTitleWidget(title: "Furniture in"),
                              CustomLaunchingTitleWidget(title: "Unique Style")
                            ],
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "We have wide range of Furniture",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTabbar(),
                      Expanded(
                          child: ListView.builder(
                        itemBuilder: ((context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SingleFurniturePage(
                                              furniture: furnitureList[index],
                                            )));
                              },
                              child: Card(
                                elevation: 0,
                                // color: Colors.grey.shade100,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Image.asset("assets/" +
                                          furnitureList[index].image),
                                      height: 125,
                                      width: 125,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                furnitureList[index].title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Text(
                                              furnitureList[index].description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Hero(
                                              tag: "price" +
                                                  furnitureList[index]
                                                      .id
                                                      .toString(),
                                              child: Text(
                                                "\$" +
                                                    (furnitureList[index].price)
                                                        .toString(),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Hero(
                                        tag: "heart" +
                                            (furnitureList[index].id)
                                                .toString(),
                                        child: Icon(
                                          Icons.favorite_outline,
                                          size: 25,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        itemCount: furnitureList.length,
                      ))
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

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(Icons.menu),
        InkWell(
          onTap: () {},
          child: Container(
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 15),
              child: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(40),
                )),
          ),
        )
      ]),
    );
  }
}

class CustomLaunchingTitleWidget extends StatelessWidget {
  CustomLaunchingTitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({Key? key}) : super(key: key);

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  String selected = "Tables";
  List<String> tabs = ["Tables", "Chairs", "Lamps", "All"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => CustomTabbarTile(
              title: tabs[index],
              isSelected: tabs[index] == selected,
              onTap: () {
                setState(() {
                  selected = tabs[index];
                });
              },
            )),
        itemCount: tabs.length,
      ),
    );
  }
}

class CustomTabbarTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onTap;
  const CustomTabbarTile(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: isSelected ? Colors.grey.shade300 : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
          child: SizedBox(
            width: 60,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    color: isSelected ? Colors.black : Colors.grey,
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 25,
              ),
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
                size: 25,
              ),
              Icon(
                Icons.person_outlined,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        )
      ]),
    );
  }
}
