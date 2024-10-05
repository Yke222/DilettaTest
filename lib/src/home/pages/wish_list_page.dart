import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '/../core/core.dart';
import '../../../ui/theme/colors.dart';
import '../../../ui/widget/widget.dart';
import '../home.dart';
import 'widget/widget.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({
    super.key,
  });

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
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

  void _init() {
    _controller.fetchWishlist();
  }

  void _removeFromWishList(StarShipEntity starChipEntity) {
    _controller.removeFromWishlist(starChipEntity);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
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
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: state.wishlist.length,
                              (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                  ),
                                  child:
                                  StarshipItemWidget(
                                    title: state.wishlist[index].name,
                                    description: state.wishlist[index].model,
                                    starShipClass: state
                                        .wishlist[index].starshipClass,
                                    onTheWishlist: true,
                                    onTapButton: () => _removeFromWishList(
                                      state.wishlist[index],
                                    ),
                                    onTap: () => DetailsItemBottomSheet.show(
                                      context: context,
                                      starShipEntity: state.wishlist[index],
                                      onTapButton: () => _removeFromWishList(
                                        state.wishlist[index],
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
    );
  }
}
