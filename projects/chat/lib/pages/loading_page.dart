import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Carregando...',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
