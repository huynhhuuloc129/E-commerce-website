    <template>
        <div style="width: 100vw;" class="archivo-medium">
            <div class="d-flex flex-column justify-content-between m-auto align-items-center"
                style="height: 350px; background-color: #fbbfc0;">
                <div style="height: 15vh;"></div>
                <div class="text-white mt-5">
                    <div class="text-uppercase">
                        {{ brand.name }}
                    </div>
                    <h1>
                        {{ product.name }}
                    </h1>
                </div>

                <div v-if="currentUser.username == 'admin'" class="w-100  text-end mb-2 me-5">

                    <button class="btn btn-light " @click="pushToWithId('editProduct', product.proId)">Chỉnh
                        sửa</button>
                </div>
                <div v-else>

                </div>
            </div>

            <div id="product-section" class="container align-items-center d-flex  justify-content-center mb-3 w-100">
                <div>
                    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">

                        <div class="carousel-inner mt-3">
                            <div :class="['carousel-item', typeSelection == 0 ? 'active' : '']"
                                data-bs-interval="10000">
                                <img :src="singleImage.base64" class="d-block image-product" alt="...">
                                <div class="carousel-caption d-none d-md-block">

                                </div>
                            </div>

                            <div v-for="(image, index) in images" :key="image.imageId"
                                :class="['carousel-item', index + 1 === typeSelection ? 'active' : '']">
                                <img :src="image.base64" class="d-block image-product" alt="...">
                            </div>
                        </div>
                        <button v-if="images.length > 0" class="carousel-control-prev" type="button"
                            data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button v-if="images.length > 0" class="carousel-control-next" type="button"
                            data-bs-target="#carouselExampleDark" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>

                    <div class="w-100 d-flex flex-column justify-content-between mt-2">

                        <div id="type-section" class="d-flex flex-wrap align-items-center">
                            <h6 class="fw-bold me-3" for="selectType">Loại:</h6>

                            <div class="btn-group mb-3 d-flex flex-wrap" role="group"
                                aria-label="Basic radio toggle button group">
                                <div class="mb-2" v-for="(type, index) in types" :key="type.typeId">
                                    <input v-model="typeSelection" :value="index" type="radio" class="btn-check"
                                        name="typeSelection" :id="'btnradio' + index" autocomplete="off">
                                    <label class="btn btn-outline-dark me-2 " style="border-radius: 0px;"
                                        :for="'btnradio' + index">{{ type.name }}</label>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex w-100">
                            <div class="d-flex align-items-center mt-3 w-50 me-5">
                                <h6 class="fw-bold me-3">Số lượng: </h6>
                                <input v-model="numberSelection" class="form-control w-75" type="number" min="1"
                                    :max="types[typeSelection].quantityInStock">
                            </div>
                            <div class="d-flex align-items-center">
                                <h6 class="mt-2 fw-bold">Số lượng trong kho: <span>{{
                                        types[typeSelection].quantityInStock }}</span>
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="w-50 ms-3 mt-3">
                    <h2 class="fw-bold">Thông tin sản phẩm </h2>
                    <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                        <a class="collapse-btn fw-bold " data-bs-toggle="collapse" href="#collapseExample" role="button"
                            aria-expanded="false" aria-controls="collapseExample">
                            Mô tả sản phẩm
                        </a>
                        <i class="fa-solid fa-plus"></i>
                    </div>

                    <div class="collapse show  w-100" id="collapseExample">
                        <div>
                            {{ product.description }}
                        </div>
                    </div>

                    <hr class="w-100">
                    <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                        <a class="collapse-btn fw-bold" data-bs-toggle="collapse" href="#collapse1" role="button"
                            aria-expanded="false" aria-controls="collapse1">
                            Thành phần
                        </a>

                        <i class="fa-solid fa-plus"></i>
                    </div>


                    <div class="collapse show w-100" id="collapse1">
                        <div class="" v-for="comp in components" :key="comp.componentId">
                            <span class="fw-bold">
                                {{ comp.name }}:
                            </span>
                            {{ comp.description }}
                        </div>
                    </div>
                    <hr class="w-100">

                    <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                        <a class="collapse-btn fw-bold" data-bs-toggle="collapse" href="#collapse2" role="button"
                            aria-expanded="false" aria-controls="collapse2">
                            Cách sử dụng
                        </a>

                        <i class="fa-solid fa-plus"></i>
                    </div>
                    <div class="collapse show w-100" id="collapse2">
                        <div>
                            <div v-for="guide in productGuide" :key="guide">
                                {{ guide }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <h6 class="text-end w-100" v-if="types[typeSelection].unitPrice != null">Đơn giá: <span
                        class="fw-bold text-danger">{{
                            types[typeSelection].unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</span></h6>


                <div class="d-flex justify-content-end w-100 mt-3">
                    <button
                        :disabled="!checkLogin() || currentUser.username == 'admin' || types[typeSelection].quantityInStock <= 0"
                        class="cart-button me-3" @click="addToCart"><i class="fa-solid fa-cart-shopping"></i>
                        Thêm vào giỏ hàng</button>
                    <button
                        :disabled="!checkLogin() || currentUser.username == 'admin' || types[typeSelection].quantityInStock <= 0"
                        class="buy-button" @click="addOrder">Mua ngay</button>

                </div>
            </div>

            <div class="container mb-5" style="margin-top: 0px;">
                <button v-for="tag in tagsBelong" :key="tag.tagId" class="text-uppercase tag-button me-3 mt-2"
                    @click="pushToWithId('tag', tag.tagId)">
                    {{ tag.name }}
                </button>
            </div>
            <hr class="w-100" v-if="productsRecommended.length > 1">

            <div class="text-center align-items-center justify-content-center mb-5 m-5"
                v-if="productsRecommended.length > 1">
                <h4 class="text-uppercase">Các sản phẩm cùng nhãn hiệu</h4>

                <div id="recommenderCarousel" class="carousel slide carousel-dark" data-bs-ride="carousel">
                    <div class="carousel-inner" v-if="recommendedLength > 0">
                        <div class="carousel-item active">
                            <div class="d-flex  justify-content-center">
                                <div v-for="index in recommendedLength" :key="'product' + index" class="card me-2 mb-2"
                                    style="width: 260px; overflow: hidden;">
                                    <div
                                        :style="`height: 227px; background: url(${productsRecommended[index - 1].image}); background-size: cover; background-repeat: no-repeat;`">
                                    </div>
                                    <div class="card-body text-start">
                                        <div> <span class="author text-uppercase fw-bold text-secondary">{{
                                            productsRecommended[index - 1].brandName }}</span></div>
                                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden;"
                                            @click="pushToWithId('products', productsRecommended[index - 1].proId)">{{
                                                productsRecommended[index - 1].name }}</div>
                                        <div class=" fw-bold text-danger">{{
                                            productsRecommended[index - 1].unitPrice.toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="d-flex  justify-content-center">
                                <div v-for="index in recommendedLength" :key="'product' + index" class="card me-2 mb-2"
                                    style="width: 260px; overflow: hidden;">
                                    <div
                                        :style="`height: 227px; background: url(${productsRecommended[index + recommendedLength - 1].image}); background-size: cover; background-repeat: no-repeat;`">
                                    </div>
                                    <div class="card-body text-start">
                                        <div> <span class="author text-uppercase fw-bold text-secondary">{{
                                            productsRecommended[index + recommendedLength - 1].brandName }}</span>
                                        </div>
                                        <div class="fw-bold product-name" style="height: 45px; overflow: hidden;"
                                            @click="pushToWithId('products', productsRecommended[index + recommendedLength - 1].proId)">
                                            {{
                                                productsRecommended[index + recommendedLength - 1].name }}</div>
                                        <div class=" fw-bold text-danger">{{
                                            productsRecommended[index +
                                                recommendedLength - 1].unitPrice.toLocaleString("it-IT", {
                                                    style: "currency",
                                                    currency: "VND",
                                                }) }}</div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <button style="z-index: 9;;" class="carousel-control-prev" type="button"
                        data-bs-target="#recommenderCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button style="z-index: 9;" class="carousel-control-next" type="button"
                        data-bs-target="#recommenderCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>

            <hr class="w-100">

            <div class="container rating d-flex flex-column align-items-center justify-content-center">
                <h4 class="text-uppercase">Đánh giá sản phẩm</h4>
                <h5 v-if="reviews.length == 0">Hiện chưa có đánh giá nào cho sản phẩm này</h5>
            </div>

            <section>
                <div class=" py-2 text-body mb-5">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-11 col-lg-9 col-xl-7">

                            <div v-for="review in reviews" :key="review.reviewId" class="d-flex flex-start mb-2">
                                <img v-if="review.avatar != null && review.avatar != ''"
                                    class="rounded-circle shadow-1-strong me-3" :src="review.avatar" alt="avatar"
                                    width="65" height="65" />
                                <img v-else src="https://placehold.co/65x65" alt=""
                                    class="rounded-circle shadow-1-strong me-3" width="65" height="65">
                                <div v-if="reviews[0].reviewId != 0" class="card w-100">
                                    <div class="card-body p-3">
                                        <div class="">

                                            <h5>{{ review.name }}</h5>
                                            <i v-for="index in review.star" :key="index"
                                                class="fas fa-star d-inline-block" style="color: #F4BB47"></i>

                                            <p class="small">{{ calculateTimeElapse(review.created_at) }}</p>
                                            <p>
                                                {{ review.content }}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </section>
        </div>
    </template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import accountServices from '@/services/account.services';
import { checkLogin, calculateTimeElapse } from '@/utilities/utilities';
import product_tagServices from '@/services/product_tag.services';


// @ts-ignore
import productServices from '@/services/product.sevices';
import reviewServices from '@/services/review.services';
import brandServices from '@/services/brand.services';
import typeServices from '@/services/type.services';
import tagServices from '@/services/tag.services';

import { useRoute, useRouter } from 'vue-router'
import { useCookies } from 'vue3-cookies';
import Swal from 'sweetalert2';
import selectedProductServices from '@/services/selectedProduct.services';
import componentServices from '@/services/component.services';
import imageServices from '@/services/image.services';
import orderServices from '@/services/order.services';
import productComponentServices from '@/services/productComponent.services';
import { getAllSProducts } from '@/utilities/cartStore';
const id = ref(0);

const cookies = useCookies();
const token = cookies.cookies.get("Token");

const route = useRoute();
const router = useRouter()

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

const product = ref({
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
})
const singleImage = ref({
    imageId: 0,
    created_at: '',
    updated_at: '',
    base64: '',
    belongId: ''
})
const images = ref([{
    imageId: 0,
    created_at: '',
    updated_at: '',
    base64: '',
    belongId: ''
}])
const productGuide = ref([] as string[])
const brand = ref({
    brandId: 0,
    name: '',
    created_at: '',
    updated_at: '',
    logo: ''
})

const typeSelection = ref(0)
const numberSelection = ref(1)
const quantityInStock = ref(0)

const types = ref([{
    typeId: 0,
    name: '',
    productId: 0,
    unitPrice: 0,
    quantityInStock: 0,
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
const product_components = ref([
    {
        productComponentId: 0,
        componentId: 0,
        productId: 0,
        created_at: '',
        updated_at: ''
    }
])
const tagsBelong = ref([
    {
        tagId: 0,
        name: '',
        created_at: '',
        updated_at: ''
    }
])

const review = ref({
    reviewId: 0,
    productId: 0,
    accountId: 0,
    content: '',
    star: 0,
    created_at: '',
    updated_at: '',
    name: '',
    email: '',
    avatar: ''
})

const reviews = ref([{
    reviewId: 0,
    productId: 0,
    accountId: 0,
    content: '',
    star: 0,
    created_at: '',
    updated_at: '',
    name: '',
    email: '',
    avatar: ''
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
    name: '',
    typeName: ''
}])

function pushToWithId(name: string, id: number) {
    router.push({
        name: name,
        params: { id: id }
    })
}


async function addToCart() {
    // e.preventDefault();
    try {
        if (numberSelection.value <= 0) throw ('Số lượng sản phẩm phải lớn hơn 0!')
        if (numberSelection.value > types.value[typeSelection.value].quantityInStock) throw ('Số lượng sản phẩm vượt số lượng đang có.')

        let respSProducts = await selectedProductServices.getAllByAccountIdInCart(currentUser.value.accountId)
        sProducts.value = respSProducts.data.sProducts

        for (let i=0; i< sProducts.value.length; i++) {
            if (sProducts.value[i].proId == product.value.proId) {
                if (numberSelection.value + sProducts.value[i].quantitySelected > types.value[typeSelection.value].quantityInStock) {
                    Swal.fire({
                        title: "Lỗi!",
                        text: "Số lượng sản phẩm đã chọn và số lượng trong giỏ hàng vượt quá số lượng trong kho.",
                        icon: "error",
                        confirmButtonText: "OK",
                    });
                    return;
                }
            }
        }

        await selectedProductServices.create({
            quantitySelected: numberSelection.value,
            sellingPrice: types.value[typeSelection.value].unitPrice,
            typeId: types.value[typeSelection.value].typeId,
            proId: types.value[typeSelection.value].productId,
            accountId: currentUser.value.accountId
        })

        Swal.fire({
            title: "Thành công!",
            text: "Thêm vào giỏ hàng thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });

        await getAllSProducts(currentUser.value.accountId);
    } catch (error) {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã có lỗi xảy ra! " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
        console.log(error)
    }
}

const components = ref([{
    componentId: 0,
    name: "",
    description: "",
    created_at: "",
    updated_at: ""
}])

let orderReviews = ref([{
    orderId: 0,
    created_at: "",
    updated_at: "",
    quantitySelected: [] as number[],
    sellingPrices: [] as number[],
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shipped: 0,
    shippedDate: "",
    shipmentTracking: "",
    shippingAddress: "",
    paid: 0,
    selectedProductIds: [] as number[],
    typeIds: [] as number[],
    typeNames: [] as string[],
    productIds: [] as number[],
    proId: 0,
    productNames: [] as string[],
    imageBase64: [] as string[],
    confirm: 0
}])

const newOrder = ref({
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shippingAddress: "",
    shipped: 0,
    shippedDate: null,
    shipmentTracking: "",
    paid: 0,
    confirm: 0,
    typeId: 0,
    proId: 0,
    quantitySelected: 0,
    sellingPrice: 0,
})

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

const productsRecommended = ref([] as productDetail[])
const recommendedLength = ref(0)

async function addOrder(e: any) {
    e.preventDefault();
    try {

        if (numberSelection.value <= 0) throw ('Số lượng sản phẩm phải lớn hơn 0!')
        if (numberSelection.value >= types.value[typeSelection.value].quantityInStock) throw ('Số lượng sản phẩm vượt số lượng đang có.')
        if (currentUser.value.billingAddress == undefined || currentUser.value.billingAddress == "" || currentUser.value.phone == undefined || currentUser.value.phone == "") {
            throw "Vui lòng nhập đầy đủ thông tin cá nhân trước khi đặt hàng!"
        }

        newOrder.value = {
            accountId: currentUser.value.accountId,
            totalPrice: types.value[typeSelection.value].unitPrice * numberSelection.value,
            shippingPrice: 30000,
            shippingAddress: currentUser.value.billingAddress,
            shipped: 0,
            shippedDate: null,
            shipmentTracking: "Đang chờ giao hàng",
            paid: 0,
            confirm: 0,
            proId: product.value.proId,
            typeId: types.value[typeSelection.value].typeId,
            quantitySelected: numberSelection.value,
            sellingPrice: types.value[typeSelection.value].unitPrice
        }

        await orderServices.orderNow(newOrder.value)

        Swal.fire({
            title: "Thành công!",
            text: "Đặt hàng thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });

        router.push({ name: "orders" });
    } catch (error) {
        console.log(error)

        Swal.fire({
            title: "Thất bại!",
            text: "Đặt hàng thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function fetchRecommendedProducts() {
    let respProdBrand = await productServices.getAllDetailByBrandId(product.value.brandId);

    let shuffledProducts = respProdBrand.data.products.sort(() => Math.random() - 0.5);
    const index = shuffledProducts.findIndex((prod: any) => prod.proId == product.value.proId);
    if (index !== -1) {
        shuffledProducts.splice(index, 1)
    }

    productsRecommended.value = shuffledProducts; // Giới hạn số lượng nếu cần
    recommendedLength.value = Math.floor(Math.min(productsRecommended.value.length / 2, 8));
}


onMounted(async () => {
    try {
        // get current user
        if (checkLogin()) {
            let resp = await accountServices.getMe(token);
            currentUser.value = resp.data.account[0];
        }

        id.value = Number(route.params.id);

        let respProduct = await productServices.getOne(id.value)
        product.value = respProduct.data.products[0]

        productGuide.value = product.value.guide.split('\nBước ')
        productGuide.value[0] = productGuide.value[0].replace('Bước 1', '1')


        if (product.value.proId != 0) {
            // get brand
            let respBrand = await brandServices.getOne(product.value.brandId)
            brand.value = respBrand.data.brand[0]

            // get type
            let respType = await typeServices.getAllByProductId(product.value.proId);
            types.value = respType.data.type

            if (types.value[0] != undefined) quantityInStock.value = types.value[0].quantityInStock

            // get all tags
            let respProductTags = await product_tagServices.getAllByProductId(product.value.proId);
            product_tags.value = respProductTags.data.product_tag;

            let respTags = []
            for (let i = 0; i < product_tags.value.length; i++) {
                let respTag = await tagServices.getOne(product_tags.value[i].tagId)

                respTags.push(respTag.data.tag[0])
            }

            tagsBelong.value = respTags;

            // get all components
            let respProComp = await productComponentServices.getAllByProductId(product.value.proId);
            product_components.value = respProComp.data.product_component

            let respComps = []
            for (let i = 0; i < product_components.value.length; i++) {
                let respComponent = await componentServices.getOne(product_components.value[i].componentId)

                respComps.push(respComponent.data.component[0])
            }

            components.value = respComps;
            // get review
            let respReviews = await reviewServices.getAllByProductId(product.value.proId)
            reviews.value = respReviews.data.review;

            if (currentUser.value.accountId != 0) {
                let respReview = await reviewServices.getAllByProductIdAndAccountId(product.value.proId, currentUser.value.accountId)
                review.value = respReview.data.review[0];
                if (review.value == undefined) {
                    review.value = {
                        reviewId: 0,
                        productId: 0,
                        accountId: 0,
                        content: '',
                        star: 0,
                        created_at: '',
                        updated_at: '',
                        name: '',
                        email: '',
                        avatar: ''
                    }
                }
            }

            // get images
            let respImages = await imageServices.getAllByBelongId('product' + product.value.proId)
            images.value = respImages.data.image;
            singleImage.value = images.value[0];
            images.value.splice(0, 1)
            // get orders
            orderReviews.value = []
            let respOrders = await orderServices.getDetailByAccountId(currentUser.value.accountId)
            for (let i = 0; i < respOrders.data.order.length; i++) {
                let data = respOrders.data.order[i];
                // Push the transformed order into the orders array
                orderReviews.value.push({
                    orderId: data.orderId,
                    created_at: data.created_at,
                    updated_at: data.updated_at,
                    quantitySelected: data.quantitiesSelected.split(',').map(Number), // Convert string to array of numbers
                    sellingPrices: data.sellingPrices.split(',').map(Number), // Convert string to array of numbers
                    accountId: data.accountId,
                    totalPrice: data.totalPrice,
                    shippingPrice: data.shippingPrice,
                    shipped: data.shipped,
                    shippedDate: data.shippedDate,
                    shipmentTracking: data.shipmentTracking,
                    shippingAddress: data.shippingAddress,
                    paid: data.paid,
                    selectedProductIds: data.selectedProductIds.split(',').map(Number), // Convert string to array of numbers
                    typeIds: data.typeIds.split(',').map(Number), // Convert string to array of numbers
                    typeNames: data.typeNames.split(','), // Convert string to array of strings
                    productIds: data.productIds.split(',').map(Number), // Convert string to array of numbers
                    proId: data.proId,
                    productNames: data.productNames.split(','), // Convert string to array of strings
                    imageBase64: data.imageBase64.split('||'),
                    confirm: data.confirm
                });

                // get all recommended
            }
            await fetchRecommendedProducts();
        }
    } catch (error) {
        console.log(error);
    }
})

</script>

<style>
.rating-wrapper {
    direction: rtl !important;

    .star-rating {
        color: rgba(198, 206, 237, .8);
        cursor: pointer;
        display: inline-flex;
        font-size: 1.5rem;
        padding: 1rem .4rem;
        transition: color 0.5s;
    }

    .rating-input {
        display: none;
    }

    .star-rating:hover,
    .star-rating:hover~.star-rating,
    .rating-input:checked~.star-rating {
        color: #F4BB47;
    }
}

#type-dropdown {
    background-color: transparent;
}

#type-dropdown-button {
    padding: 15px;
    background-color: transparent;
}

#type-dropdown-button:hover {
    box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}

#type-dropdown-button:focus {
    border: 0px;
    box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}

#type-dropdown-button {
    border: 0px;
}

.collapse-btn {
    color: black;
    width: 100%;
    text-decoration: none;
}

.collapse-item {
    margin: 5px;
}

.collapse {
    margin: 15px 5px 15px 5px;
}

.cart-button {
    border: 0px;
    padding: 15px;
    background-color: rgb(237, 237, 237);
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

.buy-button {
    border: 0px;
    padding: 15px;
    color: white;
    background-color: rgb(0, 0, 0);
}

.buy-button:hover {
    background-color: rgb(31, 31, 31);

}

.cart-button:hover {
    background-color: rgb(181, 181, 181);
}

.image-carousel {
    width: 830px;
}

.image-product {
    width: 600px;
    height: auto;
}

#carouselExampleDark,
#type-section {
    max-width: 600px;
}

.product-name:hover {
    cursor: pointer;
    color: #f18f90;
    ;
}

@media only screen and (max-width: 1000px) {
    #product-section {
        flex-direction: column;
    }
}
</style>