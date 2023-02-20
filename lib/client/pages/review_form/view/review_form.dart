import 'package:flutter/material.dart';

class ReviewForm extends StatelessWidget {
  static const routeName = '/review-form';

  const ReviewForm({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Review Form')),
      );
}
