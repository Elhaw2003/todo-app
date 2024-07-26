import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({super.key, required this.colorContainer, required this.colorTitle, required this.colorBorder, required this.title, this.onTap});
  final Color colorContainer;
  final Color colorTitle;
  final Color colorBorder;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorContainer,
            border: Border.all(color: colorBorder)
        ),
        child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: colorTitle
                ),
              ),
            ),
        ),
    );
  }
}
