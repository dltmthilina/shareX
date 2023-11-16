import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class FilledDropdownMenu extends StatefulWidget {
  final String hintText;
  final double menuHeight;
  final double menuWidth;
  final double buttonHeight;
  final Color menuBackgroundColor;
  final Color buttonBackgroundColor;
  const FilledDropdownMenu({
    super.key,
    required this.hintText,
    required this.menuHeight,
    required this.buttonHeight,
    required this.menuBackgroundColor,
    required this.buttonBackgroundColor,
    required this.menuWidth,
  });

  @override
  State<FilledDropdownMenu> createState() => _FilledDropdownMenuState();
}

class _FilledDropdownMenuState extends State<FilledDropdownMenu> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.menuWidth,
      height: widget.buttonHeight,
      decoration: BoxDecoration(
        color: widget.buttonBackgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonFormField(
        decoration: InputDecoration(contentPadding: EdgeInsets.all(6)),
        menuMaxHeight: widget.menuHeight,
        value: dropdownValue,
        hint: Text("Category"),
        style: TextStyle(color: Colors.white),
        dropdownColor: widget.menuBackgroundColor,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );
  }
}
