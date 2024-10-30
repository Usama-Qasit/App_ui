import 'package:flutter/material.dart';

class MySizedBox extends StatefulWidget {
  final double h;
  final double w;
  const MySizedBox({super.key, required this.h, required this.w});

  @override
  State<MySizedBox> createState() => _MySizedBoxState();
}

class _MySizedBoxState extends State<MySizedBox> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: Height * widget.h,
      width: Width * widget.w,
    );
  }
}