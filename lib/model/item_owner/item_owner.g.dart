// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOwner _$ItemOwnerFromJson(Map<String, dynamic> json) => ItemOwner(
      login: json["login"],
      id: json["id"],
      nodeId: json["node_id"],
      avatarUrl: json["avatar_url"],
      gravatarId: json["gravatar_id"],
      url: json["url"],
      htmlUrl: json["html_url"],
      followersUrl: json["followers_url"],
      followingUrl: json["following_url"],
      gistsUrl: json["gists_url"],
      starredUrl: json["starred_url"],
      subscriptionsUrl: json["subscriptions_url"],
      organizationsUrl: json["organizations_url"],
      reposUrl: json["repos_url"],
      eventsUrl: json["events_url"],
      receivedEventsUrl: json["received_events_url"],
      type: json["type"],
      siteAdmin: json["site_admin"],
    );

Map<String, dynamic> _$ItemOwnerToJson(ItemOwner instance) => <String, dynamic>{
      "login": instance.login,
      "id": instance.id,
      "node_id": instance.nodeId,
      "avatar_url": instance.avatarUrl,
      "gravatar_id": instance.gravatarId,
      "url": instance.url,
      "html_url": instance.htmlUrl,
      "followers_url": instance.followersUrl,
      "following_url": instance.followingUrl,
      "gists_url": instance.gistsUrl,
      "starred_url": instance.starredUrl,
      "subscriptions_url": instance.subscriptionsUrl,
      "organizations_url": instance.organizationsUrl,
      "repos_url": instance.reposUrl,
      "events_url": instance.eventsUrl,
      "received_events_url": instance.receivedEventsUrl,
      "type": instance.type,
      "site_admin": instance.siteAdmin,
    };
