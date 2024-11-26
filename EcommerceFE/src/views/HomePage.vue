<template>
    <div id="video-section" style="overflow: hidden;">

        <video autoplay muted loop id="wallpaperVideo">
            <source src="@/assets/videoWallpaper.mp4" type="video/mp4">
        </video>
    </div>

    <div id="height-section" ></div>

    <div class="archivo-medium">
        <img id="cover" src="../assets/Cover.png">
        <div class="container first-product d-flex justify-content-between mt-5 ">
            <div class="width25 mt-3">
                <h5 class="text-homepage">Giàu thành phần dưỡng da, tạo cảm giác dễ chịu trên da</h5>
                <h1>Trang điểm phong cách <span class="fw-bold text-capitalize" v-if="brands[0] != null">{{
                    brands[0].name }}</span></h1>
            </div>

            <ul  class="d-flex product-section ">
                <li v-for="index in 5" :key="'firstPro' + index" class="ul-item card card-product"
                    @click="pushToProduct($event, firstProducts[index-1].proId)">
                    <div class="card-body text-center" v-if="firstProducts[index-1] != null">

                        <img class="product-img" :src="firstProducts[index-1].image" alt=""  width="">

                        <div class="mb-3 fw-bold small">{{ firstProducts[index-1].name }}</div>
                        <div class="text-truncate text-wrap fw-bold" style="height: 70px;">
                            {{ firstProducts[index-1].description }}
                        </div>

                        <div class="mt-5 fw-bold text-uppercase">
                            Xem chi tiết
                        </div>
                    </div>

                </li>

            </ul>

        </div>
        <div class="container mb-5" v-if="brands[0] != null">

            <a :href="'http://localhost:5173/brand/' + brands[0].brandId"
                class="container  text-uppercase fw-bold linkToBrand">
                Khám phá tất cả sản phẩm từ <span class="fw-bold">{{ brands[0].name }}</span>
            </a>
        </div>

        <img id="cover2" src="../assets/Cover2.png">
        <div class="container first-product d-flex justify-content-between mt-5">
            <div class="width25 mt-3">
                <h5 class="text-homepage">Giàu thành phần dưỡng da, tạo cảm giác dễ chịu trên da</h5>
                <h1>Trang điểm phong cách <span class="fw-bold text-capitalize" v-if="brands[1] != null">{{
                    brands[1].name }}</span></h1>
            </div>

            <ul class="d-flex product-section ">
                <li v-for="index in 5" :key="'secondPro' + index" class="ul-item card card-product"
                    @click="pushToProduct($event, secondProducts[index-1].proId)">
                    <div class="card-body text-center" v-if="secondProducts[index-1] != null">

                        <img class="product-img" :src="secondProducts[index-1].image" alt=""  width="">

                        <div class="mb-3 fw-bold small">{{ secondProducts[index-1].name }}</div>
                        <div class="text-truncate text-wrap fw-bold" style="height: 70px;">
                            {{ secondProducts[index-1].description }}
                        </div>
                        <!-- <div class="mt-2">
    VND 429,000đ
