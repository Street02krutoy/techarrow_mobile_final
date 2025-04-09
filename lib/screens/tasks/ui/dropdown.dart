import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.button,
    required this.children,
    required this.controller,
  });

  final Widget button;
  final List<Widget> children;
  final ValueNotifier<bool> controller;

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, val, child) {
          return Column(
            children: [
              InkWell(
                  onTap: () {
                    widget.controller.value = !widget.controller.value;
                  },
                  child: widget.button),
              if (val) ...widget.children
            ],
          );
        });
  }
}
