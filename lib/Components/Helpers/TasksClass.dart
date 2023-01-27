class Tasks {
  final String Task;
  bool state;
  String Tags;
  String description;
  Tasks(
      {required this.Task,
      required this.state,
      required this.Tags,
      required this.description});
  void stateChanger() {
    state = !state;
  }
}
