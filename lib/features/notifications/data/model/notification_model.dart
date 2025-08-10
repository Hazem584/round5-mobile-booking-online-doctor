// notification_model.dart - Updated to ensure correct read status
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_booking_with_doctor/core/helpers/assets.dart';

class NotificationModel {
  final int id;
  final String title;
  final String message;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final String? imageUrl;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.imageUrl,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      type: json['type'] ?? 'general',
      isRead: json['is_read'] ?? false,
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toIso8601String(),
      ),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'type': type,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
      'image_url': imageUrl,
    };
  }

  // Helper method to get notification icon based on type
  String get iconPath {
    if (kDebugMode) {
      print('🔍 Getting icon for type: "$type"');
    }

    switch (type.trim()) {
      case 'Upcoming Appointment':
        if (kDebugMode) {
          print('✅ Matched: Upcoming Appointment');
        }
        return Assets.assetsImagesTimeQuarter;
      case 'Appointment completed':
        if (kDebugMode) {
          print('✅ Matched: Appointment completed');
        }
        return Assets.assetsImagesCompleted;
      case 'Appointment Cancelled':
        if (kDebugMode) {
          print('✅ Matched: Appointment Cancelled');
        }
        return Assets.assetsImagesCalendarRemove;
      default:
        if (kDebugMode) {
          print('⚠️ No match found, using default. Type was: "$type"');
        }
        return Assets.assetsImagesTimeQuarter;
    }
  }

  // Helper method to get background color based on type
  Color get iconBgColor {
    switch (type.trim()) {
      case 'Upcoming Appointment':
        return const Color(0xFFE8EFF8); // أزرق فاتح
      case 'Appointment completed':
        return const Color(0xFFEDF7EE); // أخضر فاتح
      case 'Appointment Cancelled':
        return const Color(0xFFFFEDED); // أحمر فاتح
      default:
        return const Color(0xFFE8EFF8); // أزرق فاتح كـ default
    }
  }

  // Helper method to format time
  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 7) {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Just now';
    }
  }

  // Copy method for easy updates
  NotificationModel copyWith({
    int? id,
    String? title,
    String? message,
    String? type,
    bool? isRead,
    DateTime? createdAt,
    String? imageUrl,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, type: $type, isRead: $isRead)';
  }
}