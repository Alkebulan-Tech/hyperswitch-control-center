// Firebase.res
@module("firebase/app")
external firebase: Js.t<{.}> = "default"

@module("firebase/app")
external initializeApp: Js.Dict.t<string> => Js.t<{.}> = "initializeApp"

// Import getAnalytics from firebase/analytics
@module("firebase/analytics")
external getAnalytics: Js.t<{.}> => Js.t<{.}> = "getAnalytics"

// Define the config object using Js.Dict
let config = Js.Dict.fromArray([
  ("apiKey", "AIzaSyBrUTDPRT3FNJPNrz0V_xWQuL1kTjKZUyE"),
  ("authDomain", "kemetx-f8e5b.firebaseapp.com"),
  ("projectId", "kemetx-f8e5b"),
  ("storageBucket", "kemetx-f8e5b.appspot.com"),
  ("messagingSenderId", "667699489962"),
  ("appId", "1:667699489962:web:249e189e0f410c109f74d3"),
  ("measurementId", "G-F10KGKG8GT")
])

let app = initializeApp(config)
let analytics = getAnalytics(app)
