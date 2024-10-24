part of '../story.dart';

final class Dialog extends Intent {
  final String? name;
  final DialogBody body;
  @override
  final Attributes extraAttributes;

  Dialog(this.name, this.body, this.extraAttributes);

  @override
  Dialog.fromXMLNode(XMLNode node)
      : name = node.attributes.remove('name'),
        body = switch (node.body!) {
          XMLValue it => DialogText(it.body),
          XMLChildren it =>
            DialogChoices(it.body.map((it) => Choice.fromXMLNode(it)).toList())
        },
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'dialog',
      {if (name != null) 'name': name!, ...extraAttributes},
      switch (body) {
        DialogText() => XMLValue((body as DialogText).body),
        DialogChoices() => XMLChildren(
            (body as DialogChoices).body.map((it) => it.toXMLNode()).toList())
      });
}
