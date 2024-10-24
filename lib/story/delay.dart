part of '../story.dart';

final class Delay extends Intent {
  final int duration;
  @override
  final Attributes extraAttributes;

  Delay(this.duration, this.extraAttributes);

  @override
  Delay.fromXMLNode(XMLNode node)
      : duration = int.parse(node.attributes.remove('duration')!),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'delay', {'duration': duration.toString(), ...extraAttributes}, null);
}
