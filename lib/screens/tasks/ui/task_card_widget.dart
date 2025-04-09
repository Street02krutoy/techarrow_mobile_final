import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget(
      {super.key, required this.child, this.onEditTapped, this.onTap});

  final Widget child;
  final VoidCallback? onEditTapped;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                child,
                Spacer(),
                if (onEditTapped != null)
                  IconButton(
                    onPressed: onEditTapped,
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
