class Course {
  String image;
  String title;
  String category;
  String sologan;
  String reason;
  String value;
  String experienceLevel;
  List<String> listTopic;
  Course({
    required this.image,
    required this.title,
    required this.category,
    required this.sologan,
    required this.reason,
    required this.value,
    required this.experienceLevel,
    required this.listTopic,
  });
}

List<Course> listCourse = [
  Course(
    image: "assets/images/basic_conversastion.png",
    title: "Basic Conversation Topics (New)",
    sologan: "Gain confidence speaking about familiar topics",
    reason:
        "It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you've mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.",
    value:
        "This course covers vocabulary at the CEFR A2 level. You will build confidence while learning to speak about a variety of common, everyday topics. In addition, you will build implicit grammar knowledge as your tutor models correct answers and corrects your mistakes.",
    experienceLevel: "Beginner",
    category: "English For Beginners",
    listTopic: [
      "Foods You Love",
      "Your Job",
      "Playing and Watching Sports",
      "The Best Pet",
      "Having Fun in Your Free Time",
      "Your Daily Routine",
      "Childhood Memories",
      "Your Family Members",
      "Your Hometown",
      "Shopping Habits",
    ],
  ),
  Course(
    image: "assets/images/intermedialy_conversation.png",
    title: "Intermediate Conversation Topics (New)",
    sologan: "Express your ideas and opinions",
    reason:
        "Looking for some variety in your lesson topics? Immerse yourself in English discussion with this set of engaging topics.",
    value:
        "This course covers vocabulary at the CEFR B1-B2 levels. You will work on improving fluency and comprehension by discussing a variety of topics. In addition, you will receive corrections from a native English speaker to help improve your grammatical accuracy.",
    experienceLevel: "Intermediate",
    category: "English For Beginners",
    listTopic: [
      "Cooking",
      "Your Dream Job",
      "Sports Fitness",
      "Service Animals",
      "Social Activities",
      "Your Ideal Day",
      "Childhood Friendships",
      "The Importance of Family",
      "City Life",
      "Online Shopping",
    ],
  ),
  Course(
    image: "assets/images/human_cycle.png",
    title: "Healthy Mind, Healthy Body (New)",
    sologan: "Let's discuss the many aspects of living a long, happy life",
    reason:
        "Looking for some variety in your lesson topics? Immerse yourself in English discussion with this set of engaging topics.",
    value:
        "Discuss topics related to physical, mental, and emotional health. Learn about other cultures along the way in friendly conversations with tutors.",
    experienceLevel: "Intermediate",
    category: "Conversational English",
    listTopic: [
      "You Are What You Eat",
      "Health and Fitness",
      "Drink Up",
      "Getting Some Zizz",
      "Calm and RnB",
      "Look On The Bright Side",
    ],
  ),
  Course(
    image: "assets/images/movie_television.png",
    title: "Movies and Television (New)",
    sologan: "Let's discuss our preferences and habits surrounding movies and television shows",
    reason:
        "Movies and television shows are common topics of conversation among friends and coworkers. In this course, you will practice discussing the movies and television shows you've seen and sharing your opinions about them.",
    value:
        "You will learn vocabulary related to movies and television. In addition, you will practice the grammatical structures that help you tell a story, and share and explain your likes and dislikes.",
    experienceLevel: "Intermediate",
    category: "Conversational English",
    listTopic: [
      "Your Favorite Movie",
      "Your Favorite TV shows",
      "Film Production",
      "The World of Streaming",
      "Competition Shows",
      "Reality TV",
      "TV And Movie Characters",
      "Animated Movies And TV Series",
      "Movies Around the World",
      "The Future of Entertainment",
    ],
  ),
];
