part of '../story.dart';

final class Scene extends Intent {
  final String id;
  final String? base;
  final String? overlay;
  final List<Intent> body;
  @override
  final Attributes extraAttributes;

  Scene(this.id, this.base, this.overlay, this.body, this.extraAttributes);

  @override
  Scene.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        base = node.attributes.remove('base'),
        overlay = node.attributes.remove('overlay'),
        body = (node.body as XMLChildren)
            .body
            .map((it) => Intent.fromXMLNode(it))
            .toList(),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'scene',
      {
        'id': id,
        if (base != null) 'base': base!,
        if (overlay != null) 'overlay': overlay!,
        ...extraAttributes
      },
      XMLChildren(body.map((it) => it.toXMLNode()).toList()));
}
