// Firebase.res
@module("firebase/app")
@module("firebase/analytics")
external firebase: Js.t({.}) = "default"

@module("firebase/app")
@module("firebase/analytics")
external initializeApp: Js.t({.}) => Js.t({.}) = "initializeApp"

let config = {

  "apiKey": "AIzaSyBrUTDPRT3FNJPNrz0V_xWQuL1kTjKZUyE",

  "authDomain": "kemetx-f8e5b.firebaseapp.com",

  "projectId": "kemetx-f8e5b",

  "storageBucket": "kemetx-f8e5b.appspot.com",

  "messagingSenderId": "667699489962",

  "appId": "1:667699489962:web:249e189e0f410c109f74d3",

  "measurementId": "G-F10KGKG8GT"

}

let app = initializeApp(config)
let analytics = getAnalytics(app)
