part of '../parser.dart';

final class Pair<A, B> {
  final A first;
  final B second;

  Pair(this.first, this.second);
}

final class XMLNode {
  final String tag;
  final Attributes attributes;
  final XMLBody? body;

  XMLNode(this.tag, this.attributes, this.body);

  Map<String, List<XMLBody>> childrenToMap() {
    if (body is XMLChildren) {
      XMLChildren childrenBody = body as XMLChildren;
      Map<String, List<XMLBody>> result = {};

      for (var child in childrenBody.body) {
        if (child.body != null) {
          result.putIfAbsent(child.tag, () => []).add(child.body!);
        }
      }

      return result;
    } else {
      return {};
    }
  }

  factory XMLNode.fromXMLString(String xml) {
    Map<String, String> parseAttributes(String attributeString) {
      final attributePattern = RegExp(r'(\w+)="([^"]*)"');
      return Map.fromEntries(
        attributePattern
            .allMatches(attributeString)
            .map((match) => MapEntry(match.group(1)!, match.group(2)!)),
      );
    }

    Pair<XMLNode, int> parseElement(String xml, int startIndex) {
      final openTagRegex = RegExp(r'<(\w+)([^>]*)>');
      final closeTagRegex = RegExp(r'</(\w+)>');
      final selfClosingTagRegex = RegExp(r'<(\w+)([^>]*)/>');

      final openTagMatch = openTagRegex.firstMatch(xml.substring(startIndex));
      final selfClosingTagMatch =
          selfClosingTagRegex.firstMatch(xml.substring(startIndex));

      if (openTagMatch != null &&
          (selfClosingTagMatch == null ||
              openTagMatch.start + startIndex <
                  selfClosingTagMatch.start + startIndex)) {
        String tag = openTagMatch.group(1)!;
        String attrString = openTagMatch.group(2)!;
        Map<String, String> attributes = parseAttributes(attrString);
        List<XMLNode> children = [];
        int index = openTagMatch.end + startIndex;

        while (true) {
          final nextOpenTagMatch =
              openTagRegex.firstMatch(xml.substring(index));
          final nextCloseTagMatch =
              closeTagRegex.firstMatch(xml.substring(index));

          if (nextCloseTagMatch != null &&
              (nextOpenTagMatch == null ||
                  nextCloseTagMatch.start + index <
                      nextOpenTagMatch.start + index)) {
            String closeTag = nextCloseTagMatch.group(1)!;
            if (closeTag == tag) {
              String innerXml = xml
                  .substring(openTagMatch.end + startIndex,
                      nextCloseTagMatch.start + index)
                  .trim();
              XMLBody body = children.isNotEmpty
                  ? XMLChildren(children)
                  : XMLValue(innerXml);
              return Pair(XMLNode(tag, attributes, body),
                  nextCloseTagMatch.end + index);
            } else {
              throw ArgumentError(
                  'Mismatched close tag: expected </$tag> but found </$closeTag>');
            }
          }

          if (nextOpenTagMatch != null &&
              (nextCloseTagMatch == null ||
                  nextOpenTagMatch.start + index <
                      nextCloseTagMatch.start + index)) {
            var parsedElement = parseElement(xml, index);
            children.add(parsedElement.first);
            index = parsedElement.second;
          } else {
            break;
          }
        }

        throw ArgumentError('Missing close tag for <$tag>');
      } else if (selfClosingTagMatch != null) {
        String tag = selfClosingTagMatch.group(1)!;
        String attrString = selfClosingTagMatch.group(2)!;
        Map<String, String> attributes = parseAttributes(attrString);
        return Pair(XMLNode(tag, attributes, null),
            selfClosingTagMatch.end + startIndex);
      } else {
        throw ArgumentError('Invalid XML format');
      }
    }

    var result = parseElement(xml.trim(), 0);
    return result.first;
  }

  String toXMLString([int indentLevel = 0]) {
    final indent = '    ' * indentLevel;
    final attributesString =
        attributes.entries.map((e) => '${e.key}="${e.value}"').join(' ');
    final xmlHeader =
        indentLevel == 0 ? '<?xml version="1.0" encoding="UTF-8"?>\n' : '';
    final attributesPart =
        attributesString.isNotEmpty ? ' $attributesString' : '';

    if (body == null) {
      return '$xmlHeader$indent<$tag$attributesPart/>';
    } else if (body is XMLValue) {
      return '$xmlHeader$indent<$tag$attributesPart>${(body as XMLValue).body}</$tag>';
    } else if (body is XMLChildren) {
      final children = (body as XMLChildren)
          .body
          .map((child) => child.toXMLString(indentLevel + 1))
          .join('\n');
      return '''$xmlHeader$indent<$tag$attributesPart>
$children
$indent</$tag>''';
    }

    return '';
  }
}
