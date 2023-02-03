import 'package:flutter/material.dart';

class ReminderTaskView extends StatefulWidget {
  final String img;
  final String taskName;
  final String saveDate;
  const ReminderTaskView({Key? key, required this.img, required this.taskName, required this.saveDate}) : super(key: key);

  @override
  State<ReminderTaskView> createState() => _ReminderTaskViewState();
}

class _ReminderTaskViewState extends State<ReminderTaskView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 139,
        height: 91,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, 5),
              blurRadius: 10
            )
          ],
          color: const Color(0xffffffff),
          borderRadius:  BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:  const EdgeInsets.fromLTRB(0.5, 0, 0, 2),
              height: 55,
              width: 60,
              child: Image.asset(widget.img,
              fit: BoxFit.cover),
            ),
            Container(
              margin:  const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child:
              Text(
                widget.taskName,
                textAlign:  TextAlign.right,
                style:  const TextStyle(
                  fontSize:  12,
                  fontWeight:  FontWeight.w500,
                  height:  1,
                  color:  Color(0xff042d2b),
                ),
              ),
            ),
            Container(
              margin:  const EdgeInsets.fromLTRB(8, 5, 0, 0),
              child:
              Text(
                'Save Date: ${widget.saveDate}',
                textAlign:  TextAlign.right,
                style:  const TextStyle(
                fontSize:  10,
                fontWeight:  FontWeight.w400,
                height:  1,
                color:  Color(0x7f042d2b),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
