import 'package:flutter/material.dart';
import 'package:rider_app/generated/assets.dart';
import 'package:rider_app/provider/widgets/app_input.dart';

class SearchPage extends StatelessWidget {
  static const routeName = "/search-page";

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Search"),
      // ),
      body: Column(
        children: [
          Container(
            height: 215,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 6,
                      spreadRadius: 0.5)
                ]),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 26, top: 20, right: 26, bottom: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                 const Stack(
                    children: [
                      Icon(Icons.arrow_back),
                      Center(
                        child: Text(
                          "Set Drop Off",
                          style: TextStyle(fontSize: 18, fontFamily: "bold"),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(Assets.imagesPin,height: 16,width: 16,),
                    const  SizedBox(width: 18,),
                      Expanded(child: AppInput(hintText: "PickUp Location",))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
