import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final void Function() longPressCallback;

  TaskTile(this.isChecked, this.taskTitle, {required this.checkboxCallback, required this.longPressCallback});

  /*void checkboxCallback(bool? checkboxState){
     if (checkboxState != null) {
       setState(() {
         isChecked = checkboxState ;
       });
     }

  }*/
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (value) {
          checkboxCallback(value);
        },
      ),
    );
  }
}
/*
if (checkboxState != null) {
          setState(() {
            isChecked = checkboxState ;
          });
        }
 */
/*class TaskCheckBox extends StatelessWidget {

  final bool checkBoxState;
  final Function toggleCheckboxState;
  const TaskCheckBox({required this.checkBoxState, required this.toggleCheckboxState});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      activeColor: Colors.lightBlueAccent,
      onChanged: toggleCheckboxState as void Function(bool?)?,
    );
  }
}*/
