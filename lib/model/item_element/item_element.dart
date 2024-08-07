import 'dart:core';

import 'package:github_bloc_task/model/item_owner/item_owner.dart';
import 'package:json_annotation/json_annotation.dart';


part 'item_element.g.dart';

@JsonSerializable()
class ItemElement {
  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  ItemOwner? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? hooksUrl;
  String? issueEventsUrl;
  String? eventsUrl;
  String? assigneesUrl;
  String? branchesUrl;
  String? tagsUrl;
  String? blobsUrl;
  String? gitTagsUrl;
  String? gitRefsUrl;
  String? treesUrl;
  String? statusesUrl;
  String? languagesUrl;
  String? stargazersUrl;
  String? contributorsUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? commitsUrl;
  String? gitCommitsUrl;
  String? commentsUrl;
  String? issueCommentUrl;
  String? contentsUrl;
  String? compareUrl;
  String? mergesUrl;
  String? archiveUrl;
  String? downloadsUrl;
  String? issuesUrl;
  String? pullsUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? labelsUrl;
  String? releasesUrl;
  String? deploymentsUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? pushedAt;
  String? gitUrl;
  String? sshUrl;
  String? cloneUrl;
  String? svnUrl;
  String? homepage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasDownloads;
  bool? hasWiki;
  bool? hasPages;
  bool? hasDiscussions;
  int? forksCount;
  dynamic mirrorUrl;
  bool? archived;
  bool? disabled;
  int? openIssuesCount;
  dynamic license;
  bool? allowForking;
  bool? isTemplate;
  bool? webCommitSignoffRequired;
  List<String>? topics;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;

  ItemElement({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });

  // From JSON
  factory ItemElement.fromJson(Map<String, dynamic> json) =>
      _$ItemElementFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$ItemElementToJson(this);
}
