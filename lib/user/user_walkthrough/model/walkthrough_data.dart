import 'package:equatable/equatable.dart';
import 'package:tmeny_flutter/user/user_walkthrough/utils/localization/walkthrough_localizer.dart';

class WalkThrowPageViewItemsInfo extends Equatable{
  final List<WalkThrowPageInfo> _walkThrowPageInfoList = [
    WalkThrowPageInfo(
        title: WalkthroughLocalizer.firstPageTitle,
        description: WalkthroughLocalizer.firstPageDescription),
    WalkThrowPageInfo(
        title: WalkthroughLocalizer.secondPageTitle,
        description: WalkthroughLocalizer.secondPageDescription),
    WalkThrowPageInfo(
        title: WalkthroughLocalizer.thirdPageTitle,
        description: WalkthroughLocalizer.thirdPageDescription),
  ];

  List<WalkThrowPageInfo> getPageInfoList() => _walkThrowPageInfoList;

  @override
  List<Object?> get props => [_walkThrowPageInfoList];
}

class WalkThrowPageInfo extends Equatable {
  final String title;
  final String description;

  const WalkThrowPageInfo({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];
}
