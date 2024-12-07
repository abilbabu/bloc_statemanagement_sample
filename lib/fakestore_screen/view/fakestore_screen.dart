import 'package:bloc_statemanagement_sample/fakestore_screen/bloc/fakestore_bloc.dart';
import 'package:bloc_statemanagement_sample/fakestore_screen/bloc/fakestore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FakestoreScreen extends StatelessWidget {
  const FakestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: BlocBuilder<FakestoreBloc, FakestoreState>(
        builder: (context, state) {
          if (state is FakestoreLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FakestoreSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.productslist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image
                            Image.network(
                              state.productslist[index].image.toString(),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 16),
                            // Product Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product Title
                                  Text(
                                    state.productslist[index].title.toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  // Product Description
                                  Text(
                                    state.productslist[index].description
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
                                  // Product Price
                                  Text(
                                    '\$${state.productslist[index].price.toString()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
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
              ),
            );
          }

          if (state is FakestoreFailedState ||
              state is FakestoreExcepationState) {
            return Center(
              child: Text("Failed to fetch data"),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
