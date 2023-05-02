import 'package:flutter/material.dart';
import 'package:tmeny_flutter/common/ui/custom_widgets/no_item_found_page.dart';
import 'package:tmeny_flutter/common/utils/app_material/app_bars/application_app_bars.dart';

class UserBookingPage extends StatefulWidget {
  const UserBookingPage({Key? key}) : super(key: key);

  @override
  State<UserBookingPage> createState() => _UserBookingPageState();
}

class _UserBookingPageState extends State<UserBookingPage> {
  bool? isConnected;
  String? isConnectedMsg;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBars.defaultAppBar(
        centerTitle: true,
        title: 'My booking',
      ),
      body:NoItemFoundPage(
        image: 'assets/bookings/bookings_background.png',
        title: 'No bookings found',
        subTitle: 'It looks like you don\'t have any current bookings or reservations. You can make a new booking by selecting the "Book" button below',
        buttonTitle: 'Book',
        onPressedButton: () {},
      ),
    );
  }
}
