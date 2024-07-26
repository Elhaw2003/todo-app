import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key,  this.onTap, required this.colorContainer, required this.colorTitle, required this.colorBorder, required this.title, this.icon});
  final Color colorContainer;
  final Color colorTitle;
  final Color colorBorder;
  final String title;
  final Widget? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorContainer,
            border: Border.all(color: colorBorder)
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      color: colorTitle
                  ),
                ),
              ),
              SizedBox(child: icon,)
            ],
          ),
        ),
      ),
    );
  }
}
