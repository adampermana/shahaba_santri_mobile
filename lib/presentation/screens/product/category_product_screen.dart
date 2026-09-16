// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sahaba_mobile/business_logic/category_product/category_product_bloc.dart';
// import 'package:sahaba_mobile/business_logic/location/location_bloc.dart';
// import 'package:sahaba_mobile/injector.dart';
// import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
// import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
// import 'package:sahaba_mobile/presentation/routers/router_path.dart';
// import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
// import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';
// import 'package:sahaba_mobile/presentation/widgets/custom_dialogs_widget.dart';
// import 'package:sahaba_mobile/presentation/widgets/search_bar_widget.dart';
// import 'package:sahaba_mobile/presentation/widgets/search_history.dart';

// class CategoryProductScreen extends StatelessWidget {
//   const CategoryProductScreen({
//     required this.id,
//     required this.name,
//     super.key,
//   });

//   final int id;
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController();

//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<CategoryProductBloc>(
//           create: (context) =>
//               sl<CategoryProductBloc>()..add(CategoryProductEvent.started(id)),
//         ),
//         BlocProvider<LocationBloc>(
//           create: (context) => sl<LocationBloc>()
//             ..add(const LocationEvent.getCurrentLocation(isGetPosition: true)),
//         ),
//       ],
//       child: BlocListener<LocationBloc, LocationState>(
//         listenWhen: (previous, current) => previous.alert != current.alert,
//         listener: (context, state) async {
//           if (state.alert != null) {
//             await showAlertDialog(
//               context,
//               alert: state.alert,
//               title: state.titleError,
//               message: state.messageError,
//               titleColor: ColorPalette.kWhite,
//               messageColor: ColorPalette.kWhite,
//               iconColor: const Color(0xffB39164),
//               backgroundColor: ColorPalette.scaffoldBackground,
//               onRefresh: () => context.read<LocationBloc>().add(
//                 const LocationEvent.getCurrentLocation(isGetPosition: true),
//               ),
//             );
//           }
//         },
//         child: AppScaffold(
//           appBar: CustomAppBar.buildAppBarSimple(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             leadingWidth: 0,
//             leading: const SizedBox.shrink(),
//             bottom: const PreferredSize(
//               preferredSize: Size.fromHeight(30),
//               child: SizedBox.shrink(),
//             ),
//             titleWidget: Text(
//               name,
//               style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: ColorPalette.kWhite,
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () => context.pop(),
//                 icon: SvgPicture.asset(
//                   AppIcons.closeLine,
//                   width: 24,
//                   height: 24,
//                   colorFilter: const ColorFilter.mode(
//                     ColorPalette.kWhite,
//                     BlendMode.srcIn,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           body: BlocBuilder<CategoryProductBloc, CategoryProductState>(
//             builder: (context, state) {
//               final currentLocation = GoRouterState.of(context).uri.toString();

//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SearchBarWidget(
//                     controller: controller,
//                     hintText: 'Cari produk disini',
//                     onChanged: (value) {
//                       context.read<CategoryProductBloc>().add(
//                         CategoryProductEvent.search(value),
//                       );
//                     },
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: state.search == ''
//                         ? const SizedBox.shrink()
//                         : Text.rich(
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                               color: ColorPalette.kWhite,
//                             ),
//                             TextSpan(
//                               text: 'Hasil Pencarian ',
//                               children: [
//                                 TextSpan(
//                                   text: '"${state.search}"',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 16,
//                                     color: ColorPalette.kWhite,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                   ),

//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: state.isLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : state.errorMessage != null
//                           ? Text(state.errorMessage!)
//                           : ListView.builder(
//                               itemCount: state.products.length,
//                               itemBuilder: (context, index) {
//                                 final item = state.products[index];
//                                 return HistoryItems(
//                                   type: item.type ?? '-',
//                                   id: item.id ?? 0,
//                                   namaProduk: item.name ?? '',
//                                   status: item.status ?? '',
//                                   registerDate: item.expireDate ?? '',
//                                   lat: item.lat,
//                                   long: item.long,
//                                   eventTime: item.eventTime,
//                                   productId: item.productId,
//                                   imagePath:
//                                       (item.images != null &&
//                                           item.images!.isNotEmpty)
//                                       ? item.images![0].image
//                                       : (item.image ?? ''),
//                                   onTap: () async {
//                                     try {
//                                       if (item.type == 'Iklan') {
//                                         final locationState = context
//                                             .read<LocationBloc>()
//                                             .state;
//                                         final coordinates =
//                                             locationState.locations;
//                                         if (coordinates == null) {
//                                           context.read<LocationBloc>().add(
//                                             const LocationEvent
//                                                 .getCurrentLocation(
//                                               isGetPosition: true,
//                                             ),
//                                           );
//                                           return;
//                                         }
//                                         context.read<CategoryProductBloc>().add(
//                                           CategoryProductEvent.adLog(
//                                             item,
//                                             coordinates,
//                                           ),
//                                         );
//                                       }

//                                       await context.push(
//                                         '$currentLocation/${RouterPath.productDetailPath}',
//                                         extra: {
//                                           'id': item.id ?? 0,
//                                           'isAds': item.type == 'Iklan',
//                                         },
//                                       );

//                                       // final location = GoRouterState.of(
//                                       //   context,
//                                       // ).uri.toString();
//                                       // unawaited(
//                                       //   context.push(
//                                       //     '$location/${RouterPath.productDetailPath}',
//                                       //     extra: {
//                                       //       'id': item.id ?? 0,
//                                       //       'isAds': item.type == 'Iklan',
//                                       //     },
//                                       //   ),
//                                       // );
//                                     } on Exception catch (e) {
//                                       if (!context.mounted) return;
//                                       ScaffoldMessenger.of(
//                                         context,
//                                       ).showSnackBar(
//                                         SnackBar(content: Text(e.toString())),
//                                       );
//                                     }
//                                   },
//                                 );
//                               },
//                             ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
