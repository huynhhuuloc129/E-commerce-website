<template>
    <div style="width: 100vw;" class="archivo-medium">

        <div style="height: 400px; background-color: #fbbfc0;">
        </div>


        <div class="container mb-5 mt-5 w-100">

            <h1 class="mb-5">
                <span v-if="products.length != 0">
                    Các sản phẩm của nhãn hiệu
                </span>
                <span v-else>
                    Không có sản phẩm nào của nhãn hiệu
                </span>
                <span style="color: brown;" class="fw-bold text-uppercase">
                    {{ brand.name }}
                </span>
            </h1>

            <div class="w-100 d-flex justify-content-end mb-3">

                <select v-model="sortType" class="form-select w-25" aria-label="Default select example">
                    <option value="1">Giá tăng dần</option>
                    <option value="2">Giá giảm dần</option>
                    <option value="3">A -> Z</option>
                    <option value="4">Z -> A</option>

                </select>
            </div>

            <div class="text-center w-100 justify-content-center d-flex flex-wrap align-items-center">

                <div v-for="(product) in products" :key="product.proId" class="card me-2 mb-2"
                    style="width: 18rem; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;">
                    <div
                        :style="`height: 300px; background: url(${product.image}); background-size: cover; background-repeat: no-repeat;`">
                    </div>
                    <div class="card-body text-start">
                        <div> <span class="author text-uppercase fw-bold text-secondary">{{
                            brand.name }}</span></div>
                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden;"
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


            <h2 class="mt-5">Các nhãn hiệu phổ biến</h2>
            <div class="container mt-2 d-flex justify-content-center flex-wrap align-items-center">
                <button v-for="brand in brands" :key="brand.brandId"
                    class="fw-bold btn btn-light text-uppercase me-3 mt-2 mb-2"
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
import { useRoute, useRouter } from 'vue-router'
import { onMounted, ref, watch } from 'vue';
import productServices from '@/services/product.sevices';
import brandServices from '@/services/brand.services';
import typeServices from '@/services/type.services';

const route = useRoute();
const router = useRouter()

const id = ref(0)


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
    note: '',
    image: '',
    unitPrice: 0
}])

function pushToWithId(name: string, id: number) {
    router.push({
        name: name,
        params: { id: id }
    })
}

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

onMounted(async () => {
    try {
        id.value = Number(route.params.id);
        let respBrand = await brandServices.getOne(id.value);

        brand.value = respBrand.data.brand[0];

        let respProducts = await productServices.getAllByBrandId(brand.value.brandId);
        products.value = respProducts.data.products;

        for (let i = 0; i < products.value.length; i++) {

            let respTypes = await typeServices.getAllByProductId(products.value[i].proId)
            products.value[i].unitPrice = respTypes.data.type[0].unitPrice



        }

        console.log(products.value)

        let respBrands = await brandServices.getTop10();
        brands.value = respBrands.data.brand;

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

.product-name:hover {
    cursor: pointer;
    color: #f18f90;
    ;
}
</style>