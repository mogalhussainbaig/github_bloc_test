import 'package:flutter/material.dart';
import 'package:github_bloc_task/model/item_element/item_element.dart';

import '../../utils/reuseable_widggets/display_image_widget.dart';

class RepositoryItemWidget extends StatelessWidget {
  final ItemElement item;

  const RepositoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 100,
          child: FittedBox(
              fit: BoxFit.contain,
              child: DisplayImageWidget(
                image: item.owner!.avatarUrl!,
              )),
        ),
        title: Text(item.name ?? ''),
        subtitle: Text(item.fullName ?? ''),
        trailing: Text('${item.stargazersCount} ★'),
        onTap: () => _showRepositoryDetails(context, item),
      ),
    );
  }

  void _showRepositoryDetails(BuildContext context, ItemElement item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item.name ?? ''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Full Name: ${item.fullName}'),
              item.owner != null
                  ? Text('Owner: ${item.owner!.login}')
                  : const SizedBox(),
              Text('Stars: ${item.stargazersCount}'),
              Text('Created At: ${item.createdAt?.toLocal()}'),
              const SizedBox(height: 10),
              (item.owner != null && item.owner!.avatarUrl != null)
                  ? Flexible(
                      child: DisplayImageWidget(
                        image: item.owner!.avatarUrl!,
                      ),
                    )
                  : const SizedBox(),
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
