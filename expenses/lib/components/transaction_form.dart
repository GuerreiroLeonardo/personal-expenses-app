import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: titleController,
                  // onChanged: (newValue) => {title = newValue},
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  controller: valueController,
                  // onChanged: (newValue) => {value = newValue},
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final title = titleController.text;
                        final value =
                            double.tryParse(valueController.text) ?? 0.0;
                        onSubmit(title, value);
                      },
                      child: Text("Nova Transação"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.purple),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