</div> -->
                        <div class="mt-5 fw-bold text-uppercase">
                            Xem chi tiết
                        </div>
                    </div>


                </li>
            </ul>

        </div>
        <div class="container mb-5" v-if="brands[1] != null">
            <a :href="'http://localhost:5173/brand/' + brands[1].brandId"
                class="container  text-uppercase fw-bold linkToBrand">
                Khám phá tất cả sản phẩm từ <span class="fw-bold">{{ brands[1].name }}</span>

            </a>
        </div>

        <img id="cover3" src="../assets/Cover3.png">
        <div class="container mt-5">

            <ul class="d-flex third-product justify-content-around align-items-center">
                <li v-for="index in Math.min(thirdProducts.length, 5)" :key="'thirdPro' + index" class="ul-item card card-product"
                    @click="pushToProduct($event, thirdProducts[index-1].proId)">
                    <div class="card-body text-center" v-if="thirdProducts[index-1] != null">

                        <img class="product-img" :src="thirdProducts[index-1].image" alt="" width="">

                        <div class="mb-3 fw-bold small">{{ thirdProducts[index-1].name }}</div>
                        <div class="text-truncate text-wrap fw-bold" style="height: 70px;">
                            {{ thirdProducts[index-1].description }}
                        </div>
      
                        <div class="mt-5 fw-bold text-uppercase">
                            Xem chi tiết
                        </div>
                    </div>
                </li>
            </ul>

            <div class="container justify-content-center text-center " v-if="brands[2] != null">
                <a :href="'http://localhost:5173/brand/' + brands[2].brandId"
                    class="container  text-uppercase fw-bold linkToBrand">
                    Khám phá tất cả sản phẩm từ <span class="fw-bold">{{ brands[2].name }}</span>

                </a>
            </div>
        </div>

        <div id="card-type" class="mt-5" style="background-color: #fbbfc0; padding: 60px 0 60px 0;">
            <div class="card card-hover-item" @click="pushToCategory($event, 2)"
                style="background-image: url('https://images.unsplash.com/photo-1610844228349-76b56e6ac462?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')">
                <h1 class="card-header card-hover-header">Dưỡng môi</h1>
            </div>
            
            <div class="card card-hover-item text-white" @click="pushToCategory($event, 4)"
                style="background-image: url('https://images.unsplash.com/photo-1556228720-195a672e8a03?q=80&w=2491&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')">
                <h1 class="card-header card-hover-header">Dưỡng da</h1>
            </div>
           
            <div class="card card-hover-item" @click="pushToCategory($event, 3)"
                style="background-image: url('https://images.unsplash.com/photo-1585751119414-ef2636f8aede?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')">
                <h1 class="card-header card-hover-header">Chăm sóc tóc</h1>
            </div>
        </div>

        <div class="container mt-5">
            <h4 class="text-uppercase">Các sản phẩm trang điểm</h4>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center"
                v-if="productsByCategory1.length > 0">

                <div v-for="(product) in productsByCategory1" :key="product.proId" class="card me-2 mb-2"
                    style="width: 15rem; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                    <div
                        :style="`height: 205px; background: url(${product.image}); background-size: cover; background-repeat: no-repeat;`">
                    </div>
                    <div class="card-body text-start">
                        <div> <span v-if="product.brandName != undefined"
                                class="author text-uppercase fw-bold text-secondary">{{
                                    product.brandName }}</span></div>
                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden"
                            @click="pushToProduct($event, product.proId)">{{
                                product.name }}</div>
                        <div class=" fw-bold text-danger">{{
                            product.unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-5">
            <h4 class="text-uppercase">Các sản phẩm chăm sóc tóc</h4>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center"
                v-if="productsByCategory2.length > 0">

                <div v-for="(product) in productsByCategory2" :key="product.proId" class="card me-2 mb-2"
                    style="width: 15rem; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                    <div
                        :style="`height: 205px; background: url(${product.image}); background-size: cover; background-repeat: no-repeat;`">
                    </div>
                    <div class="card-body text-start">
                        <div> <span v-if="product.brandName != undefined"
                                class="author text-uppercase fw-bold text-secondary">{{
                                    product.brandName }}</span></div>
                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden"
                            @click="pushToProduct($event, product.proId)">{{
                                product.name }}</div>
                        <div class=" fw-bold text-danger">{{
                            product.unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-5 mb-5">
            <h4 class="text-uppercase">Các sản phẩm dưỡng da</h4>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center"
                v-if="productsByCategory3.length > 0">

                <div v-for="(product) in productsByCategory3" :key="product.proId" class="card me-2 mb-2"
                    style="width: 15rem; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                    <div
                        :style="`height: 205px; background: url(${product.image}); background-size: cover; background-repeat: no-repeat;`">
                    </div>
                    <div class="card-body text-start">
                        <div> <span v-if="product.brandName != undefined"
                                class="author text-uppercase fw-bold text-secondary">{{
                                    product.brandName }}</span></div>
                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden"
                            @click="pushToProduct($event, product.proId)">{{
                                product.name }}</div>
                        <div class=" fw-bold text-danger">{{
                            product.unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-5 mb-5">
            <h4 class="text-uppercase">Các sản phẩm bán chạy nhất</h4>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center"
                v-if="topSaleProducts.length > 0">

                <div v-for="(product) in topSaleProducts" :key="product.proId" class="card me-2 mb-2"
                    style="width: 15rem; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                    <div
                        :style="`height: 205px; background: url(${product.image}); background-size: cover; background-repeat: no-repeat;`">
                    </div>
                    <div class="card-body text-start">
                        <div> <span v-if="product.brandName != undefined"
                                class="author text-uppercase fw-bold text-secondary">{{
                                    product.brandName }}</span></div>
                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden"
                            @click="pushToProduct($event, product.proId)">{{
                                product.name }}</div>
                        <div class=" fw-bold text-danger">{{
                            product.unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { useCookies } from "vue3-cookies";
import { useRouter } from "vue-router";
import { ref, onMounted, computed } from 'vue';
import Swal from "sweetalert2";
import brandServices from "@/services/brand.services";
import productServices from "@/services/product.sevices";
import imageServices from "@/services/image.services";

const router = useRouter();
const brands = ref([{
    brandId: 0,
    name: '',
    created_at: '',
    updated_at: '',
    logo: ''
}])

type productType = {
    proId: number,
    catId: number,
    brandId: number,
    name: string,
    description: string,
    unit: string,
    guide: string,
    created_at: string,
    updated_at: string,
    maintain: string,
    note: string,
    image: string
}

const firstProducts = ref([] as productType[])
const secondProducts = ref([] as productType[])
const thirdProducts = ref([] as productType[])

type productDetail = {
    proId: number,
    catId: number,
    brandId: number,
    name: string,
    description: string,
    unit: string,
    guide: string,
    created_at: string,
    updated_at: string,
    maintain: string,
    note: string,
    unitPrice: number,
    brandName: string,
    image: string
}

const productsByCategory1 = ref([] as productDetail[])
const productsByCategory2 = ref([] as productDetail[])
const productsByCategory3 = ref([] as productDetail[])

const topSaleProducts = ref([{
    proId: 0,
    catId: 0,
    brandId: 0,
    name: "",
    description: "",
    unit: "",
    guide: "",
    created_at: "",
    updated_at: "",
    maintain: "",
    note: "",
    unitPrice: 0,
    brandName: "",
    image: "",
    totalSales: 0
}])

function pushToProduct(e: any, id: number) {
    e.preventDefault();
    router.push({ name: "products", params: { id: id } });
}

function pushToCategory(e: any, id: number) {
    e.preventDefault();
    router.push({ name: "category", params: { id: id } });
}

onMounted(async () => {
    try {

        let respBrands = await brandServices.getTop10();
        brands.value = respBrands.data.brand;

        let respPro1 = await productServices.getAllByBrandId(brands.value[0].brandId)
        let respPro2 = await productServices.getAllByBrandId(brands.value[1].brandId)
        let respPro3 = await productServices.getAllByBrandId(brands.value[2].brandId)

        firstProducts.value = respPro1.data.products
        secondProducts.value = respPro2.data.products
        thirdProducts.value = respPro3.data.products

        for (let i = 0; i < 5; i++) {
            if (firstProducts.value[i] != null) {
                let respImg1 = await imageServices.getAllByBelongIdLimit1(firstProducts.value[i].proId)
                firstProducts.value[i].image = respImg1.data.image[0].base64
            }
            if (secondProducts.value[i] != null) {
                let respImg2 = await imageServices.getAllByBelongIdLimit1(secondProducts.value[i].proId)
                secondProducts.value[i].image = respImg2.data.image[0].base64
            }
            if (thirdProducts.value[i] != null) {
                let respImg3 = await imageServices.getAllByBelongIdLimit1(thirdProducts.value[i].proId)
                thirdProducts.value[i].image = respImg3.data.image[0].base64
            }

        }


        let respProdCate = await productServices.getAllByCategoryId(2);
        productsByCategory1.value = respProdCate.data.products

        respProdCate = await productServices.getAllByCategoryId(3);
        productsByCategory2.value = respProdCate.data.products

        respProdCate = await productServices.getAllByCategoryId(4);
        productsByCategory3.value = respProdCate.data.products

        let respTopSales = await productServices.getTopSale();
        topSaleProducts.value = respTopSales.data.products
    } catch (error) {
        console.log(error)
    }
})
</script>

<style scoped>
#wallpaperVideo {
    overflow: hidden;
    z-index: -1;
    position: absolute;
    width: 100%;
    height: auto;
}

#card-type {
    padding: 40px 80px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.card-wrap {
    margin: 10px;
    transform: perspective(800px);
    transform-style: preserve-3d;
    cursor: pointer;
}

.card-wrap:hover .card-info {
    transform: translateY(0);
}

.card-wrap:hover .card-info p {
    opacity: 1;
}

.card-wrap:hover .card-info,
.card-wrap:hover .card-info p {
    transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1);
}

.card-wrap:hover .card-info:after {
    transition: 5s cubic-bezier(0.23, 1, 0.32, 1);
    opacity: 1;
    transform: translateY(0);
}

.card-wrap:hover .card-bg {
    transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1), opacity 5s cubic-bezier(0.23, 1, 0.32, 1);
    opacity: 0.8;
}

.card-wrap:hover .card {
    transition: 0.6s cubic-bezier(0.23, 1, 0.32, 1), box-shadow 2s cubic-bezier(0.23, 1, 0.32, 1);
    box-shadow: rgba(255, 255, 255, 0.2) 0 0 40px 5px, rgba(255, 255, 255, 1) 0 0 0 1px, rgba(0, 0, 0, 0.66) 0 30px 60px 0, inset #333 0 0 0 5px, inset #fff 0 0 0 6px;
}

.card-hover-item {
    position: relative;
    flex: 0 0 240px;
    width: 240px;
    height: 320px;
    background-color: #333;
    overflow: hidden;
    border-radius: 10px;
    box-shadow: rgba(0, 0, 0, 0.66) 0 30px 60px 0, inset #333 0 0 0 5px, inset rgba(255, 255, 255, 0.5) 0 0 0 6px;
    transition: 1s cubic-bezier(0.445, 0.05, 0.55, 0.95);
}

.card-bg {
    opacity: 0.5;
    position: absolute;
    top: -20px;
    left: -20px;
    width: 100%;
    height: 100%;
    padding: 20px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    transition: 1s cubic-bezier(0.445, 0.05, 0.55, 0.95), opacity 5s 1s cubic-bezier(0.445, 0.05, 0.55, 0.95);
    pointer-events: none;
}

.card-info {
    padding: 20px;
    position: absolute;
    bottom: 0;
    color: #fff;
    transform: translateY(40%);
    transition: 0.6s 1.6s cubic-bezier(0.215, 0.61, 0.355, 1);
}

.card-info p {
    opacity: 0;
    text-shadow: rgba(0, 0, 0, 1) 0 2px 3px;
    transition: 0.6s 1.6s cubic-bezier(0.215, 0.61, 0.355, 1);
}

.card-info * {
    position: relative;
    z-index: 1;
}

.card-info:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    z-index: 0;
    width: 100%;
    height: 100%;
    background-image: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.6) 100%);
    background-blend-mode: overlay;
    opacity: 0;
    transform: translateY(100%);
    transition: 5s 1s cubic-bezier(0.445, 0.05, 0.55, 0.95);
}

.card-info h1 {
    font-family: "Playfair Display";
    font-size: 36px;
    font-weight: 700;
    text-shadow: rgba(0, 0, 0, 0.5) 0 10px 10px;
}


#card-type {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.card-hover-item {
    width: 300px;
    height: 400px;
    color: white;
    padding: 20px;
    background-size: cover;
    background-position: center;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    transition: transform 0.3s ease;
}

.card-hover-item:hover {
    cursor: pointer;
    transform: scale(1.05);
}

.card-hover-header {
    font-size: 24px;
    margin: 0;
}

.card-hover-content {
    font-size: 16px;
}

.card-product {
    box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;
}

#cover {

    border-top: 1px solid black;
}

