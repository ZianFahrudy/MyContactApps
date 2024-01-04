import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_search_appbar/good_search_appbar.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:my_contact_app/features/user/presentation/widgets/user_card.dart';
import 'package:my_contact_app/infrastructure/core/di/injection.dart';
import 'package:my_contact_app/infrastructure/shared/widgets/circle_loading.dart';
import 'package:my_contact_app/infrastructure/shared/widgets/state_with_mesage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = sl<UserBloc>();
    return BlocProvider(
      create: (context) => userBloc,
      child: Scaffold(
        appBar: GoodSearchAppBar(
          title: 'Search contact',
          onSearchChanged: (query) {
            userBloc.add(SearchUsersEvent(body: UserBody(name: query)));
          },
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return _buildBodySuccess(state);
            } else if (state is UserLoading) {
              return const CircleLoading();
            } else if (state is UserFailure) {
              return StateWithMessage(message: state.message);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  ListView _buildBodySuccess(UserSuccess state) {
    return ListView.builder(
      itemCount: state.response.length,
      itemBuilder: (context, i) => UserCard(
        user: state.response[i],
      ),
    );
  }
}
