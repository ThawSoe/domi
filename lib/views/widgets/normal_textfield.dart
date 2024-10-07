import 'package:domi/views/widgets/utils/typedef.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String? hint;
  final TextEditingController? textEditingController;
  final TextFormFieldValidator? validator;

  NormalTextField({
    super.key,
    this.leading,
    this.trailing,
    this.hint,
    this.textEditingController,
    this.validator,
  });

  final OutlineInputBorder _border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.black12,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: _border,
        focusedBorder: _border,
        contentPadding: const EdgeInsets.only(left: 10),
        fillColor: Colors.black.withOpacity(0.03),
        filled: true,
        prefix: leading,
        suffixIcon: trailing,
        hintText: hint,
      ),
      controller: textEditingController,
      validator: validator,
    );
  }
}
