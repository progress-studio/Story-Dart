part of '../../project.dart';

sealed class GlobalVariable implements XMLCodable {
  GlobalVariable();

  @override
  factory GlobalVariable.fromXMLNode(XMLNode node) {
    switch (node.tag) {
      case 'character':
        return CharacterVariable.fromXMLNode(node);
      default:
        return Variable.fromXMLNode(node);
    }
  }
}
