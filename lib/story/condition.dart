part of '../story.dart';

final class Condition {
  final List<Intent>? ifTrue;
  final List<Intent>? ifFalse;

  Condition.fromChildrenMap(Map<String, List<XMLBody>> map)
      : ifTrue = map.getValue('true', (it) => Intent.fromXMLNode(it)),
        ifFalse = map.getValue('false', (it) => Intent.fromXMLNode(it));

  XMLChildren toChildren() => XMLChildren([
        if (ifTrue != null)
          XMLNode(
            'true',
            Attributes(),
            XMLChildren(ifTrue!.map((it) => it.toXMLNode()).toList()),
          ),
        if (ifFalse != null)
          XMLNode(
            'false',
            Attributes(),
            XMLChildren(ifFalse!.map((it) => it.toXMLNode()).toList()),
          ),
      ]);
}
