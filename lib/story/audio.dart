part of '../story.dart';

final class Audio extends Intent {
  final String id;
  final List<Intent>? body;
  @override
  final Attributes extraAttributes;

  Audio(this.id, this.body, this.extraAttributes);

  @override
  Audio.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        body = node.body != null
            ? (node.body as XMLChildren)
                .body
                .map((it) => Intent.fromXMLNode(it))
                .toList()
            : null,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'audio',
      {'id': id, ...extraAttributes},
      body != null
          ? XMLChildren(body!.map((it) => it.toXMLNode()).toList())
          : null);
}
