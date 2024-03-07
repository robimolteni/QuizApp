import 'package:flutter/material.dart';

class TemporaryWidget extends StatelessWidget {

  TemporaryWidget(this.showToast, {super.key});

  final void Function() showToast;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          TextButton.icon(onPressed: showToast,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.refresh),
            label: const Text("Press Here"),
          ),
      ],
      ),
    );
  }

}