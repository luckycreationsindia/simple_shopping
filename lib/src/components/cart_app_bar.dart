import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCartAppBar extends StatefulWidget {
  const CustomCartAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CustomCartAppBar> createState() => _CustomCartAppBarState();
}

class _CustomCartAppBarState extends State<CustomCartAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        const Spacer(),
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Container(
          margin: EdgeInsets.zero,
        ),
      ],
    );
  }
}
