library story;

import 'parser.dart';

part 'story/variable/boolean_variable.dart';

part 'story/variable/int_conditional.dart';

part 'story/variable/int_expression.dart';

part 'story/variable/int_variable.dart';

part 'story/variable/string_conditional.dart';

part 'story/variable/string_variable.dart';

part 'story/variable/variable.dart';

part 'story/audio.dart';

part 'story/background.dart';

part 'story/base.dart';

part 'story/character.dart';

part 'story/choice.dart';

part 'story/condition.dart';

part 'story/delay.dart';

part 'story/dialog.dart';

part 'story/dialog_body.dart';

part 'story/execute.dart';

part 'story/intent.dart';

part 'story/monolog.dart';

part 'story/overlay.dart';

part 'story/scene.dart';

final class Story extends Intent {
  final List<Intent> body;
  @override
  final Attributes extraAttributes;

  Story(this.body, this.extraAttributes);

  @override
  Story.fromXMLNode(XMLNode node)
      : body = (node.body as XMLChildren)
            .body
            .map((it) => Intent.fromXMLNode(it))
            .toList(),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode('story', extraAttributes,
      XMLChildren(body.map((it) => it.toXMLNode()).toList()));
}
