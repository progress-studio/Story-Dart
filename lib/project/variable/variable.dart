part of '../../project.dart';

sealed class Variable extends GlobalVariable implements Identifiable {
  Variable();

  @override
  factory Variable.fromXMLNode(XMLNode node) {
    switch (node.tag) {
      case 'int':
        return IntVariable.fromXMLNode(node);
      case 'boolean':
        return BooleanVariable.fromXMLNode(node);
      case 'string':
        return StringVariable.fromXMLNode(node);
      default:
        throw StateError('Unknown tag: ${node.tag}');
    }
  }
}
