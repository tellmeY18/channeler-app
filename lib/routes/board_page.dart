import 'package:channeler/backend/backend.dart';
import 'package:channeler/widgets/feed.dart';
import 'package:channeler/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//convert to stateless widget
class BoardPage extends StatelessWidget {
  const BoardPage({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final backend = Provider.of<Backend>(context);
    final title = backend.findBoardByName(name).title;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text('/$name/ - $title'),
      ),
      drawer: SideMenu(currentBoard: name),
      body: Feed(backend: backend, boardName: name),
    );
  }
}

// class BoardPage extends StatefulWidget {
//   const BoardPage({super.key, required this.name});
//   final String name;

//   @override
//   State<BoardPage> createState() => _BoardPageState();
// }

// class _BoardPageState extends State<BoardPage> {
//   @override
//   Widget build(BuildContext context) {
//     final backend = Provider.of<Backend>(context);
//     final title = backend.findBoardByName(widget.name).title;
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Theme.of(context).colorScheme.primary,
//         title: Text('/${widget.name}/ - $title'),
//       ),
//       drawer: SideMenu(currentBoard: widget.name),
//       body: Feed(backend: backend, boardName: widget.name),
//     );
//   }
// }
