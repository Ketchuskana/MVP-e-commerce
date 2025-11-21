import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'catalog_viewmodel.dart';
import '../../data/datasources/product_remote_ds.dart';
import 'package:go_router/go_router.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  late CatalogViewModel vm;
  @override
  void initState() {
    super.initState();
    vm = CatalogViewModel(ds: ProductRemoteDataSource(useLocalMock: true));
    vm.load();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<CatalogViewModel>(builder: (context, vm, _) {
        if (vm.loading) return const Center(child: CircularProgressIndicator());
        if (vm.error != null) return Center(child: Text('Error: ${vm.error}'));
        return Scaffold(
          appBar: AppBar(title: Text('Catalogue')),
          body: ListView.builder(
            itemCount: vm.products.length,
            itemBuilder: (context, i) {
              final p = vm.products[i];
              return ListTile(
                leading: Image.network(p.thumbnail,
                    width: 60, height: 60, fit: BoxFit.cover),
                title: Text(p.title),
                subtitle: Text('${p.price} €'),
                onTap: () => context.push('/product/${p.id}'),
              );
            },
          ),
        );
      }),
    );
  }
}
