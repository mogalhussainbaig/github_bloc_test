import 'package:flutter/material.dart';
import '../../models/item.dart';

class RepositoryItemWidget extends StatelessWidget {
  final ItemElement item;

  const RepositoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name!),
      subtitle: Text(item.fullName!),
      trailing: Text('${item.stargazersCount} ★'),
      onTap: () => _showRepositoryDetails(context, item),
    );
  }

  void _showRepositoryDetails(BuildContext context, ItemElement item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item.name!),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Full Name: ${item.fullName}'),
              Text('Owner: ${item.owner!.login}'),
              Text('Stars: ${item.stargazersCount}'),
              Text('Created At: ${item.createdAt?.toLocal()}'),
              const SizedBox(height: 10),
              Image.network(
                item.owner!.avatarUrl!.toString(),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Center(child: Icon(Icons.error));
                },
              ),
              // Image.network(item.owner!.avatarUrl!.toString(),loadingBuilder: (context,),),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
