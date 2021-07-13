import "dart:convert";
import "package:http/http.dart" as http;

import '../models/product.dart';
import '../models/category_tag.dart';
import '../repositories/unencoded_path.dart';

class ProductRepository {
  final _baseUrl = "the-basic-concept-api.herokuapp.com";

  Future<List<Product>> getApparels() async {
    final uri = Uri.https(_baseUrl, "/apparels");
    final client = http.Client();
    final response = await client.get(uri);
    final json = jsonDecode(response.body) as List;

    try {
      final List<Product> apparels = [];
      for (var obj in json) {
        apparels.add(Product.fromJson(obj));
      }
      return apparels;
    } catch (e) {
      throw (e);
    } finally {
      client.close();
    }
  }

  Future<List<Product>> getBedsAndHouses() async {
    final uri1 = Uri.https(_baseUrl, "/beds");
    final uri2 = Uri.https(_baseUrl, "/houses");
    final client = http.Client();

    final responses;
    try {
      responses = await Future.wait([
        client.get(uri1),
        client.get(uri2),
      ]);
    } catch (e) {
      throw (e);
    }

    final jsonBeds = jsonDecode(responses[0].body) as List;
    final jsonHouses = jsonDecode(responses[1].body) as List;
    final json = jsonBeds + jsonHouses;
    try {
      final List<Product> bedsandHouses = [];
      for (var obj in json) {
        bedsandHouses.add(Product.fromJson(obj));
      }
      return bedsandHouses;
    } catch (e) {
      throw (e);
    } finally {
      client.close();
    }
  }

  Future<List<Product>> getBowls() async {
    final uri = Uri.https(_baseUrl, "/bowls");
    final client = http.Client();
    final response = await client.get(uri);
    final json = jsonDecode(response.body) as List;

    try {
      final List<Product> bowls = [];
      for (var obj in json) {
        bowls.add(Product.fromJson(obj));
      }
      return bowls;
    } catch (e) {
      throw (e);
    } finally {
      client.close();
    }
  }

  Future<List<Product>> getCollars() async {
    final uri = Uri.https(_baseUrl, "/collars");
    final client = http.Client();
    final response = await client.get(uri);
    final json = jsonDecode(response.body) as List;

    try {
      final List<Product> collars = [];
      for (var obj in json) {
        collars.add(Product.fromJson(obj));
      }
      return collars;
    } catch (e) {
      throw (e);
    } finally {
      client.close();
    }
  }

  Future<Product> getSpecificProduct({
    required String id,
    required String categoryTag,
  }) async {
    String unencodedPath;

    switch (categoryTag) {
      case CategoryTag.APPAREL:
        unencodedPath = UnencodedPath.APPAREL;
        break;
      case CategoryTag.BED:
        unencodedPath = UnencodedPath.BED;
        break;
      case CategoryTag.BOWL:
        unencodedPath = UnencodedPath.BOWL;
        break;
      case CategoryTag.COLLAR:
        unencodedPath = UnencodedPath.COLLAR;
        break;
      case CategoryTag.HOUSE:
        unencodedPath = UnencodedPath.HOUSE;
        break;
      default:
        throw ("An error occured in ProductRepository getSpecificProduct");
    }

    unencodedPath += "/$id";
    final uri = Uri.https(_baseUrl, unencodedPath);
    final client = http.Client();
    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    try {
      return Product.fromJson(json);
    } catch (e) {
      throw (e);
    } finally {
      client.close();
    }
  }

  Future<List<Product>> getSpecificProducts(
      Map<String, String> idToCategoryTag) async {
    final List<Product> products = [];
    for (var id in idToCategoryTag.keys) {
      final product = await getSpecificProduct(
        id: id,
        categoryTag: idToCategoryTag[id]!,
      );
      products.add(product);
    }
    return products;
  }
}
