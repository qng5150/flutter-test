import 'package:myapp/select_option.dart';

class AsyncService {
  Future<List<SelectOption>> getOptions() async {
    List<SelectOption> options = []
      ..add(SelectOption(name: 'one', display: 'One'))
      ..add(SelectOption(name: 'two', display: 'Two'))
      ..add(SelectOption(name: 'three', display: 'Three'));
    return options;
  }
}
