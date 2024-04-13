class AppwriteConstants {
  static const projectId = '661a62f8c5ace3e04734';
  static const databaseId = '661a64d393b1f909d750';
  static const endPoint = 'https://cloud.appwrite.io/v1';

  static const  oauthProvider = "google";

  static const String usersCollection = '661a65c0ab150c17920e';
  static const String todosCollection = '661a65e4260867db5ec3';
  static const String statsCollection = '661a64d393b1f909d750';

  static const String imagesBucket = '661a6664849a01a91623';

  static String imageUrl(String imageId) => '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}