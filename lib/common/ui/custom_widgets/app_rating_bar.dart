import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tmeny_flutter/common/utils/app_dimensions/dimensions.dart';

class AppRatingBar extends StatelessWidget {
  final double rating;
  final double itemSize;
  final bool canRate;
  final ValueChanged<double>? onRateUpdate;
  AppRatingBar({
    Key? key,
    required this.rating,
    double? itemSize,
    this.onRateUpdate,
    this.canRate = false
  }) : itemSize = itemSize ?? IconDimensions.xSmall, super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Colors.amber,
          size: itemSize,
        ),
        half: Icon(
          Icons.star,
          color: Colors.amber,
          size: itemSize,
        ),
        empty: Icon(
          Icons.star,
          color: Colors.grey,
          size: itemSize,
        )
      ),
      onRatingUpdate: onRateUpdate ?? (value) {},
      initialRating: rating,
      tapOnlyMode: false,
      updateOnDrag: canRate,
      ignoreGestures: !canRate,
      allowHalfRating: true,
      maxRating: 5,
      itemSize: itemSize,
    );
  }
}
