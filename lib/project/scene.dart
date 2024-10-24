part of '../project.dart';

final class Scene implements XMLCodable, Identifiable {
  @override
  final String id;
  final String name;
  final List<Resource> base;
  final List<Resource> overlay;
  @override
  final Attributes extraAttributes;

  Scene(this.id, this.name, this.base, this.overlay, this.extraAttributes);

  @override
  Scene.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        name = node.attributes.remove('name')!,
        base = node
            .childrenToMap()
            .getValue('base', (it) => Resource.fromXMLNode(it))!,
        overlay = node
            .childrenToMap()
            .getValue('overlay', (it) => Resource.fromXMLNode(it))!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'scene',
      {'id': id, 'name': name, ...extraAttributes},
      XMLChildren([
        XMLNode(
            'base', {}, XMLChildren(base.map((it) => it.toXMLNode()).toList())),
        XMLNode('overlay', {},
            XMLChildren(overlay.map((it) => it.toXMLNode()).toList()))
      ]));
}
