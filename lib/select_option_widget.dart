import 'package:flutter/material.dart';
import 'package:myapp/async_service.dart';
import 'package:myapp/select_option.dart';
import 'package:myapp/select_widget.dart';

class SelectOptionWidget extends StatefulWidget {
  final AsyncService asyncService;
  SelectOptionWidget({asyncService})
      : this.asyncService =
            asyncService == null ? AsyncService() : asyncService;

  @override
  _StatefulWidgetState createState() =>
      _StatefulWidgetState(asyncService: this.asyncService);
}

class _StatefulWidgetState extends State<SelectOptionWidget> {
  String _selectedItem;
  List<SelectOption> _selectOptions;
  final AsyncService asyncService;

  _StatefulWidgetState({this.asyncService});
  @override
  void initState() {
    super.initState();
    this._selectedItem = "Nothing Selected.";
    this._initOptions();
  }

  Future<void> _initOptions() async {
    List<SelectOption> option = await asyncService.getOptions();
    setState(() {
      this._selectOptions = option;
    });
  }

  Future<SelectOption> selectOption() async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelectWidget(
                options: this._selectOptions,
              )),
    ) as SelectOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('selectedTextWidget'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            SelectOption theOption = await this.selectOption();
            setState(() {
              this._selectedItem = theOption.display + ' was selected';
            });
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0, 15.0),
                child: Icon(
                  Icons.link,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(_selectedItem,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
