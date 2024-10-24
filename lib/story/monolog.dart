part of '../story.dart';

final class Monolog extends Intent {
  final String body;
  @override
  final Attributes extraAttributes;

  Monolog(this.body, this.extraAttributes);

  @override
  Monolog.fromXMLNode(XMLNode node)
      : body = (node.body as XMLValue).body,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode('monolog', extraAttributes, XMLValue(body));
}
