<template>
    <!-- <div class="w-100 h-100"
        style="position: absolute; display: flex; justify-content: center; align-items: center; z-index: 100;">
        <VueSpinner size="50 " color="red" />
    </div> -->

    <div style="width: 100vw;" class="archivo-medium">

        <div style="height: 400px; background-color: #fbbfc0;">
        </div>
        <div class="search-container-main">
            <input @keyup.enter="pushToSearchPage($event, contentSearch)" type="text" placeholder="Tìm kiếm..."
                id="search-input-main" v-model="contentSearch">
            <button id="search-button-main">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
                    viewBox="0 0 16 16">
                    <path
                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.415l-3.85-3.85a1.007 1.007 0 0 0-.115-.098zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                </svg>
            </button>
        </div>

        <div class="container mb-5 mt-5">

            <h1>
                <span v-if="products.length != 0">
                    Các kết quả tìm kiếm
                </span>
                <span v-else>
                    Không có kết quả tìm kiếm
                </span>
                <span style="color: brown;" class="fw-bold text-uppercase">
                    {{ content }}
                </span>
            </h1>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center">

                <div v-for="(product, index) in products" :key="product.proId"
                    class="example-2 card card-tag mb-5 me-5">
                    <div class="wrapper" :style="`background: url(${images[index].base64})`">
                        <div class="header">
                            <!-- <div class="date text-white">
                                <span class="day">12</span>
                                <span class="month">Aug</span>
                                <span class="year">2016</span>
                            </div>
                            <ul class="menu-content">
                                <li><a href="#"><i class="text-white fa-solid fa-cart-shopping"></i></a></li>
                                <li><a href="#" class="text-white"><i class="text-white fa fa-comment"
                                            aria-hidden="true"></i></a></li>
                            </ul> -->
                        </div>
                        <div class="data">
                            <div class="content">
                                <span class="author text-uppercase">{{ brands[index].name }}</span>
                                <h1 class="title"><a href="#">{{ product.name }}</a></h1>
                                <p class="text" style="overflow: hidden;">{{ product.description }}</p>
                                <a :href="'http://localhost:5173/products/' + product.proId" class="button">
                                    Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import productServices from '@/services/product.sevices';
import brandServices from '@/services/brand.services';
import imageServices from '@/services/image.services';

const route = useRoute();
const router = useRouter();

const content = ref('');
const contentSearch = ref('');

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

type productType = {
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
}
const images = ref([{
    imageId: 0,
    created_at: '',
    updated_at: '',
    base64: '',
    belongId: ''
}])
function filterProduct(products: productType[]) {
    return products.filter((p) => {
        return p.name.toLowerCase().indexOf(content.value.toLowerCase()) != -1
    })
}

function pushToSearchPage(e: any, content: string) {
    e.preventDefault();
    router.push({ name: "search", params: { content: content } });
}

onMounted(async () => {
    try {
        content.value = route.params.content.toString();

        let respProducts = await productServices.getAll()


        products.value = filterProduct(respProducts.data.products)
        
        let respBrands = []
        let respImgs = []

        for (let i = 0; i < products.value.length; i++) {
            let respBrand = await brandServices.getOne(products.value[i].brandId)

            respBrands.push(respBrand.data.brand[0])

            let respImage = await imageServices.getAllByBelongIdLimit1(products.value[i].proId)
            respImgs.push(respImage.data.image[0])
        }
        images.value = respImgs
        brands.value = respBrands;

    } catch (error) {
        console.log(error)
    }
})

</script>

<style>
.search-container-main {
    position: relative;
    bottom: 30px;
    display: flex;
    align-items: center;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
    padding: 10px;
    max-width: 600px;
    margin: 0 auto;
}

#search-input-main {
    border: none;
    outline: none;
    width: 100%;
    padding: 10px;
    font-size: 16px;
}

#search-button-main {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0 10px;
}

#search-button-main svg {
    fill: #000;
}


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