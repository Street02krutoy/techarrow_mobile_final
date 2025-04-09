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
              GestureDetector(
                  onTap: () {
                    widget.controller.value = !widget.controller.value;
                  },
                  child: widget.button),
              ClipRect(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: ConstrainedBox(
                    constraints: val
                        ? const BoxConstraints()
                        : const BoxConstraints(maxHeight: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.children,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
