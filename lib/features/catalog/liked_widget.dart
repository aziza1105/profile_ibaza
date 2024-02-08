import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';


class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: SizedBox(
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 50,
                    child: MaterialButton(
                      onPressed: () {},
                      color: buttonTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      children: [
                        Text(
                          '5',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: SvgPicture.asset(AppIcons.starTop),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
