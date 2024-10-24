part of '../story.dart';

final class Overlay extends Intent {
  final String id;
  @override
  final Attributes extraAttributes;

  Overlay(this.id, this.extraAttributes);

  @override
  Overlay.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() =>
      XMLNode('overlay', {'id': id, ...extraAttributes}, null);
}
