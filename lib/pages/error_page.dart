//Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Providers
import '../providers/global_providers.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          ElevatedButton(
            //Fetch data afresh
            onPressed: () => context.refresh(productsFutureProvider),
            child: Text("Click to Try again"),
          ),
        ],
      ),
    );
  }
}