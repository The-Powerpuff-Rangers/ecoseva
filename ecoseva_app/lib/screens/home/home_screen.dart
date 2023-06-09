import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecoseva_app/providers/profile_providers.dart';
import 'package:ecoseva_app/screens/home/widgets/graph_card.dart';
import 'package:ecoseva_app/screens/home/widgets/group_card.dart';
import 'package:ecoseva_app/screens/home/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/colors.dart';
import '../../gen/assets.gen.dart';

class HomeScreen extends ConsumerWidget {
  static const routename = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final currentUser = ref.watch(currentUserProvider);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkGreen,
      ),
      child: LayoutBuilder(
        builder: (context, size) => Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.maxWidth * 0.35,
              color: AppColors.darkGreen,
            ),
            Positioned.fill(
              top: 20,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    currentUser.when(
                      data: (data) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
                        child: AutoSizeText(
                          'Hello, ${data.name}',
                          style: textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      error: (error, stackTrace) => const SizedBox.shrink(),
                      loading: () => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
                        child: AutoSizeText(
                          'Hello,',
                          style: textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GraphCard(
                                title: 'Nearest',
                                centerText: '20 M',
                                primaryColor: AppColors.parrotGreen,
                                dataMap: const {'a': 70, 'b': 30},
                              ),
                              GraphCard(
                                title: 'Capacity',
                                centerText: '63 %',
                                primaryColor: AppColors.red,
                                dataMap: const {'a': 63, 'b': 37},
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          GraphCard(
                            title: 'Non Bio Degradable',
                            centerText: '57 %',
                            primaryColor: AppColors.red,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            dataMap: const {'a': 57, 'b': 43},
                          ),
                          const InfoCard(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        children: [
                          AutoSizeText(
                            'Groups',
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            splashRadius: 1,
                            icon: Assets.icons.plusSquared.image(scale: 1.1, color: Colors.black),
                          ),
                          // Flexible(
                          //     fit: FlexFit.loose,
                          //     flex: 2,
                          //     child: SearchGroupBar(label: 'Search Groups', controller: TextEditingController()))
                        ],
                      ),
                    ),
                    const GroupCard()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
