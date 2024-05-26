import 'package:flutter/material.dart';
import 'package:mlk/Auth/presentation/widgets/custom_Text_Form_Field.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomTextFomField(
              val: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Title';
                }
                return null;
              },
              label: "Title",
              keytype: null,
              myContoller: titleController,
              myhint: "text",
              suffix: null,
              obscure: false),
        ],
      ),
    );
  }
}
