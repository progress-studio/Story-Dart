part of '../story.dart';

final class Base extends Intent {
  final String id;
  @override
  final Attributes extraAttributes;

  Base(this.id, this.extraAttributes);

  @override
  Base.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode('base', {'id': id, ...extraAttributes}, null);
}
