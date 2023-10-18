import { randomUUID } from "crypto";
import { create } from "zustand";

export const useStore = create<IStore>((set, get) => ({
  catalogObjects: [],
  cartData: {
    items: [],
    totalPrice: 0,
  },
  customerData: null,

  setCustomerData: ({
    name,
    billingAddress,
    phone,
    email,
  }: {
    name: string;
    billingAddress: string;
    phone: string;
    email: string;
  }) => {
    set({
      customerData: {
        name: name,
        billing_address: billingAddress,
        phone: phone,
        email: email,
      },
    });
  },
  fetchCatalogObjects: async () => {
    const items = await listCatalog();

    console.log(items);

    set({
      catalogObjects: items,
    });
  },
  setCartData: (item: any) => {
    const cartItems = get().cartData.items;
    cartItems.push(item as never);

    const total = (get().cartData.totalPrice += item.amount);
    set({
      cartData: {
        items: cartItems,
        totalPrice: total,
      },
    });
  },
  createOrderAndPayment: async () => {
    const customer = get().customerData;
    const customerId = randomUUID();
    const existingCustomer = await searchCustomer(customer.email);

    if (existingCustomer) {
      console.log("Customer already exists:", existingCustomer);
    } else {
      // Create the customer
      const newCustomer = await createCustomer(
        customer.name,

        customer.phone,
        customer.email,
        customerId,
        customer.billing_address
      );
      console.log("New customer created:", newCustomer);
    }

    const orderId = randomUUID();
    const cart = get().cartData;

    const order = createOrder(
      customerId,
      cart!.totalPrice.toString(),
      cart!.items!.length.toString(),
      orderId
    );
  },
}));

type IStore = {
  catalogObjects: any[];
  cartData: {
    items: [];
    totalPrice: number;
  };
  customerData: any;

  setCustomerData: ({
    name,
    billingAddress,
    phone,
    email,
  }: {
    name: string;
    billingAddress: string;
    phone: string;
    email: string;
  }) => void;
  setCartData: (item: any) => void;
  fetchCatalogObjects: () => void;
  createOrderAndPayment: () => void;
};

const authToken = process.env.SQAURE_ACCESS_TOKEN;

async function createOrder(
  customerId: string,
  orderTotal: string,
  orderQuantity: string,
  idempotencyKey: string
): Promise<void> {
  const url = "https://connect.squareupsandbox.com/v2/orders";
  const authToken = "YOUR_AUTH_TOKEN"; // Replace with your Square auth token

  const requestBody: OrderRequestBody = {
    order: {
      location_id: '"LGDC7E4MCPJSG',
      customer_id: customerId,
      metadata: {
        order_total: orderTotal,
        order_quantity: orderQuantity,
      },
    },
    idempotency_key: idempotencyKey,
  };

  const headers = {
    "Square-Version": "2023-09-25",
    Authorization: `Bearer ${authToken}`,
    "Content-Type": "application/json",
  };

  try {
    const response = await fetch(url, {
      method: "POST",
      headers,
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      throw new Error(`Error: ${response.statusText}`);
    }

    const responseData = await response.json();
    console.log("Order created:", responseData);
  } catch (error) {
    console.error("Error creating order:", error);
  }
}

async function searchCustomer(email: string): Promise<any | null> {
  const url = "https://connect.squareupsandbox.com/v2/customers/search";
  const authToken = "YOUR_AUTH_TOKEN"; // Replace with your Square auth token

  const requestBody: CustomerSearchRequestBody = {
    query: {
      filter: {
        email_address: {
          exact: email,
        },
      },
    },
  };

  const headers = {
    "Square-Version": "2023-09-25",
    Authorization: `Bearer ${authToken}`,
    "Content-Type": "application/json",
  };

  try {
    const response = await fetch(url, {
      method: "POST",
      headers,
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      throw new Error(`Error: ${response.statusText}`);
    }

    const responseData = await response.json();
    return responseData.customers[0] || null;
  } catch (error) {
    console.error("Error searching for customer:", error);
    return null;
  }
}

async function createCustomer(
  givenName: string,
  idempotencyKey: string,
  phoneNumber: string,
  emailAddress: string,
  billingAddress: string
): Promise<any | null> {
  const url = "https://connect.squareupsandbox.com/v2/customers";

  const requestBody: CreateCustomerRequestBody = {
    given_name: givenName,
    idempotency_key: idempotencyKey,
    phone_number: phoneNumber,
    email_address: emailAddress,
    address: {
      address_line_1: billingAddress,
    },
  };

  const headers = {
    "Square-Version": "2023-09-25",
    Authorization: `Bearer ${authToken}`,
    "Content-Type": "application/json",
  };

  try {
    const response = await fetch(url, {
      method: "POST",
      headers,
      body: JSON.stringify(requestBody),
    });

    if (!response.ok) {
      throw new Error(`Error: ${response.statusText}`);
    }

    const responseData = await response.json();
    return responseData.customer;
  } catch (error) {
    console.error("Error creating customer:", error);
    return null;
  }
}

async function listCatalog(): Promise<any | null> {
  const url = "/api/listorder";

  const headers = {
    "Square-Version": "2023-09-25",
    Authorization: `Bearer ${authToken}`,
    "Content-Type": "application/json",
  };

  try {
    const response = await fetch(url, {
      method: "GET",
      headers,
    });

    const responseData = await response.json();
    console.log({responseData})
    return responseData.objects;
  } catch (error) {
    console.error("Error listing catalog:", error);
    return null;
  }
}
