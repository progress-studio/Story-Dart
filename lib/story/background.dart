part of '../story.dart';

final class Background extends Intent {
  final String id;
  final List<Intent> body;
  @override
  final Attributes extraAttributes;

  Background(this.id, this.body, this.extraAttributes);

  @override
  Background.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        body = (node.body as XMLChildren)
            .body
            .map((it) => Intent.fromXMLNode(it))
            .toList(),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode('background', {'id': id, ...extraAttributes},
      XMLChildren(body.map((it) => it.toXMLNode()).toList()));
}
