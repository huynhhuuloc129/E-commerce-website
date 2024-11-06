<template>
    <div style="width: 100vw;">
        <div style="background-color: #fbbfc0; height: 150px;"></div>
        <div class="container my-4">
            <!-- Cart Header -->
            <div class="row border-bottom py-2 fw-bold bg-light">
                <div class="col-5">Sản Phẩm</div>
                <div class="col-2">Đơn Giá</div>
                <div class="col-2">Số Lượng</div>
                <div class="col-2">Số Tiền</div>
                <div class="col-1"></div>
            </div>

            <div v-if="sProducts.length == 0">Giỏ hàng chưa có sản phẩm nào</div>
            <!-- Cart Row 1 -->
            <div v-for="(sProduct, index) in sProducts" :key="sProduct.selectedProductId"
                class="row align-items-center border-bottom py-3">

                <div class="col-5 d-flex">
                    <div class="me-3">
                        <img v-if="images[index] != null" :src="images[index].base64" height="80" width="80"
                            class="img-fluid" alt="Product 1">
                    </div>
                    <div>
                        <div class="fw-bold"><a class="cart-items fw-bold"
                                :href="'http://localhost:5173/products/' + sProduct.proId">{{ sProduct.name }}</a></div>
                        <div class="text-muted">{{ sProduct.typeName }}</div>
                    </div>
                </div>
                <div class="col-2" v-if="sProduct.sellingPrice != null">{{ sProduct.sellingPrice.toLocaleString("it-IT",
                    {
                        style: "currency",
                        currency: "VND",
                    }) }}</div>
                <div class="col-2 d-flex align-items-center">
                    {{ sProduct.quantitySelected }}
                </div>
                <div class="col-2 text-danger" v-if="sProduct.sellingPrice != null">{{
                    (sProduct.sellingPrice * sProduct.quantitySelected).toLocaleString("it-IT", {
                        style: "currency",
                        currency: "VND",
                    }) }}</div>
                <div class="col-1">

                    <button @click="removeSelectedProduct(index)" class="btn btn-light"><i
                            class="fa-solid fa-x"></i></button>
                </div>
            </div>

            <div class="row align-items-center border-top py-3">
                <div class="col-md-6 d-flex align-items-center">
                </div>
                <div class="col-md-5 d-flex align-items-center justify-content-end w-100">
                    <div class="me-3 text-end">
                        <div>Tổng thanh toán ({{ sProducts.length }} sản phẩm): <span class="fw-bold text-danger">{{
                            calculatePrice().toLocaleString("it-IT",
                                {
                                    style: "currency",
                                    currency: "VND",
                                }) }}</span></div>
                    </div>
                    <button class="btn btn-light px-4 py-2 fw-bold" @click="addOrder($event)"
                        style="border-radius: 0px; background-color: #fbbfc0; color: white;">Đặt
                        hàng</button>
                </div>
            </div>
        </div>
    </div>


</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import Swal from 'sweetalert2';

import selectedProductServices from '@/services/selectedProduct.services';
import accountServices from '@/services/account.services';
import imageServices from '@/services/image.services';
import orderServices from '@/services/order.services';

import { useRouter } from "vue-router";
import { useCookies } from "vue3-cookies";
import { checkLogin } from '@/utilities/utilities';
const router = useRouter();
const cookies = useCookies();

const token = cookies.cookies.get("Token");

const sProducts = ref([{
    selectedProductId: 0,
    quantitySelected: 0,
    sellingPrice: 0,
    created_at: '',
    updated_at: '',
    proId: 0,
    orderId: 0,
    accountId: 0,
    typeId: 0,
    block: 0,
    name: '',
    typeName: ''
}])

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
const images = ref([{
    imageId: 0,
    created_at: '',
    updated_at: '',
    base64: '',
    belongId: ''
}])
async function removeSelectedProduct(index: number) {
    try {


        await selectedProductServices.delete(sProducts.value[index].selectedProductId)

        sProducts.value.splice(index, 1)
    } catch (error) {
        console.log(error)
    }
}
function calculatePrice() {
    if (sProducts.value.length > 0) {
        let s = 0
        for (let i = 0; i < sProducts.value.length; i++) {
            s += (sProducts.value[i].sellingPrice * sProducts.value[i].quantitySelected)
        }
        return s
    } else {
        return 0
    }
}
const newOrder = ref({
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shippingAddress: "",
    shipped: 0,
    shippedDate: null,
    shipmentTracking: "",
    paid: 0,
    confirm: 0
})

async function addOrder(e: any) {
    e.preventDefault();
    try {
        if (currentUser.value.billingAddress == undefined || currentUser.value.billingAddress == "") {
            throw "Vui lòng nhập đầy đủ thông tin cá nhân trước khi đặt hàng!"
        }

        newOrder.value = {
            accountId: currentUser.value.accountId,
            totalPrice: calculatePrice(),
            shippingPrice: 50000,
            shippingAddress: currentUser.value.billingAddress,
            shipped: 0,
            shippedDate: null,
            shipmentTracking: "",
            paid: 0,
            confirm: 0
        }

        await orderServices.create(newOrder.value)

        Swal.fire({
            title: "Thành công!",
            text: "Đặt hàng thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });

        router.push({ name: "orders" });
    } catch (error) {
        console.log(error)

        Swal.fire({
            title: "Thất bại!",
            text: "Đặt hàng thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}
onMounted(async () => {
    try {
        if (!checkLogin()) {
            Swal.fire({
                title: "Chưa đăng nhập!",
                text: "Vui lòng đăng nhập để xem thông tin",
                icon: "error",
                confirmButtonText: "OK",
                timer: 1500
            });

            router.push({ name: "home" });
        } else {
            let resp = await accountServices.getMe(token);
            currentUser.value = resp.data.account[0];
        }

        let respSProducts = await selectedProductServices.getAllByAccountIdInCart(currentUser.value.accountId);
        sProducts.value = respSProducts.data.sProducts

        let respImgs = []
        for (let i = 0; i < sProducts.value.length; i++) {


            let respImage = await imageServices.getAllByBelongIdLimit1(sProducts.value[i].proId)
            respImgs.push(respImage.data.image[0])
        }
        images.value = respImgs
    } catch (error) {
        console.log(error)
    }
})

</script>

<style scoped>
.cart-items {
    color: black;
    text-decoration: none;
}

.cart-items:hover {
    text-decoration: underline;
}
</style>