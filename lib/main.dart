import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphical_abstract/theme/theme.dart';
import 'package:graphical_abstract/theme/theme_const.dart';
import 'package:graphical_abstract/view/home_view.dart';
import 'package:graphical_abstract/viewmodel/graphical_abstract_viewmodel.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // Add MetaSEO just into Web platform condition
  if (kIsWeb) {
    // Define MetaSEO object
    MetaSEO meta = MetaSEO();
    meta.config();
    // add meta seo data for web app as you want
    meta.author(author: 'Rafeeque Mavoor & Shajin KP.');
    meta.description(description: 'Analyze your scientific research papers with our revolutionary Graphical Abstract Analyzer & Suggestion AI tool. ');
    meta.keywords(keywords: 'graphical abstract powerpoint, graphical abstract illustrator, graphical abstract analyzer, medicine graphical abstract,what is a graphical abstract, ai image analysis, scientific illustration software, graphical abstract design for manuscript, how to make graphical abstract of article, how to make a graphical abstract using powerpoint, how to prepare graphical abstract, how to make graphical abstract for your manuscript, graphical abstract mak, graphical abstract maker online, elsevie, scientific illustration software, ai for research');
    meta.nameContent(name: "title", content: "labcanvas.io | Graphical Abstract Analyzer");
    meta.ogTitle(ogTitle: "labcanvas.io | Graphical Abstract Analyzer");
    meta.ogDescription(ogDescription: "Analyze your scientific research papers with our revolutionary Graphical Abstract Analyzer & Suggestion AI tool. ");
    meta.ogImage(ogImage: "https://iili.io/JRVAeOG.md.png");
    meta.robots(robotsName: RobotsName.google, content: "index, follow");
    meta.robots(robotsName: RobotsName.googleBot, content: "index, follow");
    meta.robots(robotsName: RobotsName.googleBotNews, content: "index, follow");
    meta.robots(robotsName: RobotsName.googleSiteVerification, content: "index, follow");
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GraphicalAbstractViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: CONST.appName,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightMood,
        navigatorKey: CONST.navigatorKey,
        home: const HomeView(),
      ),
    );
  }
}
