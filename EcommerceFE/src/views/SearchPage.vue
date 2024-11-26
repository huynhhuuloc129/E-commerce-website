<template>
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

        <div class="container mb-5 mt-2">
            <h1 class="text-center">Từ khóa tìm kiếm: <span style="color: brown;" class="fw-bold text-uppercase">
                    {{ content }}
                </span></h1>

            <h2>
                <span v-if="products.length != 0">
                    Các sản phẩm tìm kiếm phù hợp
                </span>
                <span v-else>
                    Không có sản phẩm nào phù hợp
                </span>
            </h2>
            <div class="w-100 d-flex justify-content-end mb-3">

                <select v-model="sortType" class="form-select w-25" aria-label="Default select example">
                    <option value="1">Giá tăng dần</option>
                    <option value="2">Giá giảm dần</option>
                    <option value="3">A -> Z</option>
                    <option value="4">Z -> A</option>

                </select>
            </div>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center"
                v-if="products.length > 0">

                <div v-for="(product) in products" :key="product.proId" class="card me-2 mb-2"
                    style="width: 18rem; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                    <div
                        :style="`height: 300px; background: url(${product.image}); background-size: cover; background-repeat: no-repeat;`">
                    </div>
                    <div class="card-body text-start">
                        <div> <span v-if="product.brandName != undefined"
                                class="author text-uppercase fw-bold text-secondary">{{
                                    product.brandName }}</span></div>
                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden"
                            @click="pushToWithId('products', product.proId)">{{
                                product.name }}</div>
                        <div class=" fw-bold text-danger">{{
                            product.unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</div>
                    </div>
                </div>
            </div>

            <div class="mt-5" v-if="filterBrands()!.length > 0">

                <h2>
                    <span>
                        Các nhãn hiệu phù hợp
                    </span>
                </h2>
                <div class="container mt-2 d-flex justify-content-center flex-wrap align-items-center">
                    <button v-for="brand in filterBrands()" :key="brand.brandId"
                        class="fw-bold btn btn-light text-uppercase me-3 mt-2 mb-2"
                        @click="pushToWithId('brand', brand.brandId)" style="color: #fbbfc0;">
                        <h5 class="fw-bold ">
                            {{ brand.name }}
                        </h5>
                    </button>
                </div>
            </div>
            <div class="mt-5" v-else>
                <h2>
                    <span>
                        Không có nhãn hiệu nào phù hợp
                    </span>
                </h2>
            </div>


            <div class="mt-5" v-if="filterTags()!.length > 0">
                <h2><span>Các nhãn phù hợp</span></h2>

                <div class="d-flex justify-content-center align-items-center flex-wrap mb-5">
                    <button v-for="tag in filterTags()" :key="tag.tagId" class="text-uppercase tag-button me-3 mt-2"
                        @click="pushToWithId('tag', tag.tagId)">
                        {{ tag.name }}
                    </button>
                </div>
            </div>

            <div v-else class="mt-5">
                <h2>
                    <span>
                        Không có nhãn dán nào phù hợp
                    </span>
                </h2>
            </div>
        </div>

    </div>
</template>

<script setup lang="ts">
import { onMounted, ref, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import productServices from '@/services/product.sevices';
import brandServices from '@/services/brand.services';
import imageServices from '@/services/image.services';
import tagServices from '@/services/tag.services';

const route = useRoute();
const router = useRouter();

const content = ref('');
const contentSearch = ref('');

type brandType = {
    brandId: number,
    name: string,
    created_at: string,
    updated_at: string,
    logo: string
}

const allBrand = ref([] as brandType[])
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
    note: '',
    unitPrice: 0,
    brandName: "",
    image: ""
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
    unitPrice: number,
    brandName: string,
    image: string
}

type tagType = {
    tagId: number,
    name: string,
    created_at: string,
    updated_at: string
}
const tags = ref([] as tagType[])
const sortType = ref(0)

watch(sortType, () => {
    if (sortType.value == 1) {
        products.value.sort((a, b) => {
            if (a.unitPrice > b.unitPrice) return 1
            else return -1
        })
    } else if (sortType.value == 2) {
        products.value.sort((a, b) => {
            if (a.unitPrice < b.unitPrice) return 1
            else return -1
        })
    } else if (sortType.value == 3) {
        products.value.sort((a, b) => {
            if (a.name > b.name) return 1
            else return -1
        })
    } else if (sortType.value == 4) {
        products.value.sort((a, b) => {
            if (a.name < b.name) return 1
            else return -1
        })
    }
})

function filterProduct(products: productType[]) {
    return products.filter((p) => {
        return (p.name.toLowerCase().indexOf(content.value.toLowerCase()) != -1) || (p.description.toLowerCase().indexOf(content.value.toLowerCase()) != -1 ) 
    })
}

function filterTags() {
    return tags.value.filter((t) => {
        return t.name.toLowerCase().indexOf(content.value.toLowerCase()) != -1
    })
}

function filterBrands() {
    return allBrand.value.filter((b) => {
        return b.name.toLowerCase().indexOf(content.value.toLowerCase()) != -1
    })
}

function pushToSearchPage(e: any, content: string) {
    e.preventDefault();
    router.push({ name: "search", params: { content: content } });
}
function pushToWithId(name: string, id: number) {
    router.push({
        name: name,
        params: { id: id }
    })
}

onMounted(async () => {
    try {
        content.value = route.params.content.toString();

        let respProducts = await productServices.getAll()


        products.value = filterProduct(respProducts.data.products)



        for (let i = 0; i < products.value.length; i++) {
            let respBrand = await brandServices.getOne(products.value[i].brandId)
            products.value[i].brandName = respBrand.data.brand[0].name

            let respImage = await imageServices.getAllByBelongIdLimit1(products.value[i].proId)
            products.value[i].image = respImage.data.image[0].base64
        }

        // get all brands
        let respAllBrand = await brandServices.getAll();
        allBrand.value = respAllBrand.data.brand

        // get all tags
        let respAllTag = await tagServices.getAll();
        tags.value = respAllTag.data.tag

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

.product-name:hover {
    cursor: pointer;
    color: #f18f90;
    ;
}
</style>