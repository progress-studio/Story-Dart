part of '../../story.dart';

final class IntExpression extends IntBody {
  final IntExpressionValue value;

  IntExpression(this.value);

  @override
  IntExpression.fromXMLNode(XMLNode node)
      : value = node.attributes.entries
            .map((entry) {
              switch (entry.key) {
                case 'set':
                  return SetIntValue(int.parse(entry.value));
                case 'increase':
                  return IncreaseIntValue(int.parse(entry.value));
                case 'decrease':
                  return DecreaseIntValue(int.parse(entry.value));
                default:
                  return null;
              }
            })
            .whereType<IntExpressionValue>()
            .first;
}

sealed class IntExpressionValue {}

final class SetIntValue extends IntExpressionValue {
  final int operand;

  SetIntValue(this.operand);
}

final class IncreaseIntValue extends IntExpressionValue {
  final int operand;

  IncreaseIntValue(this.operand);
}

final class DecreaseIntValue extends IntExpressionValue {
  final int operand;

  DecreaseIntValue(this.operand);
}
