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

                <div v-if="currentUser.username == 'admin'" class="w-100  text-end mb-3 me-5">

                    <button class="btn btn-light " @click="pushToWithId('editProduct', product.proId)">Chỉnh
                        sửa</button>
                </div>
                <div v-else>

                </div>
            </div>
            <div class="container align-items-center d-flex flex-column  justify-content-center mb-3"
                style="max-width: 50%;">
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 0"></button>
                        <button type="button" v-for="(image, index) in images" :key="image.imageId"
                            data-bs-target="#carouselExampleDark" :data-bs-slide-to="index + 1"
                            :aria-label="'Slide ' + index + 1"></button>

                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item image-carousel active" data-bs-interval="10000">
                            <img :src="singleImage.base64" class="d-block image-product" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <!-- <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p> -->
                            </div>
                        </div>

                        <div v-for="(image) in images" :key="image.imageId" class="carousel-item image-carousel"
                            data-bs-interval="10000">
                            <img :src="image.base64" class="d-block image-product" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <!-- <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p> -->
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <hr class="w-100">

                <div class="w-100 d-flex align-items-center justify-content-between">

                    <div class="d-flex align-items-center">
                        <h6 class="fw-bold" for="selectType">Loại:</h6>

                        <select v-model="typeSelection" id="selectType" class="form-select ms-3"
                            aria-label="Default select example">
                            <option v-for="(type, index) in types" :key="type.typeId" :value="index">{{ type.name }}
                            </option>
                        </select>
                    </div>

                    <div class="d-flex flex-column w-50 align-items-center">
                        <div class="d-flex w-100 align-items-center">
                            <h6 class="me-3 fw-bold">Số lượng: </h6>
                            <input v-model="numberSelection" class="form-control w-50" type="number" min="0" max="100">
                        </div>
                        <div class="d-flex w-100 align-items-center">
                            <h6 class="me-3 mt-2 fw-bold">Số lượng trong kho: <span>{{ quantityInStock }}</span></h6>
                        </div>
                    </div>
                </div>
                <hr class="w-100">


                <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                    <a class="collapse-btn fw-bold " data-bs-toggle="collapse" href="#collapseExample" role="button"
                        aria-expanded="false" aria-controls="collapseExample">
                        Thông tin sản phẩm
                    </a>
                    <i class="fa-solid fa-plus"></i>
                </div>

                <div class="collapse" id="collapseExample">
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


                <div class="collapse" id="collapse1">
                    <div>
                        Some placeholder content for the collapse component. This panel is hidden by default but
                        revealed
                        when the user activates the relevant trigger.
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
                <div class="collapse" id="collapse2">
                    <div>
                        <div v-for="guide in productGuide" :key="guide">
                            {{ guide }}
                        </div>
                    </div>
                </div>

                <h6 class="text-end w-100 mt-5" v-if="types[typeSelection].unitPrice != null">Đơn giá: {{
                    types[typeSelection].unitPrice.toLocaleString("it-IT", {
                        style: "currency",
                        currency: "VND",
                    }) }}</h6>


                <div class="d-flex justify-content-end w-100 mt-3">
                    <button :disabled="!checkLogin()" class="cart-button me-3" @click="addToCart"><i
                            class="fa-solid fa-cart-shopping"></i> Thêm
                        vào
                        giỏ hàng</button>
                    <button :disabled="!checkLogin()" class="buy-button">Mua ngay</button>

                </div>
            </div>

            <div class="container mb-5" style="width: 50vw; margin-top: 100px;">
                <button v-for="tag in tagsBelong" :key="tag.tagId" class="text-uppercase tag-button me-3 mt-2"
                    @click="pushToWithId('tag', tag.tagId)">
                    {{ tag.name }}
                </button>
            </div>
            <hr class="w-100">

            <div class="d-flex flex-column align-items-center justify-content-center mb-5 m-5">
                <h4 class="text-uppercase">Các sản phẩm tương tự</h4>

                <div id="recommenderCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="d-flex justify-content-between">
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 1</h5>
                                        <p class="card-text">Description of the first recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 2</h5>
                                        <p class="card-text">Description of the second recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 3</h5>
                                        <p class="card-text">Description of the third recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 4</h5>
                                        <p class="card-text">Description of the fourth recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 5</h5>
                                        <p class="card-text">Description of the fifth recommended item.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="carousel-item">
                            <div class="d-flex justify-content-between">

                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 6</h5>
                                        <p class="card-text">Description of the sixth recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 7</h5>
                                        <p class="card-text">Description of the seventh recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 8</h5>
                                        <p class="card-text">Description of the eighth recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 9</h5>
                                        <p class="card-text">Description of the ninth recommended item.</p>
                                    </div>
                                </div>
                                <div class="card me-2">
                                    <img src="https://via.placeholder.com/300x150" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title">Recommendation 10</h5>
                                        <p class="card-text">Description of the tenth recommended item.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#recommenderCarousel"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#recommenderCarousel"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>

            <hr class="w-100">

            <div class="container rating d-flex flex-column align-items-center justify-content-center">
                <h4 class="text-uppercase mb-4">Đánh giá sản phẩm</h4>
                <h5  v-if="reviews.length == 0">Hiện chưa có đánh giá nào cho sản phẩm này</h5>
            </div>

            <section v-if="checkLogin()">
                <div class="py-5 text-body">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-6">
                            <div class="card">
                                <div class="card-body p-4">
                                    <div class="d-flex flex-start w-100">
                                        <img class="rounded-circle shadow-1-strong me-3"
                                            v-if="checkLogin() == true && currentUser.avatar != ''"
                                            :src="currentUser.avatar" alt="avatar" width="65" height="65" />
                                        <img v-else src="https://placehold.co/65x65" alt=""
                                            class="rounded-circle shadow-1-strong me-3" width="65" height="65">
                                        <div class="w-100">
                                            <h5>Thêm bình luận</h5>
                                            <h6>{{ currentUser.name }}</h6>
                                            <div class="container-wrapper">
                                                <div class="container d-flex align-items-center justify-content-start ">
                                                    <div class="row justify-content-center">

                                                        <!-- star rating -->
                                                        <div class="rating-wrapper">

                                                            <!-- star 5 -->
                                                            <input v-model="starNum" class="rating-input" type="radio"
                                                                id="5-star-rating" name="star-rating" value="5">
                                                            <label for="5-star-rating" class="star-rating">
                                                                <i class="fas fa-star d-inline-block"></i>
                                                            </label>

                                                            <!-- star 4 -->
                                                            <input v-model="starNum" class="rating-input" type="radio"
                                                                id="4-star-rating" name="star-rating" value="4">
                                                            <label for="4-star-rating" class="star-rating star">
                                                                <i class="fas fa-star d-inline-block"></i>
                                                            </label>

                                                            <!-- star 3 -->
                                                            <input v-model="starNum" class="rating-input" type="radio"
                                                                id="3-star-rating" name="star-rating" value="3">
                                                            <label for="3-star-rating" class="star-rating star">
                                                                <i class="fas fa-star d-inline-block"></i>
                                                            </label>

                                                            <!-- star 2 -->
                                                            <input v-model="starNum" class="rating-input" type="radio"
                                                                id="2-star-rating" name="star-rating" value="2">
                                                            <label for="2-star-rating" class="star-rating star">
                                                                <i class="fas fa-star d-inline-block"></i>
                                                            </label>

                                                            <!-- star 1 -->
                                                            <input v-model="starNum" class="rating-input" type="radio"
                                                                id="1-star-rating" name="star-rating" value="1">
                                                            <label for="1-star-rating" class="star-rating star">
                                                                <i class="fas fa-star d-inline-block"></i>
                                                            </label>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div data-mdb-input-init class="form-outline">
                                                <textarea v-model="review.content" class="form-control"
                                                    id="textAreaExample" rows="4"></textarea>
                                            </div>
                                            <div class="d-flex justify-content-between mt-3">
                                                <button type="button" data-mdb-button-init data-mdb-ripple-init
                                                    class="btn btn-dark" @click="review.content = ''">Xóa</button>
                                                <button :disabled="review.content.length == 0" type="button"
                                                    data-mdb-button-init data-mdb-ripple-init class="btn"
                                                    style="background-color: #fbbfc0; color: white;"
                                                    @click="modifyReview($event)">
                                                    <span v-if="review.accountId == 0">
                                                        Gửi
                                                    </span>
                                                    <span v-else>
                                                        Cập nhật
                                                    </span>
                                                    <i class="fas fa-long-arrow-alt-right ms-1"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section>
                <div class=" py-5 text-body">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-11 col-lg-9 col-xl-7">

                            <div v-for="review in reviews" :key="review.reviewId" class="d-flex flex-start mb-4">
                                <img v-if="review.avatar != null && review.avatar != ''"
                                    class="rounded-circle shadow-1-strong me-3" :src="review.avatar" alt="avatar"
                                    width="65" height="65" />
                                <img v-else src="https://placehold.co/65x65" alt=""
                                    class="rounded-circle shadow-1-strong me-3" width="65" height="65">
                                <div v-if="reviews[0].reviewId != 0" class="card w-100">
                                    <div class="card-body p-4">
                                        <div class="">

                                            <h5>{{ review.name }}</h5>
                                            <i v-for="index in review.star" :key="index"
                                                class="fas fa-star d-inline-block" style="color: #fbbfc0"></i>

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
import imageServices from '@/services/image.services';
import orderServices from '@/services/order.services';

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
const numberSelection = ref(0)
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

