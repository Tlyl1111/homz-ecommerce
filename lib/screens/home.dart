import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/home_controller.dart';
import 'package:timberr/screens/search_delegate/product_search_delegate.dart';
import 'package:timberr/widgets/input/custom_text_field.dart';
import 'package:timberr/widgets/tabbed/bottom_nav.dart';
import 'package:timberr/widgets/tiles/product_grid_tile.dart';
import 'package:timberr/widgets/tiles/product_list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  bool _showSearchBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Nếu scroll lên vượt qua chiều cao của SliverAppBar, hiện thanh search
    if (_scrollController.hasClients) {
      const threshold = 160.0; // cùng với expandedHeight
      if (_scrollController.offset >= threshold && !_showSearchBar) {
        setState(() => _showSearchBar = true);
      } else if (_scrollController.offset < threshold && _showSearchBar) {
        setState(() => _showSearchBar = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => kOnExitConfirmation(),
      child: Scaffold(
        bottomNavigationBar: const BottomNav(
          selectedPos: 0,
        ),
        body: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar.large(
              expandedHeight: 280,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/header_home.png',
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  height: 48,
                  width: 48,
                ),
              ),
              leadingWidth: 64,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(
                    'assets/notification.png',
                    height: 48,
                    width: 48,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
              bottom: _showSearchBar ? const MySearchBar() : null,
            ),
            SliverToBoxAdapter(
              child: GetBuilder<HomeController>(
                id: kHome,
                builder: (controller) {
                  return SizedBox(
                    height: 342,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "New Arrivals",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Text(
                                "See All",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: kColorPrimary,
                                ),
                              )
                            : SizedBox(
                                height: 279, // đủ cao để hiển thị item
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.productsList.length,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  itemBuilder: (context, index) {
                                    final product = controller.productsList
                                        .elementAt(index);
                                    debugPrint("product: ${product.toJson()}");
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: SizedBox(
                                        height: 250,
                                        child:
                                            ProductGridTile(product: product),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: GetBuilder<HomeController>(
                id: kHome,
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kColorPrimary,
                      ),
                    );
                  }
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Best Selling",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.productsList.length,
                        itemBuilder: (context, index) {
                          final product =
                              controller.productsList.elementAt(index);
                          return ProductListTile(
                              product: product,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8));
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchBar extends StatelessWidget implements PreferredSizeWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: ProductSearchDelegate());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomTextField(
          hintText: "Find Your Style Here",
          enabled: false,
          suffixIcon: Container(
            height: 16,
            width: 16,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/search.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
