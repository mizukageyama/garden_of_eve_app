import 'package:garden_of_eve/features/products/domain/product_model.dart';
import 'package:garden_of_eve/utils/dio_network/dio_exception.dart';
import 'package:dio/dio.dart';

class FavoritesRepository {
  //final FavoritesApi _favApi = FavoritesApi();
  int totalPages = 0;
  final Map<String, dynamic> rawData = {
    'favorites': [
      {
        "id": 7,
        "name": "Barrel Cactus Small",
        "description":
            "Barrel cacti grow into a squat tubular shape, giving it the appearance of a very spiky ribbed barrel. The genus name Ferocactus is Latin for “fierce cactus,” an apt description that will be affirmed by any who have seen the densely packed, stiff spines covering the fleshy-looking plant.",
        "sunlight": "Full",
        "watering": "Once a week",
        "lifespan": "50 - 100 years",
        "size": "10 - 15 cm",
        "category": ["Indoor"],
        "qty": 20,
        "price": 400,
        "img_directory": "Products/Barrel_Cactus_Small_mhsdrc",
        "img_url":
            "https://res.cloudinary.com/dcseyuhyn/image/upload/v1659340386/Products/Barrel_Cactus_Small_mhsdrc.png",
        "img_credit": "Photo by rawpixel.com on FreePik",
        "created_at": "2022-08-02 10:55:04",
        "modified_at": "2022-08-02 10:55:04"
      },
      {
        "id": 8,
        "name": "Birds Nest Fern Plant",
        "description":
            "Evergreen, with solid, undivided fronds that may be a consistent width from top to bottom or taper, depending on the species. Each frond has a dark central rib down its length; in Asplenium australasicum, the rib is prominent underneath, giving the frond a boat-keeled appearance.",
        "sunlight": "Shade",
        "watering": "1 - 2 times a week",
        "lifespan": "Perennial",
        "size": "2 - 5 ft",
        "category": ["Indoor"],
        "qty": 20,
        "price": 300,
        "img_directory": "Products/Birds_Nest_Fern_Plant_utnbqd",
        "img_url":
            "https://res.cloudinary.com/dcseyuhyn/image/upload/v1659340386/Products/Birds_Nest_Fern_Plant_utnbqd.png",
        "img_credit": "Photo by rawpixel.com on FreePik",
        "created_at": "2022-08-02 10:55:14",
        "modified_at": "2022-08-02 10:55:14"
      },
      {
        "id": 9,
        "name": "Bougainvillea Bonsai Tree",
        "description":
            "Fast growing, tolerate pruning very well and are well suited for most bonsai styles. As they are subtropical plants, they can't endure frost and need temperatures around 50° F – 59° F / 10° C – 15° C in winter.",
        "sunlight": "Full",
        "watering": "Water when dry",
        "lifespan": "Perennial",
        "size": "15 - 40 ft",
        "category": ["Indoor", "Outdoor"],
        "qty": 20,
        "price": 7000,
        "img_directory": "Products/Bougainvillea_Bonsai_Tree_ao1cdm",
        "img_url":
            "https://res.cloudinary.com/dcseyuhyn/image/upload/v1659340389/Products/Bougainvillea_Bonsai_Tree_ao1cdm.png",
        "img_credit": "Photo by Devin H on Unsplash",
        "created_at": "2022-08-02 10:55:32",
        "modified_at": "2022-08-02 10:55:32"
      },
      {
        "id": 10,
        "name": "Brooklyn Succulent + Cactus Arrangement",
        "description":
            "Succulents evoke glorious warmth, while ranging widely (and wildly) in form and texture from the bold, columnar magnificence of Cereus and euphorbias to the exquisite, flower-like forms of aeoniums, aloes and echeverias and the rounded shapes of mammillaria and rebutia cacti",
        "sunlight": "Full",
        "watering": "Water when dry",
        "lifespan": "Perennial",
        "size": "1 - 6 ft",
        "category": ["Indoor", "Succulent", "Cactus"],
        "qty": 20,
        "price": 1800,
        "img_directory":
            "Products/Brooklyn_Succulent_Cactus_Arrangement_xt9lqu",
        "img_url":
            "https://res.cloudinary.com/dcseyuhyn/image/upload/v1659339502/Products/Brooklyn_Succulent_Cactus_Arrangement_xt9lqu.png",
        "img_credit": "Photo by Stephanie Harvey on Unsplash",
        "created_at": "2022-08-02 10:55:40",
        "modified_at": "2022-08-02 10:55:40"
      },
      {
        "id": 11,
        "name": "Bunny Ear Cactus",
        "description":
            "Bunny ear cactus (Opuntia microdasys) is a popular houseplant that is not only attractive but is also low-maintenance.",
        "sunlight": "Full",
        "watering": "Water when dry",
        "lifespan": "Perennial",
        "size": "2 - 3 ft",
        "category": ["Indoor", "Cactus"],
        "qty": 20,
        "price": 300,
        "img_directory": "Products/Bunny_Ear_Cactus_bb4dkz",
        "img_url":
            "https://res.cloudinary.com/dcseyuhyn/image/upload/v1659339504/Products/Bunny_Ear_Cactus_bb4dkz.png",
        "img_credit": "Photo by rawpixel.com on FreePik",
        "created_at": "2022-08-02 10:55:47",
        "modified_at": "2022-08-02 10:55:47"
      },
      {
        "id": 12,
        "name": "Bunny Ears Prickly Pear Cactus",
        "description":
            "Opuntia microdasys, also known as the bunny ear cactus or angel's wings, is a small cousin of the more commonly known prickly pear cactus",
        "sunlight": "Full",
        "watering": "Water when dry",
        "lifespan": "Perennial",
        "size": "2 - 3 ft",
        "category": ["Cactus", "Indoor"],
        "qty": 20,
        "price": 500,
        "img_directory": "Products/Bunny_Eears_Prickly_Pear_Cactus_gvmvzq",
        "img_url":
            "https://res.cloudinary.com/dcseyuhyn/image/upload/v1659339504/Products/Bunny_Eears_Prickly_Pear_Cactus_gvmvzq.png",
        "img_credit": "Photo by Nathan Dumlao on Unsplash",
        "created_at": "2022-08-02 10:56:02",
        "modified_at": "2022-08-02 10:56:02"
      }
    ]
  };

  Future<List<Product>> geFavorites(int userId, int page) async {
    try {
      //final response = await _favApi.getFavorites(userId, page);
      // final Map<String, dynamic> rawData = response.data['data'];
      // totalPages = rawData['total_pages'];
      final favProduct =
          rawData['favorites'].map((data) => Product.fromJson(data)).toList();
      return List<Product>.from(favProduct);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  int get totalPage => totalPages;
}
