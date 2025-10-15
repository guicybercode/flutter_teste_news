# 🤖 PROMPT TÉCNICO - NEWS PORTAL

## PROMPT PARA RECRIAR O PROJETO

```
Crie uma aplicação Flutter de portal de notícias com as seguintes especificações:

DESIGN:
- Paleta: Branco (#FFFFFF), Cinza (#FAFAFA, #757575, #212121), Dourado (#D4AF37)
- Fonte: Poppins (Google Fonts)
- Logo personalizada na tela de login (120x120px) e AppBar (40x40px)
- Material Design 3 com bordas arredondadas (12-24px)
- Totalmente responsivo (mobile/tablet/desktop)

ARQUITETURA:
- State Management: Provider
- Estrutura: Models, Services, Providers, Screens, Widgets
- Padrão: Repository + Observer

DEPENDÊNCIAS:
provider: ^6.1.0
fl_chart: ^0.68.0
google_fonts: ^6.1.0
intl: ^0.19.0

TELAS:
1. Login (autenticação mock, email + senha 6+)
2. Home (carrossel, gráfico de linha, grid de notícias)
3. Categorias (6 categorias em grid)
4. Salvos (favoritos)
5. Perfil (estatísticas, logout)
6. Detalhes (notícia completa)
7. Layout (Bottom Nav mobile, Rail desktop)

DADOS MOCK:
- 12 notícias (2 por categoria)
- 6 categorias: Política, Esportes, Tecnologia, Entretenimento, Economia, Saúde
- Gráfico: últimos 7 dias

FUNCIONALIDADES:
- Sistema de favoritos
- Gráfico de tendências (fl_chart)
- Navegação responsiva
- Pull-to-refresh
- Formatação inteligente de datas
- Contador de leituras
```

---

## ESTRUTURA DE ARQUIVOS

```
lib/
├── models/
│   ├── category_model.dart      # Category(id, name, icon, color)
│   ├── news_model.dart           # News(id, title, content, summary, categoryId, publishedAt, imageUrl, author, isSaved)
│   └── user_model.dart           # User(id, name, email, avatarUrl, joinedAt)
│
├── services/
│   ├── auth_service.dart         # login(), logout(), isLoggedIn()
│   ├── news_service.dart         # getCategories(), getAllNews(), getNewsByCategory()
│   └── chart_service.dart        # getNewsVolumeData()
│
├── providers/
│   ├── auth_provider.dart        # AuthProvider with ChangeNotifier
│   └── news_provider.dart        # NewsProvider with ChangeNotifier
│
├── screens/
│   ├── login_screen.dart         # Form, validation, logo, gradient background
│   ├── main_layout.dart          # NavigationBar (mobile) / NavigationRail (desktop)
│   ├── home_screen.dart          # Carousel, chart, grid
│   ├── categories_screen.dart    # Grid of category cards
│   ├── category_news_screen.dart # Filtered news list
│   ├── saved_screen.dart         # Favorited news
│   ├── profile_screen.dart       # User info, stats, logout
│   └── news_detail_screen.dart   # SliverAppBar, full content
│
├── widgets/
│   ├── news_card.dart            # Card with image, title, summary, author, date
│   ├── category_card.dart        # Card with icon circle, colored background
│   └── news_trend_chart.dart     # LineChart with golden gradient
│
└── main.dart                      # MultiProvider, ThemeData, routes
```

---

## CÓDIGO-CHAVE

### Theme Configuration (main.dart)
```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFFD4AF37),
    primary: Color(0xFFD4AF37),
  ),
  scaffoldBackgroundColor: Color(0xFFFAFAFA),
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF212121),
  ),
)
```

### Provider Setup (main.dart)
```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => NewsProvider()),
  ],
  child: MaterialApp(...)
)
```

### Responsive Layout (main_layout.dart)
```dart
if (isDesktop) {
  // NavigationRail
} else {
  // NavigationBar
}
```

### Chart Configuration (news_trend_chart.dart)
```dart
LineChartData(
  lineBarsData: [
    LineChartBarData(
      gradient: LinearGradient(colors: [Color(0xFFD4AF37), ...]),
      isCurved: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: true, gradient: ...),
    )
  ]
)
```

---

## BREAKPOINTS

