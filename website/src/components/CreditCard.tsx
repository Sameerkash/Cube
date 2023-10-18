import * as React from "react";

import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export function CreditCard() {
  return (
    <Card className="w-auto">
      <CardHeader>
        <CardTitle>Payment Method</CardTitle>
        <CardDescription>Add card details</CardDescription>
      </CardHeader>
      <CardContent>
        <form>
          <div className="grid w-full items-center gap-4">
            <div className="flex flex-col space-y-1.5">
              <Label htmlFor="name">Card Number</Label>
              <Input id="name" placeholder="4553 XXXX XXXX XXXX" />
            </div>

            <div className="flex flex-row justify-between">
              <div className="flex flex-col w-20">
                <Label htmlFor="name">CVV</Label>
                <Input id="name" placeholder="123" />
              </div>

              <div className="flex flex-col w-20">
                <Label htmlFor="name">Exiry</Label>
                <Input id="name" placeholder="01/20" />
              </div>
            </div>
          </div>
        </form>
      </CardContent>
      <CardFooter className="flex justify-between">
        <Button variant="outline">Confirm Order</Button>
      </CardFooter>
    </Card>
  );
}
