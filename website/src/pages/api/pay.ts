import { randomUUID } from "crypto";
import type { NextApiRequest, NextApiResponse } from "next";
import { Client, Environment } from "square";

const client = new Client({
  accessToken: process.env.SQAURE_ACCESS_TOKEN,
  environment: Environment.Sandbox,
});

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  try {
    console.log(process.env.SQAURE_ACCESS_TOKEN);
    if (req.method === "POST") {
      const { result } = await client.paymentsApi.createPayment({
        idempotencyKey: randomUUID(),
        sourceId: req.body.sourceId,
        amountMoney: {
          currency: "USD",
          amount: BigInt(1000),
        },
      });
      res.status(200).json(result);
    } else {
      res.status(500).json({ error: "failed to load data" });
    }

    // const result = await someAsyncOperation()
  } catch (err) {
    res.status(500).json({ error: "failed to load data" });
  }
}
