export const SiteConfig = {
  title: "Workout Cool",
  description: "Modern fitness coaching platform with comprehensive exercise database",
  keywords: [
    "fitness",
    "workout",
    "exercise",
    "training",
    "muscle building",
    "strength training",
    "bodybuilding",
    "fitness app",
    "workout planner",
    "exercise database",
  ],
  prodUrl: "https://workout.cool",
  logo: "/images/logo.png",
  domain: "workout.cool",
  appIcon: "/images/logo4.jpg",
  company: {
    name: "Workout Cool",
    address: "34 avenue des champ Elysée 75008 Paris, France",
  },
  brand: {
    primary: "#007291",
  },
  email: {
    // Destination of contact / feedback / sponsor forms. Empty = forms are saved (when applicable) but no email is sent.
    contact: process.env.NEXT_PUBLIC_CONTACT_EMAIL ?? "",
  },
  maker: {
    image: "https://workout.cool/images/me/twitter-en.jpg",
    website: "https://workout.cool",
    twitter: "https://twitter.com/workout_cool",
    name: "Workout Cool",
  },
  stores: {
    appStoreId: "6749820499",
    appStoreUrl: "https://apps.apple.com/app/id6749820499",
    androidPackage: "com.workout.cool",
    playStoreUrl: "https://play.google.com/store/apps/details?id=com.workout.cool",
  },
  auth: {
    password: false,
  },
  seo: {
    ogImage: {
      width: 1200,
      height: 630,
    },
    twitterHandle: "@snouzy_biceps",
    applicationName: "Workout Cool",
    category: "fitness",
    classification: "Fitness & Health",
  },
};
