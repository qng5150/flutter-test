import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/select_option.dart';

class SelectWidget extends StatelessWidget {
  final List<SelectOption> options;
  SelectWidget({this.options});

  @override
  Widget build(BuildContext context) {
    if (options == null || options.length == 0) {
      return Container(
          key: const Key('selectWidget'), child: Text('No options available'));
    }

    return ListView.builder(
        key: const Key('selectWidget'),
        itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          SelectOption option = options[index];
          return Card(
              child: ListTile(
            title: Text(option.display),
            onTap: () {
              Navigator.pop(context, option);
            },
          ));
        });
  }
}
