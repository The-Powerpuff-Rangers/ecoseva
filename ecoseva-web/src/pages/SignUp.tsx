import React from "react";
import SignupImg from "../assets/Side Image (1).png";
import orImg from "../assets/OR.png";
import googleLogo from "../assets/Google.png";

function SignUp() {
  return (
    <div className="bg-slate-50 min-h-screen flex flex-col">
      <div className="flex flex-grow justify-center items-center">
        <div className="flex shadow-lg">
          <img
            src={SignupImg}
            alt=""
            className="h-[80vh] w-[25vw] rounded-l-2xl object-cover"
          />
          <div className="h-[80vh] w-[30vw] px-11 py-6 bg-white flex flex-col justify-around items-start rounded-r-2xl">
            <p className="text-[#C4C4C4] mb-4">Get Started!</p>
            <h1 className="text-2xl font-semibold">Sign Up</h1>
            <form
              action="/login"
              className="flex flex-col justify-center items-center gap-8 my-4"
            >
              <input
                type="text"
                placeholder="Email ID"
                className="w-full border-b-[1px] border-black outline-none placeholder:text-sm"
              />
              <input
                type="password"
                placeholder="Password"
                className="w-full border-b-[1px] border-black outline-none placeholder:text-sm"
              />
              <input
                type="password"
                placeholder="Confirm Password"
                className="w-full border-b-[1px] border-black outline-none placeholder:text-sm"
              />
              <button
                type="submit"
                className="bg-[#86B049] py-2 px-6 w-full rounded-3xl"
              >
                Register
              </button>
              <img
                src={orImg}
                alt="There is a another option"
                className="w-56"
              />
              <button className="bg-[#CEB5FF] border-[1px] border-black py-2 px-6 w-full rounded-3xl flex justify-center items-center">
                <img src={googleLogo} alt="GoogleImg" className="w-4 mr-2" />
                Sign in with Google
              </button>
            </form>
            <span className="font-semibold">
              Already a user?{" "}
              <a href="/login" className="text-sky-700">
                Login
              </a>
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}

export default SignUp;
