import 'package:flutter/material.dart';
import 'package:let_tutor/utils/validate_input.dart';
import 'package:let_tutor/widgets/space.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.dateController}) : super(key: key);
  final TextEditingController dateController;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime selectedDate;

  @override
  void dispose() {
    widget.dateController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    setState(() {
      selectedDate = DateTime.parse(widget.dateController.text);
    });
  }

  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now()))) {
      return false;
    }
    return true;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2100),
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.dateController.text = selectedDate.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.cake,
              color: Colors.blue,
              size: 30,
            ),
            space(20),
            Expanded(
              child: TextFormField(
                controller: widget.dateController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  hintText: "Enter your birthday",
                ),
                validator: (value) => validate_input(value, 'birthday'),
                //textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(
                  Icons.calendar_today,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
