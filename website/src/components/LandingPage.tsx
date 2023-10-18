import React, { useEffect, useRef } from "react";
import ProductsPage from "./ProductsPage";
import { useStore } from "@/store/use_store";

const LandingPage: React.FC = () => {
  const thirdSectionRef = useRef<HTMLDivElement | null>(null);

  const scrollToThirdSection = () => {
    if (thirdSectionRef.current) {
      thirdSectionRef.current.scrollIntoView({ behavior: "smooth" });
    }
  };

  return (
    <div className="flex flex-col">
      {/* Section 1: Landing */}
      <section className="flex flex-col justify-center items-center bg-blue-500 text-white h-screen">
        <h1 className="text-2xl md:text-8xl font-bold mb-4 text-center">
          Ferns and Petals
        </h1>
        <p className="text-sm md:text-3xl mb-28 text-center">
          This beautiful flower bouquet is the perfect way to show someone you
          care.
        </p>
        <button
          className="rounded-full px-6 py-3 bg-white text-blue-500 font-bold"
          onClick={scrollToThirdSection}
        >
          Checkout Products
        </button>
      </section>

      {/* Section 2: Product Grid */}
      <section className="flex flex-col justify-center items-center bg-green-500 text-white h-screen">
        <h2 className="text-lg md:text-4xl font-bold mb-10 text-center">
          Quality Products and Features
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-20">
          {[...Array(6)].map((_, index) => (
            <div key={index} className="bg-white p-4 rounded-lg">
              <h3 className="text-md md:text-lg font-semibold mb-2">
                Product {index + 1}
              </h3>
              <p className="text-gray-700 text-xl">
                Quality and best features.
              </p>
            </div>
          ))}
        </div>
      </section>

      {/* Section 3: Another Section */}
      <section
        className="flex flex-col justify-center items-center bg-yellow-500 text-white h-screen"
        ref={thirdSectionRef}
      >
        <ProductsPage />
      </section>
    </div>
  );
};

export default LandingPage;
