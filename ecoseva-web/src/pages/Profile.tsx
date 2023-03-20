import React, { useState } from "react";
import ProfilePageImage from "../assets/ProfilePageImage.png";
import profileImg from "../assets/Jumping.png";

const Profile = () => {
  const [dob, setDob] = useState<string>("1 Jan 2002");
  const [phone, setPhone] = useState<string>("+91 1234567890");
  const [email, setEmail] = useState<string>("sample@gmail.com");
  const [isEdit, setIsEdit] = useState<boolean>(false);
  return (
    <div className="flex justify-between">
      <div className="p-10">
        <h1>Profile</h1>
        <div>
          <div>
            <img src={profileImg} alt="profileImg" className="w=11" />
          </div>
          <div>
            <span>John_Doe</span>
            <button>Edit</button>
          </div>
          <span>15 Mar 2023</span>
        </div>
        <div>
          <form
            action="#"
            className="flex flex-col justify-center items-center gap-8"
          >
            <label htmlFor="dob">Date of Birth</label>
            <input type="text" id="dob" value={dob} disabled />
            <input type="text" value={phone} disabled />
            <input type="email" value={email} disabled />
            {isEdit ? (
              <button className="bg-[#EA4335] w-28 font-medium py-2 px-3 rounded-lg">
                Save
              </button>
            ) : (
              <button
                type="submit"
                className="bg-[#EA4335] w-28 font-medium py-2 px-3 rounded-lg"
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
