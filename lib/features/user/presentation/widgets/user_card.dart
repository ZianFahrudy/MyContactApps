import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/infrastructure/navigation/routes.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.user,
    super.key,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed<void>(Routes.detail, arguments: user.id),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text(user.name),
      subtitle: Text(user.phone),
      trailing: Text(user.gender == 'l' ? 'Laki-laki' : 'Perempuan'),
    );
  }
}
