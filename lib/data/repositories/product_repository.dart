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

  Future<List<Product>> getBeds() async {
    final uri = Uri.https(_baseUrl, "/beds");
    final client = http.Client();
    final response = await client.get(uri);
    final json = jsonDecode(response.body) as List;

    try {
      final List<Product> beds = [];
      for (var obj in json) {
        beds.add(Product.fromJson(obj));
      }
      return beds;
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

  Future<List<Product>> getHouses() async {
    final uri = Uri.https(_baseUrl, "/houses");
    final client = http.Client();
    final response = await client.get(uri);
    final json = jsonDecode(response.body) as List;

    try {
      final List<Product> houses = [];
      for (var obj in json) {
        houses.add(Product.fromJson(obj));
      }
      return houses;
    } catch (e) {
      throw (e);
    } finally {
      client.close();
    }
  }
}
