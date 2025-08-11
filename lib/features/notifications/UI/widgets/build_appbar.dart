// notifications_app_bar.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/notifications_cubit.dart';
import '../../logic/cubit/notifications_state.dart';

class NotificationsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onClearAll;

  const NotificationsAppBar({
    super.key,
    this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
        onPressed: () {
          try {
            // Safe navigation back
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          } catch (e) {
            if (kDebugMode) {
              print('❌ Error in back navigation: $e');
            }
            // Fallback: try to navigate to a safe route
            Navigator.of(context).pushReplacementNamed('/');
          }
        },
      ),
      title: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          try {
            final cubit = context.read<NotificationsCubit>();
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (cubit.unreadCount > 0) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${cubit.unreadCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            );
          } catch (e) {
            if (kDebugMode) {
              print('❌ Error in app bar title: $e');
            }
            return const Text(
              'Notifications',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            );
          }
        },
      ),
      centerTitle: true,
      actions: [
        BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            try {
              final cubit = context.read<NotificationsCubit>();
              
              return PopupMenuButton<String>(
                icon: Icon(
                  cubit.hasNotifications ? Icons.more_vert : Icons.notifications_off,
                  color: Colors.grey[600],
                ),
                onSelected: (value) {
                  try {
                    switch (value) {
                      case 'mark_all_read':
                        cubit.markAllAsRead();
                        break;
                      case 'clear_all':
                        _showClearAllDialog(context);
                        break;
                      case 'refresh':
                        cubit.refreshNotifications();
                        break;
                      case 'add_test':
                        cubit.addTestNotification();
                        break;
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print('❌ Error in menu action: $e');
                    }
                  }
                },
                itemBuilder: (context) {
                  List<PopupMenuEntry<String>> items = [];
                  
                  if (cubit.hasNotifications) {
                    items.addAll([
                      const PopupMenuItem(
                        value: 'mark_all_read',
                        child: Row(
                          children: [
                            Icon(Icons.mark_email_read, size: 20),
                            SizedBox(width: 12),
                            Text('Mark all as read'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'clear_all',
                        child: Row(
                          children: [
                            Icon(Icons.clear_all, size: 20, color: Colors.red),
                            SizedBox(width: 12),
                            Text('Clear all', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      const PopupMenuDivider(),
                    ]);
                  }
                  
                  items.addAll([
                    const PopupMenuItem(
                      value: 'refresh',
                      child: Row(
                        children: [
                          Icon(Icons.refresh, size: 20),
                          SizedBox(width: 12),
                          Text('Refresh'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'add_test',
                      child: Row(
                        children: [
                          Icon(Icons.add_alert, size: 20, color: Colors.blue),
                          SizedBox(width: 12),
                          Text('Add test notification', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ),
                  ]);
                  
                  return items;
                },
              );
            } catch (e) {
              if (kDebugMode) {
                print('❌ Error in popup menu: $e');
              }
              return IconButton(
                icon: Icon(Icons.refresh, color: Colors.grey[600]),
                onPressed: () {
                  try {
                    context.read<NotificationsCubit>().refreshNotifications();
                  } catch (e) {
                    if (kDebugMode) {
                      print('❌ Error in refresh action: $e');
                    }
                  }
                },
              );
            }
          },
        ),
      ],
    );
  }

  void _showClearAllDialog(BuildContext context) {
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Clear All Notifications'),
          content: const Text(
            'Are you sure you want to clear all notifications? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                try {
                  Navigator.pop(context);
                  context.read<NotificationsCubit>().clearAllNotifications();
                  // Call the callback if provided
                  onClearAll?.call();
                } catch (e) {
                  if (kDebugMode) {
                    print('❌ Error clearing notifications: $e');
                  }
                }
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Clear All'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error showing clear all dialog: $e');
      }
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}