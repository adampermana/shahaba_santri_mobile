import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahaba_mobile/presentation/widgets/bottom_navigation_bar.dart';

//  Constants

// Gunakan path SVG yang tersedia di project assets
const String _svgA = 'assets/svg/compass-3-line.svg';
const String _svgB = 'assets/svg/calendar-line.svg';
const String _svgC = 'assets/svg/sun-line.svg';
const String _svgD = 'assets/svg/notification-line.svg';
const String _svgFeatured = 'assets/svg/quran-unselected.svg';

//  Fixture items

/// 2 item minimal
List<NavBarItem> _items2() => [
  const NavBarItem(
    defaultSvgPath: _svgA,
    selectedSvgPath: _svgA,
    title: 'Home',
  ),
  const NavBarItem(
    defaultSvgPath: _svgB,
    selectedSvgPath: _svgB,
    title: 'Search',
  ),
];

/// 5 item dengan featured di index 2 (tengah)
List<NavBarItem> _items5() => [
  const NavBarItem(
    defaultSvgPath: _svgA,
    selectedSvgPath: _svgA,
    title: 'Home',
  ),
  const NavBarItem(
    defaultSvgPath: _svgB,
    selectedSvgPath: _svgB,
    title: 'Search',
  ),
  const NavBarItem(
    defaultSvgPath: _svgFeatured,
    selectedSvgPath: _svgFeatured,
    title: 'Al-Quran',
    isFeatured: true,
  ),
  const NavBarItem(
    defaultSvgPath: _svgC,
    selectedSvgPath: _svgC,
    title: 'Jadwal',
  ),
  const NavBarItem(
    defaultSvgPath: _svgD,
    selectedSvgPath: _svgD,
    title: 'Profil',
  ),
];

//  Helper

Widget _wrap(Widget child) => MaterialApp(
  home: Scaffold(
    body: Align(
      alignment: Alignment.bottomCenter,
      child: child,
    ),
  ),
);

//  Tests

