import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/furniture_model.dart';

class SingleFurniturePage extends StatelessWidget {
  final FurnitureModel furniture;
  const SingleFurniturePage({Key? key, required this.furniture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomSingleFurnitureAppBar(
                title: furniture.title.split(" ").last,
                id: furniture.id.toString(),
              ),
              Expanded(
                  child: Container(
                child: Image.asset("assets/" + furniture.image),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    furniture.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: Colors.grey.shade300),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add,
                            size: 17,
                            color: Colors.grey,
                          ),
                        ),
                        Text("1"),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.remove,
                            size: 17,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // description
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Hero(
                  tag: "des" + furniture.id.toString(),
                  child: Text(
                    furniture.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              // bottom price and buy
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Hero(
                        tag: "price" + furniture.id.toString(),
                        child: Text(
                          "\$" + (furniture.price).toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                  // buy buttom
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Text("Buy Now"),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kSecondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSingleFurnitureAppBar extends StatelessWidget {
  final String title;
  final String id;
  const CustomSingleFurnitureAppBar(
      {Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.back_hand)),
        const BackButton(),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Hero(
          tag: "heart" + (id),
          child: Icon(
            Icons.favorite_outline,
            size: 25,
          ),
        )
      ],
    );
  }
}
