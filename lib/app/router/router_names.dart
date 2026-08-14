/// Canonical list of app route names and their path segments.
enum AppRoutersName {
  battlePass('/'),
  quests('/quests');

  const AppRoutersName(this.route);

  final String route;
}
