part of '../../project.dart';

final class StringVariable extends Variable {
  @override
  final String id;
  final String name;
  final String? defaultValue;
  @override
  final Attributes extraAttributes;

  StringVariable(this.id, this.name, this.defaultValue, this.extraAttributes);

  @override
  StringVariable.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        name = node.attributes.remove('name')!,
        defaultValue = node.attributes.remove('default'),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'string',
      {
        'id': id,
        'name': name,
        if (defaultValue != null) 'default': defaultValue!,
        ...extraAttributes
      },
      null);
}
