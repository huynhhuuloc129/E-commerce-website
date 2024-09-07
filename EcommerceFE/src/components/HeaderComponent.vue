<template>
    <div id="header" class="w-100 text-center">
        <form action="" id="search-input">
            <input type="text" id="text-search-input" placeholder="Tìm sản phẩm">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="search-button"
                class="bi bi-search ms-2" viewBox="0 0 16 16">
                <path
                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
            </svg>
        </form>
        <h1 class="text-center fw-bold mb-4 text-uppercase"><a id="header-title" href="http://localhost:5173">Sunny
                Cosmetic</a>
        </h1>
        <div class="d-flex justify-content-between">
            <div class="d-flex justify-content-evenly container">

                <button class="header-item fw-bold text-uppercase btn border-0 " type="button" id="dropdownMenuButton2"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    Dưỡng da
                </button>
                <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton2">
                    <li class="row">
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Chăm sóc da mặt</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Tinh chất dưỡng da
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Sữa rữa mặt
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Kem dưỡng da ban đêm
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TOÀN BỘ SẢN PHẨM CHĂM SÓC DA MẶT
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Tẩy trang và làm sạch</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Micellar Water
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Sửa rửa mặt Aura Perfect
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Sửa rửa mặt Revitalift
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TẤT CẢ SẢN PHẨM TẨY TRANG VÀ LÀM SẠCH
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Kem chống nắng</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Kem Chống nắng UV Defender
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Kem Chống nắng UV Perfect
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TẤT CẢ KEM CHỐNG NẮNG
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Các Dòng Sản phẩm Dưỡng da</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Glycolic Bright
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Aura Perfect
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Aura Perfect Clinical
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Revitalift
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Micellar Water
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Tất cả Sản phẩm Dưỡng da
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>

                <button class="header-item fw-bold text-uppercase btn border-0" type="button" id="dropdownMenuButton3"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    Trang điểm
                </button>


                <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton3">
                    <li class="row">
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Sản phẩm trang điểm mặt</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Kem nền
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Phấn phủ
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Kem che khuyết đếm
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Phấn má hồng
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TOÀN BỘ SẢN PHẨM TRANG ĐIỂM MẶT
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Trang điểm môi</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Son thỏi
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Son kem, son tint
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TOÀN BỘ TRANG ĐIỂM MÔI
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Trang điểm mắt</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Mascara
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Kẻ mắt
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Chì kẻ mày
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TẤT CẢ SẢN PHẨM TRANG ĐIỂM MẮT
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Các dòng Sản phẩm Trang điểm</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Brow Artist
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Color Riche
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Chiffon Signature
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Infallible
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Rouge Signature
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Tất cả Sản phẩm Trang điểm
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>

                <button class="header-item fw-bold text-uppercase btn border-0 " type="button" id="dropdownMenuButton4"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    Chăm sóc, nhuộm tóc
                </button>

                <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton4">
                    <li class="row">
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Chăm sóc tóc</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Dầu gội
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Dầu xả
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Kem dưỡng tóc
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Mặt nạ dưỡng tóc
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Tinh chất dưỡng tóc
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TOÀN BỘ SẢN PHẨM CHĂM SÓC TÓC
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Thuốc nhuộm tóc</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Nhuộm Phủ Bạc không hư tổn Excellence Creme
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Nhuộm Thời Trang chuẩn salon Excellence Fashion
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    XEM TẤT CẢ THUỐC NHUỘM TÓC
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Các Nhãn hiệu Sản phẩm tóc</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Color Vive
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Extraordinary Oil
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Fall Resist
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Total Repair 5
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Excellence
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Tất cả Sản phẩm Tóc
                                </a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3 mt-3">
                            <h6 class="">Các dòng Sản phẩm Trang điểm</h6>

                            <div class="mt-1">
                                <a href="" class="link">
                                    Brow Artist
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Color Riche
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Chiffon Signature
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Infallible
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Rouge Signature
                                </a>
                            </div>
                            <div class="mt-1">
                                <a href="" class="link">
                                    Tất cả Sản phẩm Trang điểm
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>


                <button class="header-item fw-bold text-uppercase btn border-0 " type="button" id="dropdownMenuButton1"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    Nhãn hàng
                </button>

                <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton1">
                    <h6 class=" ms-5 mt-3">Các thương hiệu</h6>
                    <li class="row">
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands1" class="mt-1 text-uppercase" :key="brand">
                                <a href="" class="link">{{ brand }}</a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands2" class="mt-1 text-uppercase" :key="brand">
                                <a href="" class="link">{{ brand }}</a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands3" class="mt-1 text-uppercase" :key="brand">
                                <a href="" class="link">{{ brand }}</a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands4" class="mt-1 text-uppercase" :key="brand">
                                <a href="" class="link">{{ brand }}</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div>
                <div v-if="currentUser.accountId == 0" class="d-flex justify-content-between">
                    <button class="btn btn-light me-2 fw-bold text-white" style="background-color: #fbbfc0;">
                        <a class="header-link-login" href="#" @click="pushToLogin($event)">
                            Đăng nhập
                        </a></button>
                    <button class="btn btn-light fw-bold"><a class="header-link-signup" href="#"
                            @click="pushToSignUp($event)">Đăng ký</a></button>
                </div>

                <div v-else class="d-flex justify-content-between">
                    <div class="dropdown">
                        <button data-mdb-button-init data-mdb-ripple-init data-mdb-dropdown-init
                            class="btn btn-light dropdown-toggle me-2" type="button" id="dropdownMenuButton"
                            data-mdb-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user" style="color: #fbbfc0; "></i>

                        </button>
                        <ul class="dropdown-menu rounded" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="#">Tài khoản cá nhân</a></li>
                            <li><a class="dropdown-item" href="#">Đơn mua</a></li>
                            <li><a class="dropdown-item" href="#" @click="signOut">Đăng xuất</a></li>
                        </ul>
                    </div>
                    <button class="btn btn-light me-5">

                        <i class="fa-solid fa-cart-shopping" style="color: #fbbfc0"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import accountServices from '@/services/account.services';
