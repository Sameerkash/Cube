interface OrderRequestBody {
  order: {
    location_id: string;
    customer_id: string;
    metadata: {
      order_total: string;
      order_quantity: string;
    };
  };
  idempotency_key: string;
}

interface CustomerSearchRequestBody {
  query: {
    filter: {
      email_address: {
        exact: string;
      };
    };
  };
}

interface CreateCustomerRequestBody {
  given_name: string;
  idempotency_key: string;
  phone_number: string;
  email_address: string;
  address: { address_line_1: string };
}


interface CatalogListRequest {
    types: string;
  }
  