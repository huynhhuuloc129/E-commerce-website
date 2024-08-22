<template>
    <div id="header" class="w-100 text-center">
        <form action="" id="search-input">
            <input type="text" id="text-search-input" placeholder="Tìm sản phẩm">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" id="search-button" class="bi bi-search ms-2"
                viewBox="0 0 16 16">
                <path
                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
            </svg>
        </form>
        <h1 class="text-center mb-4 text-uppercase">Sunny Cosmetic</h1>
        <div class="d-flex justify-content-between container">
            <button class="header-item fw-bold text-uppercase btn border-0 " type="button" id="dropdownMenuButton1"
                data-bs-toggle="dropdown" aria-expanded="false">
                Nhãn hàng
            </button>

            <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton1">
                <h6 class=" ms-5 mt-3">Các thương hiệu</h6>
                <li class="row">
                    <div class="col ms-5 mb-3">
                        <div v-for="brand in brands1" class="mt-1" :key="brand">
                            <a href="" class="link">{{ brand }}</a>
                        </div>
                    </div>
                    <div class="col ms-5 mb-3">
                        <div v-for="brand in brands2" class="mt-1" :key="brand">
                            <a href="" class="link">{{ brand }}</a>
                        </div>
                    </div>
                    <div class="col ms-5 mb-3">
                        <div v-for="brand in brands3" class="mt-1" :key="brand">
                            <a href="" class="link">{{ brand }}</a>
                        </div>
                    </div>
                    <div class="col ms-5 mb-3">
                        <div v-for="brand in brands4" class="mt-1" :key="brand">
                            <a href="" class="link">{{ brand }}</a>
                        </div>
                    </div>
                </li>
            </ul>

            <button class="header-item fw-bold text-uppercase btn border-0" type="button" id="dropdownMenuButton2"
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

            <button class="header-item fw-bold text-uppercase btn border-0" type="button" id="dropdownMenuButton4"
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

            <button class="header-item fw-bold text-uppercase btn border-0" type="button" id="dropdownMenuButton5"
                data-bs-toggle="dropdown" aria-expanded="false">
                Bí quyết làm đẹp
            </button>
            <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton5">
                <li><a class="dropdown-item" href="#">Action2</a></li>
                <li><a class="dropdown-item" href="#">Another action12</a></li>
                <li><a class="dropdown-item" href="#">Something else here2</a></li>
            </ul>

            <button class="header-item fw-bold text-uppercase btn border-0" type="button" id="dropdownMenuButton6"
                data-bs-toggle="dropdown" aria-expanded="false">
                Tư vấn khách hàng
            </button>
            <ul class="dropdown-menu mt-3" aria-labelledby="dropdownMenuButton6">
                <li><a class="dropdown-item" href="#">Action2</a></li>
                <li><a class="dropdown-item" href="#">Another action12</a></li>
                <li><a class="dropdown-item" href="#">Something else here2</a></li>
            </ul>
        </div>

    </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

const brands1 = ref([] as string[]);
const brands2 = ref([] as string[]);
const brands3 = ref([] as string[]);
const brands4 = ref([] as string[]);

onMounted(() => {
    brands1.value = [`L'Oréal Paris`, `Estée Lauder`, `MAC Cosmetics`, `Chanel`, `Dior`]
    brands2.value = [`Lancôme`, `Clinique`, `Maybelline`, `NARS Cosmetics`, `Urban Decay`]
    brands3.value = [`Shiseido`, `Benefit Cosmetics`, `Bobbi Brown`, `Fenty Beauty`, `Charlotte Tilbury`]
    brands4.value = [`Giorgio Armani Beauty`, `Yves Saint Laurent Beauty`, `Tarte Cosmetics`, `Huda Beauty`, `Sephora Collection`]

})

</script>

<style scoped>
.header-item:hover {
    cursor: pointer;
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
        background-color: white;
        color: black;
        border-bottom: 1px solid black;
    }

    .header-item {
        color: black;
    }
}

.dropdown-menu {
    border: 1px 0 0 0;
    border-radius: 0px;
    width: 100%;
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
    background-color: #292929;
    border: none;
    border-bottom: 1px solid white;
}
#text-search-input:focus{
    outline: none;
}
#search-button:hover{
    cursor: pointer;
}
</style>