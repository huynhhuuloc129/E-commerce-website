<template>
    <div style="width: 100vw;" class="archivo-medium">

        <div style="height: 400px; background-color: #fbbfc0;">
        </div>


        <div class="container mb-5 mt-5 w-100">

            <h1 class="mb-5">
                <span v-if="products.length != 0">
                    Các sản phẩm có nhãn
                </span>
                <span v-else>
                    Không có sản phẩm nào có nhãn
                </span>
                <span style="color: brown;" class="fw-bold text-uppercase">
                    #{{ tag.name }}
                </span>
            </h1>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center">

                <div v-for="(product, index) in products" :key="product.proId"
                    class="example-2 card card-tag mb-5 me-5">
                    <div class="wrapper" :style="`background: url(${images[index].base64})`">
                        <div class="header">
                            <!-- <div class="date">
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
                            </ul> -->
                        </div>
                        <div class="data">
                            <div class="content">
                                <span class="author text-uppercase">{{ brands[index].name }}</span>
                                <h1 class="title"><a href="#">{{ product.name }}</a></h1>
                                <p class="text" style="overflow: hidden;">{{ product.description }}</p>
                                <a :href="'http://localhost:5173/products/' + product.proId" class="button">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <h2 class="mt-5">Các nhãn phổ biến nhất</h2>

            <div class="d-flex justify-content-center align-items-center flex-wrap mb-5">
                <button v-for="tag in tags" :key="tag.tagId" class="text-uppercase tag-button me-3 mt-2"
                    @click="pushToWithId('tag', tag.tagId)">
                    {{ tag.name }}
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
import productServices from '@/services/product.sevices';
import brandServices from '@/services/brand.services';
import imageServices from '@/services/image.services';


const route = useRoute();
const router = useRouter()

const id = ref(0)

const tag = ref({
    tagId: 0,
    name: '',
    created_at: '',
    updated_at: ''
})

const tags = ref([{
    tagId: 0,
    name: '',
    created_at: '',
    updated_at: ''
}])

const product_tags = ref([
    {
        productTagId: 0,
        tagId: 0,
        productId: 0,
        created_at: '',
        updated_at: ''
    }
])

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
const images = ref([{
    imageId: 0,
    created_at: '',
    updated_at: '',
    base64: '',
    belongId: ''
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
        let respTag = await tagServices.getOne(id.value);

        tag.value = respTag.data.tag[0];

        let respProductTags = await product_tagServices.getAllByTagId(tag.value.tagId);
        product_tags.value = respProductTags.data.product_tag;

        let respProducts = []
        let respImgs = []
        for (let i = 0; i < product_tags.value.length; i++) {
            let respProduct = await productServices.getOne(product_tags.value[i].productId)

            respProducts.push(respProduct.data.products[0])

            let respImage = await imageServices.getAllByBelongIdLimit1(respProduct.data.products[0].proId)
            respImgs.push(respImage.data.image[0])
        }
        products.value = respProducts;
        images.value = respImgs

        let respBrands = []
        for (let i = 0; i < products.value.length; i++) {
            let respBrand = await brandServices.getOne(products.value[i].brandId)

            respBrands.push(respBrand.data.brand[0])
        }

        brands.value = respBrands;

        // get top 25 tag
        let respTags = await tagServices.getTop();
        tags.value = respTags.data.tag;

        console.log(images.value)
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

.tag-button {
    font-size: small;
    font-weight: bold;
    border: 0px;
    padding: 11px;
    background-color: rgb(237, 237, 237);
}

.tag-button:hover {
    background-color: black;
    color: white;
}
</style>