import 'package:domi/di.dart';
import 'package:domi/views/address_picker/address_picker_view.dart';
import 'package:domi/views/widgets/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  configureDI();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AddressPickerView(),
      theme: ThemeData(
          fontFamily: 'Figtree',
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textStyle: WidgetStateProperty.resolveWith(
                  (states) => const TextStyle(fontSize: 16)),
              foregroundColor:
                  WidgetStateProperty.resolveWith((states) => Colors.white),
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                    return MColors.disabledColor;
                  }
                  return MColors.hightlightBlue;
                },
              ),
            ),
          )),
    );
  }
}