import brandServices from '@/services/brand.services';

import { useCookies } from "vue3-cookies";
import { useRouter } from "vue-router";
import { onMounted, ref } from 'vue';
import Swal from "sweetalert2";

const router = useRouter();

const cookies = useCookies();
const token = cookies.cookies.get("Token");

const brands1 = ref([] as string[]);
const brands2 = ref([] as string[]);
const brands3 = ref([] as string[]);
const brands4 = ref([] as string[]);

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

const brands = ref([
    {
        brandId: 0,
        name: '',
        created_at: '',
        updated_at: ''
    }
])

function pushToSignUp(e: any) {
    e.preventDefault();
    router.push({ name: "signup" });
}


function pushToLogin(e: any) {
    e.preventDefault();
    router.push({ name: "login" });
}

function signOut() {
    document.cookie = "Token" + "=;expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    window.location.reload();
}

onMounted(async () => {
    let resp = await brandServices.getAll();
    brands.value = resp.data.brand

    let arrLen = Math.floor(brands.value.length / 4)
    let arrLenMod = brands.value.length % 4
    brands1.value = []
    brands2.value = []
    brands3.value = []
    brands4.value = []

    console.log(arrLen, arrLenMod)

    for (let i = 0; i < arrLen; i++) {
        brands1.value.push(brands.value[i].name)
        if (arrLenMod == 1) {
            brands2.value.push(brands.value[i + arrLen + 1].name)
            brands3.value.push(brands.value[i + arrLen * 2].name)
            brands4.value.push(brands.value[i + arrLen * 3].name)
        } else if (arrLenMod == 2) {
            brands2.value.push(brands.value[i + arrLen + 1].name)
            brands3.value.push(brands.value[i + arrLen * 2 + 1].name)
            brands4.value.push(brands.value[i + arrLen * 3].name)
        } else if (arrLenMod == 3) {
            brands2.value.push(brands.value[i + arrLen + 1].name)
            brands3.value.push(brands.value[i + arrLen * 2 + 1].name)
            brands4.value.push(brands.value[i + arrLen * 3 + 1].name)
        } else {
            brands2.value.push(brands.value[i + arrLen].name)
            brands3.value.push(brands.value[i + arrLen * 2].name)
            brands4.value.push(brands.value[i + arrLen * 3].name)
        }
    }

    if (arrLenMod == 1) {
        brands1.value.push(brands.value[arrLen].name)
    } else if (arrLenMod == 2) {
        brands1.value.push(brands.value[arrLen].name)
        brands2.value.push(brands.value[arrLen * 2 + 1].name)
    } else {
        brands1.value.push(brands.value[arrLen].name)
        brands2.value.push(brands.value[arrLen * 2 + 1].name)
        brands3.value.push(brands.value[arrLen * 3 + 2].name)
    }

    try {
        let resp = await accountServices.getMe(token);
        currentUser.value = resp.data.account[0];
    } catch (error) {
        console.log(error);
    }
})

</script>

<style scoped>
.header-item:hover {
    cursor: pointer;
    text-decoration: underline;
}

.header-item {
    outline: none;
    color: white;
}

.link {
    color: black;
    text-decoration: none;
}

.link:hover {
    text-decoration: underline;
    background-color: none;
}

#header {
    color: white;
    position: absolute;
    transition: 0.3s;
    padding: 25px;
    background-color: none;
}

#header:hover {
    color: black;
    background-color: white;

    #text-search-input {
        color: black;
        border-bottom: 1px solid black;
    }

    #text-search-input::placeholder {
        color: black;
    }

    .header-item {
        color: black;
    }

    #header-title {
        color: black;
        background-color: none;
    }
}

.dropdown-menu {
    border: 1px 0 0 0;
    border-radius: 0px;
    width: 100%;
}

#header-title {
    text-decoration: none;
    color: white;
}


#header-title:hover {
    background-color: transparent;
}

#search-input {
    position: absolute;
    right: 0;
    margin-right: 50px;
}

#text-search-input {
    color: white;
    width: 300px;
    transition: 0.3s;
    background-color: transparent;
    border: none;
    border-bottom: 1px solid white;
}

#text-search-input::placeholder {
    color: white;
}

#text-search-input:focus {
    outline: none;
}

#search-button:hover {
    cursor: pointer;
}

.header-link-login {
    text-decoration: none;
    color: white;
    font-weight: bold;

}

.header-link-signup {
    text-decoration: none;
    color: black;
    font-weight: bold;
}

.dropdown:hover>.dropdown-menu {
    display: block;
}

.dropdown>.dropdown-toggle:active {
    /*Without this, clicking will make it sticky*/
    pointer-events: none;
}

.dropdown-menu {
    overflow-x: hidden;
}
</style>