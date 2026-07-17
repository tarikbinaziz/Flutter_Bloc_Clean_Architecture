import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const NoInternetWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.signal_wifi_off, size: 100, color: Colors.red),
        Text("No Internet Connection"),
        ElevatedButton(onPressed: onRetry, child: Text("Retry")),
      ],
    );
  }
}
