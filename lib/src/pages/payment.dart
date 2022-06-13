import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/components/CustomButton.dart';
import 'package:simple_shopping/src/components/alert_dialog.dart';
import 'package:simple_shopping/src/components/cart_app_bar.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';
import 'package:simple_shopping/src/utils/color_schemes.g.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  var cardInputFormatter = MaskTextInputFormatter(
    mask: '####-####-####-####',
    type: MaskAutoCompletionType.lazy,
  );
  var expiryInputFormatter = MaskTextInputFormatter(
    mask: '##/##',
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              const CustomCartAppBar(title: "Payment"),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const CustomTextInput(
                          title: "Name on Card",
                          hint: "John Doe",
                          maxLength: 25,
                          hideCounterText: false,
                        ),
                        CustomTextInput(
                          title: "Card Number",
                          hint: "4489-xxxx-xxxx-xx12",
                          maxLength: 19,
                          keyboardType: TextInputType.number,
                          inputFormatters: [cardInputFormatter],
                        ),
                        CustomTextInput(
                          title: "Expiry",
                          hint: "MM/YY",
                          maxLength: 5,
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [expiryInputFormatter],
                        ),
                        const CustomTextInput(
                          title: "CVV",
                          hint: "000",
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          hideCounterText: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                text: "Make Payment",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return CustomAlertDialog(
                        title: "Success",
                        message:
                            "Payment made Successfully!\n\nYour Order will be dispatched Soon.",
                        onClose: () {
                          context.read<CartNotifier>().clear();
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    Key? key,
    required this.title,
    this.hint,
    this.maxLength,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.hideCounterText = true,
  }) : super(key: key);
  final String title;
  final String? hint;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool hideCounterText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(
              color: CustomColors.textLightColor,
              fontSize: 20,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            counter: hideCounterText ? const Offstage() : null,
          ),
          maxLength: maxLength,
          maxLines: maxLines,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        )
      ],
    );
  }
}
