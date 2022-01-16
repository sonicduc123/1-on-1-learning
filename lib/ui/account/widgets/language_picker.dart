import 'package:flutter/material.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:let_tutor/utils/validate_input.dart';
import 'package:let_tutor/widgets/space.dart';

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  _LanguagePickerState createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  Language _selectedDialogLanguage = Languages.korean;

// It's sample code of Dialog Item.
  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(language.name),
          SizedBox(width: 8.0),
          Flexible(child: Text("(${language.isoCode})"))
        ],
      );

  void _openLanguagePickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: LanguagePickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration: InputDecoration(hintText: 'Search...'),
                isSearchable: true,
                title: Text('Select your language'),
                onValuePicked: (Language language) => setState(() {
                      _selectedDialogLanguage = language;
                      widget.controller.text = _selectedDialogLanguage.name;
                    }),
                itemBuilder: _buildDialogItem)),
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.language,
          color: Colors.blue,
          size: 30,
        ),
        space(20),
        Expanded(
          child: TextFormField(
            readOnly: true,
            controller: widget.controller,
            decoration: const InputDecoration(
              hintText: "Enter your language",
            ),
            validator: (value) => validate_input(value, "language"),
            onTap: () => _openLanguagePickerDialog(),
          ),
        ),
      ],
    );
  }
}
