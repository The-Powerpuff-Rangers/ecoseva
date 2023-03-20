import React from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./pages/Login";
import "./App.css";
import SignUp from "./pages/SignUp";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import Profile from "./pages/Profile";

function App() {
  return (
    <div className="flex flex-col justify-between">
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />}></Route>
        <Route path="/register" element={<SignUp />}></Route>
        <Route path="/login" element={<Login />}></Route>
        <Route path="/profile" element={<Profile />}></Route>
      </Routes>
      <Footer />
    </div>
  );
}

export default App;
