"use client";

import { CreditCard } from "@/components/CreditCard";
import { useStore } from "@/store/use_store";
import React from "react";

const CheckoutPage = () => {
  const { cartData } = useStore();
  return (
    <div className="flex justify-center">
      {/* Left Section - Product Information */}
      <div className="w-1/2 p-8 flex justify-center items-center flex-col">
        <h2 className="text-xl font-bold mb-4">Order Summary</h2>
        {/* Replace with your product details */}
        {cartData.items.map((product: any) => (
          <div className="mb-2 border-solid border-red-50 p-4">
            <p className="font-bold">{product.name}</p>
            <p>$ {product.amount}</p>
          </div>
        ))}

        <div className="mt-10">
          <p className="font-bold">Order Total</p>
          <p>$ {cartData.totalPrice}</p>
        </div>
        {/* ... Add more product details */}
      </div>

      {/* Right Section - Checkout Form */}
      <div className="w-1/2 p-8">
        <h2 className="text-xl font-bold mb-4">Checkout</h2>

        {/* Checkout Form */}
        <form className="flex flex-col">
          {/* Name */}
          <div className="mb-4">
            <label htmlFor="name" className="block font-bold mb-1">
              Name
            </label>
            <input
              type="text"
              id="name"
              name="name"
              className="border rounded px-2 py-1 w-full"
            />
          </div>

          {/* Billing Address */}
          <div className="mb-4">
            <label htmlFor="address" className="block font-bold mb-1">
              Billing Address
            </label>
            <textarea
              id="address"
              name="address"
              className="border rounded px-2 py-1 w-full h-20"
            ></textarea>
          </div>

          {/* Email */}
          <div className="mb-6">
            <label htmlFor="email" className="block font-bold mb-1">
              Email
            </label>
            <input
              type="email"
              id="email"
              name="email"
              className="border rounded px-2 py-1 w-full"
            />
          </div>

          <CreditCard />

          {/* <div className="w1/2 h-3/5">
            <square.PaymentForm
              applicationId="sandbox-sq0idb-X2gArLirApTGDiZEtlOR_Q"
              cardTokenizeResponseReceived={(
                token: any,
                verifiedBuyer: any
              ) => {
                console.log("token:", token);
                console.log("verifiedBuyer:", verifiedBuyer);
              }}
              locationId="LGDC7E4MCPJSG"
            ></square.PaymentForm>
          </div> */}
          {/* Submit Button */}
          <button
            type="submit"
            className="bg-white text-black font-bold py-2 px-4 rounded mt-24"
          >
            Submit
          </button>
        </form>
      </div>
    </div>
  );
};

export default CheckoutPage;
