import 'dart:async';

class Valdiator {
  StreamTransformer validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.contains("@"))
      sink.add(data);
    else
      sink.addError("error he is not mohand");
  });
  StreamTransformer validatepass =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length > 4)
      sink.add(data);
    else
      sink.addError("password must be longer");
  });
}
