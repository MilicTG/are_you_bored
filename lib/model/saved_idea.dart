class SavedIdea {
  final int id;
  final String ideaName;

  SavedIdea({required this.id, required this.ideaName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ideaName': ideaName,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, ideaName: $ideaName}';
  }
}
