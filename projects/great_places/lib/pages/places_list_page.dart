import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
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
            onPressed: () => {
              Navigator.of(context).pushNamed(
                AppRoutes.placeFormRoute,
              )
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
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
                                ),
                              ),
                  ),
      ),
    );
  }
}
