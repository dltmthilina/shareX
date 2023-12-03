// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilledDropdownMenu extends StatefulWidget {
  List<String> list;
  final String hintText;
  final double menuHeight;
  final double menuWidth;
  final double buttonHeight;
  final Color menuBackgroundColor;
  final Color buttonBackgroundColor;
  final ValueChanged<String?> onValueChanged;

  FilledDropdownMenu({
    Key? key,
    required this.list,
    required this.hintText,
    required this.menuHeight,
    required this.menuWidth,
    required this.buttonHeight,
    required this.menuBackgroundColor,
    required this.buttonBackgroundColor,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  State<FilledDropdownMenu> createState() => _FilledDropdownMenuState();
}

class _FilledDropdownMenuState extends State<FilledDropdownMenu> {
  late String? dropdownValue;
  late List<String> _list;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
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
        decoration: const InputDecoration(contentPadding: EdgeInsets.all(6)),
        menuMaxHeight: widget.menuHeight,
        value: dropdownValue,
        hint: Text(widget.hintText),
        style: const TextStyle(color: Colors.white),
        dropdownColor: widget.menuBackgroundColor,
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          widget.onValueChanged(newValue);
        },
      ),
    );
  }
}
