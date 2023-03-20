import React, { createContext, useState } from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./pages/Login";
import "./App.css";
import SignUp from "./pages/SignUp";
import Home from "./pages/Home";
import Navbar from "./components/Navbar";
import Footer from "./components/Footer";
import Profile from "./pages/Profile";
import Dashboard from "./pages/Dashboard";

export const UserContext = createContext({});

const dummyData = {
  name: "Harsh Sharma",
  email: "test@gmail.com",
  dob: "01/01/2000",
  phone: "+91 1234567890",
};

function App() {
  const [user, setUser] = useState<any>({});
  return (
    <div className="flex flex-col justify-between">
      <UserContext.Provider value={dummyData}>
        {dummyData && <Navbar />}
        <Routes>
          <Route path="/" element={<Home />}></Route>
          <Route path="/register" element={<SignUp />}></Route>
          <Route path="/login" element={<Login />}></Route>
          <Route path="/profile" element={<Profile />}></Route>
          <Route path="/dashboard" element={<Dashboard />}></Route>
        </Routes>
        {dummyData && <Footer />}
      </UserContext.Provider>
    </div>
  );
}

export default App;
