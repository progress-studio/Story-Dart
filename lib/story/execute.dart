part of '../story.dart';

final class Execute extends Intent {
  final String id;
  @override
  final Attributes extraAttributes;

  Execute(this.id, this.extraAttributes);

  @override
  Execute.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() =>
      XMLNode('execute', {'id': id, ...extraAttributes}, null);
}
