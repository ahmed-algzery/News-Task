const String newsAPIBaseURL = 'https://finnhub.io/api/v1';
const String newsAPIKey = 'crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg';
const String kDefaultImage =
    "https://mf.b37mrtl.ru/media/pics/static.ar/l/breaking_red.jpg";

const categories = [
  "business",
  "entertainment",
  "general",
  "health",
  "science",
  "sports",
  "technology"
];

const Map<String, String> categoryTranslations = {
  "business": "أعمال",
  "entertainment": "ترفيه",
  "general": "عام",
  "health": "صحة",
  "science": "علوم",
  "sports": "رياضة",
  "technology": "تكنولوجيا",
};