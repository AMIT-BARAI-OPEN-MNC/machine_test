class CustomData {
  String fullUrlimage;
  String smollUrlimage;
  String regularUrlimage;
  int likes;
  String description;
  String username;

  CustomData({
    required this.username,
    required this.fullUrlimage,
    required this.smollUrlimage,
    required this.regularUrlimage,
    required this.likes,
    required this.description,
  });

  factory CustomData.fromJson(Map<String, dynamic> json) {
    return CustomData(
      username: json['sponsorship']?['sponsor']?['social']
              ?['instagram_username'] ??
          '',
      fullUrlimage: json['urls']?['full'] ?? '',
      smollUrlimage: json['urls']?['small'] ?? '',
      regularUrlimage: json['urls']?['regular'] ?? '',
      likes: json['likes'] ?? 0,
      description: json['description'] ?? '',
    );
  }
}

// class ImageModel {
//   String id;
//   String slug;
//   DateTime createdAt;
//   DateTime updatedAt;
//   DateTime? promotedAt;
//   int width;
//   int height;
//   String color;
//   String blurHash;
//   String? description;
//   String altDescription;
//   List<dynamic> breadcrumbs;
//   Urls urls;
//   ImageModelLinks links;
//   int likes;
//   bool likedByUser;
//   List<dynamic> currentUserCollections;
//   Sponsorship? sponsorship;
//   TopicSubmissions topicSubmissions;
//   User user;

//   ImageModel({
//     required this.id,
//     required this.slug,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.promotedAt,
//     required this.width,
//     required this.height,
//     required this.color,
//     required this.blurHash,
//     required this.description,
//     required this.altDescription,
//     required this.breadcrumbs,
//     required this.urls,
//     required this.links,
//     required this.likes,
//     required this.likedByUser,
//     required this.currentUserCollections,
//     required this.sponsorship,
//     required this.topicSubmissions,
//     required this.user,
//   });
// }

// class ImageModelLinks {
//   String self;
//   String html;
//   String download;
//   String downloadLocation;

//   ImageModelLinks({
//     required this.self,
//     required this.html,
//     required this.download,
//     required this.downloadLocation,
//   });
// }

// class Sponsorship {
//   List<String> impressionUrls;
//   String tagline;
//   String taglineUrl;
//   User sponsor;

//   Sponsorship({
//     required this.impressionUrls,
//     required this.tagline,
//     required this.taglineUrl,
//     required this.sponsor,
//   });
// }

// class User {
//   String id;
//   DateTime updatedAt;
//   String username;
//   String name;
//   String firstName;
//   String? lastName;
//   String? twitterUsername;
//   String? portfolioUrl;
//   String? bio;
//   String? location;
//   UserLinks links;
//   ProfileImage profileImage;
//   String instagramUsername;
//   int totalCollections;
//   int totalLikes;
//   int totalPhotos;
//   int totalPromotedPhotos;
//   bool acceptedTos;
//   bool forHire;
//   Social social;

//   User({
//     required this.id,
//     required this.updatedAt,
//     required this.username,
//     required this.name,
//     required this.firstName,
//     required this.lastName,
//     required this.twitterUsername,
//     required this.portfolioUrl,
//     required this.bio,
//     required this.location,
//     required this.links,
//     required this.profileImage,
//     required this.instagramUsername,
//     required this.totalCollections,
//     required this.totalLikes,
//     required this.totalPhotos,
//     required this.totalPromotedPhotos,
//     required this.acceptedTos,
//     required this.forHire,
//     required this.social,
//   });
// }

// class UserLinks {
//   String self;
//   String html;
//   String photos;
//   String likes;
//   String portfolio;
//   String following;
//   String followers;

//   UserLinks({
//     required this.self,
//     required this.html,
//     required this.photos,
//     required this.likes,
//     required this.portfolio,
//     required this.following,
//     required this.followers,
//   });
// }

// class ProfileImage {
//   String small;
//   String medium;
//   String large;

//   ProfileImage({
//     required this.small,
//     required this.medium,
//     required this.large,
//   });
// }

// class Social {
//   String instagramUsername;
//   String? portfolioUrl;
//   String? twitterUsername;
//   dynamic paypalEmail;

//   Social({
//     required this.instagramUsername,
//     required this.portfolioUrl,
//     required this.twitterUsername,
//     required this.paypalEmail,
//   });
// }

// class TopicSubmissions {
//   Spirituality? spirituality;
//   ArchitectureInterior? film;
//   Spirituality? streetPhotography;
//   ArchitectureInterior? experimental;
//   ArchitectureInterior? architectureInterior;
//   ArchitectureInterior? travel;
//   ArchitectureInterior? wallpapers;
//   Spirituality? texturesPatterns;
//   ArchitectureInterior? nature;

//   TopicSubmissions({
//     this.spirituality,
//     this.film,
//     this.streetPhotography,
//     this.experimental,
//     this.architectureInterior,
//     this.travel,
//     this.wallpapers,
//     this.texturesPatterns,
//     this.nature,
//   });
// }

// class ArchitectureInterior {
//   String status;

//   ArchitectureInterior({
//     required this.status,
//   });
// }

// class Spirituality {
//   String status;
//   DateTime? approvedOn;

//   Spirituality({
//     required this.status,
//     this.approvedOn,
//   });
// }

// class Urls {
//   String raw;
//   String full;
//   String regular;
//   String small;
//   String thumb;
//   String smallS3;

//   Urls({
//     required this.raw,
//     required this.full,
//     required this.regular,
//     required this.small,
//     required this.thumb,
//     required this.smallS3,
//   });
// }
