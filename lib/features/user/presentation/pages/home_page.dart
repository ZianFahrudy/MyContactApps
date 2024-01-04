import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_contact_app/features/user/data/models/user_body.dart';
import 'package:my_contact_app/features/user/domain/entities/user_entity.dart';
import 'package:my_contact_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:my_contact_app/features/user/presentation/widgets/filter_button.dart';
import 'package:my_contact_app/features/user/presentation/widgets/user_card.dart';
import 'package:my_contact_app/infrastructure/core/di/injection.dart';
import 'package:my_contact_app/infrastructure/navigation/routes.dart';
import 'package:my_contact_app/infrastructure/shared/enum/filter_user_enum.dart';
import 'package:my_contact_app/infrastructure/shared/widgets/circle_loading.dart';
import 'package:my_contact_app/infrastructure/shared/widgets/state_with_mesage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bloc
  final userBloc = sl<UserBloc>();

  // paging controller
  final _pagingController = PagingController<int, UserEntity>(firstPageKey: 1);

// for filter selected
  final selectedFilterContact =
      ValueNotifier<FilterUserEnum>(FilterUserEnum.male);

// pagination variable
  int pageNumber = 1;
  int limit = 20;

// get users
  void getUserList(int pageKey) {
    userBloc.add(
      GetUsersEvent(
        body: UserBody(
          page: pageKey,
          limit: limit,
        ),
      ),
    );
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(getUserList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Kontak'),
          centerTitle: true,
          actions: [
            FilterButton(
              selectedFilterContact: selectedFilterContact,
              onApply: onFilterApply,
            ),
          ],
        ),
        body: _buildBody(),
        floatingActionButton: _buildFloatingSearchButton(),
      ),
    );
  }

  FloatingActionButton _buildFloatingSearchButton() {
    return FloatingActionButton(
      onPressed: () => Get.toNamed<void>(Routes.search),
      child: const Icon(Icons.search),
    );
  }

  BlocListener<UserBloc, UserState> _buildBody() {
    return BlocListener<UserBloc, UserState>(
      listener: userBlocListerner,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            pageNumber = 1;
            limit = 20;
            _pagingController.refresh();
          },
          child: PagedListView(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<UserEntity>(
              itemBuilder: (context, user, index) => UserCard(user: user),
              firstPageErrorIndicatorBuilder: (context) => StateWithMessage(
                message: '${_pagingController.error}',
              ),
              newPageProgressIndicatorBuilder: (context) =>
                  const CircleLoading(),
              noItemsFoundIndicatorBuilder: (context) =>
                  const StateWithMessage(message: 'Tidak ada kontak'),
              firstPageProgressIndicatorBuilder: (context) =>
                  const CircleLoading(),
            ),
          ),
        ),
      ),
    );
  }

  void userBlocListerner(BuildContext context, UserState state) {
    if (state is UserSuccess) {
      final next = 1 + pageNumber;
      final isLastPage = state.response.length < limit;

      if (isLastPage) {
        _pagingController.appendLastPage(state.response);
        pageNumber = 0;
      } else {
        _pagingController.appendPage(state.response, next);
      }
      pageNumber++;
    } else if (state is UserFailure) {
      _pagingController.error = state.message;
    }
  }

  void onFilterApply() {
    if (selectedFilterContact.value == FilterUserEnum.male) {
      pageNumber = 1;
      limit = 100;
      Get.back<void>();

      userBloc.add(
        GetUsersEvent(body: UserBody(gender: 'l')),
      );
      _pagingController.refresh();
    } else if (selectedFilterContact.value == FilterUserEnum.female) {
      pageNumber = 1;
      limit = 100;
      Get.back<void>();

      userBloc.add(
        GetUsersEvent(body: UserBody(gender: 'p')),
      );
      _pagingController.refresh();
    } else {
      pageNumber = 1;
      limit = 20;
      Get.back<void>();

      userBloc.add(
        GetUsersEvent(body: UserBody()),
      );
      _pagingController.refresh();
    }
  }
}
