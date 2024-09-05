<template>
    <div>
        <!-- Login 11 - Bootstrap Brain Component -->
        <section id="register-section" class="py-3 py-md-5 py-xl-8 d-flex justify-content-center"
            style="width: 100vw; ">
            <div id="register-container" class="container" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <h2 class="display-5 fw-bold text-center">Đăng ký</h2>
                            <p class="text-center m-0">Đã có tài khoản? <a href="#" @click="pushToLogin($event)">Đăng
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
                                                    style="background-color: #fbbfc0;" type="submit">Đăng ký</button>
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