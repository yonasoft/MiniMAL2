import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app.dart';

// Provider to track the current navigation index
final selectedNavIndexProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedNavIndexProvider);
    final currentThemeMode = ref.watch(themeProvider);
    final Size screenSize = MediaQuery.of(context).size;

    // Determine navigation style based on screen width
    final bool isSmallScreen = screenSize.width < 600;
    final bool isMediumScreen =
        screenSize.width >= 600 && screenSize.width < 1200;

    return Scaffold(
      appBar: AppBar(
        title: const Text('mini MAL'),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              currentThemeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
                  currentThemeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      
      // Bottom navigation for small screens
      bottomNavigationBar:
          isSmallScreen
              ? BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) => _onItemTapped(context, index, ref),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    activeIcon: Icon(Icons.explore),
                    label: 'Discover',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list_outlined),
                    activeIcon: Icon(Icons.list),
                    label: 'My Lists',
                  ),
                ],
              )
              : null,

      // Use body for layout
      body: Row(
        children: [
          // Navigation rail for medium screens
          if (isMediumScreen)
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected:
                  (index) => _onItemTapped(context, index, ref),
              labelType: NavigationRailLabelType.selected,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore),
                  label: Text('Discover'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list_outlined),
                  selectedIcon: Icon(Icons.list),
                  label: Text('My Lists'),
                ),
              ],
            ),

          // Main content area
          Expanded(
            child: Column(
              children: [
                // Top navigation bar for large screens
                if (!isSmallScreen && !isMediumScreen)
                  _buildTopNavigationBar(context, selectedIndex, ref),

                // Content with search bar
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildSearchBar(),
                        const SizedBox(height: 16),
                        Expanded(child: child),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Top navigation bar for large screens
  Widget _buildTopNavigationBar(
    BuildContext context,
    int selectedIndex,
    WidgetRef ref,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem(
            context,
            'Home',
            Icons.home_outlined,
            Icons.home,
            0,
            selectedIndex,
            ref,
          ),
          const SizedBox(width: 24),
          _buildNavItem(
            context,
            'Discover',
            Icons.explore_outlined,
            Icons.explore,
            1,
            selectedIndex,
            ref,
          ),
          const SizedBox(width: 24),
          _buildNavItem(
            context,
            'My Lists',
            Icons.list_outlined,
            Icons.list,
            2,
            selectedIndex,
            ref,
          ),
        ],
      ),
    );
  }

  // Individual navigation item for top bar
  Widget _buildNavItem(
    BuildContext context,
    String label,
    IconData icon,
    IconData activeIcon,
    int index,
    int selectedIndex,
    WidgetRef ref,
  ) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(context, index, ref),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color:
                  isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for anime, manga...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }

  // Handle navigation
  void _onItemTapped(BuildContext context, int index, WidgetRef ref) {
    ref.read(selectedNavIndexProvider.notifier).state = index;
    switch (index) {
      case 0:
        context.goNamed('home');
        break;
      case 1:
        context.goNamed('discover');
        break;
      case 2:
        context.goNamed('myLists');
        break;
    }
  }
}

// Empty tab screens
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Screen'));
  }
}

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Discover Screen'));
  }
}

class MyListsTab extends StatelessWidget {
  const MyListsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('My Lists Screen'));
  }
}