```dart
final isDesktop = size.width > 1200;
final isTablet = size.width > 600 && size.width <= 1200;
final isMobile = size.width <= 600;

// Grid columns
int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
```

---

## MOCK DATA STRUCTURE

### Categories
```dart
[
  Category(id: 'politica', name: 'Política', icon: Icons.account_balance, color: Colors.blue),
  Category(id: 'esportes', name: 'Esportes', icon: Icons.sports_soccer, color: Colors.green),
  Category(id: 'tecnologia', name: 'Tecnologia', icon: Icons.computer, color: Colors.purple),
  Category(id: 'entretenimento', name: 'Entretenimento', icon: Icons.movie, color: Colors.orange),
  Category(id: 'economia', name: 'Economia', icon: Icons.attach_money, color: Colors.teal),
  Category(id: 'saude', name: 'Saúde', icon: Icons.health_and_safety, color: Colors.red),
]
```

### News Template
```dart
News(
  id: '1',
  title: 'Título da Notícia',
  summary: 'Resumo breve...',
  content: 'Conteúdo completo com múltiplos parágrafos...',
  categoryId: 'politica',
  publishedAt: DateTime.now().subtract(Duration(hours: 2)),
  imageUrl: 'https://images.unsplash.com/photo-xxxxx',
  author: 'Nome do Autor',
  isSaved: false,
)
```

### Chart Data
```dart
[
  ChartData(date: now.subtract(Duration(days: 6)), newsCount: 12),
  ChartData(date: now.subtract(Duration(days: 5)), newsCount: 18),
  ChartData(date: now.subtract(Duration(days: 4)), newsCount: 15),
  ChartData(date: now.subtract(Duration(days: 3)), newsCount: 22),
  ChartData(date: now.subtract(Duration(days: 2)), newsCount: 28),
  ChartData(date: now.subtract(Duration(days: 1)), newsCount: 25),
  ChartData(date: now, newsCount: 31),
]
```

---

## NAVEGAÇÃO

### Routes (implícitas via Navigator)
```dart
// Login → MainLayout
Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainLayout()));

// News → Detail
Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailScreen(news: news)));

// Category → Category News
Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryNewsScreen(category: category)));

// Logout → Login
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginScreen()), (_) => false);
```

---

## ASSETS

### pubspec.yaml
```yaml
flutter:
  uses-material-design: true
  assets:
    - logo/Copilot_20251015_100041.png
```

### Usage
```dart
Image.asset(
  'logo/Copilot_20251015_100041.png',
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) => Icon(...),
)
```

---

## GRADLE CONFIGURATION

### android/gradle.properties
```properties
android.overridePathCheck=true
```
**Motivo:** Suporta caracteres não-ASCII no caminho (ex: "Área de Trabalho")

---

## WIDGETS CUSTOMIZADOS - SPECS

### NewsCard
- AspectRatio 16:9 para imagem
- Padding: 16px
- BorderRadius: 12px
- Elevation: 2
- Badges: isSaved, author, publishedAt

### CategoryCard
- Border: 1px solid #EEEEEE
- Background: category.color.withAlpha(0.1)
- Icon circle: padding 16px, background category.color.withAlpha(0.2)
- BorderRadius: 16px

