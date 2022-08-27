import 'package:flutter/material.dart';

class HorizontalTechView extends StatelessWidget {
  final List<String> techList;
  const HorizontalTechView({required this.techList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: techList.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 15, left: 15),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
                color: Colors.white,
              ),
              child: Text(
                techList[index],
                style: const TextStyle(color: Colors.black),
              ),
            );
          },
        ));
  }
}
