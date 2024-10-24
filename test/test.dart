import 'package:test/test.dart';

import 'package:story_dart/parser.dart';
import 'package:story_dart/project.dart';
import 'package:story_dart/story.dart';

part 'test_project.dart';
part 'test_story.dart';

void main() {
  test('Test Project format', () {
    testProject();
  });
  test('Test Story format', () {
    testStory();
  });
}
