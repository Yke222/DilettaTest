import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '/../core/core.dart';
import '../../../ui/ui.dart';
import '../home.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({
    super.key,
  });

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final _controller = GetIt.I.get<HomeCubit>();
  final _textController = TextEditingController();
  final _debouncer = Debouncer();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _init() {
    _controller.fetchWishlist();
  }

  void _removeFromWishList(StarShipEntity starChipEntity) {
    _controller.removeFromWishlist(starChipEntity);
  }

  void _onChangeFilter(String? value) {
    if (value == null) {
      return;
    }

    _debouncer.run(() {
      _controller.filterWishList(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocConsumer<HomeCubit, HomeState>(
        bloc: _controller,
        listener: (context, state) {
          state.updatehWishlistStatus.whenOrNull(
            success: _controller.fetchWishlist,
          );
        },
        builder: (context, state) {
          return AppLoading(
            loading: state.fetchWishlistStatus.isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                title: Text(
                  'Minha WishList',
                  style: context.textTheme.displaySmall,
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: state.wishlist.isEmpty
                      ? const EmptyWidget()
                      : CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: TextfieldWidget(
                                controller: _textController,
                                label: 'Buscar',
                                suffix: const Icon(Icons.search),
                                onChange: _onChangeFilter,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                height: 16.h,
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: state.filteredWishlist.length,
                                (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: StarshipItemWidget(
                                      title: state.filteredWishlist[index].name,
                                      description:
                                          state.filteredWishlist[index].model,
                                      starShipClass: state
                                          .filteredWishlist[index]
                                          .starshipClass,
                                      onTheWishlist: true,
                                      onTapButton: () => _removeFromWishList(
                                        state.filteredWishlist[index],
                                      ),
                                      onTap: () => DetailsItemBottomSheet.show(
                                        context: context,
                                        starShipEntity:
                                            state.filteredWishlist[index],
                                        onTapButton: () => _removeFromWishList(
                                          state.filteredWishlist[index],
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
          );
        },
      ),
    );
  }
}
