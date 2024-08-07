// import 'package:background_fetch/background_fetch.dart';
//
// import '../data/remote/github_api_service.dart';
// import '../data/local/database_helper.dart';
//
// void backgroundFetchHeadlessTask(HeadlessTask task) async {
//   final GithubApiService apiService = GithubApiService();
//   final DatabaseHelper dbHelper = DatabaseHelper();
//
//   if (task.timeout) {
//     BackgroundFetch.finish(task.taskId);
//     return;
//   }
//
//   try {
//     final date = DateTime.now().subtract(const Duration(days: 1)).toIso8601String();
//     final items = await apiService.fetchRepositories(date);
//     await dbHelper.insertItems(items);
//   } catch (e) {
//     print('Error: $e');
//   }
//
//   BackgroundFetch.finish(task.taskId);
// }
//
// void initBackgroundFetch() {
//   BackgroundFetch.configure(
//     BackgroundFetchConfig(
//       minimumFetchInterval: 15,
//       stopOnTerminate: false,
//       enableHeadless: true,
//       requiresBatteryNotLow: false,
//       requiresCharging: false,
//       requiresDeviceIdle: false,
//       requiresStorageNotLow: false,
//     ),
//         (String taskId) async {
//       final GithubApiService apiService = GithubApiService();
//       final DatabaseHelper dbHelper = DatabaseHelper();
//
//       try {
//         final date = DateTime.now().subtract(const Duration(days: 1)).toIso8601String();
//         final items = await apiService.fetchRepositories(date);
//         await dbHelper.insertItems(items);
//       } catch (e) {
//         print('Error: $e');
//       }
//
//       BackgroundFetch.finish(taskId);
//     },
//   ).then((int status) {
//     print('BackgroundFetch configure success: $status');
//   }).catchError((e) {
//     print('BackgroundFetch configure ERROR: $e');
//   });
//
//   BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
// }
