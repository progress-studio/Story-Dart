part of '../../story.dart';

final class IntConditional extends IntBody {
  final Set<IntConditionalValue> value;
  final Condition condition;

  IntConditional(this.value, this.condition);

  @override
  IntConditional.fromXMLNode(XMLNode node)
      : value = node.attributes.entries
            .map((entry) {
              switch (entry.key) {
                case 'equals':
                  return IntEquals(int.parse(entry.value));
                case 'morethan':
                  return IntMoreThan(int.parse(entry.value));
                case 'lessthan':
                  return IntLessThan(int.parse(entry.value));
                default:
                  return null;
              }
            })
            .whereType<IntConditionalValue>()
            .toSet(),
        condition = Condition.fromChildrenMap(node.childrenToMap());
}

sealed class IntConditionalValue {}

final class IntEquals extends IntConditionalValue {
  final int operand;

  IntEquals(this.operand);
}

final class IntMoreThan extends IntConditionalValue {
  final int operand;

  IntMoreThan(this.operand);
}

final class IntLessThan extends IntConditionalValue {
  final int operand;

  IntLessThan(this.operand);
}
