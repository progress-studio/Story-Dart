part of '../../story.dart';

final class StringVariable extends Variable {
  final String id;
  final StringBody body;
  @override
  final Attributes extraAttributes;

  StringVariable(this.id, this.body, this.extraAttributes);

  @override
  StringVariable.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        body = node.body != null
            ? StringConditional.fromXMLNode(node)
            : StringSetValue(node.attributes['set']!),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'string',
      {
        'id': id,
        ...switch (body) {
          StringConditional it => it.value.map((it) {
              return switch (it) {
                StringEquals it => {'equals': it.operand},
                StringStartsWith it => {'startswith': it.operand},
                StringEndsWith it => {'endswith': it.operand},
              };
            }).reduce((value, element) => {...value, ...element}),
          StringSetValue it => {'set': it.value}
        },
        ...extraAttributes
      },
      body is StringConditional
          ? (body as StringConditional).condition.toChildren()
          : null);
}

sealed class StringBody implements XMLDecodable {}

final class StringSetValue extends StringBody {
  final String value;

  StringSetValue(this.value);
}
