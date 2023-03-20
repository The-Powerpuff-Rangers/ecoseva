import React, { useState, useContext } from "react";
import ProfilePageImage from "../assets/ProfilePageImage.png";
import profileImg from "../assets/Jumping.png";
import editIcon from "../assets/pencil-01.png";
import { UserContext } from "../App";

const Profile = () => {
  const [data, setData] = useState<any>(useContext(UserContext));
  const [dob, setDob] = useState<string>("1 Jan 2002");
  const [phone, setPhone] = useState<string>("+91 1234567890");
  const [email, setEmail] = useState<string>("sample@gmail.com");
  const [isEdit, setIsEdit] = useState<boolean>(false);
  return (
    <div className="flex justify-between">
      <div className="py-16 px-28 flex flex-col items-baseline">
        <h1 className="font-bold text-4xl mb-10">Profile</h1>
        <div className="flex justify-center items-center gap-8 mb-10">
          <div className="p-1 border-2 border-[#86B049] rounded-full shadow-sm">
            <img
              src={profileImg}
              alt="profileImg"
              className="w-[5.5em] h-[5.5em]"
            />
          </div>
          <div className="flex flex-col justify-center items-baseline">
            <div className="flex gap-4">
              <span className="font-bold text-2xl">{data.name}</span>
              <button
                onClick={(e) => {
                  setIsEdit(!isEdit);
                }}
              >
                <img
                  src={editIcon}
                  alt="editIcon"
                  className="w-5 hover:scale-105 transition-all ease-in-out"
                />
              </button>
            </div>
            <span>15 Mar 2023</span>
          </div>
        </div>
        <div>
          <form
            action="#"
            className="flex flex-col justify-center items-baseline gap-6"
          >
            <div className="flex flex-col items-start">
              <label htmlFor="dob" className="text-sm">
                Date of Birth
              </label>
              <input
                type="text"
                className="w-[20em] px-3 py-2 rounded-xl bg-white border-2 border-black outline-none"
                id="dob"
                value={data.dob}
                disabled
              />
            </div>
            <div className="flex flex-col items-start">
              <label htmlFor="phone" className="text-sm">
                Phone Number
              </label>
              <input
                type="text"
                className="w-[20em] px-3 py-2 rounded-xl bg-white border-2 border-black outline-none"
                value={data.phone}
                disabled
              />
            </div>
            <div className="flex flex-col items-start">
              <label htmlFor="email" className="text-sm">
                Email address
              </label>
              <input
                type="email"
                className="w-[20em] px-3 py-2 rounded-xl bg-white border-2 border-black outline-none"
                value={data.email}
                disabled
              />
            </div>
            {isEdit ? (
              <button className="bg-[#EA4335] w-28 font-medium py-2 px-3 rounded-lg shadow-lg">
                Save
              </button>
            ) : (
              <button
                type="submit"
                className="bg-[#EA4335] w-28 font-medium py-2 px-3 rounded-lg shadow-lg"
              >
                Logout
              </button>
            )}
          </form>
        </div>
      </div>
      <img src={ProfilePageImage} alt="profilepageImage" className="w-[45vw]" />
    </div>
  );
};

export default Profile;
