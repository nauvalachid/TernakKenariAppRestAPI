import 'package:canary_template/core/core.dart';
import 'package:canary_template/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_bloc.dart';
import 'package:canary_template/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_event.dart';
import 'package:canary_template/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_state.dart';
import 'package:canary_template/presentation/buyer/profile/buyer_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetBurungTersediaBloc>().add(GetAllBurungTersediaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              toolbarHeight: 70,
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Temukan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Burung Favoritmu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push(const BuyerProfileScreen());
                    },
                    child: const Icon(
                      Icons.person,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text("Search..."),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<GetBurungTersediaBloc, GetBurungTersediaState>(
                    builder: (context, state) {
                      if (state is GetBurungTersediaLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is GetBurungTersediaLoaded) {
                        if (state.burungTersedia.isEmpty) {
                          return const Center(
                            child: Text("Tidak ada burung tersedia."),
                          );
                        }

                        return ListView.builder(
                          itemCount: state.burungTersedia.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final burung = state.burungTersedia[index];
                            return GestureDetector(
                              onTap: () {
                                context.push(
                                  BuyerBirdDetailScreen(
                                    id: burung.id.toString(),
                                    namaBurung: burung.namaBurung ?? "",
                                    jenisKelamin: burung.jenisKelamin ?? "",
                                    lokasi: burung.lokasi ?? "",
                                    deskripsi: burung.deskripsi ?? "",
                                    image: burung.image ?? "",
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              burung.image ?? "",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              burung.namaBurung ?? "",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "ID: ${burung.id}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Jenis Kelamin: ${burung.jenisKelamin}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Lokasi: ${burung.lokasi}",
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox(); // default kosong
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
