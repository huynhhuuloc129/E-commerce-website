<template>
    <div class="mb-5" style="height: 150px; background-color: #fbbfc0;">
    </div>
    <div style="width: 100vw;">
        <section v-for="order in orders" :key="order.orderId" class="h-100 h-custom rounded-4 container mb-5"
            style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" class="h5">Sản phẩm</th>
                                        <th scope="col">Đơn vị</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Giá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img :src="order.imageBase64" class="img-fluid rounded-3"
                                                    style="width: 120px;" alt="Book">
                                                <div class="flex-column ms-4">
                                                    <p class="mb-2">{{ order.productName }}</p>
                                                    <p class="mb-0">{{ order.typeName }}</p>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;">Digital</p>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex flex-row">
                                                <input disabled id="form1" min="0" name="quantity"
                                                    :value="order.quantitySelected" type="number"
                                                    class="form-control form-control-sm" style="width: 50px;" />
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;" v-if="order.sellingPrice != null">
                                                {{
                                                    order.sellingPrice.toLocaleString("it-IT", {
                                                        style: "currency",
                                                        currency: "VND",
                                                    }) }}</p>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="mb-5 mb-lg-0">
                            <div class=" p-4 d-flex justify-content-end">

                                <div class="row w-50 text-end">
                                    <div class="col-lg-4 col-xl-3 w-100">
                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-2">Tổng giá:</p>
                                            <p class="mb-2">$23.49</p>
                                        </div>

                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Phí vận chuyển:</p>
                                            <p class="mb-0">{{ (50000).toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</p>
                                        </div>

                                        <hr class="w-100">

                                        <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                            <p class="mb-2">Tổng cộng:</p>
                                            <p class="mb-2">$26.48</p>
                                        </div>

                                        <button v-if="order.paid == 0" type="button" data-mdb-button-init data-mdb-ripple-init
                                            class="btn btn-primary btn-block btn-lg" style="border-radius: 0px; background-color: #fbbfc0; border: 0;">
                                            <div class="d-flex justify-content-between">
                                                <span>Thanh toán</span>
                                            </div>
                                        </button>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup lang="ts">
import orderServices from '@/services/order.services';
import { onMounted, ref } from 'vue';
import { useCookies } from 'vue3-cookies';
import { checkLogin } from '@/utilities/utilities';
import accountServices from '@/services/account.services';
const cookies = useCookies();
const token = cookies.cookies.get("Token");

const currentUser = ref({
    accountId: 0,
    username: "",
    password: "",
    email: "",
    name: "",
    phone: "",
    birthDate: null,
    avatar: "",
    billingAddress: "",
    created_at: null,
    updated_at: null,
});


let orders = ref([{
    orderId: 0,
    created_at: "",
    updated_at: "",
    quantitySelected: 0,
    sellingPrice: 0,
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shipped: 0,
    shippedDate: "",
    shipmentTracking: "",
    paid: 0,
    selectedProductId: 0,
    typeId: 0,
    typeName: "",
    productId: 0,
    proId: 0,
    productName: "",
    imageBase64: ""
}])

onMounted(async () => {
    try {
        if (checkLogin()) {
            let resp = await accountServices.getMe(token);
            currentUser.value = resp.data.account[0];
        }

        let respOrders = await orderServices.getDetailByAccountId(currentUser.value.accountId)
        orders.value = respOrders.data.order

    } catch (error) {
        console.log(error)
    }
})

</script>

<style scoped></style>