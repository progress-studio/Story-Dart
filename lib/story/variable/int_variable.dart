part of '../../story.dart';

final class IntVariable extends Variable {
  final String id;
  final IntBody body;
  @override
  final Attributes extraAttributes;

  IntVariable(this.id, this.body, this.extraAttributes);

  @override
  IntVariable.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        body = node.body != null
            ? IntConditional.fromXMLNode(node)
            : IntExpression.fromXMLNode(node),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'int',
      {
        'id': id,
        ...switch (body) {
          IntConditional it => it.value.map((it) {
              return switch (it) {
                IntEquals it => {'equals': it.operand.toString()},
                IntMoreThan it => {'morethan': it.operand.toString()},
                IntLessThan it => {'lessthan': it.operand.toString()},
              };
            }).reduce((value, element) => {...value, ...element}),
          IntExpression it => switch (it.value) {
              SetIntValue it => {'set': it.operand.toString()},
              IncreaseIntValue it => {'increase': it.operand.toString()},
              DecreaseIntValue it => {'decrease': it.operand.toString()},
            }
        },
        ...extraAttributes
      },
      body is IntConditional
          ? (body as IntConditional).condition.toChildren()
          : null);
}

sealed class IntBody implements XMLDecodable {}
