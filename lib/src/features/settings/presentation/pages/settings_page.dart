import 'package:flutter/material.dart';

import '../../../../core/dependency_injection.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/utils/context_extensions.dart';
import '../widgets/update_salary_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = findInstance<AuthService>().currentUser!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: context.systemPadding.top),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      if (currentUser.photoURL != null)
                        ClipOval(
                          child: Image.network(
                            currentUser.photoURL!,
                            height: 60,
                            width: 60,
                          ),
                        ),
                      Expanded(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(currentUser.displayName ?? 'N.A.'),
                          subtitle: Text(currentUser.email ?? 'N.A.'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                UpdateSalaryWidget(userId: currentUser.uid),
                const SizedBox(height: 36),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
