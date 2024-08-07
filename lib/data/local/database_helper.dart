import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/item.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'repositories.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY,
        node_id TEXT,
        name TEXT,
        full_name TEXT,
        private INTEGER,
        owner TEXT,
        html_url TEXT,
        description TEXT,
        fork INTEGER,
        url TEXT,
        forks_url TEXT,
        keys_url TEXT,
        collaborators_url TEXT,
        teams_url TEXT,
        hooks_url TEXT,
        issue_events_url TEXT,
        events_url TEXT,
        assignees_url TEXT,
        branches_url TEXT,
        tags_url TEXT,
        blobs_url TEXT,
        git_tags_url TEXT,
        git_refs_url TEXT,
        trees_url TEXT,
        statuses_url TEXT,
        languages_url TEXT,
        stargazers_url TEXT,
        contributors_url TEXT,
        subscribers_url TEXT,
        subscription_url TEXT,
        commits_url TEXT,
        git_commits_url TEXT,
        comments_url TEXT,
        issue_comment_url TEXT,
        contents_url TEXT,
        compare_url TEXT,
        merges_url TEXT,
        archive_url TEXT,
        downloads_url TEXT,
        issues_url TEXT,
        pulls_url TEXT,
        milestones_url TEXT,
        notifications_url TEXT,
        labels_url TEXT,
        releases_url TEXT,
        deployments_url TEXT,
        created_at TEXT,
        updated_at TEXT,
        pushed_at TEXT,
        git_url TEXT,
        ssh_url TEXT,
        clone_url TEXT,
        svn_url TEXT,
        homepage TEXT,
        size INTEGER,
        stargazers_count INTEGER,
        watchers_count INTEGER,
        language TEXT,
        has_issues INTEGER,
        has_projects INTEGER,
        has_downloads INTEGER,
        has_wiki INTEGER,
        has_pages INTEGER,
        has_discussions INTEGER,
        forks_count INTEGER,
        mirror_url TEXT,
        archived INTEGER,
        disabled INTEGER,
        open_issues_count INTEGER,
        license TEXT,
        allow_forking INTEGER,
        is_template INTEGER,
        web_commit_signoff_required INTEGER,
        topics TEXT,
        visibility TEXT,
        forks INTEGER,
        open_issues INTEGER,
        watchers INTEGER,
        default_branch TEXT,
      )
    ''');
  }

  Future<void> insertItems(List<ItemElement> items) async {
    final db = await database;
    final batch = db.batch();

    for (var item in items) {
      batch.insert(
        'items',
        item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  Future<List<ItemElement>> getItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('items');

    return List.generate(maps.length, (i) {
      return ItemElement.fromJson(maps[i]);
    });
  }
}
