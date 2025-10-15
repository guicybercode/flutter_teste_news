class ChartData {
  final DateTime date;
  final int newsCount;

  ChartData({required this.date, required this.newsCount});
}

class ChartService {
  List<ChartData> getNewsVolumeData() {
    final now = DateTime.now();
    return [
      ChartData(
        date: now.subtract(const Duration(days: 6)),
        newsCount: 12,
      ),
      ChartData(
        date: now.subtract(const Duration(days: 5)),
        newsCount: 18,
      ),
      ChartData(
        date: now.subtract(const Duration(days: 4)),
        newsCount: 15,
      ),
      ChartData(
        date: now.subtract(const Duration(days: 3)),
        newsCount: 22,
      ),
      ChartData(
        date: now.subtract(const Duration(days: 2)),
        newsCount: 28,
      ),
      ChartData(
        date: now.subtract(const Duration(days: 1)),
        newsCount: 25,
      ),
      ChartData(
        date: now,
        newsCount: 31,
      ),
    ];
  }
}



