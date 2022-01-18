import 'package:flutter/material.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus lugares'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {
              Navigator.of(context).pushNamed(
                AppRoutes.placeFormRoute,
              )
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text('Nenhum local cadastrado'),
                ),
                builder: (context, greatPlaces, child) =>
                    greatPlaces.itemsCount == 0
                        ? child!
                        : ListView.builder(
                            itemCount: greatPlaces.itemsCount,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlaces.getItemByIndex(index).image,
                                ),
                              ),
                              title: Text(
                                greatPlaces.getItemByIndex(index).title,
                              ),
                              subtitle: Text(
                                greatPlaces
                                    .getItemByIndex(index)
                                    .location
                                    .address,
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.placeDetail,
                                  arguments: greatPlaces.getItemByIndex(index),
                                );
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
