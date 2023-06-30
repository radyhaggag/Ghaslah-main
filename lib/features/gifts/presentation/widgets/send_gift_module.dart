import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ghaslah/core/functions/build_toast.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../data/models/send_gift_model.dart';
import '../bloc/gifts_bloc.dart';
import '../widgets/gift_amount_input_field.dart';
import '../widgets/gift_message_input_field.dart';
import '../widgets/gift_phone_input_field.dart';
import '../widgets/send_gift_message.dart';

class SendGiftModule extends StatefulWidget {
  const SendGiftModule({super.key});

  @override
  State<SendGiftModule> createState() => _SendGiftModuleState();
}

class _SendGiftModuleState extends State<SendGiftModule> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<GiftsBloc, GiftsState>(
      listener: (context, state) {
        if (state is SendGiftLoadingFailed) {
          buildToast(
            toastType: ToastType.error,
            msg: state.message,
          );
        }
        if (state is SendGiftLoadingSuccess) {
          buildToast(
            toastType: ToastType.success,
            msg: "تم الارسال بنجاح",
          );
        }
      },
      child: Container(
        height: context.height,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SendGiftMessage(),
                const SizedBox(height: 20),
                GiftAmountInputField(amountController: amountController),
                const SizedBox(height: 10),
                GiftPhoneInputField(phoneController: phoneController),
                const SizedBox(height: 10),
                GiftMessageInputField(messageController: messageController),
                const SizedBox(height: 20),
                BlocBuilder<GiftsBloc, GiftsState>(
                  builder: (context, state) {
                    if (state is SendGiftLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                      text: 'ارسال الهديه',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final sendGiftModel = SendGiftModel(
                            amount: int.parse(amountController.text),
                            message: messageController.text,
                            receiver: phoneController.text,
                          );
                          context
                              .read<GiftsBloc>()
                              .add(SendGift(sendGiftModel));
                        }
                      },
                      width: context.width,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
