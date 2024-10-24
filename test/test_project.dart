part of 'test.dart';

void testProject() {
  const String testData = '''<?xml version="1.0" encoding="UTF-8"?>
<project name="Lorem Ipsum Dolor">
    <stories>
        <story id="1" name="story1" src="story1.xml"/>
    </stories>
    <variables>
        <string id="name" name="Name"/>
        <character>
            <boolean id="friend" name="Friend" default="false"/>
        </character>
    </variables>
    <backgrounds>
        <image id="school" name="School" src="school.png" alt="a"/>
    </backgrounds>
    <sounds>
        <audio id="ost" name="OST" src="ost.mp3"/>
    </sounds>
    <scenes>
        <scene id="special_scene" name="Special Scene">
            <base>
                <image id="plain" name="Plain" src="special_scene_1.png"/>
            </base>
            <overlay>
                <image id="idle" name="Idle" src="special_scene_1_idle.png"/>
                <image id="happy" name="Happy" src="special_scene_1_happy.png"/>
            </overlay>
        </scene>
    </scenes>
    <characters>
        <character id="john_doe" name="John Doe">
            <variable>
                <int id="favorable" name="Favorable" default="0"/>
                <boolean id="met" name="Met" default="false"/>
            </variable>
            <base>
                <image id="plain" name="Plain" src="john_doe_base_plain.png"/>
                <image id="uniform" name="Uniform" src="john_doe_base_uniform.png"/>
            </base>
            <overlay>
                <image id="angry" name="Angry" src="john_doe_overlay_angry.png"/>
                <image id="delight" name="Delight" src="john_doe_overlay_delight.png"/>
                <image id="happy" name="Happy" src="john_doe_overlay_happy.png"/>
                <image id="idle" name="Idle" src="john_doe_overlay_idle.png"/>
                <image id="sad" name="Sad" src="john_doe_overlay_sad.png"/>
            </overlay>
        </character>
        <character id="jane_doe" name="Jane Doe">
            <variable>
                <int id="favorable" name="Favorable" default="0"/>
                <boolean id="met" name="Met" default="false"/>
            </variable>
            <base>
                <image id="plain" name="Plain" src="jane_doe_base_plain.png"/>
                <image id="uniform" name="Uniform" src="jane_doe_base_uniform.png"/>
            </base>
            <overlay>
                <image id="angry" name="Angry" src="john_doe_overlay_angry.png"/>
                <image id="delight" name="Delight" src="john_doe_overlay_delight.png"/>
                <image id="happy" name="Happy" src="john_doe_overlay_happy.png"/>
                <image id="idle" name="Idle" src="john_doe_overlay_idle.png"/>
                <image id="sad" name="Sad" src="john_doe_overlay_sad.png"/>
            </overlay>
        </character>
    </characters>
</project>''';
  final Project project = Project.fromXMLNode(XMLNode.fromXMLString(testData));
  expect(project.toXMLNode().toXMLString(), testData);
}
