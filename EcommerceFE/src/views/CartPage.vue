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
                    <button type="button" class="btn btn-light" :disabled="sProduct.quantitySelected == 1"
                        @click="editQuantity(-1, sProduct.quantitySelected, index, $event)">-</button>
                    {{ sProduct.quantitySelected }}
                    <button type="button" class="btn btn-light"
                        :disabled="sProduct.quantitySelected >= types[index].quantityInStock"
                        @click="editQuantity(1, sProduct.quantitySelected, index, $event)">+</button>

                </div>
                <div class="col-2 text-danger" v-if="sProduct.sellingPrice != null">{{
                    (sProduct.sellingPrice * sProduct.quantitySelected).toLocaleString("it-IT", {
                        style: "currency",
                        currency: "VND",
                    }) }}</div>
                <div class="col-1">

                    <button @click="removeSelectedProduct(index)" class="btn btn-light" style="border-radius: 0;"><i
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
                    <button class="btn btn-danger px-4 py-2 fw-bold text-uppercase"
                        style="border-radius: 0px; color: white;" data-bs-toggle="modal"
                        data-bs-target="#confirmOrderModal">
                        Tiến hành đặt hàng</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="confirmOrderModal" tabindex="-1" aria-labelledby="confirmOrderModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmOrderModalLabel">Xác nhận đơn hàng</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <section class="h-100 h-custom container mb-3">
                        <div class="mb-3">

                            <div class="text-capitalize fw-bold" style="font-size: 22px;" for="addressShip ">Địa chỉ
                                nhận hàng</div>
                            <div class="d-flex">
                                <div class="me-5">
                                    <div class="fw-bold">
                                        Tên: {{ currentUser.name }}
                                    </div>
                                    <div class="fw-bold">
                                        SĐT: {{ currentUser.phone }}
                                    </div>
                                </div>
                                <div>
                                    {{ currentUser.billingAddress }}
                                </div>

                            </div>
                        </div>
                        <div class="container h-100"
                            style="box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;">
                            <div class="row d-flex justify-content-center align-items-center h-100">
                                <div class="col">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="h5">Sản phẩm</th>
                                                    <th scope="col">Đơn giá</th>
                                                    <th scope="col">Số lượng</th>
                                                    <th scope="col">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr v-for="(sProductId, index) in sProducts"
                                                    :key="sProductId + ' ' + index">
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img :src="images[index].base64" class="img-fluid rounded-3"
                                                                style="width: 80px;" alt="Book">
                                                            <div class="flex-column ms-4">
                                                                <p class="mb-2"><a class="linkp fw-bold"
                                                                        :href="'http://localhost:5173/products/' + sProducts[index].proId">{{
                                                                            sProducts[index].name }}</a></p>
                                                                <p class="mb-0">{{ sProducts[index].typeName }}</p>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle">
                                                        <p class="mb-0" style="font-weight: 500;"
                                                            v-if="sProducts[index].sellingPrice != undefined">{{
                                                                sProducts[index].sellingPrice.toLocaleString("it-IT", {
                                                                    style: "currency",
                                                                    currency: "VND",
                                                                }) }}</p>
                                                    </td>
                                                    <td class="align-middle">
                                                        <div class="d-flex flex-row">
                                                            <input disabled id="form1" min="0" name="quantity"
                                                                :value="sProducts[index].quantitySelected" type="number"
                                                                class="form-control form-control-sm"
                                                                style="width: 50px;" />
                                                        </div>
                                                    </td>
                                                    <td class="align-middle">
                                                        <p class="mb-0" style="font-weight: 500;"
                                                            v-if="sProducts[index].sellingPrice != null">
                                                            {{
                                                                (sProducts[index].sellingPrice *
                                                                    sProducts[index].quantitySelected).toLocaleString("it-IT", {
                                                                        style: "currency",
                                                                        currency: "VND",
                                                                    }) }}</p>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="d-flex w-100">
                                        <div class="w-50 me-5">
                                            <label for="note">Ghi chú</label>
                                            <input id="note" v-model="noteOrder" type="text" class="form-control">
                                        </div>

                                        <div class="w-50 me-1 mb-3">
                                            <label for="typePayment">Phương thức thanh toán</label>
                                            <select v-model="typePayment" name="typePayment" class="form-select"
                                                aria-label="Default select example">
                                                <option value="Chuyển khoản">Chuyển khoản</option>
                                                <option value="Thanh toán khi nhận hàng">Thanh toán khi nhận hàng
                                                </option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="mb-5 mb-lg-0">
                                        <div class=" p-4 pt-0 d-flex justify-content-end">

                                            <div class="row w-50 text-end">
                                                <div class="col-lg-4 col-xl-3 w-100">
                                                    <div class="d-flex justify-content-between"
                                                        style="font-weight: 500;">
                                                        <p class="mb-2">Tổng giá:</p>
                                                        <p class="mb-2">{{ calculatePrice().toLocaleString("it-IT", {
                                                            style: "currency",
                                                            currency: "VND",
                                                        }) }}</p>
                                                    </div>

                                                    <div class="d-flex justify-content-between"
                                                        style="font-weight: 500;">
                                                        <p class="mb-0">Phí vận chuyển:</p>
                                                        <p class="mb-0">{{ (30000).toLocaleString("it-IT",
                                                            {
                                                                style: "currency",
                                                                currency: "VND",
                                                            }) }}</p>
                                                    </div>

                                                    <hr class="w-100">

                                                    <div class="d-flex justify-content-between"
                                                        style="font-weight: 500;">
                                                        <p class="mb-0">Tổng số tiền:</p>
                                                        <p class="mb-0 text-danger fw-bold">{{ (calculatePrice() +
                                                            30000).toLocaleString("it-IT", {
                                                                style: "currency",
                                                                currency: "VND",
                                                            }) }}</p>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </section>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                        style="border: 0px; border-radius: 0px;">Hủy</button>
                    <button type="button" class="btn btn-danger text-uppercase fw-bold" data-bs-dismiss="modal"
                        style="border: 0px; border-radius: 0px;" @click="addOrder">Đặt
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
import typeServices from '@/services/type.services';
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