void main() {
  //  NavBarItem model

  group('NavBarItem', () {
    test('isFeatured defaults to false', () {
      const item = NavBarItem(
        defaultSvgPath: _svgA,
        selectedSvgPath: _svgA,
        title: 'Home',
      );
      expect(item.isFeatured, isFalse);
    });

    test('isFeatured can be set to true', () {
      const item = NavBarItem(
        defaultSvgPath: _svgFeatured,
        selectedSvgPath: _svgFeatured,
        title: 'Al-Quran',
        isFeatured: true,
      );
      expect(item.isFeatured, isTrue);
    });

    test('properties are correctly assigned', () {
      const item = NavBarItem(
        defaultSvgPath: _svgA,
        selectedSvgPath: _svgB,
        title: 'Beranda',
      );
      expect(item.defaultSvgPath, _svgA);
      expect(item.selectedSvgPath, _svgB);
      expect(item.title, 'Beranda');
    });
  });

  //  BottomNavigationItemsBar – assert

  group('BottomNavigationItemsBar - assertions', () {
    test('asserts when less than 2 items provided', () {
      expect(
        () => BottomNavigationItemsBar(
          items: const [
            NavBarItem(
              defaultSvgPath: _svgA,
              selectedSvgPath: _svgA,
              title: 'Home',
            ),
          ],
          onChanged: (_) {},
        ),
        throwsAssertionError,
      );
    });

    test('asserts when more than 5 items provided', () {
      expect(
        () => BottomNavigationItemsBar(
          items: List.generate(
            6,
            (i) => NavBarItem(
              defaultSvgPath: _svgA,
              selectedSvgPath: _svgA,
              title: 'Item $i',
            ),
          ),
          onChanged: (_) {},
        ),
        throwsAssertionError,
      );
    });
  });

  //  BottomNavigationItemsBar – rendering

  group('BottomNavigationItemsBar - rendering', () {
    testWidgets('renders all item labels for 2 items', (tester) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('renders all 5 item labels', (tester) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items5(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Al-Quran'), findsOneWidget);
      expect(find.text('Jadwal'), findsOneWidget);
      expect(find.text('Profil'), findsOneWidget);
    });

    testWidgets(
      'selected item (initialIndex=0) renders first label with selected style',
      (tester) async {
        await tester.pumpWidget(
          _wrap(
            BottomNavigationItemsBar(
              items: _items2(),
              onChanged: (_) {},
            ),
          ),
        );
        await tester.pump();

        // "Home" label teks ada dan terlihat
        expect(find.text('Home'), findsOneWidget);

        final homeText = tester.widget<Text>(find.text('Home'));
        expect(homeText.style?.color, Colors.white); // selected
        final searchText = tester.widget<Text>(find.text('Search'));
        expect(searchText.style?.color, const Color(0xFFA7A9AF)); // unselected
      },
    );

    testWidgets('initialIndex=1 selects second item', (tester) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            initialIndex: 1,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      final searchText = tester.widget<Text>(find.text('Search'));
      expect(searchText.style?.color, Colors.white);
      final homeText = tester.widget<Text>(find.text('Home'));
      expect(homeText.style?.color, const Color(0xFFA7A9AF));
    });
  });

  //  BottomNavigationItemsBar – interaction

  group('BottomNavigationItemsBar - interaction', () {
    testWidgets('tapping unselected item fires onChanged with correct index', (
      tester,
    ) async {
      int? changedTo;
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (i) => changedTo = i,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Search'));
      await tester.pump();

      expect(changedTo, 1);
    });

    testWidgets('tapping current selected item does NOT fire onChanged', (
      tester,
    ) async {
      var callCount = 0;
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) => callCount++,
          ),
        ),
      );
      await tester.pump();

      // Tap the already-selected item
      await tester.tap(find.text('Home'));
      await tester.pump();

      expect(callCount, 0);
    });

    testWidgets('selection updates visually after tapping another item', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      // Before tap: Home is selected
      expect(
        tester.widget<Text>(find.text('Home')).style?.color,
        Colors.white,
      );

      // Tap Search
      await tester.tap(find.text('Search'));
      await tester.pump();

      // After tap: Search is selected, Home is unselected
      expect(
        tester.widget<Text>(find.text('Search')).style?.color,
        Colors.white,
      );
      expect(
        tester.widget<Text>(find.text('Home')).style?.color,
        const Color(0xFFA7A9AF),
      );
    });

    testWidgets(
      'tapping featured item fires onChanged but does NOT update selection',
      (tester) async {
        int? changedTo;
        await tester.pumpWidget(
          _wrap(
            BottomNavigationItemsBar(
              items: _items5(),
              onChanged: (i) => changedTo = i,
            ),
          ),
        );
        await tester.pump();

        // Tap the featured center item (Al-Quran, index=2)
        await tester.tap(find.text('Al-Quran'));
        await tester.pump();

        // onChanged called with index 2
        expect(changedTo, 2);

        // BUT selection does NOT move to featured — Home still selected
        expect(
          tester.widget<Text>(find.text('Home')).style?.color,
          Colors.white,
        );
      },
    );

    testWidgets('onChanged called with correct index for each item', (
      tester,
    ) async {
      final tapped = <int>[];

      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items5(),
            initialIndex: 3, // start far right so tapping 0,1,4 all fire
            onChanged: tapped.add,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Home')); // index 0
      await tester.pump();
      await tester.tap(find.text('Search')); // index 1
      await tester.pump();
      await tester.tap(find.text('Al-Quran')); // index 2 (featured)
      await tester.pump();
      await tester.tap(find.text('Profil')); // index 4
      await tester.pump();

      expect(tapped, containsAllInOrder([0, 1, 2, 4]));
    });
  });

  //  BottomNavigationItemsBar – didUpdateWidget

  group('BottomNavigationItemsBar - didUpdateWidget', () {
    testWidgets('selection updates when initialIndex prop changes', (
      tester,
    ) async {
      var externalIndex = 0;

      await tester.pumpWidget(
        StatefulBuilder(
          builder: (ctx, setState) {
            return MaterialApp(
              home: Scaffold(
                body: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => setState(() => externalIndex = 1),
                      child: const Text('Switch'),
                    ),
                    BottomNavigationItemsBar(
                      items: _items2(),
                      initialIndex: externalIndex,
                      onChanged: (_) {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
      await tester.pump();

      // Initially Home is selected
      expect(
        tester.widget<Text>(find.text('Home')).style?.color,
        Colors.white,
      );

      // Change external index to 1 via button
      await tester.tap(find.text('Switch'));
      await tester.pump();

      // Now Search should be selected
      expect(
        tester.widget<Text>(find.text('Search')).style?.color,
        Colors.white,
      );
      expect(
        tester.widget<Text>(find.text('Home')).style?.color,
        const Color(0xFFA7A9AF),
      );
    });
  });

  //  BottomNavigationItemsBar – appearance

  group('BottomNavigationItemsBar - appearance', () {
    testWidgets('uses custom selectedLabelStyle when provided', (tester) async {
      const customStyle = TextStyle(
        color: Colors.amber,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      );
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            selectedLabelStyle: customStyle,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      final homeText = tester.widget<Text>(find.text('Home'));
      expect(homeText.style?.color, Colors.amber);
      expect(homeText.style?.fontSize, 18.0);
      expect(homeText.style?.fontWeight, FontWeight.w900);
    });

    testWidgets('uses custom unselectedLabelStyle when provided', (
      tester,
    ) async {
      const customStyle = TextStyle(
        color: Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.w300,
      );
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            unselectedLabelStyle: customStyle,
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      final searchText = tester.widget<Text>(find.text('Search'));
      expect(searchText.style?.color, Colors.grey);
      expect(searchText.style?.fontSize, 10.0);
    });

    testWidgets('Semantics button=true and label matches item title', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      // Both items wrapped with Semantics(button: true)
      final semanticsFinder = find.bySemanticsLabel('Home');
      expect(semanticsFinder, findsWidgets);
    });

    testWidgets('item labels have maxLines=1 and overflow=ellipsis', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      for (final label in ['Home', 'Search']) {
        final text = tester.widget<Text>(find.text(label));
        expect(text.maxLines, 1);
        expect(text.overflow, TextOverflow.ellipsis);
      }
    });

    testWidgets('all items rendered with textAlign=center', (tester) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      for (final label in ['Home', 'Search']) {
        final text = tester.widget<Text>(find.text(label));
        expect(text.textAlign, TextAlign.center);
      }
    });
  });

  //  BottomNavigationItemsBar – widget structure

  group('BottomNavigationItemsBar - widget structure', () {
    testWidgets('contains SizedBox at root level', (tester) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(),
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('regular items use InkWell for tap interaction', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items2(), // 2 regular items
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      // Both non-featured items use InkWell
      expect(find.byType(InkWell), findsNWidgets(2));
    });

    testWidgets('featured item uses GestureDetector instead of InkWell', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          BottomNavigationItemsBar(
            items: _items5(), // index 2 is featured
            onChanged: (_) {},
          ),
        ),
      );
      await tester.pump();

      // 4 regular items → 4 InkWells
      // 1 featured item → GestureDetector
      expect(find.byType(InkWell), findsNWidgets(4));
      // GestureDetector wraps the featured button
      expect(find.byType(GestureDetector), findsAtLeastNWidgets(1));
    });
  });
}
