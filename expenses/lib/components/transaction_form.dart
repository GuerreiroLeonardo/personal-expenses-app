import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
                  onSubmitted: (_) => _submitForm(),
                  controller: titleController,
                  // onChanged: (newValue) => {title = newValue},
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
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
                      onPressed: _submitForm,
                      child: Text("Nova Transação"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[100], onPrimary: Colors.purple),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
