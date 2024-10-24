part of '../../project.dart';

final class BooleanVariable extends Variable {
  @override
  final String id;
  final String name;
  final bool? defaultValue;
  @override
  final Attributes extraAttributes;

  BooleanVariable(this.id, this.name, this.defaultValue, this.extraAttributes);

  @override
  BooleanVariable.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        name = node.attributes.remove('name')!,
        defaultValue = node.attributes['default'] != null
            ? bool.parse(node.attributes.remove('default')!)
            : null,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'boolean',
      {
        'id': id,
        'name': name,
        if (defaultValue != null) 'default': defaultValue!.toString(),
        ...extraAttributes
      },
      null);
}
