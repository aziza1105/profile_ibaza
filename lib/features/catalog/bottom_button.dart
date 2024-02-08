import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../assets/constants/colors.dart';
import '../../assets/constants/icons.dart';


class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: SizedBox(
        width: double.maxFinite,
        height: 55,
        child: MaterialButton(
          onPressed: () {},
          color: buttonBackgroundAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.fromLTRB(11, 11, 92, 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 60,
              ),
              const Text(
                'Barchasini ko\'rish',
                style: TextStyle(
                  color: buttonTextColor,
                  fontSize: 20,
                ),
              ),
              SvgPicture.asset(AppIcons.yellowArrow),
            ],
          ),
        ),
      ),
    );
  }
}
