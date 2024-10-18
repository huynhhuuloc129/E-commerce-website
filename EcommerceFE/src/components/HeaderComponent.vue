<template>
    <div id="header" class="w-100 text-center archivo-bold">
        <form @submit="pushToSearchPage($event, searchContent)" id="search-input">
            <input type="text" v-model="searchContent" id="text-search-input" placeholder="Tìm sản phẩm">
            <button type="submit" style="background-color: transparent; border: 0px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="search-button"
                    class="bi bi-search ms-2" viewBox="0 0 16 16">
                    <path
                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                </svg>
            </button>
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold text-uppercase">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold text-uppercase">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold">
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
                                <a href="" class="link fw-bold text-uppercase">
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
                                <a href="" class="link fw-bold text-uppercase">
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
                            <div v-for="brand in brands1" class="mt-1 text-uppercase" :key="brand.brandId">
                                <a :href="'http://localhost:5173/brand/' + brand.brandId" class="link">{{ brand.name
                                    }}</a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands2" class="mt-1 text-uppercase" :key="brand.brandId">
                                <a :href="'http://localhost:5173/brand/' + brand.brandId" class="link">{{ brand.name
                                    }}</a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands3" class="mt-1 text-uppercase" :key="brand.brandId">
                                <a :href="'http://localhost:5173/brand/' + brand.brandId" class="link">{{ brand.name
                                    }}</a>
                            </div>
                        </div>
                        <div class="col ms-5 mb-3">
                            <div v-for="brand in brands4" class="mt-1 text-uppercase" :key="brand.brandId">
                                <a :href="'http://localhost:5173/brand/' + brand.brandId" class="link">{{ brand.name
                                    }}</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div>
                <div v-if="currentUser != null && currentUser.accountId == 0" class="d-flex justify-content-between">
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
                            
                            <img v-if="currentUser != null && currentUser.avatar != null && currentUser.avatar != ''" :src="currentUser.avatar" height="25px" width="25px" alt="">
                            <i v-else class="fa-solid fa-user" style="color: #fbbfc0; "></i>

                        </button>
                        <ul class="dropdown-menu rounded" aria-labelledby="dropdownMenuButton">
                            <li><a class="dropdown-item" href="http://localhost:5173/personal">Tài khoản cá nhân</a>
                            </li>
                            <li v-if="currentUser != null && currentUser.username == 'admin'"><a class="dropdown-item"
                                    href="http://localhost:5173/admin">Admin</a></li>
                            <li><a class="dropdown-item" href="http://localhost:5173/orders">Đơn mua</a></li>
                            <li><a class="dropdown-item" href="#" @click="signOut">Đăng xuất</a></li>
                        </ul>
                    </div>


                    <button type="button" class="btn btn-light me-5 dropdown-toggle" id="dropdownMenuButtonCart"
                        data-bs-toggle="dropdown" aria-expanded="false" @click="getAllSProducts">

                        <i class="fa-solid fa-cart-shopping" style="color: #fbbfc0"></i>
                    </button>

                    <div class="dropdown-menu w-25 rounded" aria-labelledby="dropdownMenuButtonCart">
                        <span v-if="sProducts.length > 0" class="ms-3">
                            Sản phẩm mới thêm
                        </span>
                        <span v-else class="ms-3">
                            Chưa có sản phẩm nào
                        </span>

                        <div v-for="(sProduct, index) in sProducts" :key="sProduct.selectedProductId"
                            class="cart-product ps-3 d-flex justify-content-between">

                            <div class="d-flex">
                                <img :src="images[index].base64" class="me-2" height="auto" width="90" alt="">
                                <div class="d-flex flex-column">

                                    <a class="text-wrap cart-items"
                                        :href="'http://localhost:5173/products/' + sProduct.proId">{{ sProduct.name
                                        }}</a>
                                    <div>
                                        Số lượng: {{ sProduct.quantitySelected }}
                                    </div>
                                    <div class="price" v-if="sProduct.sellingPrice != null">
                                        Đơn Giá:
                                        {{ sProduct.sellingPrice.toLocaleString("it-IT", {
                                            style: "currency",
                                            currency: "VND",
                                        }) }}
                                    </div>
                                </div>
                            </div>

                            <button @click="removeSelectedProduct(index)" class="btn btn-light"><i
                                    class="fa-solid fa-x"></i></button>


                        </div>

                        <div class="text-end">
                            <button class="btn cart-btn me-3 mt-2" @click="pushToCart">Xem giỏ hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import selectedProductServices from '@/services/selectedProduct.services';
