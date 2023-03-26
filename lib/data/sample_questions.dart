class QuestionModel {
  String? question;
  Map<String, dynamic>? answers;

  QuestionModel(this.question, this.answers);
}

List<QuestionModel> questions = [
  QuestionModel(
    // Beware the casual committer.
    "Was the individual direct about starting a monogamous relationship with you?",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
  QuestionModel(
    //Beware the everlasting boyfriend.
    "Did the person cheat on you?",
    {
      "Yes": 0.0,
      "No": 1.0,
    },
  ),
  QuestionModel(
    //Beware the one that cuts off your lifelines.
    "Did this person have a similar cultural background as you?",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
  QuestionModel(
    //Beware the overt flirter.
    "What was this person’s income range?",
    {
      "0-\$50,000": 0.25,
      "\$50,000-\$1.000,000": 0.5,
      "\$1.000,000-\$250,000": 0.75,
      "\$250,000 or More": 1.0,
    },
  ),
  QuestionModel(
    //Beware the man who manipulates through charm.
    "Would you refer to this person as Nice or kind?",
    {
      "Nice": 1.0,
      "Kind": 0.0,
    },
  ),
  QuestionModel(
    //Beware the man who is nice to receive rewards.
    "How long did it take for the person to show negative behaviors in the relationship?",
    {
      "Week or Less": 1.0,
      "Month or less": 0.75,
      "1.0 Year or less": 0.5,
      "None": 0.25,
    },
  ),
  QuestionModel(
    //Beware the man that confuses you before you make decisions.
    "Do you believe that this person plays emotional games with people close to them?",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
  QuestionModel(
    //Beware the one that claims you're crazy.
    "Have you caught this person in lies about the fundamentals of who they really are?",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
  QuestionModel(
    //Beware the man that befriends the corrupt.
    "Did the person engage in backhanded compliments?",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
  QuestionModel(
    //Beware the man who has never left Neverland.
    "Did the individual make you question long-held beliefs, question your intellect, or even your level of sanity??",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
  QuestionModel(
    //Beware the one that is disgusted by children.
    "Where did you meet this person?",
    {
      "Online": 0.5,
      "Friend/Family": 1.0,
      "Work": 0.75,
      "Other": 0.25,
    },
  ),
  QuestionModel(
    //Beware the man who lives for the hunt of the flesh.
    "Did you put up with disrespect from this person in order to keep the peace?",
    {
      "Yes": 1.0,
      "No": 0.0,
    },
  ),
];

List<String> beware = [
  "Beware of the casual committer.",
  "Beware the everlasting boyfriend.",
  "Beware the one that cuts off your lifelines.",
  "Beware the overt flirter.",
  "Beware the man who manipulates through charm.",
  "Beware the man who is nice to receive rewards.",
  "Beware the man that confuses you before you make decisions.",
  "Beware the one that claims you're crazy.",
  "Beware the man that befriends the corrupt.",
  "Beware the man who has never left Neverland.",
  "Beware the one that is disgusted by children.",
  "Beware the man who lives for the hunt of the flesh.",
  "Beware the man who pulls no punches.",
  "Beware the guilty distractor.",
  "Beware the enabling bloodline.",
  "Beware the servant master.",
  "Beware the negligent protector.",
  "Beware the Joker.",
  "Beware the 1.0 deceiver.",
  "Beware the armchair athlete.",
];
