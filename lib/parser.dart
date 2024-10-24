library parser;

part 'parser/xml_body.dart';

part 'parser/xml_codable.dart';

part 'parser/xml_node.dart';

abstract interface class Identifiable {
  String get id;
}

extension IdentifiableList<T extends Identifiable> on List<T> {
  T getElement(String id) => firstWhere((element) => element.id == id);
}

typedef Attributes = Map<String, String>;
