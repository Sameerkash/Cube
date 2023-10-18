import React, { useState } from "react";
import CartDrawer from "./CartDrawer";

const Header: React.FC = () => {
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);

  const handleCartClick = () => {
    setIsDrawerOpen(!isDrawerOpen);
    console.log({ isDrawerOpen });
  };

  return (
    <header className="fixed top-0 left-0 w-full bg-white bg-opacity-20 backdrop-blur-md shadow-lg flex justify-between items-center p-4">
      <div className="text-xl font-bold">Ferns and Petals</div>

      <div className="flex items-center" onClick={handleCartClick}>
        {/* Add other header elements if needed */}

      </div>

      <CartDrawer/>
      {/* {isDrawerOpen && (
        <CartDrawer
          isOpen={isDrawerOpen}
          handleToggleDrawer={handleCartClick}
        />
      )} */}
    </header>
  );
};

export default Header;
