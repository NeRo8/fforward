import 'package:fforward_adm/services/fb_review_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReviewDetailController extends GetxController {
  final FBReviewService _reviewService;

  final GlobalKey<FormState> reviewForm = GlobalKey<FormState>();

  ReviewDetailController({reviewService}) : _reviewService = reviewService;

  void onTapSubmit() async {}
}
