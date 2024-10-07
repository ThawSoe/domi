import 'package:domi/views/widgets/normal_textfield.dart';
import 'package:domi/views/widgets/utils/typedef.dart';
import 'package:flutter/material.dart';

class AddressBoxWidget extends StatelessWidget {
  final TextFormFieldValidator validator;
  final TextEditingController controller;
  const AddressBoxWidget({
    super.key,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Complete Address"),
        const SizedBox(
          height: 10,
        ),
        NormalTextField(
          hint: "3A Street",
          validator: validator,
          textEditingController: controller,
        ),
      ],
    );
  }
}
