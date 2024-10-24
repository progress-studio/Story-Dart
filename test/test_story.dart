part of 'test.dart';

void testStory() {
  const String testData = '''<?xml version="1.0" encoding="UTF-8"?>
<story>
    <background id="school">
        <audio id="ost">
            <monolog>Hi</monolog>
            <dialog name="name">Hi</dialog>
            <character id="john_doe" show="true">
                <overlay id="hi"/>
                <dialog>
                    <choice body="Hi">
                        <dialog>So?</dialog>
                        <int id="favorable" set="1"/>
                        <boolean id="met" set="true"/>
                        <int id="favorable" increase="1"/>
                        <int id="favorable" decrease="1"/>
                    </choice>
                </dialog>
                <int id="favorable" morethan="3">
                    <true>
                        <dialog>Dialog1</dialog>
                    </true>
                </int>
                <boolean id="met">
                    <true>
                        <dialog>Dialog2</dialog>
                    </true>
                    <false>
                        <dialog>Dialog3</dialog>
                    </false>
                </boolean>
            </character>
            <character id="john_doe" show="false"/>
            <dialog>Dialog</dialog>
        </audio>
    </background>
    <scene id="special_scene">
        <character id="john_doe">
            <overlay id="hi"/>
            <dialog>Dialog4</dialog>
        </character>
    </scene>
</story>''';
  final Story story = Story.fromXMLNode(XMLNode.fromXMLString(testData));
  expect(story.toXMLNode().toXMLString(), testData);
}
