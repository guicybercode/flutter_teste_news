# News Portal - Aplicação de Notícias Responsiva

Uma aplicação moderna de notícias desenvolvida em Flutter com design responsivo, gráficos interativos e navegação intuitiva.

## ✨ Características

- **Design Responsivo**: Adapta-se automaticamente a mobile, tablet e desktop
- **Autenticação**: Sistema de login com validação
- **Gráfico de Tendências**: Visualização de volume de notícias dos últimos 7 dias usando fl_chart
- **Categorias**: 6 categorias de notícias (Política, Esportes, Tecnologia, Entretenimento, Economia, Saúde)
- **Notícias Salvas**: Sistema de favoritos para salvar notícias
- **Navegação Intuitiva**: Bottom Navigation Bar em mobile e Navigation Rail em desktop
- **Perfil de Usuário**: Visualização de estatísticas e informações do usuário

## 🚀 Tecnologias Utilizadas

- **Flutter**: Framework principal
- **Provider**: Gerenciamento de estado
- **fl_chart**: Biblioteca de gráficos
- **Google Fonts**: Fontes personalizadas
- **Material Design 3**: Interface moderna

## 📱 Estrutura do Projeto

```
lib/
├── models/           # Modelos de dados
│   ├── category_model.dart
│   ├── news_model.dart
│   └── user_model.dart
├── providers/        # Gerenciamento de estado
│   ├── auth_provider.dart
│   └── news_provider.dart
├── screens/          # Telas da aplicação
│   ├── login_screen.dart
│   ├── main_layout.dart
│   ├── home_screen.dart
│   ├── categories_screen.dart
│   ├── category_news_screen.dart
│   ├── saved_screen.dart
│   ├── profile_screen.dart
│   └── news_detail_screen.dart
├── services/         # Serviços e dados mock
│   ├── auth_service.dart
│   ├── news_service.dart
│   └── chart_service.dart
├── widgets/          # Componentes reutilizáveis
│   ├── category_card.dart
│   ├── news_card.dart
│   └── news_trend_chart.dart
└── main.dart         # Ponto de entrada
```

## 🎯 Funcionalidades

### Tela de Login
- Validação de email e senha
- Interface moderna com gradientes
- Design responsivo

### Página Inicial
- Carrossel de notícias em destaque
- Gráfico de linha mostrando tendências
- Grid de notícias (responsivo)
- Pull-to-refresh

### Categorias
- Grid de categorias coloridas
- Navegação para notícias filtradas
- Design adaptativo

### Notícias Salvas
- Lista de notícias favoritadas
- Gerenciamento de favoritos

### Perfil
- Informações do usuário
- Estatísticas (lidas, salvas, categorias)
- Opções de configuração
- Botão de logout

### Detalhes da Notícia
- Imagem em destaque
- Conteúdo completo
- Botões de ação (curtir, comentar, compartilhar)
- Sistema de favoritos

## 🔧 Como Executar

1. **Pré-requisitos**:
   - Flutter SDK instalado
   - Editor (VS Code, Android Studio, etc.)

2. **Instalar dependências**:
   ```bash
   flutter pub get
   ```

3. **Executar aplicação**:
   ```bash
   flutter run
   ```

## 🔐 Login

Para fazer login, use **qualquer email** e uma **senha com pelo menos 6 caracteres**.

Exemplos:
- Email: `usuario@exemplo.com`
- Senha: `123456`

## 📊 Dados de Demonstração

A aplicação utiliza dados mock (estáticos) para demonstração:
- 12 notícias pré-carregadas
- 6 categorias diferentes
- Dados de gráfico simulados

## 🎨 Design Responsivo

### Mobile (< 600px)
- Bottom Navigation Bar
- Lista de notícias em coluna única
- Layout otimizado para toque

### Tablet (600px - 1200px)
- Bottom Navigation Bar
- Grid de 2 colunas para notícias
- Espaçamento otimizado

### Desktop (> 1200px)
- Navigation Rail lateral
- Grid de 3-4 colunas para notícias
- Aproveitamento de espaço horizontal

## 📦 Dependências Principais

```yaml
dependencies:
  provider: ^6.1.0        # Gerenciamento de estado
  fl_chart: ^0.68.0       # Gráficos
  google_fonts: ^6.1.0    # Fontes
  intl: ^0.19.0          # Formatação de datas
```

## 🌟 Recursos Futuros

- [ ] Integração com API real de notícias
- [ ] Sistema de comentários
- [ ] Compartilhamento em redes sociais
- [ ] Modo escuro
- [ ] Notificações push
- [ ] Busca de notícias
- [ ] Filtros avançados

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais e demonstração.
