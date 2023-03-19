import React from "react";
import loginPageImg from "../assets/Side Image.png";
import orImg from "../assets/OR.png";
import googleLogo from "../assets/Google.png";

function Login() {
  return (
    <div className="bg-slate-50 min-h-screen flex flex-col">
      <div className="flex flex-grow justify-center items-center">
        <div className="flex shadow-lg">
          <img
            src={loginPageImg}
            alt=""
            className="h-[70vh] w-[25vw] rounded-l-2xl object-cover"
          />
          <div className="h-[70vh] w-[30vw] px-11 py-6 bg-white flex flex-col justify-around items-start rounded-r-2xl">
            <p className="text-[#C4C4C4] mb-4">Good to see you back!</p>
            <h1 className="text-2xl font-semibold">Login</h1>
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
              <button
                type="submit"
                className="bg-[#86B049] py-2 px-6 w-full rounded-3xl"
              >
                Login
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
              New user?{" "}
              <a href="/register" className="text-sky-700">
                Sign Up
              </a>
            </span>
          </div>
        </div>
      </div>
    </div>
    // <div className="h-full bg-slate-400">
    //   <div className="flex justify-center items-center">
    //     <div className="bg-white w-[25vw] flex justify-center items-center">
    //       <img src={loginPageImg} alt="loginPageImage" />
    //       <div>
    //         <p>Good to see you back!</p>
    //         <h1>Login</h1>
    //         <form action="/">
    //           <input type="text" placeholder="Email ID" />
    //           <input type="password" placeholder="Password" />
    //           <button type="submit">Login</button>
    //         </form>
    //
    //         <div>
    //           <span>New user?</span>
    //           <a href="/">Sign Up</a>
    //         </div>
    //       </div>
    //     </div>
    //   </div>
    // </div>
  );
}

export default Login;
