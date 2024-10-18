import createApiClient from "./api.service";
import handlingError from "./api.service";
import axios from "axios";

class OrderService {
  api: any;
  constructor(baseUrl = "http://localhost:3000/api") {
    this.api = createApiClient(baseUrl);
  }
  async getAll() {
    try {
      const chts = await this.api.get("/orders");
      return chts.data;
    } catch (err) {
      handlingError(err);
    }
  }
  async getAllByAccountIdAndShipped(id: number) {
    try {
      const chts = await this.api.get("/orders/account/" + id);
      return chts.data;
    } catch (err) {
      handlingError(err);
    }
  }
  async getDetailByAccountId(id: number) {
    try {
      const chts = await this.api.get("/orders/detail/" + id);
      return chts.data;
    } catch (err) {
      handlingError(err);
    }
  }
  async getOne(id: number) {
    try {
      const chts = await this.api.get("/orders/" + id);
      return chts.data;
    } catch (err) {
      handlingError(err);
    }
  }

  async create(data: any) {
    try {
      const resp = await this.api.post(
        "http://localhost:3000/api/orders",
        data
      );
      return resp.data;
    } catch (err: any) {
      handlingError(err);
    }
  }

  async delete(id: number) {
    try {
      return await this.api.delete("/orders/" + id);
    } catch (err) {
      handlingError(err);
    }
  }
}

export default new OrderService();