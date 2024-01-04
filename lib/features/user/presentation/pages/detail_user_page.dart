import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_contact_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:my_contact_app/features/user/presentation/widgets/label_menu.dart';
import 'package:my_contact_app/infrastructure/core/di/injection.dart';
import 'package:my_contact_app/infrastructure/shared/widgets/circle_loading.dart';
import 'package:my_contact_app/infrastructure/shared/widgets/state_with_mesage.dart';

class DetailUserPage extends StatelessWidget {
  const DetailUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userBloc = sl<UserBloc>();
    return BlocProvider(
      create: (context) =>
          userBloc..add(GetDetailUserEvent(body: Get.arguments as String)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Detail Kontak'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is DetailUserSuccess) {
              return _buildBodySuccess(state);
            } else if (state is UserLoading) {
              return const CircleLoading();
            } else if (state is UserFailure) {
              return StateWithMessage(message: state.message);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Center _buildBodySuccess(DetailUserSuccess state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              state.response.avatar,
            ),
          ),
          const SizedBox(height: 10),
          LabelMenu(
            label: 'Nama',
            value: state.response.name,
          ),
          LabelMenu(
            label: 'Jenis Kelamin',
            value: state.response.gender == 'l' ? 'Laki-laki' : 'Perempuan',
          ),
          LabelMenu(
            label: 'Nomor Hp',
            value: state.response.phone,
          ),
          LabelMenu(
            label: 'Email',
            value: state.response.email,
          ),
        ],
      ),
    );
  }
}
