import 'package:flutter/material.dart';
import 'package:my_app/model/cliente_model.dart';
import 'package:my_app/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<ClienteModel>? _clienteModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _clienteModel = (await ApiService().getClientes())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _clienteModel == null || _clienteModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _clienteModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_clienteModel![index].id.toString()),
                          Text(_clienteModel![index].nome),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_clienteModel![index].email),
                          Text(_clienteModel![index].telefone),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
