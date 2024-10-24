part of '../../project.dart';

final class CharacterVariable extends GlobalVariable {
  final List<Variable> variables;
  @override
  final Attributes extraAttributes;

  CharacterVariable(this.variables, this.extraAttributes);

  @override
  CharacterVariable.fromXMLNode(XMLNode node)
      : variables = (node.body as XMLChildren)
            .body
            .map((it) => Variable.fromXMLNode(it))
            .toList(),
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode('character', extraAttributes,
      XMLChildren(variables.map((it) => it.toXMLNode()).toList()));
}
