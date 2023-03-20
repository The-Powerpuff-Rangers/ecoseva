import React from "react";
import HomeImg from "../assets/HomeGif.gif";
import Card from "../components/Card";

function Home() {
  return (
    <div className="mb-24">
      <div className="flex justify-center items-center pl-20 mb-10">
        <div>
          <h1 className="font-bold text-left text-6xl mb-5">
            Serve the nature because it's{" "}
            <span className="text-[#86B049]">yours</span> too.
          </h1>
          <p className="text-[#A0A0A0] text-4xl mb-5">
            Bin it right, save the planet's might!
          </p>
          <button className="bg-[#5600FF] px-4 py-3 rounded-lg text-white shadow-md">
            <a href="/dashboard">Go to dashboard</a>
          </button>
        </div>
        <img src={HomeImg} alt="HomePageImage" className="w-[60vw]" />
      </div>
      <div className="flex flex-col gap-12">
        <h1 className="text-center text-3xl font-bold">Need of EcoSeva</h1>
        <div className="flex justify-around">
          <Card
            name="User Xyz"
            desc="“Saving nature is a critical issue, and smart dustbins are an innovative solution. They help reduce waste, promote recycling, and keep the environment clean. Highly recommended!”"
          />
          <Card
            name="User abc"
            desc="“Saving nature is a critical issue, and smart dustbins are an innovative solution. They help reduce waste, promote recycling, and keep the environment clean. Highly recommended!”"
          />
          <Card
            name="User pqr"
            desc="“Saving nature is a critical issue, and smart dustbins are an innovative solution. They help reduce waste, promote recycling, and keep the environment clean. Highly recommended!”"
          />
        </div>
      </div>
    </div>
  );
}

export default Home;
