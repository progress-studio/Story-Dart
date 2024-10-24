part of '../../project.dart';

final class IntVariable extends Variable {
  @override
  final String id;
  final String name;
  final int? defaultValue;
  @override
  final Attributes extraAttributes;

  IntVariable(this.id, this.name, this.defaultValue, this.extraAttributes);

  @override
  IntVariable.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        name = node.attributes.remove('name')!,
        defaultValue = node.attributes['default'] != null
            ? int.parse(node.attributes.remove('default')!)
            : null,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'int',
      {
        'id': id,
        'name': name,
        if (defaultValue != null) 'default': defaultValue!.toString(),
        ...extraAttributes
      },
      null);
}
