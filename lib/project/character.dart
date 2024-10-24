part of '../project.dart';

final class Character implements XMLCodable, Identifiable {
  @override
  final String id;
  final String name;
  final List<Variable> variable;
  final List<Resource> base;
  final List<Resource> overlay;
  @override
  final Attributes extraAttributes;

  Character(this.id, this.name, this.variable, this.base, this.overlay,
      this.extraAttributes);

  @override
  Character.fromXMLNode(XMLNode node)
      : id = node.attributes.remove('id')!,
        name = node.attributes.remove('name')!,
        variable = node
            .childrenToMap()
            .getValue('variable', (it) => Variable.fromXMLNode(it))!,
        base = node
            .childrenToMap()
            .getValue('base', (it) => Resource.fromXMLNode(it))!,
        overlay = node
            .childrenToMap()
            .getValue('overlay', (it) => Resource.fromXMLNode(it))!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'character',
      {'id': id, 'name': name, ...extraAttributes},
      XMLChildren([
        XMLNode('variable', {},
            XMLChildren(variable.map((it) => it.toXMLNode()).toList())),
        XMLNode(
            'base', {}, XMLChildren(base.map((it) => it.toXMLNode()).toList())),
        XMLNode('overlay', {},
            XMLChildren(overlay.map((it) => it.toXMLNode()).toList()))
      ]));
}