const types = ref([{
    typeId: 0,
    name: '',
    productId: 0,
    unitPrice: 0,
    quantityInStock: 0,
    created_at: '',
    updated_at: ''
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
    confirm: 0,
    paymentType: "",
    note: ""
})

async function editQuantity(number: number, original: number, index: number, e: any) {
    e.preventDefault();

    try {

        await selectedProductServices.updateQuantity(sProducts.value[index].selectedProductId, {
            number: original + number
        })

        sProducts.value[index].quantitySelected += number
    } catch (error) {
        console.log(error)

        Swal.fire({
            title: "Thất bại!",
            text: "Chỉnh sửa số lượng thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

const noteOrder = ref("")
const typePayment = ref("Chuyển khoản")

async function addOrder(e: any) {
    e.preventDefault();
    try {
        if (currentUser.value.billingAddress == undefined || currentUser.value.billingAddress == "") {
            throw "Vui lòng nhập đầy đủ thông tin cá nhân trước khi đặt hàng!"
        }

        newOrder.value = {
            accountId: currentUser.value.accountId,
            totalPrice: calculatePrice(),
            shippingPrice: 30000,
            shippingAddress: currentUser.value.billingAddress,
            shipped: 0,
            shippedDate: null,
            shipmentTracking: "",
            paid: 0,
            confirm: 0,
            paymentType: typePayment.value,
            note: noteOrder.value
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
        let respTypes = []

        for (let i = 0; i < sProducts.value.length; i++) {
            let respType = await typeServices.getOne(sProducts.value[i].typeId)
            respTypes.push(respType.data.type[0])

            let respImage = await imageServices.getAllByBelongIdLimit1(sProducts.value[i].proId)
            respImgs.push(respImage.data.image[0])
        }
        images.value = respImgs
        types.value = respTypes

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

.linkp {
    color: black;
    text-decoration: none;
}

.linkp:hover {
    text-decoration: underline;
}
</style>