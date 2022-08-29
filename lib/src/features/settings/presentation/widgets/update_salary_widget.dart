import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/firebase.dart';
import '../../../../core/utils/num_extensions.dart';
import '../../../../core/dependency_injection.dart';
import '../../../../core/services/firestore_service.dart';

class UpdateSalaryWidget extends StatefulWidget {
  final String userId;
  const UpdateSalaryWidget({Key? key, required this.userId}) : super(key: key);

  @override
  State<UpdateSalaryWidget> createState() => _UpdateSalaryWidgetState();
}

class _UpdateSalaryWidgetState extends State<UpdateSalaryWidget> {
  bool isEditing = false;
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return _editingView();
    } else {
      return _displayView();
    }
  }

  Widget _displayView() => StreamBuilder<double?>(
        stream: findInstance<FirestoreHelper>().currentSalary(widget.userId),
        builder: (context, snap) {
          if (snap.hasError) {
            debugPrint(snap.error.toString());
            return ListTile(
              title: const Text('Error'),
              subtitle: const Text('Monthly salary'),
              onTap: () => editMode(snap.data),
            );
          } else if (snap.hasData) {
            return ListTile(
              title: Text(snap.data!.currency),
              subtitle: const Text('Monthly salary'),
              onTap: () => editMode(snap.data),
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else {
            return ListTile(
              selected: true,
              title: const Text("Add monthly salary"),
              trailing: const Icon(FluentIcons.edit_20_regular),
              onTap: () => editMode(snap.data),
            );
          }
        },
      );

  void editMode(double? existingValue) {
    if (existingValue != null) amountController.text = existingValue.toString();
    setState(() => isEditing = true);
  }

  Widget _editingView() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          inputFormatters: [currencyInputFormatter],
          decoration: InputDecoration(
            prefixText: kRupeeSymbol + ' ',
            label: const Text('Montly salary'),
            hintText: 'XX,XXX',
            suffixIcon: IconButton(
              onPressed: () {
                final newAmount = double.tryParse(amountController.text);
                if (newAmount != null) {
                  findInstance<FirestoreHelper>().setMonthlySalary(
                    widget.userId,
                    newAmount,
                  );
                  setState(() => isEditing = false);
                }
              },
              icon: const Icon(
                FluentIcons.chevron_right_20_regular,
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }
}
