part of '../story.dart';

sealed class Intent implements XMLCodable {
  Intent();

  @override
  factory Intent.fromXMLNode(XMLNode node) {
    switch (node.tag) {
      case 'audio':
        return Audio.fromXMLNode(node);
      case 'background':
        return Background.fromXMLNode(node);
      case 'base':
        return Base.fromXMLNode(node);
      case 'character':
        return Character.fromXMLNode(node);
      case 'delay':
        return Delay.fromXMLNode(node);
      case 'dialog':
        return Dialog.fromXMLNode(node);
      case 'execute':
        return Execute.fromXMLNode(node);
      case 'monolog':
        return Monolog.fromXMLNode(node);
      case 'overlay':
        return Overlay.fromXMLNode(node);
      case 'scene':
        return Scene.fromXMLNode(node);
      case 'int' || 'boolean' || 'string':
        return Variable.fromXMLNode(node);
      default:
        throw StateError('Unknown tag: ${node.tag}');
    }
  }
}
