import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../models/category_model.dart';
import '../services/news_service.dart';
import '../services/chart_service.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  final ChartService _chartService = ChartService();
  
  List<News> _allNews = [];
  final List<News> _savedNews = [];
  int _newsReadCount = 0;

  NewsProvider() {
    _loadNews();
  }

  List<News> get allNews => _allNews;
  List<News> get savedNews => _savedNews;
  int get newsReadCount => _newsReadCount;
  List<Category> get categories => _newsService.getCategories();

  void _loadNews() {
    _allNews = _newsService.getAllNews();
    notifyListeners();
  }

  List<News> getNewsByCategory(String categoryId) {
    return _newsService.getNewsByCategory(categoryId);
  }

  List<News> getTopNews({int limit = 5}) {
    return _newsService.getTopNews(limit: limit);
  }

  News? getNewsById(String id) {
    return _newsService.getNewsById(id);
  }

  Category? getCategoryById(String id) {
    return _newsService.getCategoryById(id);
  }

  void toggleSaveNews(News news) {
    final index = _allNews.indexWhere((n) => n.id == news.id);
    if (index != -1) {
      _allNews[index] = _allNews[index].copyWith(isSaved: !_allNews[index].isSaved);
      
      if (_allNews[index].isSaved) {
        _savedNews.add(_allNews[index]);
      } else {
        _savedNews.removeWhere((n) => n.id == news.id);
      }
      
      notifyListeners();
    }
  }

  bool isNewsSaved(String newsId) {
    return _allNews.any((news) => news.id == newsId && news.isSaved);
  }

  void incrementReadCount() {
    _newsReadCount++;
    notifyListeners();
  }

  List<ChartData> getChartData() {
    return _chartService.getNewsVolumeData();
  }
}

