import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../presentation/custom_widgets/c_chip.dart';
import '../../model/bucket.dart';
import '../../../../core/constants/paddings.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../presentation/custom_widgets/sliver_app_bar.dart';

class AddEditBucketScreen extends StatefulWidget {
  final Bucket? bucket;
  const AddEditBucketScreen({Key? key, required this.bucket}) : super(key: key);

  @override
  State<AddEditBucketScreen> createState() => _AddEditBucketScreenState();
}

class _AddEditBucketScreenState extends State<AddEditBucketScreen> {
  final List<BucketTag> tags = [];

  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.bucket != null) {
      tags.addAll(widget.bucket!.tags);
      titleController.text = widget.bucket!.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CSliverAppBar(
            title: widget.bucket != null ? 'Edit bucket' : 'New bucket',
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  padding8,
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      label: Text('Name'),
                      hintText: 'Personal Expenses/Bills/Savings',
                    ),
                  ),
                  padding12,
                  Row(
                    children: [
                      Text('Tags', style: textTheme.headline5),
                      IconButton(
                        icon: const Icon(FluentIcons.add_20_regular),
                        onPressed: _onChipAdd,
                      ),
                    ],
                  ),
                  Wrap(
                    children: tags
                        .map(
                          (item) => CChip(
                            title: item.title,
                            deleteIcon:
                                const Icon(FluentIcons.delete_20_regular),
                            deleteCallback: () =>
                                setState(() => tags.remove(item)),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onChipAdd() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        contentPadding: const EdgeInsets.all(16),
        title: const Text("New tag"),
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Food/Fuel/Mobile bill',
            ),
            onSubmitted: (value) {
              if (value.length > 3) {
                Navigator.pop(context);
                setState(() => tags.add(BucketTag(title: value)));
              }
            },
          ),
        ],
      ),
    );
  }
}