#cover,
#cover1,
#cover2 {
    width: 100vw;
}

.width25 {
    width: 25vw;
}

.ul-item {
    overflow: hidden;
    transition: 0.3s;
    box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
    margin-left: 20px;
    list-style-type: none;
    border: none;
}

.card-body {
    width: 180px;
}

.ul-item:hover {
    cursor: pointer;
    box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}

.linkToBrand {
    text-decoration: none;
    color: black;
}

.linkToBrand:hover {
    text-decoration: underline;
}
.product-name:hover {
    cursor: pointer;
    color: #f18f90;
    ;
}
#height-section{
    height: 100vh;
}
.product-img{
    height: 150px;
}

@media only screen and (max-width: 1600px) {
    #height-section{
        height: 50vh;
    }
}
@media only screen and (max-width: 830px) {
    #height-section{
        height: 25vh;
    }
}
@media only screen and (max-width: 1000px) {
    .product-img{
        height: 100px;
    }
}
@media only screen and (max-width: 760px) {
    .text-homepage{
        display: none;
    }
    .product-section{
        margin: 0 !important;
        padding: 0 0 5px 0;
        
    }
    .card-body{
        font-weight: small;
    }
    .first-product{
        max-width: 760px;
    }
    .third-product{
        max-width: 760px;
        
    }
}
</style>