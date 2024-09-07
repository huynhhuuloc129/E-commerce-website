<template>
    <div>
        <!-- Login 11 - Bootstrap Brain Component -->
        <section id="register-section" class="py-3 py-md-5 py-xl-8 d-flex justify-content-center"
            style="width: 100vw; ">
            <div id="register-container" class="container" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                <button class="btn btn-primary fw-bold" style="background-color: #fbbfc0;" @click="pushToHome($event)">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
                        width="20" height="20" viewBox="0 0 1080 1080" xml:space="preserve">
                        <desc>Created with Fabric.js 5.2.4</desc>
                        <defs>
                        </defs>
                        <g transform="matrix(1 0 0 1 540 540)" id="72aced9b-aa54-4249-9dc6-9e19e554784b">
                            <rect
                                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1; visibility: hidden;"
                                vector-effect="non-scaling-stroke" x="-540" y="-540" rx="0" ry="0" width="1080"
                                height="1080" />
                        </g>
                        <g transform="matrix(1 0 0 1 540 540)" id="dc768630-a52b-42d8-a820-e479ef290ab0">
                        </g>
                        <g transform="matrix(45 0 0 45 540 540)" id="Layer_1">
                            <path
                                style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-dashoffset: 0; stroke-linejoin: miter; stroke-miterlimit: 4; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;"
                                transform=" translate(-12, -12)"
                                d="M 17 13 L 17 9 L 16 9 L 16 2 C 15.999803201759228 1.3068318723271313 15.64070241533253 0.6631905605624568 15.050948300515039 0.2989486409446078 C 14.461194185697549 -0.06529327867324142 13.724889129355653 -0.0981927775718634 13.105 0.2120000000000004 L 9.658000000000001 1.936 C 8.639069646382637 2.4411528923331502 7.996029367026038 3.4817301357069486 8.000000000000002 4.6190000000000015 L 8.000000000000002 9 L 7.000000000000002 9 L 7.000000000000002 13 L 5.000000000000002 13 L 5.000000000000002 24 L 19 24 L 19 13 z M 10 4.619 C 10.000202218169136 4.240334289603904 10.214270588465137 3.894263542687765 10.553 3.725 L 14 1.9999999999999996 L 14 9 L 10 9 z M 9 11 L 15 11 L 15 13 L 9 13 z M 17 22 L 7 22 L 7 15 L 17 15 z"
                                stroke-linecap="round" />
                        </g>
                    </svg>
                    Trang chủ</button>
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <h2 class="display-5 fw-bold text-center">Đăng ký</h2>
                            <p class="text-center">Đã có tài khoản? <a href="#" @click="pushToLogin($event)">Đăng
                                    nhập</a></p>
                        </div>
                    </div>

                </div>
                <div class="row justify-content-center">
                    <div class="">
                        <div class="row gy-5 justify-content-center">
                            <div class="col-12 col-lg-5">
                                <form @submit="onRegister">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="">
                                            <div class="form-floating">
                                                <input type="text" v-model="inputFormRegister.username"
                                                    class="form-control border-0 border-bottom" name="username"
                                                    id="username" placeholder="name@example.com" required>
                                                <label for="username" class="form-label">Tài khoản</label>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="form-floating">
                                                <input type="password" v-model="inputFormRegister.password"
                                                    class="form-control border-0 border-bottom" name="password"
                                                    id="password" placeholder="Password" required>
                                                <label for="password" class="form-label">Mật khẩu</label>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="form-floating">
                                                <input type="text" v-model="inputFormRegister.name"
                                                    class="form-control border-0 border-bottom" name="name" id="name"
                                                    placeholder="Họ và tên" required>
                                                <label for="name" class="form-label">Họ tên</label>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="form-floating">
                                                <input type="email" class="form-control border-0 border-bottom"
                                                    v-model="inputFormRegister.email" name="email" id="email"
                                                    placeholder="Email" required>
                                                <label for="email" class="form-label">Email</label>
                                            </div>
                                        </div>

                                        <div class="d-flex">
                                            <div class="me-3">
                                                <div class="form-floating">
                                                    <input type="text" v-model="inputFormRegister.phone"
                                                        class="form-control border-0 border-bottom" name="phone"
                                                        id="phone" placeholder="Số điện thoại" required>
                                                    <label for="phone" class="form-label">Điện thoại</label>
                                                </div>
                                            </div>

                                            <div class="">
                                                <div class="form-floating">
                                                    <input type="date" v-model="inputFormRegister.birthDate"
                                                        class="form-control border-0 border-bottom" name="date"
                                                        id="date" placeholder="Số điện thoại" required>
                                                    <label for="date" class="form-label">Ngày sinh</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="">
                                            <div class="form-floating">
                                                <input type="text" v-model="inputFormRegister.billingAddress"
                                                    class="form-control border-0 border-bottom" name="address"
                                                    id="address" placeholder="Địa chỉ nhận hàng" required>
                                                <label for="address" class="form-label">Địa chỉ nhận hàng</label>
                                            </div>
                                        </div>

                                        <div class="">
                                            <div class="d-grid">
                                                <button class="btn btn-primary btn-lg"
                                                    style="background-color: #fbbfc0;" type="submit"> Đăng ký </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script setup lang="ts">
import accountServices from '@/services/account.services';
import checkLogin from "@/utilities/utilities";

import { useRouter } from "vue-router";
import { onMounted, ref } from 'vue';
import Swal from "sweetalert2";

const router = useRouter();

const inputFormRegister = ref({
    username: "",
    password: "",
    email: "",
    phone: "",
    name: "",
    birthDate: "",
    billingAddress: ""
});

function pushToLogin(e: any) {
    e.preventDefault();
    router.push({ name: "login" });
}

function pushToHome(e: any) {
    e.preventDefault();
    router.push({ name: "home" });
}

async function onRegister(e: any) {
    e.preventDefault();
    try {
        let resp = await accountServices.register({
            username: inputFormRegister.value.username,
            password: inputFormRegister.value.password,
            email: inputFormRegister.value.email,
            phone: inputFormRegister.value.phone,
            name: inputFormRegister.value.name,
            birthDate: inputFormRegister.value.birthDate,
            billingAddress: inputFormRegister.value.billingAddress,
        });
        console.log(resp)

        Swal.fire({
            title: "Success!",
            text: "Register success.",
            icon: "success",
            confirmButtonText: "OK",
        });

        setTimeout(async () => {

            router.push({ name: "login" })
        }, 1500);


    } catch (err: any) {
        Swal.fire({
            title: "Error!",
            text: "Wrong username or password.",
            icon: "error",
            confirmButtonText: "OK",
        });
        console.log(err);
    }
};

onMounted(() => {
    if (checkLogin()) router.push({ name: "home" });
});
</script>

<style>
#header,
#footer {
    display: none;
}

#register-section {
    background-image: url('../assets/loginCover1.png');
    height: 100vh;
    background-size: 100vw 100vh;
}

#register-container {
    width: 50vw;
    backdrop-filter: blur(10px);
    padding: 20px 0 70px 10px;
    border-radius: 20px;
    border: 1px solid #fbbfc0;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}
</style>