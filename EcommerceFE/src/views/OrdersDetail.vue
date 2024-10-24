<template>
    <div class="mb-5" style="height: 150px; background-color: #fbbfc0;">
    </div>
    <div style="width: 100vw;">
        <section v-for="order in orders" :key="order.orderId" class="h-100 h-custom container mb-5">
            <div class="container h-100 py-3 rounded-4 " style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
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
                                    <tr v-for="(sProductId, index) in order.selectedProductIds" :key="sProductId + ' ' + index">
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img :src="order.imageBase64[index]" class="img-fluid rounded-3"
                                                    style="width: 120px;" alt="Book">
                                                <div class="flex-column ms-4">
                                                    <p class="mb-2"><a class="linkp fw-bold" :href="'http://localhost:5173/products/' + order.productIds[index]">{{ order.productNames[index] }}</a></p>
                                                    <p class="mb-0">{{ order.typeNames[index] }}</p>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;">Thỏi</p>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex flex-row">
                                                <input disabled id="form1" min="0" name="quantity"
                                                    :value="order.quantitySelected[index]" type="number"
                                                    class="form-control form-control-sm" style="width: 50px;" />
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;" v-if="order.sellingPrices[index] != null">
                                                {{
                                                    order.sellingPrices[index].toLocaleString("it-IT", {
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
                                            <p class="mb-2">{{ (order.totalPrice).toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</p>
                                        </div>

                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Phí vận chuyển:</p>
                                            <p class="mb-0">{{ (order.shippingPrice).toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</p>
                                        </div>

                                        <hr class="w-100">

                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Tổng cộng:</p>
                                            <p class="mb-0">{{ (order.totalPrice + order.shippingPrice).toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</p>
                                        </div>

                                        <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                            <p class="mb-0">Địa chỉ giao hàng:</p>
                                            <p class="mb-0">
                                                {{ order.shippingAddress }}
                                            </p>
                                        </div>

                                        <button @click="addToPayment(order.totalPrice + order.shippingPrice, order.productNames)" v-if="order.paid == 0" type="button" data-mdb-button-init
                                            data-mdb-ripple-init class="btn btn-primary btn-block btn-lg"
                                            style="border-radius: 0px; background-color: #fbbfc0; border: 0;">
                                            <div class="d-flex justify-content-between">
                                                <span>Thanh toán</span>
                                            </div>
                                        </button>
                                        <div v-else class="text-success fw-bold"> Đã thanh toán</div>
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
import paymentServices from '@/services/payment.services';
import { useRouter } from 'vue-router';

const cookies = useCookies();
const token = cookies.cookies.get("Token");

const router = useRouter();

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
    quantitySelected: [] as number[],
    sellingPrices: [] as number[],
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shipped: 0,
    shippedDate: "",
    shipmentTracking: "",
    shippingAddress: "",
    paid: 0,
    selectedProductIds: [] as number[],
    typeIds: [] as number[],
    typeNames: [] as string[],
    productIds: [] as number[],
    proId: 0,
    productNames: [] as string[],
    imageBase64: [] as string[]
}])

async function addToPayment(amount: number, descriptions: string[]){
    let mainDescription = "Thanh toán cho đơn hàng "
    for (let i=0; i<descriptions.length; i++) {
        if (i <descriptions.length -1) mainDescription += (descriptions[i] + ", ")
        else mainDescription += descriptions[i]
    }

    try {
        let resp = await paymentServices.create({
            amount: amount,
            description: mainDescription
        })
        window.location.href = resp.order_url;
    } catch (error) {
        console.log(error)
    }
}

onMounted(async () => {
    try {
        orders.value = [];

        if (checkLogin()) {
            let resp = await accountServices.getMe(token);
            currentUser.value = resp.data.account[0];
        }

        let respOrders = await orderServices.getDetailByAccountId(currentUser.value.accountId)
        for (let i = 0; i < respOrders.data.order.length; i++) {
            let data = respOrders.data.order[i];
            // Push the transformed order into the orders array
            orders.value.push({
                orderId: data.orderId,
                created_at: data.created_at,
                updated_at: data.updated_at,
                quantitySelected: data.quantitiesSelected.split(',').map(Number), // Convert string to array of numbers
                sellingPrices: data.sellingPrices.split(',').map(Number), // Convert string to array of numbers
                accountId: data.accountId,
                totalPrice: data.totalPrice,
                shippingPrice: data.shippingPrice,
                shipped: data.shipped,
                shippedDate: data.shippedDate,
                shipmentTracking: data.shipmentTracking,
                shippingAddress: data.shippingAddress,
                paid: data.paid,
                selectedProductIds: data.selectedProductIds.split(',').map(Number), // Convert string to array of numbers
                typeIds: data.typeIds.split(',').map(Number), // Convert string to array of numbers
                typeNames: data.typeNames.split(','), // Convert string to array of strings
                productIds: data.productIds.split(',').map(Number), // Convert string to array of numbers
                proId: data.proId,
                productNames: data.productNames.split(','), // Convert string to array of strings
                imageBase64: data.imageBase64.split('||')
            });
        }

    } catch (error) {
        console.log(error)
    }
})

</script>

<style scoped>
.linkp{
    color: black;
    text-decoration: none;
}
.linkp:hover{
    text-decoration: underline;
}
</style>