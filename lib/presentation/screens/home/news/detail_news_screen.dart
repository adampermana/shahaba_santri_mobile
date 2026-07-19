import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/apps_scaffold.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_appbar_widget.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppScaffold(
      appBar: _buildAppBar(context),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            const SizedBox(
              height: 240,
              width: double.infinity,
              child: CacheImageOrSvg(
                source:
                    'https://akcdn.detik.net.id/visual/2015/03/31/8c04ef5b-2678-4230-bd4e-b10f20d8e252_169.jpg?w=1200',
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xFFDDDDDD),
                        size: 16,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        '14 Jul 2026',
                        style: textTheme.bodySmall?.copyWith(
                          color: const Color(0xFFDDDDDD),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Title
                  const SizedBox(
                    width: 371,
                    height: 55,
                    child: Text(
                      'Menelusuri Jejak Sejarah Masjid Nabawi dan Perluasannya di Era Modern',
                      style: TextStyle(
                        color:
                            Colors.white /* semantic-content-inverse-primary */,
                        fontSize: 16,
                        fontFamily: 'Synonym Variable',
                        fontWeight: FontWeight.w700,
                        height: 1.75,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Location + Description
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Madinah',
                          style: TextStyle(
                            color: Color(
                              0xFFDDDDDD,
                            ) /* semantic-content-inverse-secondary */,
                            fontSize: 12,
                            fontFamily: 'Synonym Variable',
                            fontWeight: FontWeight.w700,
                            height: 1.67,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' — Masjid Nabawi bukan sekadar tempat ibadah biasa; ia adalah denyut nadi sejarah peradaban Islam. Dibangun pertama kali oleh Rasulullah SAW pada tahun pertama Hijriah (622 Masehi) setibanya beliau di Madinah, masjid ini awalnya hanya berupa bangunan sederhana berdinding bata lumpur dan beratapkan pelepah kurma.',
                          style: TextStyle(
                            color: Color(
                              0xFFDDDDDD,
                            ) /* semantic-content-inverse-secondary */,
                            fontSize: 12,
                            fontFamily: 'Synonym Variable',
                            fontWeight: FontWeight.w400,
                            height: 1.67,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Embedded Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const CacheImageOrSvg(
                      source:
                          'https://cdns.dream.co.id/resources/news/2018/05/02/83351/664xauto-di-dalam-kabah-ada-emas-minyak-benarkah-180502r.jpg',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Article Content
                  const SizedBox(
                    width: 371,
                    height: 440,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Fase Perluasan Awal Seiring bertambahnya jumlah umat Islam, masjid ini mengalami beberapa kali perluasan sejak zaman Khulafaur Rasyidin. Khalifah Umar bin Khattab dan Utsman bin Affan mencatatkan sejarah perluasan signifikan dengan mulai menggunakan material batu dan kayu yang lebih kokoh.\nEra Modern dan Fasilitas Terkini Di era modern, perluasan paling masif terjadi di bawah pemerintahan Arab Saudi. \n\nSaat ini, Masjid Nabawi telah dilengkapi dengan berbagai fasilitas canggih untuk menunjang kenyamanan jutaan jemaah, di antaranya:\n',
                            style: TextStyle(
                              color: Color(
                                0xFFDDDDDD,
                              ) /* semantic-content-inverse-secondary */,
                              fontSize: 12,
                              fontFamily: 'Synonym Variable',
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Payung Hidrolik Raksasa: Terpasang di area pelataran untuk melindungi jemaah dari terik matahari Madinah.\nSistem Pendingin Udara Sentral: Menjaga suhu di dalam masjid tetap sejuk meski di puncak musim panas.\nArea Bawah Tanah (Basement): Difungsikan sebagai area parkir luas dan fasilitas utilitas terpadu.\n',
                            style: TextStyle(
                              color: Color(
                                0xFFDDDDDD,
                              ) /* semantic-content-inverse-secondary */,
                              fontSize: 12,
                              fontFamily: 'Synonym Variable',
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nHingga kini, Masjid Nabawi mampu menampung lebih dari satu juta jemaah pada puncak musim haji, menjadikannya salah satu bangunan keagamaan terbesar dan termegah di dunia yang tidak pernah sepi dari lantunan ayat suci.',
                            style: TextStyle(
                              color: Color(
                                0xFFDDDDDD,
                              ) /* semantic-content-inverse-secondary */,
                              fontSize: 12,
                              fontFamily: 'Synonym Variable',
                              fontWeight: FontWeight.w400,
                              height: 1.67,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar.buildAppBarSimple(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 40,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: SizedBox.shrink(),
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).maybePop(),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: ColorPalette.kWhite,
          size: 22,
        ),
        padding: const EdgeInsets.only(left: 16),
        constraints: const BoxConstraints.tightFor(width: 40, height: 40),
        splashRadius: 20,
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 16),
      //     child: _QiblaInfoButton(onTap: _showQiblaInfoModal),
      //   ),
      // ],
    );
  }

  // Widget _buildBulletPoint(TextTheme textTheme, String text) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 4),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           '• ',
  //           style: textTheme.bodyMedium?.copyWith(
  //             color: const Color(0xFFDDDDDD),
  //             fontSize: 14,
  //             height: 1.43,
  //           ),
  //         ),
  //         Expanded(
  //           child: Text(
  //             text,
  //             style: textTheme.bodyMedium?.copyWith(
  //               color: const Color(0xFFDDDDDD),
  //               fontSize: 14,
  //               fontWeight: FontWeight.w400,
  //               height: 1.43,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
