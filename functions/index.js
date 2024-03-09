/* eslint max-len: ["error", { "code": 200 }] */
const {onRequest} = require("firebase-functions/v2/https");
const {initializeApp} = require("firebase/app");
// const {getFirestore} = require("firebase/firestore");
const {OpenAI} = require("openai");
require("dotenv").config({path: __dirname + "/.env"});
const secretKey = process.env.OPENAI_API_KEY;
const openai = new OpenAI({
  apiKey: secretKey,
});

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDJiEpUcgffekrZSrCqMGQzxGLgl8MH5D0",
  authDomain: "mytown-594e9.firebaseapp.com",
  databaseURL: "https://mytown-594e9-default-rtdb.europe-west1.firebasedatabase.app",
  projectId: "mytown-594e9",
  storageBucket: "mytown-594e9.appspot.com",
  messagingSenderId: "923456110574",
  appId: "1:923456110574:web:1ae6010ebe35912f8198ff",
};

// Initialize Firebase
initializeApp(firebaseConfig);

exports.checkSearchMatch = onRequest({timeoutSeconds: 1200}, async (req, res) => {
  // let description = req.params.body;

  // Implementare fetch all database

  const assistant = await openai.beta.assistants.retrieve(
      "asst_4ubos6tsYm2UBPmSe8Bp7deJ");
  const thread = await openai.beta.threads.create();
  const input = "'lumanare parfumata roz fuxia';'telefon mobil Samsung Galaxy';'Rata de jucarie';'lumanare cu lumina de culoare fuxia'"; // Here comes the input
  await openai.beta.threads.messages.create(thread.id, {
    role: "user",
    content: input,
  });
  // Polling mechanism to see if runStatus is completed
  // This should be made more robust.
  const run = await openai.beta.threads.runs.create(thread.id, {
    assistant_id: assistant.id,
  });

  let runStatus = await openai.beta.threads.runs.retrieve(
      thread.id,
      run.id,
  );

  while (runStatus.status !== "completed") {
    await new Promise((resolve) => setTimeout(resolve, 2000));
    runStatus = await openai.beta.threads.runs.retrieve(thread.id, run.id);
  }

  // Get the last assistant message from the messages array
  const messages = await openai.beta.threads.messages.list(thread.id);

  // Find the last message for the current run
  const lastMessageForRun = messages.data
      .filter(
          (message) => message.run_id === run.id && message.role === "assistant",
      )
      .pop();

  if (lastMessageForRun) {
    console.log(`${lastMessageForRun.content[0].text.value}`);
  }
});
