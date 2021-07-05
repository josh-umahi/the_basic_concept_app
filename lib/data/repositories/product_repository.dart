import "dart:convert";
import "package:http/http.dart" as http;

import '../models/product.dart';

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
}
