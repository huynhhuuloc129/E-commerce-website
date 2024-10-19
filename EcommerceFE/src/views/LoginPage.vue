<template>
    <div>
        <!-- Login 11 - Bootstrap Brain Component -->
        <section id="login-section" class=" py-md-5 d-flex justify-content-center archivo-medium" style="width: 100vw;">
            <div id="login-container" class="">
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
                            <h2 class="display-5 fw-bold text-center">Đăng nhập</h2>
                            <p class="text-center m-0">Chưa có tài khoản? <a href="#"
                                    @click="pushToRegister($event)">Đăng ký</a></p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-lg-10 col-xl-8">
                        <div class="row gy-5 justify-content-center">
                            <div class="col-12 col-lg-5">
                                <form @submit="onLogin($event)">
                                    <div class="row gy-3 overflow-hidden">
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="text" v-model="inputFormLogin.username"
                                                    class="form-control border-0 border-bottom" name="email" id="email"
                                                    placeholder="name@example.com" required
                                                    style="box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                                                <label for="email" class="form-label">Tài khoản</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" v-model="inputFormLogin.password"
                                                    class="form-control border-0 border-bottom" name="password"
                                                    id="password" value="" placeholder="Password" required
                                                    style="box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                                                <label for="password" class="form-label">Mật khẩu</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="row justify-content-between">

                                                <div class="col-6">
                                                    <div class="">
                                                        <a href="#!" class="link-secondary text-decoration-none">Quên
                                                            mật khẩu?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-grid">
                                                <button class="btn btn-primary btn-lg"
                                                    style="background-color: #fbbfc0;" type="submit">Đăng nhập</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div
                                class="col-12 col-lg-2 d-flex align-items-center justify-content-center gap-3 flex-lg-column">
                                <div class="bg-dark h-100 d-none d-lg-block" style="width: 1px; --bs-bg-opacity: .1;">
                                </div>
                                <div class="bg-dark w-100 d-lg-none" style="height: 1px; --bs-bg-opacity: .1;"></div>
                                <div>Hoặc</div>
                                <div class="bg-dark h-100 d-none d-lg-block" style="width: 1px; --bs-bg-opacity: .1;">
                                </div>
                                <div class="bg-dark w-100 d-lg-none" style="height: 1px; --bs-bg-opacity: .1;"></div>
                            </div>
                            <div class="col-12 col-lg-5 d-flex align-items-center">
                                <div class="d-flex gap-3 flex-column w-100 ">
                                    <a href="#!">
                                        <GoogleLogin :callback="callback" />

                                    </a>
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
import accountServices from "@/services/account.services";
import { checkLogin } from "@/utilities/utilities";

import { decodeCredential } from "vue3-google-login";
import { useCookies } from "vue3-cookies";
import { useRouter } from "vue-router";
import { onMounted, ref } from 'vue';
import Swal from "sweetalert2";

const router = useRouter();
const cookies = useCookies();

const inputFormLogin = ref({
    username: "",
    password: "",
});

const currentToken = ref({
    token: "",
    id: "",
});

function pushToRegister(e: any) {
    e.preventDefault();
    router.push({ name: "signup" });
}

function pushToHome(e: any) {
    e.preventDefault();
    router.push({ name: "home" });
}

const callback = (response: any) => {

    console.log("Handle the response", decodeCredential(response.credential))
}

async function onLogin(e: any) {
    e.preventDefault();
    try {
        currentToken.value = await accountServices.login({
            username: inputFormLogin.value.username,
            password: inputFormLogin.value.password,
        });

        cookies.cookies.set("Token", currentToken.value.token);

        Swal.fire({
            title: "Success!",
            text: "Login success.",
            icon: "success",
            confirmButtonText: "OK",
        });

        setTimeout(async () => {

            router.push({ name: "home" })
        }, 1500);
    } catch (err: any) {
        Swal.fire({
            title: "Lỗi!",
            text: "Sai tài khoản hoặc mật khẩu",
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
#login-section {

    background-image: url('../assets/loginCover1.png');
    height: 100vh;
    background-size: 100vw 100vh;
}

#login-container {
    backdrop-filter: blur(8px);
    padding: 20px 0 0px 20px;
    border-radius: 20px;
    border: 1px solid #fbbfc0;
}
</style>