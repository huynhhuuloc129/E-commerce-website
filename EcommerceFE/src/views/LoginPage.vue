<template>
    <div>
        <!-- Login 11 - Bootstrap Brain Component -->
        <section id="login-section" class="py-3 py-md-5 py-xl-8 d-flex justify-content-center" style="width: 100vw;">
            <div id="login-container" class="container">
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
                                                    placeholder="name@example.com" required>
                                                <label for="email" class="form-label">Tài khoản</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating mb-3">
                                                <input type="password" v-model="inputFormLogin.password"
                                                    class="form-control border-0 border-bottom" name="password"
                                                    id="password" value="" placeholder="Password" required>
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
                                    <a href="#!" class="btn btn-lg btn-danger">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                                            <path
                                                d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                                        </svg>
                                        <span class="ms-2 fs-6">Đăng nhập với Google</span>
                                    </a>
                                    <a href="#!" class="btn btn-lg btn-primary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                            <path
                                                d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
                                        </svg>
                                        <span class="ms-2 fs-6">Đăng nhập với Facebook</span>
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
import checkLogin from "@/utilities/utilities";

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

async function onLogin(e: any) {
    e.preventDefault();
    try {
        currentToken.value = await accountServices.login({
            username: inputFormLogin.value.username,
            password: inputFormLogin.value.password,
        });

        cookies.cookies.set("Token", currentToken.value.token);
        cookies.cookies.set("UserId", currentToken.value.id);

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
#header,
#footer {
    display: none;
}

#login-section {

    background-image: url('../assets/loginCover1.png');
    height: 100vh;
    background-size: 100vw 100vh;
}

#login-container {
    backdrop-filter: blur(8px);
    padding: 70px 0 70px 10px;
    border-radius: 20px;
    border: 1px solid #fbbfc0;
}
</style>