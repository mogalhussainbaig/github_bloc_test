import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/item.dart';

class GithubApiService {
  final String baseUrl = 'https://api.github.com/search/repositories';

  Future<List<ItemElement>> fetchRepositories(String date) async {
    List<ItemElement> items=[];
    try{
      final response = await http.get(Uri.parse('$baseUrl?q=created:>2022-04-29&sort=stars&order=desc'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // Item item=itemFromJson(response.body);

        List<dynamic> list=data['items'];
        print('list=${list.length}');
        for (var element in list) {
          items.add(ItemElement.fromJson(element));
        }
        // items=item.items.toList();
        print(items.length);

        // final List<Item> items = (data['items'] as List).map((i) => Item.fromJson(i)).toList();
      }
    }catch(ex){

    }


    return items;
  }
}
