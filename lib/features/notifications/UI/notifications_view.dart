import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_booking_online_doctor/features/notifications/UI/widgets/build_appbar.dart';
import 'package:mobile_booking_online_doctor/features/notifications/UI/widgets/empty_notifications_view.dart';
import 'package:mobile_booking_online_doctor/features/notifications/UI/widgets/notifications_error_view.dart';
import 'package:mobile_booking_online_doctor/features/notifications/UI/widgets/notifications_view_body.dart';

import '../logic/cubit/notifications_cubit.dart';
import '../logic/cubit/notifications_state.dart';

class NotificationsView extends StatefulWidget {
  static const String routeName = '/notifications';

  const NotificationsView({super.key});

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('🔄 NotificationsView initState called');
    }
    
    // Load notifications when the page opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        if (kDebugMode) {
          print('🔄 Loading notifications in postFrameCallback');
        }
        
        final cubit = context.read<NotificationsCubit>();
        if (kDebugMode) {
          print('📊 Current state: ${cubit.state}');
          print('📊 Has notifications: ${cubit.hasNotifications}');
          print('📊 Notification count: ${cubit.notifications.length}');
        }
        
        cubit.loadNotifications();
      } catch (e) {
        if (kDebugMode) {
          print('❌ Error loading notifications in initState: $e');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('🏗️ Building NotificationsView');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const NotificationsAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          try {
            if (kDebugMode) {
              print('🔄 Pull to refresh triggered');
            }
            await context.read<NotificationsCubit>().refreshNotifications();
          } catch (e) {
            if (kDebugMode) {
              print('❌ Error refreshing notifications: $e');
            }
          }
        },
        child: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: (context, state) {
            try {
              if (kDebugMode) {
                print('👂 BlocListener: $state');
              }

              if (state is NotificationsError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                    action: SnackBarAction(
                      label: 'Retry',
                      textColor: Colors.white,
                      onPressed: () {
                        context.read<NotificationsCubit>().loadNotifications();
                      },
                    ),
                  ),
                );
              } else if (state is NotificationActionSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            } catch (e) {
              if (kDebugMode) {
                print('❌ Error in BlocListener: $e');
              }
            }
          },
          builder: (context, state) {
            try {
              if (kDebugMode) {
                print('🏗️ BlocBuilder: $state');
              }

              if (state is NotificationsLoading) {
                if (kDebugMode) {
                  print('⏳ Showing loading state');
                }
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Loading notifications...'),
                    ],
                  ),
                );
              } else if (state is NotificationsLoaded) {
                if (kDebugMode) {
                  print('✅ Notifications loaded: ${state.notifications.length} items');
                  for (final notification in state.notifications) {
                    print('   - ${notification.title} (${notification.type}) - Read: ${notification.isRead}');
                  }
                }
                
                if (state.notifications.isEmpty) {
                  if (kDebugMode) {
                    print('📭 No notifications to show');
                  }
                  return const EmptyNotificationsView();
                }
                
                return NotificationsList(notifications: state.notifications);
              } else if (state is NotificationsError) {
                if (kDebugMode) {
                  print('❌ Error state: ${state.message}');
                }
                return NotificationsErrorView(
                  message: state.message,
                  onRetry: () {
                    context.read<NotificationsCubit>().loadNotifications();
                  },
                );
              }
              
              // Initial state - show empty view with debug info
              if (kDebugMode) {
                print('🏁 Initial state - showing empty view');
              }
              return Column(
                children: [
                  if (kDebugMode) ...[
                    Container(
                      color: Colors.yellow.withOpacity(0.3),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'DEBUG: Initial state - ${state.runtimeType}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                  const Expanded(child: EmptyNotificationsView()),
                ],
              );
            } catch (e) {
              if (kDebugMode) {
                print('❌ Error in BlocBuilder: $e');
              }
              return const NotificationsErrorView(
                message: 'An unexpected error occurred',
              );
            }
          },
        ),
      ),
    );
  }
}