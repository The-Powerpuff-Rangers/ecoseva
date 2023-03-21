import React, { createContext, useEffect, useState } from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./pages/Login";
import "./App.css";
import SignUp from "./pages/SignUp";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import Profile from "./pages/Profile";
import Dashboard from "./pages/Dashboard";
import Axios from "axios";
import AuthService from "./services/auth.service";

interface User {
  email: string;
  password: string;
  name: string;
  phone: string;
  access_token: string;
  refresh_token: string;
}

function App() {
  const [user, setUser] = useState<User>(AuthService.getCurrentUser());

  useEffect(() => {
    return () => {
      setUser(AuthService.getCurrentUser());
    };
  }, [user]);

  return (
    <div className="flex flex-col justify-between">
      {user && <Navbar />}
      <Routes>
        <Route path="/" element={<Home />}></Route>
        <Route path="/register" element={<SignUp />}></Route>
        <Route path="/login" element={<Login />}></Route>
        <Route path="/profile" element={<Profile />}></Route>
        <Route path="/dashboard" element={<Dashboard />}></Route>
      </Routes>
      {user && <Footer />}
    </div>
  );
}

export default App;
