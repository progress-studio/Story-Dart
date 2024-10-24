part of '../../story.dart';

sealed class Variable extends Intent {
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
