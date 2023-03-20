import React from "react";
import { Link } from "react-router-dom";
import logoImg from "../assets/Logo.png";
import porofileImg from "../assets/Jumping.png";

function Navbar() {
  return (
    <div className="w-full h-20 px-6 shadow-lg flex justify-between items-center z-10">
      <Link to="/">
        <img src={logoImg} alt="logo" className="w-32" />
      </Link>
      <div className="flex flex-1 justify-around items-center">
        <Link to="/" className="font-semibold">
          Dashboard
        </Link>
        <Link to="/" className="font-semibold">
          Notification
        </Link>
      </div>
      <div className="flex flex-1 items-center justify-between">
        <input
          type="text"
          className="p-2 rounded-lg border-2 w-1/2 outline-none"
          placeholder="Search"
        />
        <Link to="/profile">
          <img
            src={porofileImg}
            alt="profileImg"
            className="w-11 rounded-full"
          />
        </Link>
      </div>
    </div>
  );
}

export default Navbar;
