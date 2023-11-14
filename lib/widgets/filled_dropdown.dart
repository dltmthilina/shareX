import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class FilledDropdownMenu extends StatefulWidget {
  const FilledDropdownMenu({super.key});

  @override
  State<FilledDropdownMenu> createState() => _FilledDropdownMenuState();
}

class _FilledDropdownMenuState extends State<FilledDropdownMenu> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      menuStyle:
          MenuStyle(backgroundColor: MaterialStateProperty.all(Colors.purple)),
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
