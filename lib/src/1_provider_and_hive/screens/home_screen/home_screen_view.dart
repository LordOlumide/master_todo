part of './home_screen.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeTopSection(),
        Expanded(
          child: context.select<TodoManager, int>(
                      (todoManager) => todoManager.totalCount) !=
                  0
              ? ListView.builder(
                  itemCount: context.read<TodoManager>().totalCount,
                  itemBuilder: (context, index) {
                    final TodoManager todoManager =
                        context.watch<TodoManager>();
                    final todo = todoManager.state[index];

                    return TodoCard(
                      todo: todo,
                      onCheckBoxChanged: (bool? newValue) {
                        if (newValue == null) {
                          return;
                        }
                        // Type promotion happens here
                        context.read<TodoManager>().changeReadStatus(
                              todoId: todo.id,
                              newValue: newValue,
                            );
                      },
                      onDeletePressed: () async {
                        final bool? shouldDelete = await showDialog(
                          context: context,
                          builder: (context) =>
                              DeleteDialog(todoName: todo.name),
                        );
                        if (shouldDelete == true && context.mounted) {
                          context.read<TodoManager>().deleteTodo(todo.id);
                        }
                      },
                    );
                  },
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'No Todos yet',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
        ),
      ],
    );
  }
}
