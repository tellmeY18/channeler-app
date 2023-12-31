import 'dart:convert';

class Board {
  final String name;
  final String title;
  final int pages;
  final int threadsPerPage;

  const Board(
      {required this.name,
      required this.title,
      required this.pages,
      required this.threadsPerPage});

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
        name: json['board'] as String,
        title: json['title'] as String,
        pages: json['pages'] as int,
        threadsPerPage: json['per_page'] as int);
  }
}

List<Board> parseBoards(String responseBody) {
  final des = jsonDecode(responseBody) as Map<String, dynamic>;
  final boards = des['boards'] as List<dynamic>;
  return boards
      .map((json) => Board.fromJson(json as Map<String, dynamic>))
      .toList();
}
