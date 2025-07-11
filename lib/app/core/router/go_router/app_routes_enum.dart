enum AppRoutes {
  splash(path: '/splash', name: 'splash'),
  leading(path: '/leading', name: 'leading'),
  catDetail(path: '/cat_detail', name: 'cat_detail'),
  catSearchList(path: '/cat_search', name: 'cat_serach'),
  catResourcesWebView(path: '/cat_resources', name: 'cat_resources');

  const AppRoutes({required this.path, required this.name});

  final String path;
  final String name;
}
