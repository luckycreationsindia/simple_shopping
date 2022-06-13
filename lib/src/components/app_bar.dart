import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/src/components/anim_search_widget.dart';
import 'package:simple_shopping/src/models/cart_notifier.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final AnimationController _cartAnimController = AnimationController(
    duration: const Duration(milliseconds: 500),
    reverseDuration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  late final Animation<double> _cartAnimation = CurvedAnimation(
    parent: _cartAnimController,
    curve: Curves.easeIn,
    reverseCurve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    _cartAnimController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.forward();
    _cartAnimController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 0,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              ),
              const Spacer(),
              SizeTransition(
                sizeFactor: _animation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 3),
                child: AnimSearchBar(
                  width: fullWidth - 100,
                  rtl: true,
                  closeSearchOnSuffixTap: true,
                  autoFocus: true,
                  textController: _searchController,
                  onSuffixTap: () => _searchController.clear(),
                  color: Colors.transparent,
                  boxShadow: const [],
                  onToggle: (int newState) {
                    if (newState == 1) {
                      _controller.reverse();
                      _cartAnimController.reverse();
                    } else {
                      _controller.forward();
                      _cartAnimController.forward();
                    }
                  },
                ),
              ),
              SizeTransition(
                sizeFactor: _cartAnimation,
                axis: Axis.horizontal,
                axisAlignment: -1,
                child: Badge(
                  badgeContent: Text(
                    context.watch<CartNotifier>().totalItems.toString(),
                  ),
                  position: const BadgePosition(end: 0, top: 0),
                  child: IconButton(
                    onPressed: () => context.push('/cart'),
                    icon: const Icon(
                      Icons.shopping_bag,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
