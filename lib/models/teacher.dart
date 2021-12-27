class Teacher {
  String id;
  String name;
  String country;
  List<String> specialties;
  String avatar;
  double rating;
  String interests;
  String description;
  List<String> language;
  int isFavorite = 0;
  Teacher({
    required this.id,
    required this.name,
    required this.country,
    required this.specialties,
    this.avatar = "",
    required this.rating,
    required this.interests,
    required this.description,
    required this.language,
  });
  favorite() {
    if (isFavorite == 1) {
      isFavorite = 0;
    } else {
      isFavorite = 1;
    }
    
  }
}

List<Teacher> listTeacher = [
  Teacher(
    id: "1",
    name: "April corpuz",
    country: "ph",
    language: ["English"],
    specialties: [
      "English for business",
      "Conversational",
      "English for kids",
      "STARTERS",
      "MOVERS",
    ],
    avatar:
        "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg",
    rating: 4.6,
    interests:
        "Cooking, Mingling with kids, Watch my small retail store, Travelling",
    description:
        "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone. I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners. So don't worry, I will be with you every step of the way going at your own pace. Let's practice what you already know and add something new each day. With my skills and experiences, I can assure you that I can provide adequate English learning effectively and efficiently. Together, let's make English learning fun.",
  ),
  Teacher(
    id: "2",
    name: "Hannah Nguyen",
    country: "vn",
    language: ["English"],
    specialties: [
      "Conversational",
      "English for kids",
      "STARTERS",
      "MOVERS",
      "TOEIC",
      "FLYERS",
    ],
    avatar:
        "https://api.app.lettutor.com/avatar/c6303006-d5d0-45f6-a0ee-89148a51b69eavatar1631108968307.jpg",
    rating: 3.4,
    interests: "Finance, gardening, travelling",
    description:
        "I have been teaching English as a second language for kids, teenagers and adults for 5 years. I can help you gain a stronger foundation in English before furthering your studies. I'm patient, will speak slowly and clearly so don't hesitate to ask for good understanding.",
  ),
  Teacher(
    id: "3",
    name: "Nhi Lam",
    language: ["English"],
    country: "vn",
    specialties: [
      "Conversational",
      "English for kids",
      "IELTS",
    ],
    avatar:
        "https://api.app.lettutor.com/avatar/86248137-6f7d-4cf5-ad2e-34da42722b28avatar1628058042246.jpg",
    rating: 3.8,
    interests: "Finance, gardening, travelling",
    description:
        "Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.",
  ),
  Teacher(
    id: "4",
    name: "Joan Gacer",
    language: ["English", "Filipino"],
    country: "ph",
    specialties: [
      "Conversational",
      "English for kids",
      "IELTS",
      "English for business",
      "STARTERS",
      "MOVERS",
      "PET",
      "KET",
    ],
    avatar:
        "https://api.app.lettutor.com/avatar/8c4e58c4-e9d1-4353-b64d-41b573c5a3e9avatar1632284832414.jpg",
    rating: 4.5,
    interests:
        "I'm an outgoing patient and fun I love spending time with cute nephews and nieces I teach them to become good English speakers. In my spare time, I love to watch movies, read travel and swim I also love meeting new people learning their culture, and share our experiences together I believe language should not be the barrier to share your passion and care for other people that's why I teach English it is my passion to educate and help.",
    description:
        "I was a customer service sales executive for 3 years before I become an ESL teacher I am trained to deliver excellent service to my clients so I can help you with business English dealing with customers or in sales-related jobs and a lot more, I also love to teach beginner, intermediate and advance I speak slowly and clearly so that the student can easily follow my instructions and pronunciation. In my class, I want environment-friendly fun and engaging I have many activities designed to help your enthusiasm in learning the language. I'm so excited to meet you in one of my classes let us have fun while learning English. See you there.",
  ),
  Teacher(
    id: "5",
    name: "Kathy Huỳnh",
    country: 'vn',
    language: ["English", "Vietnamese"],
    specialties: [
      "Conversational",
      "English for kids",
      "STARTERS",
      "MOVERS",
      "PET",
      "KET",
      "FLYERS",
    ],
    avatar:
        "https://api.app.lettutor.com/avatar/7a1067cc-4a79-494d-820c-34e63cf60748avatar1636901693895.jpg",
    rating: 4.5,
    interests:
        "I love spending my free time on watching movies, especially American comedy and horror ones. I can develop my English skill from those exciting films. Other than that, I also enjoy talking with people from different cultures, getting to know more about them, and widening my perspective. Listening to music and traveling are also some of my top favorite things to do when I have spare time.",
    description:
        "Hi! My name is Kathy, I have been using English as a second language since I was young, I also have great experience in teaching and communicating with students. As a friendly and energetic person, I am always ready to help and accompany with you in your English learning journey. I can help you gain confidence in using English and enhance your speaking skill. I know that learning a new language can be full of obstacles; however, do not hesitate and come to my class, I will bring you a friendly classroom with slow speak, a good accent that offers you opportunities to speak more, practice more, learn more about English.",
  ),
  Teacher(
    id: "6",
    name: "Teacher GP",
    country: "vn",
    language: ["English", "Vietnamese"],
    specialties: [
      "Conversational",
      "English for kids",
      "English for business",
    ],
    avatar:
        "https://api.app.lettutor.com/avatar/9f896616-72d6-4d28-8859-de0e90f3c4adavatar1634393619087.jpg",
    rating: 4.5,
    interests:
        "I am mostly interested in Science and Technology or Gadgets. I like reading different trending articles and get updated with the latest current affairs and stuff going around. I am also an advocate and a resource speaker for the welfare of people with visual disability.",
    description:
        "I am an online English tutor for more than 2 years now. I love meeting new people, talking with them and sit on a meaningful conversation while learning about their different cultures at the same time. I could say that I am a people-person because I love stirring up interesting topics relatable to my students' lives. I can help you out with your conversation skills because I am creative, patient and has a great passion in teaching meaningfully. I'll slowly build your pronunciation and vocabulary. Worry not if you feel shy in speaking in English, because the more you engage with me, the next time you knew, you'll be talking straight and will be expressing yourself in a spontaneous way.",
  ),
];
