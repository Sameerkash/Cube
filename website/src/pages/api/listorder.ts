import { randomUUID } from "crypto";
import type { NextApiRequest, NextApiResponse } from "next";
import { Client, Environment } from "square";

const client = new Client({
  accessToken: process.env.SQAURE_ACCESS_TOKEN,
  environment: Environment.Sandbox,
});

const accessToken = process.env.SQAURE_ACCESS_TOKEN;
const headers = {
  "Square-Version": "2023-09-25",
  Authorization: `Bearer ${accessToken}`,
  "Content-Type": "application/json",
};

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  try {
    if (req.method === "GET") {
      req.headers = headers;
      const { result } = await client.catalogApi.listCatalog();

      let objects: any[] = [];
      result.objects!.forEach((e) => {
        objects.push({
          id: e.id,
          name: e.itemData?.name,
          imageUrl: e.itemData?.description,
          amount:
            e!.itemData!.variations![0]!.itemVariationData!.priceMoney!.amount!.toString(),
        });
      });

      res.status(200).json({
        objects: objects,
      });
    } else {
      res.status(500).json({ error: "failed to load data" });
    }
  } catch (err) {
    console.log(err);
    res.status(500).json({ error: "failed to load data" });
  }
}
