import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  final VoidCallback deleteFunction;
  final  String text;

  ToDoTile(
      {Key? key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction, 
      required this.text
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25,
        top: 25,
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            //check box
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),

            //task name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                Text(text,style: TextStyle(fontSize: 12,fontFamily: "Poppins-Bold"),)
              ],
            ),
            Spacer(),
            // IconButton(onPressed: delFunction,   icon: const Icon(Icons.delete, color:Colors.red))
            InkWell(
                onTap: deleteFunction,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
