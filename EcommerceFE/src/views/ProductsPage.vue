<template>
    <div style="width: 100vw;">
        <div class="d-flex justify-content-center m-auto align-items-center"
            style="height: 550px; background-color: #EEEEEE;">
            <div>
                Color Riche
                <h1>
                    Son lì Matte Son Mịn lì Cao cấp 129 I Lead
                </h1>
            </div>
        </div>
        <div class="container align-items-center d-flex flex-column  justify-content-center mt-5 mb-3"
            style="max-width: 50%;">
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <img src="@/assets/loginCover1.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>First slide label</h5>
                            <p>Some representative placeholder content for the first slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                        <img src="@/assets/loginCover1.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Second slide label</h5>
                            <p>Some representative placeholder content for the second slide.</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="@/assets/loginCover1.png" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Third slide label</h5>
                            <p>Some representative placeholder content for the third slide.</p>
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

            <div class="w-100 d-flex align-items-center">
                <CustomSelect :options="['go', 'python', 'rust', 'javascript']" :default="'go'" class="select me-5 " />
                <div class="d-flex w-50 align-items-center">
                    <h5 class="me-3">Số lượng: </h5>
                    <input class="form-control w-50" type="number">
                </div>
            </div>
            <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                <a class="collapse-btn " data-bs-toggle="collapse" href="#collapseExample" role="button"
                    aria-expanded="false" aria-controls="collapseExample">
                    Thông tin sản phẩm
                </a>
                <i class="fa-solid fa-plus"></i>
            </div>

            <div class="collapse" id="collapseExample">
                <div>
                    Some placeholder content for the collapse component. This panel is hidden by default but revealed
                    when the user activates the relevant trigger.
                </div>
            </div>

            <hr class="w-100">
            <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                <a class="collapse-btn" data-bs-toggle="collapse" href="#collapse1" role="button" aria-expanded="false"
                    aria-controls="collapse1">
                    Thành phần
                </a>

                <i class="fa-solid fa-plus"></i>
            </div>
            <div class="collapse" id="collapse1">
                <div>
                    Some placeholder content for the collapse component. This panel is hidden by default but revealed
                    when the user activates the relevant trigger.
                </div>
            </div>
            <hr class="w-100">

            <div class="collapse-item d-flex justify-content-between w-100 align-items-center ">
                <a class="collapse-btn" data-bs-toggle="collapse" href="#collapse2" role="button" aria-expanded="false"
                    aria-controls="collapse2">
                    Cách sử dụng
                </a>

                <i class="fa-solid fa-plus"></i>
            </div>
            <div class="collapse" id="collapse2">
                <div>
                    Some placeholder content for the collapse component. This panel is hidden by default but revealed
                    when the user activates the relevant trigger.
                </div>
            </div>
            <hr class="w-100">

            <div class="d-flex justify-content-end w-100">
                <button class="cart-button me-3"><i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ hàng</button>
                <button class="buy-button">Mua ngay</button>

            </div>

        </div>

        <div class="container mb-5" style="width: 50vw; margin-top: 100px;">
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>
            <button class="text-uppercase tag-button me-3 mt-2">Son môi</button>

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

        <div class="container rating d-flex flex-column align-items-center justify-content-center mb-5">
            <h4 class="text-uppercase ">Đánh giá sản phẩm</h4>


            <div class="container-wrapper w-100">
                <div class="container d-flex align-items-center justify-content-center">
                    <div class="row justify-content-center">

                        <!-- star rating -->
                        <div class="rating-wrapper p-2">

                            <!-- star 5 -->
                            <input class="rating-input" type="radio" id="5-star-rating" name="star-rating" value="5">
                            <label for="5-star-rating" class="star-rating">
                                <i class="fas fa-star d-inline-block"></i>
                            </label>

                            <!-- star 4 -->
                            <input class="rating-input" type="radio" id="4-star-rating" name="star-rating" value="4">
                            <label for="4-star-rating" class="star-rating star">
                                <i class="fas fa-star d-inline-block"></i>
                            </label>

                            <!-- star 3 -->
                            <input class="rating-input" type="radio" id="3-star-rating" name="star-rating" value="3">
                            <label for="3-star-rating" class="star-rating star">
                                <i class="fas fa-star d-inline-block"></i>
                            </label>

                            <!-- star 2 -->
                            <input class="rating-input" type="radio" id="2-star-rating" name="star-rating" value="2">
                            <label for="2-star-rating" class="star-rating star">
                                <i class="fas fa-star d-inline-block"></i>
                            </label>

                            <!-- star 1 -->
                            <input class="rating-input" type="radio" id="1-star-rating" name="star-rating" value="1">
                            <label for="1-star-rating" class="star-rating star">
                                <i class="fas fa-star d-inline-block"></i>
                            </label>

                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
// @ts-ignore
import CustomSelect from "../components/CustomSelect.vue";
</script>

<style>
.rating-wrapper {
    align-self: center;
    box-shadow: 7px 7px 25px rgba(198, 206, 237, .7),
        -7px -7px 35px rgba(255, 255, 255, .7),
        inset 0px 0px 4px rgba(255, 255, 255, .9),
        inset 7px 7px 15px rgba(198, 206, 237, .8);
    border-radius: 5rem;
    display: inline-flex;
    direction: rtl !important;
    margin-left: auto;


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
</style>