"use client";

import Header from "@/components/Header";
import LandingPage from "@/components/LandingPage";
import React from "react";

const ProductDetailPage = ({ params }: { params: { merchantId: string } }) => {
  return (
    <div>
      <Header />
      <LandingPage />
    </div>
  );
};

export default ProductDetailPage;
