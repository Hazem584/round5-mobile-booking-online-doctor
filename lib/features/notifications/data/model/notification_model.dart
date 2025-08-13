// notification_model.dart - Updated for API Integration
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/assets.dart';

class NotificationModel {
  final int id;
  final String title;
  final String message;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final String? imageUrl;
  final String? icon;
  final String? color;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.isRead,
    required this.createdAt,
    this.imageUrl,
    this.icon,
    this.color,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print('🔄 Parsing notification from JSON: ${json['title']}');
    }

    return NotificationModel(
      id: _parseId(json['id']),
      title: json['title']?.toString() ?? 'No Title',
      message: json['message']?.toString() ?? 'No Message',
      type: json['type']?.toString() ?? 'general',
      isRead: _parseIsRead(json),
      createdAt: _parseCreatedAt(json),
      imageUrl: json['image_url']?.toString(),
      icon: json['icon']?.toString(),
      color: json['color']?.toString(),
    );
  }

  // Helper method to parse ID from different possible formats
  static int _parseId(dynamic id) {
    if (id is int) return id;
    if (id is String) {
      try {
        return int.parse(id);
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ Could not parse ID: $id');
        }
        return 0;
      }
    }
    return 0;
  }

  // Helper method to parse isRead from different possible field names
  static bool _parseIsRead(Map<String, dynamic> json) {
    // Try different possible field names
    final readFields = ['is_read', 'isRead', 'read', 'read_at'];
    
    for (final field in readFields) {
      if (json.containsKey(field)) {
        final value = json[field];
        if (value is bool) return value;
        if (value is int) return value == 1;
        if (value is String) {
          if (value.toLowerCase() == 'true' || value == '1') return true;
          if (value.toLowerCase() == 'false' || value == '0') return false;
          // If it's a date string, consider it read
          if (value.isNotEmpty && value != 'null') return true;
        }
        if (value != null && value.toString() != 'null') return true;
      }
    }
    
    return false; // Default to unread
  }

  // Helper method to parse created date from different possible formats
  static DateTime _parseCreatedAt(Map<String, dynamic> json) {
    final dateFields = ['created_at', 'createdAt', 'date', 'timestamp'];
    
    for (final field in dateFields) {
      if (json.containsKey(field)) {
        final value = json[field];
        if (value != null) {
          try {
            if (value is String) {
              // Handle different date formats
              return DateTime.parse(value);
            } else if (value is int) {
              // Handle timestamp
              return DateTime.fromMillisecondsSinceEpoch(value * 1000);
            }
          } catch (e) {
            if (kDebugMode) {
              print('⚠️ Could not parse date: $value');
            }
          }
        }
      }
    }
    
    return DateTime.now(); // Default to current time
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
      'icon': icon,
      'color': color,
    };
  }

  // Helper method to get notification icon based on type
  String get iconPath {
    if (kDebugMode) {
      print('🔍 Getting icon for type: "$type"');
    }

    // First check if there's a custom icon from API
    if (icon != null && icon!.isNotEmpty) {
      // You can map API icon names to local assets here
      switch (icon!.toLowerCase()) {
        case 'calendar':
        case 'appointment':
          return Assets.assetsImagesTimeQuarter;
        case 'check':
        case 'completed':
          return Assets.assetsImagesCompleted;
        case 'cancel':
        case 'cancelled':
          return Assets.assetsImagesCalendarRemove;
        default:
          if (kDebugMode) {
            print('🔍 Using custom icon: $icon');
          }
          return Assets.assetsImagesTimeQuarter;
      }
    }

    // Fallback to type-based icon selection
    switch (type.toLowerCase().trim()) {
      case 'upcoming appointment':
      case 'appointment_reminder':
      case 'appointment reminder':
        if (kDebugMode) {
          print('✅ Matched: Upcoming Appointment');
        }
        return Assets.assetsImagesTimeQuarter;
        
      case 'appointment completed':
      case 'appointment_completed':
      case 'appointment_confirmed':
      case 'appointment confirmed':
        if (kDebugMode) {
          print('✅ Matched: Appointment completed');
        }
        return Assets.assetsImagesCompleted;
        
      case 'appointment cancelled':
      case 'appointment_cancelled':
      case 'appointment_canceled':
      case 'appointment canceled':
        if (kDebugMode) {
          print('✅ Matched: Appointment Cancelled');
        }
        return Assets.assetsImagesCalendarRemove;
        
      case 'prescription_ready':
      case 'prescription ready':
        if (kDebugMode) {
          print('✅ Matched: Prescription Ready');
        }
        return Assets.assetsImagesCompleted;
        
      default:
        if (kDebugMode) {
          print('⚠️ No match found, using default. Type was: "$type"');
        }
        return Assets.assetsImagesTimeQuarter;
    }
  }

  // Helper method to get background color based on type or API color
  Color get iconBgColor {
    // First check if there's a custom color from API
    if (color != null && color!.isNotEmpty) {
      try {
        // Handle hex colors from API
        if (color!.startsWith('#')) {
          final hexColor = color!.substring(1);
          final intColor = int.parse('FF$hexColor', radix: 16);
          return Color(intColor).withOpacity(0.1);
        }
        
        // Handle named colors from API
        switch (color!.toLowerCase()) {
          case 'blue':
            return const Color(0xFFE8EFF8);
          case 'green':
            return const Color(0xFFEDF7EE);
          case 'red':
            return const Color(0xFFFFEDED);
          case 'purple':
            return const Color(0xFFF3E8FF);
          case 'orange':
            return const Color(0xFFFFF4E6);
          default:
            return const Color(0xFFE8EFF8);
        }
      } catch (e) {
        if (kDebugMode) {
          print('⚠️ Could not parse color: $color');
        }
      }
    }

    // Fallback to type-based color selection
    switch (type.toLowerCase().trim()) {
      case 'upcoming appointment':
      case 'appointment_reminder':
      case 'appointment reminder':
        return const Color(0xFFE8EFF8);
        
      case 'appointment completed':
      case 'appointment_completed':
      case 'appointment_confirmed':
      case 'appointment confirmed':
        return const Color(0xFFEDF7EE); 

      case 'appointment cancelled':
      case 'appointment_cancelled':
      case 'appointment_canceled':
      case 'appointment canceled':
        return const Color(0xFFFFEDED);
        
      case 'prescription_ready':
      case 'prescription ready':
        return const Color(0xFFF3E8FF); 
        
      default:
        return const Color(0xFFE8EFF8);
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

  // Helper method to get formatted date for display
  String get formattedDate {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    return '${createdAt.day} ${months[createdAt.month - 1]} ${createdAt.year}';
  }

  // Helper method to get formatted time for display
  String get formattedTimeOnly {
    final hour = createdAt.hour > 12 ? createdAt.hour - 12 : createdAt.hour;
    final amPm = createdAt.hour >= 12 ? 'PM' : 'AM';
    final minute = createdAt.minute.toString().padLeft(2, '0');
    final displayHour = hour == 0 ? 12 : hour;
    
    return '$displayHour:$minute $amPm';
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
    String? icon,
    String? color,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, type: $type, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}