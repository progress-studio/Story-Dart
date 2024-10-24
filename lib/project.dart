library project;

import 'parser.dart';

part 'project/variable/boolean_variable.dart';

part 'project/variable/character_variable.dart';

part 'project/variable/global_variable.dart';

part 'project/variable/int_variable.dart';

part 'project/variable/string_variable.dart';

part 'project/variable/variable.dart';

part 'project/character.dart';

part 'project/resource.dart';

part 'project/scene.dart';

final class Project implements XMLCodable {
  final String name;
  final List<Resource> stories;
  final List<GlobalVariable> variables;
  final List<Resource> backgrounds;
  final List<Resource> sounds;
  final List<Scene> scenes;
  final List<Character> characters;
  @override
  final Attributes extraAttributes;

  Project(this.name, this.stories, this.variables, this.backgrounds,
      this.sounds, this.scenes, this.characters, this.extraAttributes);

  @override
  Project.fromXMLNode(XMLNode node)
      : name = node.attributes.remove('name')!,
        stories = node
            .childrenToMap()
            .getValue('stories', (it) => Resource.fromXMLNode(it))!,
        variables = node
            .childrenToMap()
            .getValue('variables', (it) => GlobalVariable.fromXMLNode(it))!,
        backgrounds = node
            .childrenToMap()
            .getValue('backgrounds', (it) => Resource.fromXMLNode(it))!,
        sounds = node
            .childrenToMap()
            .getValue('sounds', (it) => Resource.fromXMLNode(it))!,
        scenes = node
            .childrenToMap()
            .getValue('scenes', (it) => Scene.fromXMLNode(it))!,
        characters = node
            .childrenToMap()
            .getValue('characters', (it) => Character.fromXMLNode(it))!,
        extraAttributes = node.attributes;

  @override
  XMLNode toXMLNode() => XMLNode(
      'project',
      {'name': name, ...extraAttributes},
      XMLChildren([
        XMLNode('stories', {},
            XMLChildren(stories.map((it) => it.toXMLNode()).toList())),
        XMLNode('variables', {},
            XMLChildren(variables.map((it) => it.toXMLNode()).toList())),
        XMLNode('backgrounds', {},
            XMLChildren(backgrounds.map((it) => it.toXMLNode()).toList())),
        XMLNode('sounds', {},
            XMLChildren(sounds.map((it) => it.toXMLNode()).toList())),
        XMLNode('scenes', {},
            XMLChildren(scenes.map((it) => it.toXMLNode()).toList())),
        XMLNode('characters', {},
            XMLChildren(characters.map((it) => it.toXMLNode()).toList()))
      ]));
}
