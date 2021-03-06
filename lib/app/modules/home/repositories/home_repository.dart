import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_graphql_postgress/app/modules/home/models/produto_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _hasuraConnect;

  HomeRepository(this._hasuraConnect);

  Stream<List<ProdutoModel>> getProduto() {
    var subscription = r'''
          subscription getProdutos {
            produto {
              id
              nome
              valor
              tipo_produto {
                descricao
              }
              categoria_produto {
                descricao
              }
            }
          }

        ''';

    var snapshot = _hasuraConnect.subscription(subscription);

    return snapshot
        .map((data) => ProdutoModel.fromJsonList(data["data"]["produto"]));
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