import accountServices from '@/services/account.services';
import brandServices from '@/services/brand.services';
import imageServices from '@/services/image.services';

import { useCookies } from "vue3-cookies";
import { useRouter } from "vue-router";
import { onMounted, ref } from 'vue';
import Swal from "sweetalert2";

const router = useRouter();

const cookies = useCookies();
const token = cookies.cookies.get("Token");

type brandType = {
    brandId: number,
    name: string,
    created_at: string,
    updated_at: string
}

const brands1 = ref([] as brandType[]);
const brands2 = ref([] as brandType[]);
const brands3 = ref([] as brandType[]);
const brands4 = ref([] as brandType[]);

const searchContent = ref('')

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
    name: ''
}])

const brands = ref([
    {
        brandId: 0,
        name: '',
        created_at: '',
        updated_at: ''
    }
])

const categories = ref([{
    catId: 0,
    name: '',
    description: '',
    created_at: '',
    updated_at: ''
}])

function pushToSignUp(e: any) {
    e.preventDefault();
    router.push({ name: "signup" });
}

function pushToSearchPage(e: any, content: string) {
    e.preventDefault();
    router.push({ name: "search", params: { content: content } });
}
function pushToLogin(e: any) {
    e.preventDefault();
    router.push({ name: "login" });
}
function pushToCart(e: any) {
    e.preventDefault();
    router.push({ name: "cart" });
}

function signOut() {
    document.cookie = "Token" + "=;expires=Thu, 01 Jan 1970 00:00:01 GMT;";
    window.location.reload();
}

async function getAllSProducts() {
    try {
        // get selected product

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

}

async function removeSelectedProduct(index: number) {
    try {

        
        await selectedProductServices.delete(sProducts.value[index].selectedProductId)
        
        sProducts.value.splice(index, 1)
    } catch (error) {
        console.log(error)
    }
}

onMounted(async () => {

    // get all brand and divide it by 4
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
        brands1.value.push(brands.value[i])
        if (arrLenMod == 1) {
            brands2.value.push(brands.value[i + arrLen + 1])
            brands3.value.push(brands.value[i + arrLen * 2])
            brands4.value.push(brands.value[i + arrLen * 3])
        } else if (arrLenMod == 2) {
            brands2.value.push(brands.value[i + arrLen + 1])
            brands3.value.push(brands.value[i + arrLen * 2 + 1])
            brands4.value.push(brands.value[i + arrLen * 3])
        } else if (arrLenMod == 3) {
            brands2.value.push(brands.value[i + arrLen + 1])
            brands3.value.push(brands.value[i + arrLen * 2 + 1])
            brands4.value.push(brands.value[i + arrLen * 3 + 1])
        } else {
            brands2.value.push(brands.value[i + arrLen])
            brands3.value.push(brands.value[i + arrLen * 2])
            brands4.value.push(brands.value[i + arrLen * 3])
        }
    }

    if (arrLenMod == 1) {
        brands1.value.push(brands.value[arrLen])
    } else if (arrLenMod == 2) {
        brands1.value.push(brands.value[arrLen])
        brands2.value.push(brands.value[arrLen * 2 + 1])
    } else {
        brands1.value.push(brands.value[arrLen])
        brands2.value.push(brands.value[arrLen * 2 + 1])
        brands3.value.push(brands.value[arrLen * 3 + 2])
    }


    try {
        // get current User

        let resp = await accountServices.getMe(token);
        currentUser.value = resp.data.account[0];

    } catch (error) {
        console.log(error);
    }
})

</script>

<style scoped>
.cart-btn {
    background-color: #fbbfc0;
    color: white;
    border-radius: 0px;

}

.cart-items {
    color: black;
    text-decoration: none;
}

.cart-items:hover {
    text-decoration: underline;
}

.cart-product:hover {
    background-color: rgb(245, 241, 241);
}

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

    #search-button {
        color: black;
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

#search-button {
    color: white;
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