class Endpoints {
  Endpoints._();

  // base url
  //static const String baseUrl = "http://10.0.2.2:3000/api/";
  static const String baseUrl =
      "http://goerestapi-env-1.eba-endpnfax.ap-south-1.elasticbeanstalk.com/api/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String auth = '/auth';
  static const String users = '/users';
  static const String products = '/products';
  static const String cart = '/cart';
}
