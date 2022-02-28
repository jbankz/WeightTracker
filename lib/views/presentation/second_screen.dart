import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/views/domain/entity/weight_entity.dart';
import 'package:weight_tracker/views/presentation/provider/weight_provider.dart';

import '../widgets/bg_widget.dart';
import '../widgets/form_field.dart';

class AddWeightScreen extends StatefulWidget {
  const AddWeightScreen({Key? key}) : super(key: key);

  @override
  _AddWeightScreenState createState() => _AddWeightScreenState();
}

class _AddWeightScreenState extends State<AddWeightScreen> {
  late WeightProvider _provider;

  TextEditingController _firstController = TextEditingController();

  @override
  void initState() {
    _provider = Provider.of<WeightProvider>(context, listen: false);
    _checkForUpdate();
    super.initState();
  }

  void _checkForUpdate() {
    _firstController = TextEditingController(
        text: _provider.weightResponse?.entity?.weight?.toString() ?? '');
    setState(() {});
  }

  @override
  void dispose() {
    _provider.disposeValue();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
      appBarTitle:
          _provider.weightResponse != null ? 'Update Weight' : 'Add Weight',
      bodyWidget: ListView(
        children: [
          Formfields(controller: _firstController, hint: 'Weight'),
          const SizedBox(height: 23),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              child: Text(_provider.weightResponse != null
                  ? 'Update Weight'
                  : 'Add Weight'),
              onPressed: () => _provider.weightResponse != null
                  ? _updateWeight()
                  : _addWeight(),
            ),
          ),
        ],
      ),
    );
  }

  _addWeight() {
    _provider.addWeight(
        WeightEntity(weight: double.tryParse(_firstController.text)));
  }

  _updateWeight() {
    _provider.updateWeight(WeightEntity(
        weight: double.tryParse(_firstController.text),
        docId: _provider.weightResponse?.docId));
  }
}
