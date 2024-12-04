<template>
    <div class="mb-5" style="height: 145px; background-color: #fbbfc0;">
    </div>

    <div style="width: 100vw;" class="mb-5">



        <div id="whole-section" class="d-flex" style="margin: 0; background-color: white;">
            <nav id="sidebarMenu" style="z-index: 0" class="bg-white sticky-top">
                <div class="position-sticky">
                    <div ref="fragment" class="list-group list-group-flush mx-3 mt-4">
                        <a href="#" class="list-group-item list-group-item-action py-2 ripple active"
                            aria-current="true" data-bs-toggle="tab" data-bs-target="#personal">
                            <i class="fas fa-user fa-fw me-3"></i>
                            <span>Thông tin cá nhân</span>
                        </a>
                    </div>
                </div>
            </nav>

            <div class="tab-content" id="v-pills-tabContent">

                <div class="bg-light rounded tab-pane fade show active mt-4" id="personal" role="tabpanel"
                    aria-labelledby="personal-tab" style="width: 80vw">
                    <div class="container d-flex justify-content-center">
                        <div class="w-100 mt-3">
                            <h2>Hồ Sơ Của Tôi</h2>
                            <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>

                            <form @submit="updateUser" class="d-flex w-100 justify-content-between mb-5">
                                <div class="w-50">

                                    <!-- Username -->
                                    <div class="mb-3">
                                        <label for="username" class="form-label">Tên đăng nhập: {{ currentUser.username
                                            }}</label>
                                    </div>

                                    <!-- Name -->
                                    <div class="mb-3">
                                        <label for="name" class="fw-bold form-label">Tên:</label>
                                        <input type="text" class="form-control" id="name" v-model="currentUser.name"
                                            required>
                                    </div>

                                    <!-- Email -->
                                    <div class="mb-3">
                                        <label for="email" class="fw-bold form-label">Email:</label>
                                        <div class="d-flex align-items-center">
                                            <input type="email" class="form-control" id="email"
                                                v-model="currentUser.email" required />
                                        </div>
                                    </div>

                                    <!-- Phone -->


                                    <!-- Gender -->
                                    <!-- <div class="mb-3">
                                    <label class="form-label">Giới tính</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                            id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                            id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Nữ
                                        </label>
                                    </div>
                                </div> -->
                                    <div class="d-flex">
                                        <div class="mb-3 w-75">
                                            <label for="phone" class="fw-bold form-label">Số điện thoại:</label>
                                            <div class="d-flex align-items-center">
                                                <input type="tel" class="form-control" id="phone"
                                                    v-model="currentUser.phone" required />
                                            </div>
                                        </div>
                                        <!-- Date of Birth -->
                                        <div class="mb-3 w-25">
                                            <label for="dob" class="fw-bold form-label">Ngày sinh:</label>
                                            <input type="date" id="dob" class="form-control" required>
                                        </div>
                                    </div>


                                    <div class="mb-3">
                                        <label for="address" class="fw-bold form-label">Địa chỉ:</label>
                                        <input v-model="currentUser.billingAddress" type="text" id="address"
                                            class="form-control" required>
                                    </div>
                                    <button type="submit" class="btn btn-danger">Lưu</button>

                                </div>
                                <!-- Profile Picture -->
                            </form>
                            <form @submit="changePassword" class="">
                                <div>
                                    <label class="fw-bold" for="oldPassword">Mật khẩu cũ: </label>
                                    <input v-model="oldPassword" type="password" id="oldPassword" class="form-control"
                                        required>
                                </div>
                                <div class="mt-3">
                                    <label class="fw-bold" for="newPassword">Mật khẩu mới: </label>
                                    <input v-model="newPassword" type="password" id="newPassword" class="form-control"
                                        required>
                                </div>
                                <div class="mt-3">
                                    <label class="fw-bold" for="newRepeatPassword">Nhập lại mật khẩu: </label>
                                    <input v-model="newRepeatPassword" type="password" id="newRepeatPassword"
                                        class="form-control" required>
                                </div>

                                <button type="submit" class="mb-3 mt-3 btn btn-primary">Đổi mật khẩu</button>
                            </form>
                        </div>
                        <div class="mb-3 d-flex flex-column text-center mt-3 me-5">
                            <div class="d-flex flex-column">

                                <h4>Ảnh đại diện</h4>
                                <div class="d-flex align-items-center flex-column mt-3">
                                    <img v-if="currentUser.avatar != null && currentUser.avatar != ''"
                                        :src="currentUser.avatar" class="rounded-circle me-3 mb-5"
                                        style="width: 150px; height: 150px;" alt="Profile Image" />
                                    <input type="file" @change="uploadAvatar($event)" class="form-control"
                                        id="profileImage" />
                                </div>
                            </div>
                            <small class="form-text text-muted">
                                Dung lượng file tối đa 1 MB, Định dạng: JPEG, PNG
                            </small>
                        </div>



                    </div>

                </div>
                <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab"
                    style="width: 80vw">
                    <div v-if="orders.length == 0" class="d-flex flex-column justify-content-center align-items-center">
                        <h4 class="mt-5 text-center">Hiện tại chưa có đơn hàng nào</h4>
                        <button class="w-25 btn btn-primary"
                            style="border-radius: 0; background-color: #fbbfc0; border: 0;">
                            <a href="http://localhost:5173/" class="fw-bold"
                                style="text-decoration: none; color: white;">
                                Mua ngay
                            </a>
                        </button>
                    </div>

                    <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="reviewModalLabel">Đánh giá sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-2" v-for="(productId, index) in choosenOrder.productIds"
                                        :key="productId">
                                        <div class="row d-flex justify-content-center w-100">
                                            <div class="">
                                                <div class="card">
                                                    <div class=" p-4">
                                                        <div class="d-flex">
                                                            <img class="me-3" :src="choosenOrder.imageBase64[index]"
                                                                height="50" width="50" alt="">

                                                            <div>
                                                                <h6 class="fw-bold">{{ choosenOrder.productNames[index]
                                                                    }}</h6>
                                                                <div>{{ choosenOrder.typeNames[index] }}</div>
                                                            </div>
                                                        </div>
                                                        <hr>

                                                        <div class="d-flex flex-start w-100">
                                                            <img class="rounded-circle shadow-1-strong me-3"
                                                                v-if="checkLogin() == true && currentUser.avatar != ''"
                                                                :src="currentUser.avatar" alt="avatar" width="50"
                                                                height="50" />
                                                            <img v-else src="https://placehold.co/65x65" alt=""
                                                                class="rounded-circle shadow-1-strong me-3" width="65"
                                                                height="65">
                                                            <div class="w-100">

                                                                <h6>{{ currentUser.name }}</h6>
                                                                <div class="">
                                                                    <div
                                                                        class="d-flex align-items-center justify-content-start ">
                                                                        <div class="row justify-content-center">

                                                                            <!-- star rating -->
                                                                            <div class="rating-wrapper">

                                                                                <!-- star 5 -->
                                                                                <input v-model="starNums[index]"
                                                                                    class="rating-input" type="radio"
                                                                                    :id="'5-star-rating' + index"
                                                                                    :name="'star-rating' + index"
                                                                                    value="5">
                                                                                <label :for="'5-star-rating' + index"
                                                                                    class="star-rating">
                                                                                    <i
                                                                                        class="fas fa-star d-inline-block"></i>
                                                                                </label>

                                                                                <!-- star 4 -->
                                                                                <input v-model="starNums[index]"
                                                                                    class="rating-input" type="radio"
                                                                                    :id="'4-star-rating' + index"
                                                                                    :name="'star-rating' + index"
                                                                                    value="4">
                                                                                <label :for="'4-star-rating' + index"
                                                                                    class="star-rating star">
                                                                                    <i
                                                                                        class="fas fa-star d-inline-block"></i>
                                                                                </label>

                                                                                <!-- star 3 -->
                                                                                <input v-model="starNums[index]"
                                                                                    class="rating-input" type="radio"
                                                                                    :id="'3-star-rating' + index"
                                                                                    :name="'star-rating' + index"
                                                                                    value="3">
                                                                                <label :for="'3-star-rating' + index"
                                                                                    class="star-rating star">
                                                                                    <i
                                                                                        class="fas fa-star d-inline-block"></i>
                                                                                </label>

                                                                                <!-- star 2 -->
                                                                                <input v-model="starNums[index]"
                                                                                    class="rating-input" type="radio"
                                                                                    :id="'2-star-rating' + index"
                                                                                    :name="'star-rating' + index"
                                                                                    value="2">
                                                                                <label :for="'2-star-rating' + index"
                                                                                    class="star-rating star">
                                                                                    <i
                                                                                        class="fas fa-star d-inline-block"></i>
                                                                                </label>

                                                                                <!-- star 1 -->
                                                                                <input v-model="starNums[index]"
                                                                                    class="rating-input" type="radio"
                                                                                    :id="'1-star-rating' + index"
                                                                                    :name="'star-rating' + index"
                                                                                    value="1">
                                                                                <label :for="'1-star-rating' + index"
                                                                                    class="star-rating star">
                                                                                    <i
                                                                                        class="fas fa-star d-inline-block"></i>
                                                                                </label>

                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div data-mdb-input-init class="form-outline"
                                                                    v-if="reviews[index] != undefined">
                                                                    <textarea class="form-control" id="textAreaExample"
                                                                        rows="2"
                                                                        v-model="reviews[index].content"></textarea>
                                                                </div>
                                                                <div class="d-flex justify-content-between mt-3"
                                                                    v-if="reviews[index] != undefined">
                                                                    <button type="button" data-mdb-button-init
                                                                        data-mdb-ripple-init class="btn btn-dark"
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
                                        style="border-radius: 0px;  border: 0px;" @click="modifyReview">Đánh
                                        giá</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="favorite" role="tabpanel" aria-labelledby="favorite-tab"
                    style="width: 80vw">
                    <div>
                        <div class="container mt-5 px-2">
                            <h5 class="mb-2 d-flex justify-content-between align-items-center">
                                Thông tin tất cả người dùng của hệ thống
                            </h5>
                            <hr />
                            <div class="position-relative">
                                <span class="position-absolute search"><i class="fa fa-search"></i></span>
                                <input class="form-control form-control-special w-100"
                                    placeholder="Tìm kiếm bằng tên người dùng" />
                            </div>
                            <div class="table-responsive">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr class="bg-light">
                                            <th scope="col" width="1%">ID</th>
                                            <th scope="col" width="10%">Ngày tạo</th>
                                            <th scope="col" width="15%">Tài khoản</th>
                                            <th scope="col" width="35%">Tên đầy đủ</th>
                                            <th scope="col" width="15%">Email</th>
                                            <th scope="col" width="13%">Loại tài khoản</th>
                                            <th scope="col" class="text-end" width="20%"><span></span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>

                                        </tr>
                                    </tbody>
                                </table>

                                <div class="text-center">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import Swal from 'sweetalert2';
