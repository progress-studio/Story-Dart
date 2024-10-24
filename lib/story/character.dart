part of '../story.dart';

final class Character extends Intent {
  final String id;
  final bool? show;
  final String? base;
  final String? overlay;
  final List<Intent>? body;
  @override
  final Attributes extraAttributes;

  Character(this.id, this.show, this.base, this.overlay, this.body,
      this.extraAttributes);

  @override
  Character.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        show = node.attributes['show'] != null
            ? bool.parse(node.attributes.remove('show')!)
            : null,
        base = node.attributes.remove('base'),
        overlay = node.attributes.remove('overlay'),
        body = node.body != null
            ? (node.body as XMLChildren)
                .body
                .map((it) => Intent.fromXMLNode(it))
                .toList()
            : null,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'character',
      {
        'id': id,
        if (show != null) 'show': show.toString(),
        if (base != null) 'base': base!,
        if (overlay != null) 'overlay': overlay!,
        ...extraAttributes
      },
      body != null
          ? XMLChildren(body!.map((it) => it.toXMLNode()).toList())
          : null);
}
