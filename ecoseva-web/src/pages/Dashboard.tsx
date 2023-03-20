import React from "react";
import Grid from "../assets/Grid.png";
import dashBoardImg from "../assets/Illustration 1.png";
import pieChart from "../assets/Glance.png";
import dusbinImg from "../assets/dustbin.png";
import DustbinGroup from "../components/DustbinGroup";
import addGroupButton from "../assets/plus-square.png";

const dustbins = ["Dustbin 1", "Dustbin 2", "Dustbin 3", "Dustbin 4"];

const Dashboard = () => {
  return (
    <div>
      <img src={Grid} alt="" />
      <div className="mt-[-45vh] flex justify-evenly items-start mb-36">
        <img src={dashBoardImg} alt="" className="w-[40vw]" />
        <img src={pieChart} alt="" className="w-[28vw] h-[20vw] mt-14" />
      </div>
      <div className="px-28 flex justify-between items-center mb-16">
        <div className="flex flex-col gap-6">
          <div className="flex justify-between items-center">
            <div className="flex justify-center items-center gap-2">
              <h1 className="text-2xl font-bold">Groups</h1>
              <button>
                <img
                  src={addGroupButton}
                  alt="addGroupButton"
                  className="w-6 hover:scale-105 transition-all ease-in-out"
                />
              </button>
            </div>
            <input
              type="text"
              className="px-2 py-1 rounded-lg border-2 border-black w-1/2 outline-none"
              placeholder="&#128269; Search"
            />
          </div>
          <div className="flex flex-col gap-8">
            <DustbinGroup
              groupName="Group A"
              dustbins={dustbins}
            ></DustbinGroup>
            <DustbinGroup
              groupName="Group A"
              dustbins={dustbins}
            ></DustbinGroup>
            <DustbinGroup
              groupName="Group A"
              dustbins={dustbins}
            ></DustbinGroup>
          </div>
        </div>
        <img
          src={dusbinImg}
          alt="DustinImage"
          className="scale-50
        "
        />
      </div>
    </div>
  );
};

export default Dashboard;
