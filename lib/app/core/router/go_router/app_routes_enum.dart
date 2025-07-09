enum AppRoutes {
  splash(path: '/splash', name: 'splash'),
  login(path: '/login', name: 'login'),
  home(path: '/home', name: 'home'),
  profile(path: '/profile', name: 'profile'),
  settings(path: '/settings', name: 'settings');

  const AppRoutes({required this.path, required this.name});

  final String path;
  final String name;
  String get url => path;
}
