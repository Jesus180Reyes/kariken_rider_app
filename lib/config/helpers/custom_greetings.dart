String customGreetings() {
  final now = DateTime.now();
  final night = DateTime(now.year, now.month, now.day, 18, 0, 0);
  final afternoon = DateTime(now.year, now.month, now.day, 12, 0, 0);

  if (now.isAfter(night)) return "Buenas Noches";
  if (now.isAfter(afternoon)) return "Buenas Tardes";
  return "Buenos Dias";
}
