part of '../parser.dart';

sealed class XMLBody {}

final class XMLValue extends XMLBody {
  final String body;

  XMLValue(this.body);
}

final class XMLChildren extends XMLBody {
  final List<XMLNode> body;

  XMLChildren(this.body);
}

extension MapExtensions on Map<String, List<XMLBody>> {
  List<R>? getValue<R>(String key, R Function(XMLNode) action) => this[key]
      ?.expand((item) => (item as XMLChildren).body)
      .map(action)
      .toList();
}