const tagsBelong = ref([
    {
        tagId: 0,
        name: '',
        created_at: '',
        updated_at: ''
    }
])

const starNum = ref(0)
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

const orders = ref([{
    orderId: 0,
    created_at: '',
    updated_at: '',
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shippingAddress: "",
    shipped: 0,
    shippedDate: "",
    shipmentTracking: "",
    paid: 0
}])

const checkOrdered = ref(false)

function pushToWithId(name: string, id: number) {
    router.push({
        name: name,
        params: { id: id }
    })
}

async function modifyReview(e: any) {
    // e.preventDefault();

    try {
        if (starNum.value == 0) {
            throw ("Vui lòng chọn số sao")
        }
        // add new review
        if (review.value.accountId == 0) {

            await reviewServices.create({
                productId: product.value.proId,
                accountId: currentUser.value.accountId,
                content: review.value.content,
                star: starNum.value
            })
        } else { //update existed review
            await reviewServices.update(review.value.reviewId, {
                content: review.value.content,
                star: starNum.value
            })
        }

        Swal.fire({
            title: "Thành công!",
            text: "Chỉnh sửa nhận xét thành công!",
            icon: "success",
            confirmButtonText: "OK",
        });

        // window.location.reload();
    } catch (error) {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã có lỗi xảy ra! " + error,
            icon: "error",
            confirmButtonText: "OK",
        });
        console.log(error)
    }
}

async function addToCart() {
    // e.preventDefault();
    try {
        if (numberSelection.value <= 0) throw ('Số lượng sản phẩm phải lớn hơn 0!')
        if (numberSelection.value >= types.value[typeSelection.value].quantityInStock) throw ('Số lượng sản phẩm vượt số lượng đang có.')

        let resp = await selectedProductServices.create({
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
        });

    } catch (error) {
        Swal.fire({
            title: "Lỗi!",
            text: "Đã có lỗi xảy ra! " + error,
            icon: "error",
            confirmButtonText: "OK",
        });
        console.log(error)
    }
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

        console.log(product.value)

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
            let respOrders = await orderServices.getAllByAccountIdAndShipped(currentUser.value.accountId)
            orders.value = respOrders.data.order

            for(let i=0; i< orders.value.length; i++){
                console.log('')
            }
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
        color: #fbbfc0;
    }

    .star-rating:hover,
    .star-rating:hover~.star-rating,
    .rating-input:checked~.star-rating {
        color: #fbbfc0;
    }
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
    width: 830px;
    height: 830px;
}
</style>