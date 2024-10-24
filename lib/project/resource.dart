part of '../project.dart';

final class Resource implements XMLCodable, Identifiable {
  @override
  final String id;
  final String name;
  final String type;
  final String src;
  @override
  final Attributes extraAttributes;

  Resource(this.id, this.name, this.type, this.src, this.extraAttributes);

  @override
  Resource.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        name = node.attributes.remove('name')!,
        type = node.tag,
        src = node.attributes.remove('src')!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      type, {'id': id, 'name': name, 'src': src, ...extraAttributes}, null);
}
