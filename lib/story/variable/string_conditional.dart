part of '../../story.dart';

final class StringConditional extends StringBody {
  final Set<StringConditionalValue> value;
  final Condition condition;

  StringConditional(this.value, this.condition);

  @override
  StringConditional.fromXMLNode(XMLNode node)
      : value = node.attributes.entries
            .map((entry) {
              switch (entry.key) {
                case 'equals':
                  return StringEquals(entry.value);
                case 'startswith':
                  return StringStartsWith(entry.value);
                case 'endswith':
                  return StringEndsWith(entry.value);
                default:
                  return null;
              }
            })
            .whereType<StringConditionalValue>()
            .toSet(),
        condition = Condition.fromChildrenMap(node.childrenToMap());
}

sealed class StringConditionalValue {}

final class StringEquals extends StringConditionalValue {
  final String operand;

  StringEquals(this.operand);
}

final class StringStartsWith extends StringConditionalValue {
  final String operand;

  StringStartsWith(this.operand);
}

final class StringEndsWith extends StringConditionalValue {
  final String operand;

  StringEndsWith(this.operand);
}
