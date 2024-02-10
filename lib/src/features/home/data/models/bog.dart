class Blog {
  //local purpose only
  bool isFav = false;

  UserData? userData;
  String? id;
  String? title;
  String? description;
  String? source;
  //Stats? stats;
  Share? share;
  Configuration? configuration;
  String? headline;
  String? createdAt;
  String? updatedAt;
  dynamic itemTags;
  dynamic itemTagsByAlpha;
  Owner? owner;
  dynamic curators;

  Blog(
      {this.userData,
        this.id,
        this.title,
        this.description,
        this.source,
        //this.stats,
        this.share,
        this.configuration,
        this.headline,
        this.createdAt,
        this.updatedAt,
        this.itemTags,
        this.itemTagsByAlpha,
        this.owner,
        this.curators});

  Blog.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
    id = json['id'];
    title = json['title'];
    description = json['description'];
    source = json['source'];
    //stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    share = json['share'] != null ? Share.fromJson(json['share']) : null;
    configuration = json['configuration'] != null
        ? Configuration.fromJson(json['configuration'])
        : null;
    headline = json['headline'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['item_tags'] != null) {
      itemTags = <Null>[];
      // json['item_tags'].forEach((v) {
      //   itemTags!.add(new Null.fromJson(v));
      // });
    }
    if (json['item_tags_by_alpha'] != null) {
      itemTagsByAlpha = <Null>[];
      // json['item_tags_by_alpha'].forEach((v) {
      //   itemTagsByAlpha!.add(new Null.fromJson(v));
      // });
    }
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    if (json['curators'] != null) {
      curators = <Null>[];
      // json['curators'].forEach((v) {
      //   curators!.add(new Null.fromJson(v));
      // });
    }
  }

}

class UserData {
  bool? ownedByMe;
  bool? editablebyMe;
  bool? editableByMe;
  bool? favoritedByMe;
  bool? userIsMe;
  bool? followedByMe;

  UserData(
      {this.ownedByMe,
        this.editablebyMe,
        this.editableByMe,
        this.favoritedByMe});

  UserData.fromJson(Map<String, dynamic> json) {
    ownedByMe = json['ownedByMe'];
    editablebyMe = json['editablebyMe'];
    editableByMe = json['editableByMe'];
    favoritedByMe = json['favoritedByMe'];
    userIsMe = json['userIsMe'];
    followedByMe = json['followedByMe'];
  }

}

// class Stats {
//   int? views;
//   int? helperCount;
//   int? publishedItemCount;
//   int? queuedItemCount;
//   int? followerCount;
//   int? favoritesCount;
//   int? totalVotes;
//
//   Stats(
//       {this.views,
//         this.helperCount,
//         this.publishedItemCount,
//         this.queuedItemCount,
//         this.followerCount,
//         this.favoritesCount,
//         this.totalVotes});
//
//   Stats.fromJson(Map<String, dynamic> json) {
//     views = json['views'];
//     helperCount = json['helperCount'];
//     publishedItemCount = json['publishedItemCount'];
//     queuedItemCount = json['queuedItemCount'];
//     followerCount = json['followerCount'];
//     favoritesCount = json['favoritesCount'];
//     totalVotes = json['totalVotes'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['views'] = this.views;
//     data['helperCount'] = this.helperCount;
//     data['publishedItemCount'] = this.publishedItemCount;
//     data['queuedItemCount'] = this.queuedItemCount;
//     data['followerCount'] = this.followerCount;
//     data['favoritesCount'] = this.favoritesCount;
//     data['totalVotes'] = this.totalVotes;
//     return data;
//   }
// }

class Share {
  String? shareTitle;
  String? shareSource;
  String? shareDescription;
  String? image;
  String? shareURL;

  Share(
      {this.shareTitle,
        this.shareSource,
        this.shareDescription,
        this.image,
        this.shareURL});

  Share.fromJson(Map<String, dynamic> json) {
    shareTitle = json['shareTitle'];
    shareSource = json['shareSource'];
    shareDescription = json['shareDescription'];
    image = json['image'];
    shareURL = json['shareURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shareTitle'] = this.shareTitle;
    data['shareSource'] = this.shareSource;
    data['shareDescription'] = this.shareDescription;
    data['image'] = this.image;
    data['shareURL'] = this.shareURL;
    return data;
  }
}

class Configuration {
  bool? isModerated;
  bool? isPrivate;
  bool? userCanAdd;
  bool? userCanComment;
  bool? userCanSeeQueue;
  bool? userCanVote;
  bool? anonymousCanVote;
  bool? votingClosed;
  bool? itemTimestamp;
  bool? emojiVoting;
  String? defaultSort;
  String? defaultLayout;

  Configuration(
      {this.isModerated,
        this.isPrivate,
        this.userCanAdd,
        this.userCanComment,
        this.userCanSeeQueue,
        this.userCanVote,
        this.anonymousCanVote,
        this.votingClosed,
        this.itemTimestamp,
        this.emojiVoting,
        this.defaultSort,
        this.defaultLayout});

  Configuration.fromJson(Map<String, dynamic> json) {
    isModerated = json['isModerated'];
    isPrivate = json['isPrivate'];
    userCanAdd = json['userCanAdd'];
    userCanComment = json['userCanComment'];
    userCanSeeQueue = json['userCanSeeQueue'];
    userCanVote = json['userCanVote'];
    anonymousCanVote = json['anonymousCanVote'];
    votingClosed = json['votingClosed'];
    itemTimestamp = json['itemTimestamp'];
    emojiVoting = json['emojiVoting'];
    defaultSort = json['defaultSort'];
    defaultLayout = json['defaultLayout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isModerated'] = this.isModerated;
    data['isPrivate'] = this.isPrivate;
    data['userCanAdd'] = this.userCanAdd;
    data['userCanComment'] = this.userCanComment;
    data['userCanSeeQueue'] = this.userCanSeeQueue;
    data['userCanVote'] = this.userCanVote;
    data['anonymousCanVote'] = this.anonymousCanVote;
    data['votingClosed'] = this.votingClosed;
    data['itemTimestamp'] = this.itemTimestamp;
    data['emojiVoting'] = this.emojiVoting;
    data['defaultSort'] = this.defaultSort;
    data['defaultLayout'] = this.defaultLayout;
    return data;
  }
}

class Owner {
  UserData? userData;
  dynamic id;
  String? name;
  String? screenName;
  String? profileImage;
  //Stats? stats;
  String? bio;
  Status? status;
  String? headline;

  Owner(
      {this.userData,
        this.id,
        this.name,
        this.screenName,
        this.profileImage,
        //this.stats,
        this.bio,
        this.status,
        this.headline});

  Owner.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    id = json['id'];
    name = json['name'];
    screenName = json['screen_name'];
    profileImage = json['profile_image'];
    //stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    bio = json['bio'];
    status =
    json['status'] != null ? Status.fromJson(json['status']) : null;
    headline = json['headline'];
  }

}




class Status {
  bool? isCurator;
  bool? hasPro;

  Status({this.isCurator, this.hasPro});

  Status.fromJson(Map<String, dynamic> json) {
    isCurator = json['isCurator'];
    hasPro = json['hasPro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCurator'] = this.isCurator;
    data['hasPro'] = this.hasPro;
    return data;
  }
}