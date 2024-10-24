part of '../story.dart';

final class Choice implements XMLCodable {
  final String text;
  final List<Intent> body;
  @override
  final Attributes extraAttributes;

  @override
  Choice.fromXMLNode(XMLNode node)
      : text = node.attributes.remove('body')!,
        body = (node.body as XMLChildren)
            .body
            .map((it) => Intent.fromXMLNode(it))
            .toList(),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode('choice', {'body': text, ...extraAttributes},
      XMLChildren(body.map((it) => it.toXMLNode()).toList()));
}
