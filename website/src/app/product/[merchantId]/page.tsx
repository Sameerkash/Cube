"use client";

import Header from "@/components/Header";
import LandingPage from "@/components/LandingPage";
import { useStore } from "@/store/use_store";
import React, { useEffect } from "react";

const ProductDetailPage = ({ params }: { params: { merchantId: string } }) => {
  const { fetchCatalogObjects } = useStore();

  useEffect(() => {
    fetchCatalogObjects();
  }, []);

  return (
    <div>
      <Header />
      <LandingPage />
    </div>
  );
};

export default ProductDetailPage;
