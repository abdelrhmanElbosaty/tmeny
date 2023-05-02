import 'package:equatable/equatable.dart';

enum MainUserTabItemType {
  home,
  bookings,
  updates,
  menu,
}

class MainUserTabItem extends Equatable {
  final String? image;
  final String title;
  final bool isSelected;
  final MainUserTabItemType type;

  const MainUserTabItem(
      {required this.image,
      required this.title,
      required this.type,
      required this.isSelected});

  @override
  List<Object?> get props => [image, title, isSelected, type];
}
