<template>
    <div class="mb-3" style="height: 145px; background-color: #fbbfc0;">
    </div>
    <div class="container justify-content-center align-items-center mb-5">
        <ul class="nav nav-tabs " id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button"
                    role="tab" aria-controls="home" aria-selected="true" style="color: black;"
                    @click="currentType = 99">Tất cả</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button"
                    role="tab" aria-controls="contact" aria-selected="false" style="color: black;"
                    @click="currentType = 1">Chờ xác nhận</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button"
                    role="tab" aria-controls="profile" aria-selected="false" style="color: black;"
                    @click="currentType = 0">Chờ thanh
                    toán</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button"
                    role="tab" aria-controls="contact" aria-selected="false" style="color: black;"
                    @click="currentType = 5">Đang chờ giao hàng</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button"
                    role="tab" aria-controls="contact" aria-selected="false" style="color: black;"
                    @click="currentType = 4">Đang vận chuyển</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button"
                    role="tab" aria-controls="contact" aria-selected="false" style="color: black;"
                    @click="currentType = 6">Thành công</button>
            </li>

            <li class="nav-item" role="presentation">
                <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button"
                    role="tab" aria-controls="contact" aria-selected="false" style="color: black;"
                    @click="currentType = 3">Đã hủy</button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">

        </div>
    </div>
    <div style="width: 100vw;" class="mb-5">
        <div v-if="filterOrders()!.length == 0"
            class="d-flex flex-column justify-content-center align-items-center mb-5">
            <h4 class="mt-5 text-center">Hiện tại chưa có đơn hàng nào</h4>
            <button class="w-25 btn btn-primary" style="border-radius: 0; background-color: #fbbfc0; border: 0;">
                <a href="http://localhost:5173/" class="fw-bold" style="text-decoration: none; color: white;">
                    Mua ngay
                </a>
            </button>
        </div>
        <section v-for="(order) in filterOrders()" :key="order.orderId" class="h-100 h-custom container mb-3">
            <div class="container h-100"
                style="box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">

                        <div class="table-responsive">
                            <div class="m-2 fw-bold">#{{ order.orderId }}</div>
                            <div class="mb-3">

                                <div class="text-capitalize fw-bold" for="addressShip ">Địa chỉ
                                    nhận hàng: <span> {{ currentUser.billingAddress }}
                                    </span>
                                </div>
                                <div class="d-flex">
                                    <div class="me-5">
                                        <div class="fw-bold">
                                            Tên: <span>{{ currentUser.name }}</span>
                                        </div>
                                        <div class="fw-bold">
                                            SĐT: <span>{{ currentUser.phone }}</span>
                                        </div>
                                    </div>
                                    <div>
                                    </div>

                                </div>
                            </div>
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
                                    <tr v-for="(sProductId, index) in order.selectedProductIds"
                                        :key="sProductId + ' ' + index">
                                        <th scope="row">
                                            <div class="d-flex align-items-center">
                                                <img :src="order.imageBase64[index]" class="img-fluid rounded-3"
                                                    style="width: 80px;" alt="Book">
                                                <div class="flex-column ms-4">
                                                    <p class="mb-2"><a class="linkp fw-bold"
                                                            :href="'http://localhost:5173/products/' + order.productIds[index]">{{
                                                                order.productNames[index] }}</a></p>
                                                    <p class="mb-0">{{ order.typeNames[index] }}</p>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;">Thỏi</p>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex flex-row" v-if="index < order.quantitySelected.length">
                                                <input disabled id="form1" min="1" name="quantity"
                                                    :value="order.quantitySelected[index]" type="number"
                                                    class="form-control form-control-sm" style="width: 50px;" />
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <p class="mb-0" style="font-weight: 500;"
                                                v-if="order.sellingPrices[index] != null">
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
                            <div class="p-4 pt-0 d-flex justify-content-end">

                                <div class="row w-50 text-end">
                                    <div class="col-lg-4 col-xl-3 w-100">
                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-1">Tổng giá:</p>
                                            <p class="mb-1">{{ (order.totalPrice).toLocaleString("it-IT", {
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
                                            <p class="mb-0 text-danger fw-bold">{{ (order.totalPrice +
                                                order.shippingPrice).toLocaleString("it-IT", {
                                                    style: "currency",
                                                    currency: "VND",
                                                }) }}</p>
                                        </div>

                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Địa chỉ giao hàng:</p>
                                            <p class="mb-0">
                                                {{ order.shippingAddress }}
                                            </p>
                                        </div>

                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Phương thức thanh toán:</p>
                                            <p class="mb-0">
                                                {{ order.paymentType }}
                                            </p>
                                        </div>
                                        <div v-if="order.note != undefined && order.note.length > 0"
                                            class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Ghi chú:</p>
                                            <p class="mb-0">
                                                {{ order.note }}
                                            </p>
                                        </div>
                                        <div v-if="order.shipmentTracking != ''" class="d-flex justify-content-between"
                                            style="font-weight: 500;">
                                            <p class="mb-0">Tình trạng đơn hàng:</p>
                                            <p class="mb-0">
                                                {{ order.shipmentTracking }}
                                            </p>
                                        </div>

                                        <div v-if="order.cancel == 1" class="text-danger fw-bold">
                                            Đơn hàng đã bị hủy
                                        </div>

                                        <div v-if="order.confirm == 0 && order.cancel == 0" class="mt-3">
                                            <span class="text-info fw-bold">Đang chờ admin duyệt</span>
                                        </div>

                                        <div v-if="order.confirm == 1 && order.cancel == 0">
                                            <button
                                                @click="addToPayment(order.orderId, order.totalPrice + order.shippingPrice, order.productNames)"
                                                v-if="order.paid == 0 && order.paymentType == 'Thanh toán online'"
                                                type="button" data-mdb-button-init data-mdb-ripple-init
                                                class="btn btn-danger btn-block btn-lg"
                                                style="border-radius: 0px;  border: 0;">
                                                <div class="d-flex justify-content-between">
                                                    <span>Thanh toán</span>
                                                </div>
                                            </button>

                                            <div v-if="order.paid == 1 && order.paymentType == 'Thanh toán online'"
                                                class="d-flex flex-column justify-content-end text-end align-items-end">
                                                <button @click="updateShipmentTracking(order.orderId)"
                                                    v-if="order.shipmentTracking == 'Đang vận chuyển'"
                                                    class="btn btn-outline-danger">
                                                    Đã nhận được hàng
                                                </button>
                                                <button
                                                    v-if="reviewCheckMap.get(order.orderId) == false && order.shipmentTracking == 'Đã nhận được hàng'"
                                                    type="button" class="btn btn-primary fw-bold w-50 bg-danger"
                                                    data-bs-toggle="modal" data-bs-target="#reviewModal"
                                                    style="border-radius: 0px;  border: 0px;"
                                                    @click="choosenOrder = order; initReviewVariable(order.productIds.length)">
                                                    Đánh giá
                                                </button>
                                            </div>

                                            <div v-if="order.paymentType == 'Thanh toán khi nhận hàng'">

                                                <button @click="updateShipmentTracking(order.orderId)"
                                                    v-if="order.shipmentTracking == 'Đang vận chuyển'"
                                                    class="btn btn-outline-danger">
                                                    Đã nhận được hàng
                                                </button>
                                                <button
                                                    v-if="reviewCheckMap.get(order.orderId) == false && order.shipmentTracking == 'Đã nhận được hàng'"
                                                    type="button" class="btn btn-primary fw-bold w-50 bg-danger"
                                                    data-bs-toggle="modal" data-bs-target="#reviewModal"
                                                    style="border-radius: 0px;  border: 0px;"
                                                    @click="choosenOrder = order; initReviewVariable(order.productIds.length)">
                                                    Đánh giá
                                                </button>
                                            </div>


                                        </div>
                                        <button
                                            v-if="(order.paid == 0 && order.cancel == 0 && order.paymentType == 'Thanh toán online') || (order.confirm == 0 && order.cancel == 0 && order.paymentType == 'Thanh toán khi nhận hàng')"
                                            @click="cancelOrder(order.orderId)" class="btn btn-dark mt-1"
                                            style="border-radius:  0;">Hủy đơn</button>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="reviewModalLabel">Đánh giá sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-2" v-for="(productId, index) in choosenOrder.productIds" :key="productId">
                            <div class="row d-flex justify-content-center w-100">
                                <div class="">
                                    <div class="card">
                                        <div class=" p-4">
                                            <div class="d-flex">
                                                <img class="me-3" :src="choosenOrder.imageBase64[index]" height="50"
                                                    width="50" alt="">

                                                <div>
                                                    <h6 class="fw-bold">{{ choosenOrder.productNames[index] }}</h6>
                                                    <div>{{ choosenOrder.typeNames[index] }}</div>
                                                </div>
                                            </div>
                                            <hr>

                                            <div class="d-flex flex-start w-100">
                                                <img class="rounded-circle shadow-1-strong me-3"
                                                    v-if="checkLogin() == true && currentUser.avatar != ''"
                                                    :src="currentUser.avatar" alt="avatar" width="50" height="50" />
                                                <img v-else src="https://placehold.co/65x65" alt=""
                                                    class="rounded-circle shadow-1-strong me-3" width="65" height="65">
                                                <div class="w-100">

                                                    <h6>{{ currentUser.name }}</h6>
                                                    <div class="">
                                                        <div class="d-flex align-items-center justify-content-start ">
                                                            <div class="row justify-content-center">

                                                                <!-- star rating -->
                                                                <div class="rating-wrapper">

                                                                    <!-- star 5 -->
                                                                    <input v-model="starNums[index]"
                                                                        class="rating-input" type="radio"
                                                                        :id="'5-star-rating' + index"
                                                                        :name="'star-rating' + index" value="5">
                                                                    <label :for="'5-star-rating' + index"
                                                                        class="star-rating">
                                                                        <i class="fas fa-star d-inline-block"></i>
                                                                    </label>

                                                                    <!-- star 4 -->
                                                                    <input v-model="starNums[index]"
                                                                        class="rating-input" type="radio"
                                                                        :id="'4-star-rating' + index"
                                                                        :name="'star-rating' + index" value="4">
                                                                    <label :for="'4-star-rating' + index"
                                                                        class="star-rating star">
                                                                        <i class="fas fa-star d-inline-block"></i>
                                                                    </label>

                                                                    <!-- star 3 -->
                                                                    <input v-model="starNums[index]"
                                                                        class="rating-input" type="radio"
                                                                        :id="'3-star-rating' + index"
                                                                        :name="'star-rating' + index" value="3">
                                                                    <label :for="'3-star-rating' + index"
                                                                        class="star-rating star">
                                                                        <i class="fas fa-star d-inline-block"></i>
                                                                    </label>

                                                                    <!-- star 2 -->
                                                                    <input v-model="starNums[index]"
                                                                        class="rating-input" type="radio"
                                                                        :id="'2-star-rating' + index"
                                                                        :name="'star-rating' + index" value="2">
                                                                    <label :for="'2-star-rating' + index"
                                                                        class="star-rating star">
                                                                        <i class="fas fa-star d-inline-block"></i>
                                                                    </label>

                                                                    <!-- star 1 -->
                                                                    <input v-model="starNums[index]"
                                                                        class="rating-input" type="radio"
                                                                        :id="'1-star-rating' + index"
                                                                        :name="'star-rating' + index" value="1">
                                                                    <label :for="'1-star-rating' + index"
                                                                        class="star-rating star">
                                                                        <i class="fas fa-star d-inline-block"></i>
                                                                    </label>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div data-mdb-input-init class="form-outline"
                                                        v-if="reviews[index] != undefined">
                                                        <textarea class="form-control" id="textAreaExample" rows="2"
                                                            v-model="reviews[index].content"></textarea>
                                                    </div>
                                                    <div class="d-flex justify-content-between mt-3"
                                                        v-if="reviews[index] != undefined">
                                                        <button type="button" data-mdb-button-init data-mdb-ripple-init
                                                            class="btn btn-dark"
                                                            @click="reviews[index].content = ''">Xóa</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                            style="border-radius: 0px; border: 0px;">Hủy</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                            style="border-radius: 0px;  border: 0px;" @click="modifyReview">Đánh giá</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import orderServices from '@/services/order.services';
import { onMounted, ref } from 'vue';
import { useCookies } from 'vue3-cookies';
import { checkLogin } from '@/utilities/utilities';
import accountServices from '@/services/account.services';
import paymentServices from '@/services/payment.services';
import reviewServices from '@/services/review.services';
import { useRouter } from 'vue-router';
import Swal from 'sweetalert2';

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
    imageBase64: [] as string[],
    confirm: 0,
    cancel: 0,
    paymentType: "",
    note: ""
}])
import paymentVNPayServices from '@/services/paymentVNPay.services';
async function addToPayment(id: number, amount: number, descriptions: string[]) {
    let mainDescription = "Thanh toán cho đơn hàng "
    for (let i = 0; i < descriptions.length; i++) {
        if (i < descriptions.length - 1) mainDescription += (descriptions[i] + ", ")
        else mainDescription += descriptions[i]
    }

    try {
        let resp = await paymentVNPayServices.create({
            id: id,
            amount: amount,
            description: mainDescription
        })
        window.location.href = resp.order_url;
    } catch (error) {
        console.log(error)
    }
}

async function cancelOrder(id: number) {

    try {
        await orderServices.cancel(id)

        for (let i = 0; i < orders.value.length; i++) {
            if (orders.value[i].orderId == id)
                orders.value[i].cancel = 1
        }
        Swal.fire({
            title: "Thành công!",
            text: "Hủy đơn hàng thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {
        console.log(error)
        Swal.fire({
            title: "Thất bại!",
            text: "Hủy đơn hàng thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

const currentType = ref(99)
function filterOrders() {
    if (currentType.value == 0) { // cho thanh toan
        return orders.value.filter((o) => o.paid == 0 && o.confirm == 1 && o.cancel == 0 && o.paymentType == "Thanh toán online")
    } else if (currentType.value == 1) { // cho duyet
        return orders.value.filter((o) => o.confirm == 0 && o.cancel == 0)
    } else if (currentType.value == 2) { // da hoan thanh
        return orders.value.filter((o) => o.paid == 1 && o.cancel == 0 && o.shipmentTracking != "Đang vận chuyển")
    } else if (currentType.value == 3) { // da huy
        return orders.value.filter((o) => o.cancel == 1)
    } else if (currentType.value == 4) { // dang van chuyen
        return orders.value.filter((o) => o.shipmentTracking == "Đang vận chuyển" && o.cancel == 0)
    } else if (currentType.value == 5) { // dang cho van chuyen
        return orders.value.filter((o) => o.shipmentTracking == "Đang chờ giao hàng" && o.cancel == 0)
    } else if (currentType.value == 6) { // Đã cho van chuyen
        return orders.value.filter((o) => o.shipmentTracking == "Đã nhận được hàng" && o.cancel == 0)
    } else {
        return orders.value
    }
}
const reviews = ref([{
    reviewId: 0,
    productId: 0,
    accountId: 0,
    content: '',
    star: 0,
    created_at: '',
    updated_at: '',
    name: '',
    email: '',
    avatar: ''
}])
const starNums = ref([] as number[])
const choosenOrder = ref({
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
    imageBase64: [] as string[],
    confirm: 0,
    cancel: 0
})

async function modifyReview(e: any) {
    e.preventDefault();

    try {
        for (let i = 0; i < starNums.value.length; i++) {

            if (starNums.value[i] == 0) {
                throw ("Vui lòng chọn số sao")
            }

            if (reviews.value[i].accountId == 0) {

                await reviewServices.create({
                    productId: choosenOrder.value.productIds[i],
                    accountId: currentUser.value.accountId,
                    content: reviews.value[i].content,
                    star: starNums.value[i]
                })

            } else { //update existed review

                await reviewServices.update(reviews.value[i].reviewId, {
                    content: reviews.value[i].content,
                    star: starNums.value[i]
                })

            }
        }
        // add new review
        reviewCheckMap.value.set(choosenOrder.value.orderId, true)

        Swal.fire({
            title: "Thành công!",
            text: "Chỉnh sửa nhận xét thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });

        // window.location.reload();
    } catch (error) {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã có lỗi xảy ra! " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
        console.log(error)
    }
}

async function initReviewVariable(length: number) {
    starNums.value = []
    reviews.value = []
    for (let i = 0; i < length; i++) {
        let respReview = await reviewServices.getAllByProductIdAndAccountId(choosenOrder.value.productIds[i], currentUser.value.accountId)
        let review = respReview.data.review[0];
        if (review == undefined) {
            review = {
                reviewId: 0,
                productId: 0,
                accountId: 0,
                content: '',
                star: 0,
                created_at: '',
                updated_at: '',
                name: '',
                email: '',
                avatar: ''
            }
            starNums.value.push(0)

        } else {
            starNums.value.push(review.star)
        }
        reviews.value.push(review)

    }
}


async function updateShipmentTracking(orderId: number) {
    try {

        await orderServices.updateShipment(orderId, {
            shipmentTracking: "Đã nhận được hàng"
        })

        orders.value.forEach(e => {
            if (e.orderId == orderId)
                e.shipmentTracking = "Đã nhận được hàng"
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

const reviewCheckMap = ref(new Map<number, boolean>());
onMounted(async () => {
    try {
        orders.value = [];

        if (checkLogin()) {
            let resp = await accountServices.getMe(token);
            currentUser.value = resp.data.account[0];
        } else {
            router.push({ name: "home" });
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
                imageBase64: data.imageBase64.split('||'),
                confirm: data.confirm,
                cancel: data.cancel,
                paymentType: data.paymentType,
                note: data.note
            });
        }

        for (let i = 0; i < orders.value.length; i++) {

            let respCheckReview = await orderServices.checkReview(orders.value[i].orderId, {
                accountId: currentUser.value.accountId
            })

            reviewCheckMap.value.set(orders.value[i].orderId, true);

            for (let j = 0; j < respCheckReview.data.length; j++) {
                if (respCheckReview.data[j].review_status == 0)
                    reviewCheckMap.value.set(orders.value[i].orderId, false);
            }
        }

    } catch (error) {
        console.log(error)
    }
})

</script>

<style scoped>
.linkp {
    color: black;
    text-decoration: none;
}

.linkp:hover {
    text-decoration: underline;
}

.rating-wrapper {
    direction: rtl !important;

    .star-rating {
        color: rgba(198, 206, 237, .8);
        cursor: pointer;
        display: inline-flex;
        font-size: 1.5rem;
        transition: color 0.5s;
    }

    .rating-input {
        display: none;
    }

    .star-rating:hover,
    .star-rating:hover~.star-rating,
    .rating-input:checked~.star-rating {
        color: #F4BB47;
    }
}

.active {
    font-weight: bold;
}
</style>