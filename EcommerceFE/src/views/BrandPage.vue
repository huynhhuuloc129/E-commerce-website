<template>
    <div style="width: 100vw;" class="archivo-medium">

        <div style="height: 400px; background-color: #fbbfc0;">
        </div>


        <div class="container mb-5 mt-5 w-100">

            <h1 class="mb-5">
                <span v-if="products.length != 0">
                    Các sản phẩm của nhãn hàng
                </span>
                <span v-else>
                    Không có sản phẩm nào của nhãn hàng
                </span>
                <span style="color: brown;" class="fw-bold text-uppercase">
                    {{ brand.name }}
                </span>
            </h1>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center">

                <div v-for="product in products" :key="product.proId" class="example-2 card card-tag mb-5 me-5">
                    <div class="wrapper">
                        <div class="header">
                            <div class="date">
                                <span class="day">12</span>
                                <span class="month">Aug</span>
                                <span class="year">2016</span>
                            </div>
                            <ul class="menu-content">
                                <li>
                                    <a href="#" class="fa fa-bookmark-o"></a>
                                </li>
                                <li><a href="#" class="fa fa-heart-o"><span>18</span></a></li>
                                <li><a href="#" class="fa fa-comment-o"><span>3</span></a></li>
                            </ul>
                        </div>
                        <div class="data">
                            <div class="content text-white">
                                <span class="author text-uppercase">{{ brand.name }}</span>
                                <h1 class="title"><a href="#">{{ product.name }}</a></h1>
                                <p class="text" style="overflow: hidden;">{{ product.description }}</p>
                                <a :href="'http://localhost:5173/products/' + product.proId" class="button">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <h2 class="mt-5">Các nhãn hàng phổ biến</h2>
            <div class="container mt-2 d-flex justify-content-center flex-wrap align-items-center" >
                <button v-for="brand in brands" :key="brand.brandId" class="fw-bold btn btn-light text-uppercase me-3 mt-2 mb-2"
                    @click="pushToWithId('brand', brand.brandId)" style="color: #fbbfc0;">
                    <h5 class="fw-bold ">
                        {{ brand.name }}
                    </h5>
                </button>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import product_tagServices from '@/services/product_tag.services';
import tagServices from '@/services/tag.services';

import { useRoute, useRouter } from 'vue-router'
import { onMounted, ref } from 'vue';
import productSevices from '@/services/product.sevices';
import brandServices from '@/services/brand.services';


const route = useRoute();
const router = useRouter()

const id = ref(0)

const tag = ref({
    tagId: 0,
    name: '',
    created_at: '',
    updated_at: ''
})

const product_tags = ref([
    {
        productTagId: 0,
        tagId: 0,
        productId: 0,
        created_at: '',
        updated_at: ''
    }
])

const brand = ref({
    brandId: 0,
    name: '',
    created_at: '',
    updated_at: '',
    logo: ''
})

const brands = ref([{
    brandId: 0,
    name: '',
    created_at: '',
    updated_at: '',
    logo: ''
}])

const products = ref([{
    proId: 0,
    catId: 0,
    brandId: 0,
    name: '',
    description: '',
    unit: '',
    guide: '',
    created_at: '',
    updated_at: '',
    maintain: '',
    note: ''
}])

function pushToWithId(name: string, id: number) {
    router.push({
        name: name,
        params: { id: id }
    })
}


onMounted(async () => {
    try {
        id.value = Number(route.params.id);
        let respBrand = await brandServices.getOne(id.value);

        brand.value = respBrand.data.brand[0];

        let respProducts = await productSevices.getAllByBrandId(brand.value.brandId);
        products.value = respProducts.data.products;

        let respBrands = await brandServices.getTop10();
        brands.value = respBrands.data.brand;

        console.log(brands.value)
    } catch (error) {
        console.log(error)
    }
})

</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,400,700');

/* Clear-fix */
.cf::before,
.cf::after {
    content: '';
    display: table;
}

.cf::after {
    clear: both;
}

* {
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.row-tag {
    max-width: 900px;
}

/* Base styles */
.card-tag {
    box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
    border: 0px;
    float: left;
    width: 270px;
    height: 400px;
}

.card-tag .menu-content {
    margin: 0;
    padding: 0;
    list-style-type: none;
}

.card-tag .menu-content li {
    display: inline-block;
}

.card-tag .menu-content a {
    color: var(--white);
}

.card-tag .menu-content span {
    position: absolute;
    left: 50%;
    top: 0;
    font-size: 10px;
    font-weight: 700;
    font-family: var(--open-sans);
    transform: translate(-50%, 0);
}

.card-tag .wrapper {
    background-color: var(--white);
    min-height: 400px;
    position: relative;
    overflow: hidden;
    box-shadow: 0 19px 38px rgba(var(--black), 0.3), 0 15px 12px rgba(var(--black), 0.2);
}

.card-tag .wrapper:hover .data {
    transform: translateY(0);
}

.card-tag .data {
    position: absolute;
    bottom: 0;
    width: 100%;
    transform: translateY(calc(70px + 1em));
    transition: transform 0.3s;
}

.card-tag .data .content {
    padding: 1em;
    position: relative;
    z-index: 1;
}

.card-tag .author {
    font-size: 12px;
}

.card-tag .title {
    margin-top: 10px;
}

.card-tag .text {
    height: 70px;
    margin: 0;
}

.card-tag input[type='checkbox'] {
    display: none;
}

.card-tag input[type='checkbox']:checked+.menu-content {
    transform: translateY(-60px);
}

/* Second example styles */
.example-2 .wrapper {
    background: url('https://tvseriescritic.files.wordpress.com/2016/10/stranger-things-bicycle-lights-children.jpg') center / cover no-repeat;
}

.example-2 .wrapper:hover .menu-content span {
    transform: translate(-50%, -10px);
    opacity: 1;
}

.example-2 .header {
    color: var(--white);
    padding: 1em;
}

.example-2 .header .date {
    float: left;
    font-size: 12px;
}

.example-2 .menu-content {
    float: right;
}

.example-2 .menu-content li {
    margin: 0 5px;
    position: relative;
}

.example-2 .menu-content span {
    transition: all 0.3s;
    opacity: 0;
}

.example-2 .data {
    color: var(--white);
    transform: translateY(calc(70px + 4em));
}

.example-2 .title a {
    color: var(--white);
}

.example-2 .button {
    display: block;
    width: 100px;
    margin: 2em auto 1em;
    text-align: center;
    font-size: 12px;
    color: var(--white);
    line-height: 1;
    position: relative;
    font-weight: 700;
}

.example-2 .button::after {
    content: '\2192';
    opacity: 0;
    position: absolute;
    right: 0;
    top: 50%;
    transform: translate(0, -50%);
    transition: all 0.3s;
}

.example-2 .button:hover::after {
    transform: translate(5px, -50%);
    opacity: 1;
}


#header {
    color: black;
    background-color: white;

    #text-search-input {
        color: black;
        border-bottom: 1px solid black;
    }

    #text-search-input::placeholder {
        color: black;
    }

    #search-button {
        color: black;
    }

    .header-item {
        color: black;
    }

    #header-title {
        color: black;
        text-decoration: none;
        background-color: transparent;
    }
}
</style>