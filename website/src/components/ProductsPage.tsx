// components/Products.tsx
import React, { useState } from "react";

interface Product {
  id: number;
  title: string;
  price: number;
  imageUrl: string;
}

const dummyProducts: Product[] = [
  {
    id: 1,
    title: "Product 1",
    price: 19.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  {
    id: 2,
    title: "Product 2",
    price: 24.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  {
    id: 2,
    title: "Product 2",
    price: 24.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  {
    id: 2,
    title: "Product 2",
    price: 24.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  {
    id: 2,
    title: "Product 2",
    price: 24.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  {
    id: 2,
    title: "Product 2",
    price: 24.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  {
    id: 2,
    title: "Product 2",
    price: 24.99,
    imageUrl: "https://via.placeholder.com/300",
  },
  // Add more dummy products as needed
];

const ProductsPage: React.FC = () => {
  return (
    <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
      {dummyProducts.map((product) => (
        <Product key={product.id} product={product} />
      ))}
    </div>
  );
};

export default ProductsPage;

interface ProductProps {
  product: Product;
}

const Product: React.FC<ProductProps> = ({ product }) => {
  const [isOverlayVisible, setIsOverlayVisible] = useState(false);

  const handleProductClick = () => {
    setIsOverlayVisible(true);
  };

  const handleCloseOverlay = () => {
    setIsOverlayVisible(false);
  };

  const handleAddToCart = () => {
    // Add your logic to handle adding the product to the cart
    console.log("Product added to cart:", product);
  };

  return (
    <>
      <div className="bg-white p-4 rounded-xl">
        <img
          src={product.imageUrl}
          alt={product.title}
          className="mb-2 w-full rounded-md"
        />
        <h3 className="text-black text-lg font-semibold mb-2">
          {product.title}
        </h3>
        <div className="flex justify-between">
          <p className="text-gray-700">${product.price.toFixed(2)}</p>
          {/* Add to Cart button */}
          <button
            className="bg-blue-500 text-white font-bold py-2 px-4 rounded cursor-pointer"
            onClick={handleProductClick}
          >
            View Product
          </button>
        </div>
      </div>

      {isOverlayVisible && (
        <div className="fixed top-0 left-0 flex items-center justify-center w-full h-full bg-black bg-opacity-75 z-50 rounded-md">
          <div className="bg-white p-8 flex ">
            <div className="flex-1">
              <div className="flex flex-col mb-4">
                <img
                  src={product.imageUrl}
                  alt={product.title}
                  className="mb-2 w-full"
                />
                {/* Add other images */}
              </div>
            </div>

            <div className="flex-1 ml-4">
              <CloseButton handleCloseOverlay={handleCloseOverlay} />
              <h3 className="text-xl text-black font-bold mb-2">
                {product.title}
              </h3>
              <p className="text-gray-700 mb-4">
                Product description goes here.
              </p>
              <p className="text-xl text-black font-bold">
                ${product.price.toFixed(2)}
              </p>

              {/* Add to Cart button */}
              <button
                className="bg-blue-500 font-bold py-2 px-4 rounded mt-28"
                onClick={handleAddToCart}
              >
                Add to Cart
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

const CloseButton = ({ handleCloseOverlay }: any) => {
  return (
    <div className="">
      <button
        className="top-4 right-4 text-gray-700 hover:text-black self-end"
        onClick={handleCloseOverlay}
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          className="h-6 w-6"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M6.293 6.293a1 1 0 011.414 0L12 10.586l4.293-4.293a1 1 0 111.414 1.414L13.414 12l4.293 4.293a1 1 0 01-1.414 1.414L12 13.414l-4.293 4.293a1 1 0 01-1.414-1.414L10.586 12 6.293 7.707a1 1 0 010-1.414z"
          />
        </svg>
      </button>
    </div>
  );
};
