import createApiClient from "./api.service";
import handlingError from "./api.service";
import axios from "axios";

class Product_TagService {
  api: any;
  constructor(baseUrl = "http://localhost:3000/api") {
    this.api = createApiClient(baseUrl);
  }
  async getAll() {
    try {
      const chts = await this.api.get("/product-tags");
      return chts.data;
    } catch (err) {
      handlingError(err);
    }
  }

  async getOne(id: number) {
    try {
      const chts = await this.api.get("/product-tags/" + id);
      return chts.data;
    } catch (err) {
      handlingError(err);
    }
  }

  async create(data: any) {
    try {
      const resp = await this.api.post(
        "http://localhost:3000/api/product-tags",
        data
      );
      return resp.data;
    } catch (err: any) {
      handlingError(err);
    }
  }

  async delete(id: number) {
    try {
      return await this.api.delete("/product-tags/" + id);
    } catch (err) {
      handlingError(err);
    }
  }
}

export default new Product_TagService();