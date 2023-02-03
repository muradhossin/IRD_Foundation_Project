import 'package:flutter/material.dart';

class AllTaskView extends StatefulWidget {
  final String img;
  final String taskName;
  final String saveDate;
  const AllTaskView({Key? key, required this.img, required this.taskName, required this.saveDate}) : super(key: key);

  @override
  State<AllTaskView> createState() => _AllTaskViewState();
}

class _AllTaskViewState extends State<AllTaskView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
      child: Container(
        width: double.infinity,
        height: 68,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius:  BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Image.asset(widget.img),
          title: Text(widget.taskName,style: const TextStyle(
            fontSize:  12,
            fontWeight:  FontWeight.w500,
            height:  1,
            color:  Color(0xff042d2b),
          ),),
          subtitle: Text("Save Date: ${widget.saveDate}", style: const TextStyle(
            fontSize:  10,
            fontWeight:  FontWeight.w400,
            height:  1,
            color:  Color(0x7f042d2b),
          ),),
        ),
      ),
    );
  }
}
