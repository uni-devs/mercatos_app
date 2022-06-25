part of 'mercatos_logic_functions.dart';

/* 
  final Debouncer debouncer = Debouncer(300);

  // typing function
  
  _onTyping(String text) {
    debouncer.run(
      () async {
      
      },
    );
    setState(() {});
  }

 */
class _Debouncer {
  final int milliseconds;
  Timer? _timer;

  _Debouncer(this.milliseconds);

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
