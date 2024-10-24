part of '../../story.dart';

final class BooleanVariable extends Variable {
  final String id;
  final BooleanBody body;
  @override
  final Attributes extraAttributes;

  BooleanVariable(this.id, this.body, this.extraAttributes);

  @override
  BooleanVariable.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        body = node.body != null
            ? BooleanConditional(
                Condition.fromChildrenMap(node.childrenToMap()))
            : BooleanSetValue(bool.parse(node.attributes['set']!)),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'boolean',
      {
        'id': id,
        if (body is BooleanSetValue)
          'set': (body as BooleanSetValue).value.toString(),
        ...extraAttributes
      },
      body is BooleanConditional
          ? (body as BooleanConditional).condition.toChildren()
          : null);
}

sealed class BooleanBody implements XMLDecodable {}

final class BooleanConditional extends BooleanBody {
  Condition condition;

  BooleanConditional(this.condition);
}

final class BooleanSetValue extends BooleanBody {
  bool value;

  BooleanSetValue(this.value);
}
