import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../models/news_model.dart';

class NewsService {
  static final List<Category> _categories = [
    Category(
      id: 'politica',
      name: 'Política',
      icon: Icons.account_balance,
      color: Colors.blue,
    ),
    Category(
      id: 'esportes',
      name: 'Esportes',
      icon: Icons.sports_soccer,
      color: Colors.green,
    ),
    Category(
      id: 'tecnologia',
      name: 'Tecnologia',
      icon: Icons.computer,
      color: Colors.purple,
    ),
    Category(
      id: 'entretenimento',
      name: 'Entretenimento',
      icon: Icons.movie,
      color: Colors.orange,
    ),
    Category(
      id: 'economia',
      name: 'Economia',
      icon: Icons.attach_money,
      color: Colors.teal,
    ),
    Category(
      id: 'saude',
      name: 'Saúde',
      icon: Icons.health_and_safety,
      color: Colors.red,
    ),
  ];

  static final List<News> _mockNews = [
    // Política
    News(
      id: '1',
      title: 'Congresso aprova nova reforma tributária',
      summary: 'Deputados e senadores aprovam mudanças significativas no sistema tributário nacional.',
      content: 'Em sessão histórica, o Congresso Nacional aprovou uma ampla reforma tributária que promete simplificar o sistema de impostos do país. A medida foi aprovada com 350 votos favoráveis e representa uma das maiores mudanças fiscais das últimas décadas.\n\nA reforma prevê a unificação de diversos impostos federais, estaduais e municipais em um único tributo sobre valor agregado. Segundo os especialistas, a medida pode reduzir a burocracia e aumentar a competitividade da economia brasileira.\n\nEmpresários comemoraram a aprovação, mas alertam que a implementação precisa ser feita de forma gradual para evitar impactos negativos. A expectativa é que as primeiras mudanças comecem a valer já no próximo ano fiscal.',
      categoryId: 'politica',
      publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
      imageUrl: 'https://images.unsplash.com/photo-1541872703-74c5e44368f9?w=800',
      author: 'Maria Silva',
    ),
    News(
      id: '2',
      title: 'Presidente anuncia investimentos em infraestrutura',
      summary: 'Governo federal divulga plano de R\$ 500 bilhões para obras públicas.',
      content: 'O presidente anunciou hoje um ambicioso plano de investimentos em infraestrutura que deve movimentar R\$ 500 bilhões nos próximos quatro anos. O plano contempla obras em rodovias, ferrovias, portos e aeroportos em todo o país.\n\nSegundo o ministro da Infraestrutura, os investimentos serão feitos em parceria com o setor privado através de concessões e PPPs. A expectativa é gerar mais de 2 milhões de empregos diretos e indiretos.\n\nAs obras devem começar no segundo semestre deste ano, com prioridade para regiões que apresentam maior déficit de infraestrutura.',
      categoryId: 'politica',
      publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
      imageUrl: 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800',
      author: 'João Santos',
    ),

    // Esportes
    News(
      id: '3',
      title: 'Seleção brasileira vence amistoso por 3 a 1',
      summary: 'Brasil mostra bom futebol e vence adversário europeu em preparação para Copa.',
      content: 'A Seleção Brasileira venceu por 3 a 1 em partida amistosa disputada em Londres. Os gols brasileiros foram marcados por Neymar, Vinicius Jr. e Richarlison, enquanto o time adversário descontou no segundo tempo.\n\nO técnico Tite elogiou a atuação da equipe e destacou a importância dos amistosos para testar novas formações táticas. "Estamos em um processo de evolução constante e esses jogos são fundamentais", disse o treinador.\n\nA próxima partida da Seleção será contra Argentina, em Buenos Aires, no próximo mês. O confronto é aguardado com grande expectativa pelos torcedores dos dois países.',
      categoryId: 'esportes',
      publishedAt: DateTime.now().subtract(const Duration(hours: 3)),
      imageUrl: 'https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=800',
      author: 'Pedro Costa',
    ),
    News(
      id: '4',
      title: 'Atleta brasileiro conquista medalha de ouro em campeonato mundial',
      summary: 'Desempenho histórico coloca Brasil no topo do pódio pela primeira vez.',
      content: 'O atleta brasileiro Fernando Lima conquistou a medalha de ouro no Campeonato Mundial de Atletismo, estabelecendo um novo recorde sul-americano na prova dos 400 metros com barreiras.\n\nCom o tempo de 47.23 segundos, Fernando superou favoritos e garantiu o primeiro lugar no pódio. "É a realização de um sonho. Todo o sacrifício e treinamento valeram a pena", declarou emocionado.\n\nA conquista representa um marco histórico para o atletismo brasileiro e aumenta as expectativas para os próximos Jogos Olímpicos.',
      categoryId: 'esportes',
      publishedAt: DateTime.now().subtract(const Duration(hours: 8)),
      imageUrl: 'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=800',
      author: 'Ana Oliveira',
    ),

    // Tecnologia
    News(
      id: '5',
      title: 'Nova versão de IA supera expectativas em testes',
      summary: 'Inteligência artificial mostra capacidades surpreendentes em diversas áreas.',
      content: 'Uma nova versão de inteligência artificial desenvolvida por pesquisadores superou todas as expectativas em testes realizados recentemente. O sistema demonstrou capacidades avançadas em compreensão de linguagem, raciocínio lógico e resolução de problemas complexos.\n\nOs cientistas responsáveis pelo projeto afirmam que a tecnologia pode revolucionar diversos setores, desde a medicina até a educação. "Estamos diante de um avanço significativo que pode transformar a forma como interagimos com máquinas", explicou a líder da equipe.\n\nA empresa planeja lançar uma versão comercial do sistema ainda este ano, com aplicações voltadas para empresas e desenvolvedores.',
      categoryId: 'tecnologia',
      publishedAt: DateTime.now().subtract(const Duration(hours: 1)),
      imageUrl: 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=800',
      author: 'Carlos Tech',
    ),
    News(
      id: '6',
      title: 'Smartphone dobrável chega ao mercado brasileiro',
      summary: 'Tecnologia inovadora promete revolucionar experiência mobile.',
      content: 'O tão aguardado smartphone dobrável finalmente chegou ao mercado brasileiro. O dispositivo, que pode ser transformado de telefone em tablet, traz tecnologia de ponta e design inovador.\n\nCom tela OLED de 7.6 polegadas quando aberto e 6.2 polegadas quando fechado, o aparelho oferece versatilidade sem precedentes. O preço sugerido é de R\$ 12.999, posicionando-o como um produto premium.\n\nEspecialistas apontam que a tecnologia dobrável representa o futuro dos dispositivos móveis, apesar do preço ainda elevado para o consumidor médio.',
      categoryId: 'tecnologia',
      publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
      imageUrl: 'https://images.unsplash.com/photo-1585060544812-6b45742d762f?w=800',
      author: 'Lucia Digital',
    ),

    // Entretenimento
    News(
      id: '7',
      title: 'Festival de cinema anuncia programação completa',
      summary: 'Evento contará com premiações e lançamentos exclusivos.',
      content: 'O maior festival de cinema do país anunciou sua programação completa para a edição deste ano. Serão exibidos mais de 200 filmes de 40 países diferentes, incluindo estreias mundiais e produções nacionais.\n\nEntre os destaques estão a cerimônia de premiação que contará com a presença de grandes nomes do cinema internacional e a mostra competitiva de produções brasileiras.\n\nOs ingressos já estão à venda e a expectativa é de público recorde, superando as 300 mil pessoas que compareceram no ano passado.',
      categoryId: 'entretenimento',
      publishedAt: DateTime.now().subtract(const Duration(hours: 4)),
      imageUrl: 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=800',
      author: 'Fernanda Arte',
    ),
    News(
      id: '8',
      title: 'Banda anuncia turnê mundial com passagem pelo Brasil',
      summary: 'Show prometem reunir milhares de fãs em estádios pelo país.',
      content: 'A famosa banda internacional anunciou oficialmente sua turnê mundial, que incluirá apresentações em cinco cidades brasileiras. Os shows estão programados para acontecer entre março e abril do próximo ano.\n\nOs ingressos começam a ser vendidos na próxima semana, com valores a partir de R\$ 250 para o setor pista. A produção promete um espetáculo grandioso com efeitos especiais e setlist recheada de sucessos.\n\nFãs brasileiros já demonstram grande expectativa nas redes sociais, movimentando hashtags relacionadas ao evento.',
      categoryId: 'entretenimento',
      publishedAt: DateTime.now().subtract(const Duration(hours: 7)),
      imageUrl: 'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=800',
      author: 'Ricardo Music',
    ),

    // Economia
    News(
      id: '9',
      title: 'Bolsa de valores atinge novo recorde histórico',
      summary: 'Ibovespa supera marca de 140 mil pontos impulsionado por otimismo.',
      content: 'A Bolsa de Valores de São Paulo fechou em alta histórica nesta terça-feira, superando a marca dos 140 mil pontos pela primeira vez. O otimismo dos investidores foi impulsionado por dados positivos da economia e expectativas de juros mais baixos.\n\nAnalistas do mercado financeiro destacam que o momento é favorável para investimentos em ações, mas alertam para a necessidade de diversificação. "É importante que os investidores mantenham uma estratégia equilibrada", recomenda um especialista.\n\nO dólar encerrou o dia em queda, cotado a R\$ 4,85, refletindo a confiança no mercado interno.',
      categoryId: 'economia',
      publishedAt: DateTime.now().subtract(const Duration(hours: 4)),
      imageUrl: 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=800',
      author: 'Marcos Finanças',
    ),
    News(
      id: '10',
      title: 'Inflação desacelera e fica abaixo das expectativas',
      summary: 'Índice registra menor valor em 12 meses, animando mercado.',
      content: 'O IPCA registrou alta de 0,23% em setembro, ficando abaixo das expectativas do mercado que projetavam 0,31%. Com isso, a inflação acumulada em 12 meses cai para 4,82%, dentro da meta estabelecida pelo Banco Central.\n\nA desaceleração foi puxada principalmente pela queda nos preços de alimentos e combustíveis. Economistas avaliam que há espaço para novos cortes na taxa Selic nas próximas reuniões do Copom.\n\nO resultado positivo fortalece as expectativas de crescimento econômico mais robusto para o próximo ano.',
      categoryId: 'economia',
      publishedAt: DateTime.now().subtract(const Duration(hours: 10)),
      imageUrl: 'https://images.unsplash.com/photo-1579621970563-ebec7560ff3e?w=800',
      author: 'Paula Economia',
    ),

    // Saúde
    News(
      id: '11',
      title: 'Novo tratamento promissor contra tipo raro de câncer',
      summary: 'Pesquisa brasileira desenvolve terapia inovadora com resultados animadores.',
      content: 'Pesquisadores brasileiros desenvolveram um novo tratamento que se mostrou eficaz contra um tipo raro de câncer. Os testes clínicos demonstraram taxa de sucesso de 78% na redução de tumores.\n\nA terapia utiliza técnicas de imunoterapia combinadas com medicamentos de precisão. "Os resultados são extremamente promissores e podem mudar o prognóstico de milhares de pacientes", afirma a coordenadora da pesquisa.\n\nO tratamento deve passar por novas fases de testes antes de ser disponibilizado para uso em larga escala, processo que pode levar cerca de dois anos.',
      categoryId: 'saude',
      publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
      imageUrl: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=800',
      author: 'Dr. Roberto Saúde',
    ),
    News(
      id: '12',
      title: 'Campanha de vacinação bate meta em tempo recorde',
      summary: 'Mais de 90% do público-alvo foi imunizado em três semanas.',
      content: 'A campanha nacional de vacinação superou as expectativas ao atingir 92% do público-alvo em apenas três semanas. O resultado é considerado um sucesso pelo Ministério da Saúde.\n\nA alta adesão foi atribuída à ampla divulgação e facilidade de acesso aos postos de vacinação. Foram aplicadas mais de 45 milhões de doses em todo o país.\n\nAs autoridades sanitárias agradecem a colaboração da população e reforçam a importância da imunização para prevenir surtos de doenças.',
      categoryId: 'saude',
      publishedAt: DateTime.now().subtract(const Duration(hours: 12)),
      imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=800',
      author: 'Dra. Sandra Med',
    ),
  ];

  List<Category> getCategories() {
    return _categories;
  }

  List<News> getAllNews() {
    return _mockNews;
  }

  List<News> getNewsByCategory(String categoryId) {
    return _mockNews.where((news) => news.categoryId == categoryId).toList();
  }

  List<News> getTopNews({int limit = 5}) {
    return _mockNews.take(limit).toList();
  }

  News? getNewsById(String id) {
    try {
      return _mockNews.firstWhere((news) => news.id == id);
    } catch (e) {
      return null;
    }
  }

  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((cat) => cat.id == id);
    } catch (e) {
      return null;
    }
  }
}



