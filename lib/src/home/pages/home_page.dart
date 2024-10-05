import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '/../core/core.dart';
import '../../../ui/ui.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = GetIt.I.get<HomeCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    super.initState();
  }

  Future<void> _init() async {
    await _controller.fetchListStarships();
    _controller.fetchWishlist();
    _controller.updateCurrentList();
  }

  void _onTapButton(StarShipEntity starChipEntity) {
    if (starChipEntity.onTheWishlist) {
      _removeFromWishList(starChipEntity);
      return;
    }
    _addToWishList(starChipEntity);
  }

  void _addToWishList(StarShipEntity starChipEntity) {
    _controller.addToWishlist(starChipEntity);
  }

  void _removeFromWishList(StarShipEntity starChipEntity) {
    _controller.removeFromWishlist(starChipEntity);
  }

  Future<void> _goToWishList() async {
    await context.push(HomeRoutesEnum.wishList.fullPath);
    _init();
  }

  void _onSuccessUpdateList() {
    _controller.fetchWishlist();
    _controller.updateCurrentList();

    Toast.show(
      message: 'Lista de desejos atualizada',
      type: ToastType.success,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _controller,
      listener: (context, state) {
        state.updatehWishlistStatus.whenOrNull(
          success: _onSuccessUpdateList,
        );
      },
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: _init,
          child: (state.failure != null)
              ? NoInternetPage(
                  onTapRetry: _init,
                )
              : AppLoading(
                  loading: state.fetchListStarshipsStatus.isLoading,
                  child: Scaffold(
                    backgroundColor: AppColors.white,
                    appBar: state.fetchListStarshipsStatus.isLoading
                        ? null
                        : AppBar(
                            scrolledUnderElevation: 0,
                            title: Text(
                              'Olá',
                              style: context.textTheme.displaySmall,
                            ),
                            actions: [
                              IconButton(
                                onPressed: _goToWishList,
                                icon: Badge.count(
                                  count: state.wishlist.length,
                                  backgroundColor: AppColors.accent,
                                  child: const Icon(
                                    Icons.favorite_border,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                            ],
                          ),
                    body: state.fetchListStarshipsStatus.isLoading
                        ? null
                        : SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: CustomScrollView(
                                slivers: [
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      childCount: state.listStarships.length,
                                      (_, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: StarshipItemWidget(
                                            title:
                                                state.listStarships[index].name,
                                            starShipClass: state
                                                .listStarships[index]
                                                .starshipClass,
                                            description: state
                                                .listStarships[index].model,
                                            onTheWishlist: state
                                                .listStarships[index]
                                                .onTheWishlist,
                                            onTapButton: () => _onTapButton(
                                              state.listStarships[index],
                                            ),
                                            onTap: () =>
                                                DetailsItemBottomSheet.show(
                                              context: context,
                                              starShipEntity:
                                                  state.listStarships[index],
                                              onTapButton: () => _onTapButton(
                                                state.listStarships[index],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
        );
      },
    );
  }
}
