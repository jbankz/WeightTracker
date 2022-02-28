import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/views/data/model/weight_response.dart';
import 'package:weight_tracker/views/domain/entity/weight_entity.dart';
import 'package:weight_tracker/views/presentation/provider/weight_provider.dart';

import '../widgets/bg_widget.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  WeightProvider? _provider;
  @override
  void initState() {
    super.initState();
    _provider = Provider.of<WeightProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      appBarTitle: 'Weight',
      logOut: () => _provider?.logUserOut(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddWeightScreen())),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bodyWidget: Consumer<WeightProvider>(
        builder: (context, provider, child) {
          return StreamBuilder<List<WeightResponse>>(
            stream: provider.readWeights(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) return Container();

              final _weights = snapshot.data;

              return ListView(
                children: [
                  ..._weights!.map((element) {
                    return ListTile(
                      onTap: () {
                        _provider!.setData(element);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddWeightScreen()));
                      },
                      title: Text('${element.entity?.weight} KG'),
                      subtitle: Text(element.entity?.time ?? ''),
                      trailing: IconButton(
                          onPressed: () => _delete(element),
                          icon: const Icon(Icons.delete)),
                    );
                  }).toList()
                ],
              );
            },
          );
        },
      ),
    );
  }

  void _delete(WeightResponse element) {
    _provider?.deletesWeight(WeightEntity(docId: element.docId));
  }
}
