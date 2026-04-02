import 'package:flutter/material.dart';

class HouseholdInput extends StatelessWidget {
  final String? selectedOption;
  final Function(String?) onOptionChanged;
  final TextEditingController householdCodeController;

  const HouseholdInput({
    super.key,
    required this.selectedOption,
    required this.onOptionChanged,
    required this.householdCodeController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text('Enter Existing Household'),
          value: 'existing',
          groupValue: selectedOption,
          onChanged: onOptionChanged,
        ),
        if (selectedOption == 'existing')
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              controller: householdCodeController,
              decoration: const InputDecoration(
                hintText: 'Household Code',
                border: OutlineInputBorder(),
              ),
            ),
          ),

        RadioListTile(
          title: const Text('Create New Household'),
          value: 'new',
          groupValue: selectedOption,
          onChanged: onOptionChanged,
        ),
      ],
    );
  }
}
