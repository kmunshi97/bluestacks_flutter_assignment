import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class BSTTextFieldWidget extends StatelessWidget {
  //
  final TextEditingController textEditingController;
  final String? headerText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final bool? isObsureText;
  final String? Function(String?)? validator;

  const BSTTextFieldWidget({
    Key? key,
    required this.textEditingController,
    this.headerText,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.isObsureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 36,
              right: 36,
              bottom: 8,
            ),
            child: headerText != null
                ? Text(
                    headerText!,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.blue,
                        ),
                  )
                : const SizedBox(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validator,
                obscureText: isObsureText!,
                controller: textEditingController,
                maxLength: keyboardType == TextInputType.phone ? 10 : 16,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                    keyboardType == TextInputType.phone ? 10 : 16,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  ),
                ],
                keyboardType: keyboardType ?? TextInputType.text,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.25),
                  prefixIcon: prefixIcon,
                  counterText: "",
                  hintText: hintText ?? "",
                  hintStyle: TextStyle(
                    fontSize: 10.5.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