### NewsTrendChart
- Height: 200px
- Padding: 24px
- Line width: 4px
- Golden gradient (#D4AF37 → #B8941F)
- Dots: radius 5px, white stroke 2px
- Below gradient: alpha 0.2 → 0.0

---

## FORMATAÇÃO DE DATAS

```dart
String _formatDate(DateTime date) {
  final difference = DateTime.now().difference(date);
  
  if (difference.inMinutes < 60) return '${difference.inMinutes}min atrás';
  if (difference.inHours < 24) return '${difference.inHours}h atrás';
  if (difference.inDays < 7) return '${difference.inDays}d atrás';
  
  return DateFormat('dd/MM/yyyy').format(date);
}
```

---

## PROVIDER USAGE

### AuthProvider
```dart
// Login
final authProvider = Provider.of<AuthProvider>(context, listen: false);
await authProvider.login(email, password);

// Check status
final isLoggedIn = authProvider.isLoggedIn;
final user = authProvider.currentUser;

// Logout
await authProvider.logout();
```

### NewsProvider
```dart
// Get data
final newsProvider = Provider.of<NewsProvider>(context);
final allNews = newsProvider.allNews;
final categories = newsProvider.categories;
final chartData = newsProvider.getChartData();

// Filter
final categoryNews = newsProvider.getNewsByCategory('politica');

// Toggle favorite
newsProvider.toggleSaveNews(news);

// Check saved
final isSaved = newsProvider.isNewsSaved(newsId);
```

---

## RESPONSIVE DESIGN PATTERNS

### Grid
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: isDesktop ? 3 : (isTablet ? 2 : 1),
    childAspectRatio: 0.75,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
  ),
)
```

### Carrossel
```dart
SizedBox(
  height: 200,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => Container(
      width: isDesktop ? 400 : 300,
      margin: EdgeInsets.only(right: 16),
    ),
  ),
)
```

---

## COMANDOS

### Setup
```bash
flutter create project_sekai
cd project_sekai
# Adicionar dependências ao pubspec.yaml
flutter pub get
```

### Executar
```bash
flutter run -d chrome       # Web
flutter run -d windows      # Windows
flutter run -d android      # Android
```

### Build
```bash
flutter build web           # Web build
flutter build windows       # Windows build
flutter build apk           # Android APK
```

### Manutenção
```bash
flutter clean               # Limpar cache
flutter pub get             # Atualizar dependências
flutter pub outdated        # Ver pacotes desatualizados
flutter doctor              # Verificar instalação
```

---

## CHECKLIST DE IMPLEMENTAÇÃO

### Fase 1 - Setup
- [x] Criar projeto Flutter
- [x] Adicionar dependências
- [x] Configurar assets
- [x] Configurar tema

### Fase 2 - Models & Services
- [x] Criar modelos de dados
- [x] Implementar serviços mock
- [x] Criar dados de demonstração

### Fase 3 - Providers
- [x] Implementar AuthProvider
- [x] Implementar NewsProvider
- [x] Configurar MultiProvider

### Fase 4 - Widgets
- [x] NewsCard
- [x] CategoryCard
- [x] NewsTrendChart

### Fase 5 - Screens
- [x] LoginScreen
- [x] HomeScreen
- [x] CategoriesScreen
- [x] SavedScreen
- [x] ProfileScreen
- [x] NewsDetailScreen
- [x] MainLayout

### Fase 6 - Polish
- [x] Design responsivo
- [x] Cores e tipografia
- [x] Logo e assets
- [x] Tratamento de erros
- [x] Loading states

### Fase 7 - Finalização
- [x] Testes manuais
- [x] Correção de bugs
- [x] Lint checks
- [x] Documentação

---

## TROUBLESHOOTING GUIDE

### Problema: Logo não aparece
```bash
flutter clean
flutter pub get
# Verificar caminho no pubspec.yaml
```

### Problema: Erro de build
```bash
flutter clean
rm -rf build/
flutter pub get
flutter run
```

### Problema: Provider não atualiza
```dart
// Use listen: false quando não precisa rebuild
Provider.of<NewsProvider>(context, listen: false).method();

// Use Consumer quando precisa rebuild
Consumer<NewsProvider>(builder: (context, newsProvider, child) => ...)
```

### Problema: Caracteres especiais no path
```properties
# android/gradle.properties
android.overridePathCheck=true
```

---

## PERFORMANCE TIPS

1. **Use const constructors** sempre que possível
2. **ListView.builder** para listas longas
3. **CachedNetworkImage** para imagens (produção)
4. **Lazy loading** para dados grandes
5. **Keys** em listas dinâmicas

---

## PRÓXIMOS PASSOS (Produção)

1. **Backend Integration**
   - Criar API REST
   - Implementar autenticação JWT
   - Database (PostgreSQL/MongoDB)

2. **Features**
   - Busca e filtros
   - Paginação
   - Cache offline
   - Notificações push

3. **Otimização**
   - Image optimization
   - Code splitting
   - Service workers (PWA)
   - Analytics

4. **Deploy**
   - Web: Firebase Hosting / Vercel
   - Mobile: Google Play / App Store
   - Backend: AWS / Google Cloud

---

**Este prompt permite recriar todo o projeto do zero ou entender sua estrutura completa.**


