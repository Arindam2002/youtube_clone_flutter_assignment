import 'package:flutter/material.dart';

class ActionButtonComponent extends StatelessWidget {
  const ActionButtonComponent({
    super.key, required this.icon, required this.iconText,
  });

  final Icon icon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                //  Since these buttons won't be functional hence this is left empty (Lack of required APIs)
              },
              child: icon
          ),
          SizedBox(height: 2,),
          Text(
            iconText,
            style: TextStyle(fontSize: 12, color: Colors.white),
          )
        ],
      ),
    );
  }
}