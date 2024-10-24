part of '../parser.dart';

abstract interface class XMLEncodable {
  Attributes get extraAttributes;

  XMLNode toXMLNode();
}

abstract interface class XMLDecodable {
  factory XMLDecodable.fromXMLNode(XMLNode node) {
    throw UnimplementedError('This method must be implemented by subclasses');
  }
}

abstract interface class XMLCodable implements XMLDecodable, XMLEncodable {}
