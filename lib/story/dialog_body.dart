part of '../story.dart';

sealed class DialogBody {}

final class DialogText extends DialogBody {
  final String body;

  DialogText(this.body);
}

final class DialogChoices extends DialogBody {
  final List<Choice> body;

  DialogChoices(this.body);
}