import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
import { useCookies } from 'vue3-cookies';
import { checkLogin } from "@/utilities/utilities";

import accountServices from '@/services/account.services';
import paymentServices from '@/services/payment.services';
import reviewServices from '@/services/review.services';
import orderServices from '@/services/order.services';
const cookies = useCookies();
const token = cookies.cookies.get("Token");

const router = useRouter();

const currentUser = ref({
    accountId: 0,
    username: '',
    password: '',
    name: '',
    email: '',
    phone: '',
    birthDate: '',
    avatar: '',
    billingAddress: '',
    created_at: '',
    updated_at: '',
    role: ""
})

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

async function addToPayment(id: number, amount: number, descriptions: string[]) {
    let mainDescription = "Thanh toán cho đơn hàng "
    for (let i = 0; i < descriptions.length; i++) {
        if (i < descriptions.length - 1) mainDescription += (descriptions[i] + ", ")
        else mainDescription += descriptions[i]
    }

    try {
        let resp = await paymentServices.create({
            id: id,
            amount: amount,
            description: mainDescription
        })
        window.location.href = resp.order_url;
    } catch (error) {
        console.log(error)
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
    console.log(length)
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

var updateUser = async (e: any) => {
    e.preventDefault();
    try {
        if (currentUser.value.birthDate == undefined || currentUser.value.birthDate == "") {
            currentUser.value.birthDate = "2002-10-10"
        }
        await accountServices.update(currentUser.value.accountId, {
            accountId: currentUser.value.accountId,
            name: currentUser.value.name,
            email: currentUser.value.email,
            phone: currentUser.value.phone,
            birthDate: currentUser.value.birthDate.slice(0, 10),
            billingAddress: currentUser.value.billingAddress
        })

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật tài khoản thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật tài khoản thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }

}

const oldPassword = ref('')
const newPassword = ref('')
const newRepeatPassword = ref('')
var changePassword = async (e: any) => {
    e.preventDefault();
    try {
        if (newPassword.value != newRepeatPassword.value) {
            Swal.fire({
                title: "Thất bại!",
                text: "Mật khẩu mới không trùng khớp",
                icon: "error",
                confirmButtonText: "OK",
                timer: 1500
            });
            return;
        }
        await accountServices.updatePassword({
            username: currentUser.value.username,
            accountId: currentUser.value.accountId,
            newPassword: newPassword.value,
            password: oldPassword.value
        })

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật mật khẩu tài khoản thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });

    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật mật khẩu tài khoản thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }

}

const toBase64 = (file: any) =>
    new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = reject;
    });


async function uploadAvatar(event: any) {
    try {
        let code = await toBase64(event.target.files[0]);

        currentUser.value.avatar = String(code);

        let resp = await accountServices.updateAvatar(currentUser.value.accountId, { avatar: currentUser.value.avatar })

        window.location.reload();
    } catch (err) {
        console.log(err);
    }
}

onMounted(async () => {
    try {
        if (!checkLogin()) {

            router.push({ name: "home" });
        }
        let resp = await accountServices.getMe(token);
        currentUser.value = resp.data.account[0];

        orders.value = [];

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
            console.log(respCheckReview.data)

            reviewCheckMap.value.set(orders.value[i].orderId, true);

            for (let j = 0; j < respCheckReview.data.length; j++) {
                if (respCheckReview.data[j].review_status == 0)
                    reviewCheckMap.value.set(orders.value[i].orderId, false);
            }
        }
    } catch (error) {
        console.log(error);
    }
})

</script>

<style scoped>
.list-group-item.active {
    border: 0px;
    background-color: #fbbfc0;
}

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

@media only screen and (max-width: 700px) {
    #whole-section {
        flex-direction: column;
    }
}
</style>