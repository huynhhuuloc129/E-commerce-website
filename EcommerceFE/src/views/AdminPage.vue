<template>
    <div class="mb-5" style="height: 150px; background-color: #fbbfc0;">
    </div>
    <div id="whole-section" class=" bg-white d-flex p-0 mb-5" style="width: 100vw;">
        <nav id="sidebarMenu" style="z-index: 0" class="bg-white sticky-top">
            <div class="position-sticky">
                <div ref="fragment" class="list-group list-group-flush mx-3 mt-4">
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple active" aria-current="true"
                        data-bs-toggle="tab" data-bs-target="#metric">
                        <i class="fas fa-chart-line fa-fw me-3"></i>
                        <span>Thống kê</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="false"
                        data-bs-toggle="tab" data-bs-target="#product" aria-controls="product">
                        <div class="d-flex justify-content-between">
                            <div>
                                <i class="fa-brands fa-product-hunt me-3"></i>
                                <span>Sản phẩm</span>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="false"
                        data-bs-toggle="tab" data-bs-target="#data" aria-controls="data">
                        <div class="d-flex justify-content-between">
                            <div>
                                <i class="fa-solid fa-database me-3"></i>
                                <span>Dữ liệu danh mục</span>
                            </div>
                        </div>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="false"
                        data-bs-toggle="tab" data-bs-target="#order" aria-controls="order">
                        <i class="fa-solid fa-list me-3"></i>
                        <span>Đơn hàng</span>
                    </a>

                    <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="false"
                        data-bs-toggle="tab" data-bs-target="#users" aria-controls="users">
                        <i class="fa-solid fa-users me-3"></i>
                        <span>Người dùng</span>
                    </a>
                </div>
            </div>
        </nav>

        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active mt-4" id="metric" role="tabpanel" aria-labelledby="metric-tab"
                style="width: 80vw">
                <div class="content w-100 me-5">
                    <!-- Navbar Start -->

                    <h2 class="p-4">Thống kê tổng quan</h2>

                    <!-- Sale & Revenue Start -->
                    <div class="container-fluid">


                        <div class="d-flex mt-3">
                            <div class="bg-light w-50 me-4 p-4 d-flex align-items-center justify-content-between">
                                <i class="fa-solid fa-users fa-3x" style="color: #fbbfc0"></i>
                                <div class="ms-3">
                                    <p class="mb-2 fw-bold">Số lượng người dùng</p>
                                    <h6 class="mb-0 text-end">{{ users.length }}</h6>
                                </div>
                            </div>
                            <div class="bg-light w-50 p-4 d-flex align-items-center justify-content-between">
                                <i class="fa-brands fa-product-hunt fa-3x" style="color: #fbbfc0"></i>
                                <div class="ms-3">
                                    <p class="mb-2 fw-bold">Số lượng sản phẩm</p>
                                    <h6 class="mb-0 text-end">{{ products.length }}</h6>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex mt-3">
                            <div class="bg-light w-50 me-4 p-4 d-flex align-items-center justify-content-between">
                                <i class="fa fa-chart-bar fa-3x" style="color: #fbbfc0"></i>
                                <div class="ms-3">
                                    <p class="mb-2 fw-bold">Tổng lượt bán</p>
                                    <h6 class="mb-0 text-end">{{ orders.length }}</h6>
                                </div>
                            </div>
                            <div class="bg-light w-50 p-4 d-flex align-items-center justify-content-between">
                                <i class="fa fa-chart-pie fa-3x" style="color: #fbbfc0"></i>
                                <div class="ms-3">
                                    <p class="mb-2 fw-bold">Tổng doanh thu</p>
                                    <h6 class="mb-0 text-end">{{ countTotalPrice.toLocaleString("it-IT", {
                                        style: "currency",
                                        currency: "VND",
                                    }) }}</h6>
                                </div>
                            </div>
                        </div>

                        <div class="row g-4 mt-1">
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">


                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Thống kê lượt bán</h6>

                                    </div>
                                    <div id="worldwide-sales" v-if="doneCalculate">
                                        <Chart :size="{ width: 500, height: 400 }" :data="plByMonth" :margin="{
                                            left: 0,
                                            top: 20,
                                            right: 0,
                                            bottom: 0
                                        }" direction="horizontal">

                                            <template #layers>
                                                <Grid strokeDasharray="2,2" />
                                                <Line :dataKeys="['name', 'pl']" />
                                            </template>

                                        </Chart>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Thống kê doanh thu</h6>

                                    </div>
                                    <div id="salse-revenue" v-if="doneCalculate">
                                        <Chart :size="{ width: 500, height: 400 }" :data="plByMoney" :margin="{
                                            left: 0,
                                            top: 20,
                                            right: 0,
                                            bottom: 0
                                        }" direction="horizontal">

                                            <template #layers>
                                                <Grid strokeDasharray="2,2" />

                                                <Line :dataKeys="['name', 'pl']" type="monotone" :lineStyle="{
                                                    stroke: '#9f7aea'
                                                }" />

                                                <defs>
                                                    <linearGradient id="grad" gradientTransform="rotate(90)">
                                                        <stop offset="0%" stop-color="#be90ff" stop-opacity="1" />
                                                        <stop offset="100%" stop-color="white" stop-opacity="0.4" />
                                                    </linearGradient>
                                                </defs>
                                            </template>


                                        </Chart>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="p-4 mt-3 text-" style="background-color: #fbbfc0">
                            <h6>
                                Sản phẩm bán chạy nhất
                            </h6>
                            <div v-if="topSaleProducts.length > 0" class="d-flex justify-content-between">
                                <div class="fw-bold">
                                    <div class="text-uppercase">
                                        {{ topSaleProducts[0].brandName }}
                                    </div>
                                    <a class="fw-bold text-dark"
                                        :href="'http://localhost:5173/products/' + topSaleProducts[0].proId">
                                        {{ topSaleProducts[0].name }}
                                    </a>
                                </div>
                                <div class="fw-bold">
                                    Lượt bán:
                                    {{ topSaleProducts[0].totalSales }}
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sale & Revenue End -->

                    <h2 class="p-4">Thống kê đơn hàng và doanh thu</h2>

                    <!-- Sales Chart Start -->
                    <div class="container-fluid">
                        <div class="row g-4">
                            <div class="d-flex">
                                <input type="date" class="form-control me-4" v-model="startDate">
                                <input type="date" class="form-control" v-model="endDate">
                            </div>
                            <div class="">

                                <div class="d-flex">
                                    <div
                                        class="bg-light w-50 me-4 p-4 d-flex align-items-center justify-content-between">
                                        <i class="fa fa-chart-bar fa-3x" style="color: #fbbfc0"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng lượt bán trong khoảng thời gian</p>
                                            <h6 class="mb-0 text-end">{{ filteredOrders.length }}</h6>
                                        </div>
                                    </div>
                                    <div class="bg-light w-50 p-4 d-flex align-items-center justify-content-between">
                                        <i class="fa fa-chart-pie fa-3x" style="color: #fbbfc0"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng doanh thu trong khoảng thời gian</p>
                                            <h6 class="mb-0 text-end">{{ totalRevenue.toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <!-- Widgets Start -->
                    <div class="container-fluid pt-4 d-flex w-100">
                        <div class="w-100 me-2">
                            <div class="">
                                <div class="h-100 bg-light rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <h2 class="">Thống kê đánh giá</h2>
                                    </div>
                                    <div class="">
                                        <div>
                                            <div class="fw-bold"><i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="progress" style=" margin:8px 0;">
                                                <div class="progress-bar bg-warning fw-bold text-end pe-2"
                                                    role="progressbar" aria-valuenow="5" aria-valuemin="0"
                                                    aria-valuemax="5" :style="`width: ${fiveStar * 100 / maxReview}%`">
                                                    {{ fiveStar }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div>
                                            <div class="fw-bold" style=" margin:5px 0;"> <i
                                                    class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="progress" style=" margin:8px 0;">
                                                <div class="progress-bar bg-warning fw-bold  text-end pe-2"
                                                    role="progressbar" aria-valuenow="4" aria-valuemin="0"
                                                    aria-valuemax="5" :style="`width: ${fourStar * 100 / maxReview}%`">
                                                    {{ fourStar }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div>
                                            <div class="fw-bold" style=" margin:5px 0;"><i
                                                    class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="progress" style=" margin:8px 0;">
                                                <div class="progress-bar bg-primary fw-bold text-end pe-2"
                                                    role="progressbar" aria-valuenow="3" aria-valuemin="0"
                                                    aria-valuemax="5" :style="`width: ${threeStar * 100 / maxReview}%`">
                                                    {{ threeStar }}

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div>
                                            <div class="fw-bold" style=" margin:5px 0;"><i
                                                    class="fas fa-star d-inline-block"></i>
                                                <i class="fas fa-star d-inline-block"></i>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="progress" style=" margin:8px 0;">
                                                <div class="progress-bar bg-danger fw-bold text-end pe-2"
                                                    role="progressbar" aria-valuenow="2" aria-valuemin="0"
                                                    aria-valuemax="5" :style="`width: ${twoStar * 100 / maxReview}%`">
                                                    {{ twoStar }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <div class="fw-bold" style=" margin:5px 0;"><i
                                                    class="fas fa-star d-inline-block"></i>
                                            </div>
                                        </div>
                                        <div class="">
                                            <div class="progress" style=" margin:8px 0;">
                                                <div class="progress-bar bg-danger fw-bold text-end pe-2"
                                                    role="progressbar" aria-valuenow="1" aria-valuemin="0"
                                                    aria-valuemax="5" :style="`width: ${oneStar * 100 / maxReview}%`">
                                                    {{ oneStar }}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div v-for="review in reviews" :key="review.reviewId"
                                        class="d-flex align-items-center border-bottom py-3">
                                        <img v-if="review.avatar != '' && review.avatar != null"
                                            class="rounded-circle flex-shrink-0" alt="" :src="review.avatar"
                                            style="width: 60px; height: 60px;">
                                        <img v-else src="https://placehold.co/60x60"
                                            class="rounded-circle flex-shrink-0" alt="">
                                        <div class="ms-3" style="width: 90%;">
                                            <div class="d-flex w-100 justify-content-between">
                                                <h6 class="mb-0 w-75">{{ review.name }} đã đánh giá
                                                    <a :href="'http://localhost:5173/products/' + review.productId">{{
                                                        review.productName }}</a>
                                                </h6>
                                                <div class="d-flex flex-column justify-content-end text-end">
                                                    <small>{{ calculateTimeElapse(review.created_at) }}</small>
                                                    <div>
                                                        <i v-for="index in review.star" :key="index"
                                                            class="fas fa-star d-inline-block"
                                                            style="color: #F4BB47"></i>
                                                    </div>
                                                </div>

                                            </div>
                                            <span style="display: block;" class="text-truncate">{{ review.content
                                                }}</span>
                                        </div>
                                    </div>

                                </div>
                            </div>



                        </div>

                    </div>

                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="deleteTag" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="deleteTagLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteTagLabel">Xóa nhãn
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa nhãn này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                @click="deleteTag()">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="deleteProduct" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="deleteProductLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteProductLabel">Xóa sản phẩm
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa sản phẩm này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                @click="deleteProduct()">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal -->
            <div class="modal fade" id="deleteComp" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="deleteCompLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteCompLabel">Xóa thành phần
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa thành phần này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                @click="deleteComp()">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="deleteBrand" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="deleteBrandLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteBrandLabel">Xóa thương hiệu
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa thương hiệu này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                @click="deleteBrand()">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="bg-light p-4 rounded tab-pane fade show mt-4" id="product" role="tabpanel"
                aria-labelledby="product-tab" style="width: 80vw">
                <h2>Danh sách sản phẩm</h2>
                <div class="w-100 align-content-end text-end mb-2">
                    <button class="btn btn-light text-white fw-bold p-3"
                        style="background-color: #fbbfc0; border-radius: 50px" data-bs-toggle="modal"
                        data-bs-target="#addProductModal">+
                        Thêm sản phẩm</button>
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                ID</th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Ngày nhập
                            </th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Tên sản phẩm
                            </th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Ảnh</th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Giá</th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Phân loại
                            </th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Thương hiệu
                            </th>
                            <th class="fw-bold text-uppercase text-center" style="vertical-align: middle;" scope="col">
                                Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="product in products" :key="product.proId">
                            <th scope="row">{{ product.proId }}</th>
                            <th scope="row">{{ product.created_at.slice(0, 10) }}</th>
                            <th scope="row">
                                <a class="fw-bold text-dark" :href="'http://localhost:5173/products/' + product.proId">
                                    {{ product.name }}
                                </a>
                            </th>
                            <th scope="row">
                                <img :src="product.image" height="50" width="50" alt="">

                            </th>
                            <th scope="row">{{ product.unitPrice.toLocaleString("it-IT", {
                                style: "currency",
                                currency: "VND",
                            }) }}</th>
                            <th scope="row">{{ categoriesMap.get(product.catId) }}</th>
                            <th scope="row" class="text-capitalize">{{ product.brandName }}</th>
                            <th scope="row">
                                <button class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                    data-bs-toggle="modal" data-bs-target="#editProduct"
                                    @click="choosenProductId = product.proId; getChoosenProduct()">
                                    <i class="fa-regular fa-pen-to-square"></i>
                                </button>

                                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#deleteProduct"
                                    @click="choosenProductId = product.proId; deleteProduct()">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </th>
                        </tr>

                    </tbody>
                </table>
            </div>

            <div class="bg-light p-4 rounded tab-pane fade show mt-4" id="data" role="tabpanel"
                aria-labelledby="data-tab" style="width: 80vw">
                <h2>Dữ liệu danh mục</h2>
                <div class="d-flex">

                    <div class="w-50">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h5 class="mb-0">Danh sách thể loại</h5>
                            </div>
                            <button class="btn btn-dark fw-bold w-100" data-bs-toggle="modal"
                                data-bs-target="#addCategoryModal"><i class="fa-solid fa-plus"></i></button>

                            <!-- Modal -->
                            <div class=" modal fade" id="addCategoryModal" tabindex="-1"
                                aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog-centered modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addCategoryModalLabel">Thêm thể loại
                                            </h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body d-flex flex-column w-100">
                                            <div class="d-flex w-100 justify-content-between mb-3">
                                                <label for="tag-name">Tên thể loại:</label>
                                                <input class="w-75 form-control" type="text" id="tag-name" required
                                                    v-model="newCategory.name">
                                            </div>

                                            <div class="d-flex w-100 justify-content-between">
                                                <label for="tag-name">Mô tả:</label>
                                                <input class="w-75 form-control" type="text" id="tag-name" required
                                                    v-model="newCategory.description">
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary"
                                                @click="addCategory()">Thêm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">

                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-dark">
                                            <th scope="col" class="fw-bold text-uppercase">Ngày tạo</th>
                                            <th scope="col" class="fw-bold text-uppercase">Tên</th>
                                            <th scope="col" class="fw-bold text-uppercase">Mô tả</th>
                                            <th style="width: 15%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="cat in categories" :key="cat.catId">
                                            <td>{{ cat.created_at.slice(0, 10) }}</td>
                                            <td>{{ cat.name }}</td>
                                            <td>{{ cat.description }}</td>
                                            <td class="d-flex justify-content-center"><button class="btn btn-sm"
                                                    style="background-color: #fbbfc0; color: white"
                                                    @click="choosenCategory = cat" data-bs-toggle="modal"
                                                    data-bs-target="#editCategoryModal"><i
                                                        class="fa-regular fa-pen-to-square"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="bg-light text-center rounded p-4 w-50">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h5 class="mb-0">Danh sách các thương hiệu</h5>
                        </div>
                        <button type="button" class="btn btn-dark fw-bold w-100" data-bs-toggle="modal"
                            data-bs-target="#addBrandModal"><i class="fa-solid fa-plus"></i></button>

                        <!-- Modal -->
                        <div class="modal fade" id="addBrandModal" tabindex="-1" aria-labelledby="addBrandModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog-centered modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addBrandModalLabel">Thêm thương hiệu</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body text-start d-flex">
                                        <div class="d-flex flex-column w-100 justify-content-between mb-3">
                                            <div class="w-100">
                                                <label class="" for="comp-name">Tên thương hiệu:</label>
                                                <input class="w-100 form-control" type="text" id="comp-name"
                                                    v-model="newBrandName" required>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                            @click="addBrand()">Thêm</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="editBrandModal" tabindex="-1" aria-labelledby="editBrandModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog-centered modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editBrandModalLabel">Chỉnh sửa thương hiệu</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body text-start d-flex">
                                        <div class="d-flex w-100 justify-content-between mb-3">
                                            <label for="brand-name-edit">Tên thương hiệu:</label>
                                            <input class="w-75 form-control" type="text" id="brand-name-edit"
                                                v-model="choosenBrand.name" required>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary fw-bold" data-bs-dismiss="modal"
                                            @click="editBrand()" style="background-color: #fbbfc0; border: 0px">
                                            Cập nhật</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th class="fw-bold text-uppercase" scope="col">Ngày tạo</th>
                                        <th class="fw-bold text-uppercase" scope="col">Tên</th>
                                        <th style="width: 15%;" scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody class="w-100">
                                    <tr v-for="brand in VisibleBrands()" :key="brand.brandId">
                                        <td>{{ brand.created_at.slice(0, 10) }}</td>
                                        <td class="text-capitalize">{{ brand.name }}</td>

                                        <td class="d-flex justify-content-center">
                                            <button class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                data-bs-toggle="modal" data-bs-target="#editBrandModal"
                                                @click="choosenBrand = brand">
                                                <i class="fa-regular fa-pen-to-square"></i>
                                            </button>

                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteBrand" @click="choosenBrand = brand">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>

                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                            <div class="w-100 d-flex justify-content-center align-items-center text-center mt-2">

                                <button @click="brandVisibles += steps" v-if="brandVisibles < brands.length"
                                    class="btn moreUser w-50" style="border-radius: 50px; border: 2px solid black;">
                                    Xem thêm >>
                                </button>
                            </div>
                        </div>
                    </div>


                </div>

                <div class="d-flex">

                    <div class="bg-light text-center rounded p-4 w-50">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h5 class="mb-0">Danh sách các thành phần</h5>
                        </div>
                        <button type="button" class="btn btn-dark fw-bold w-100" data-bs-toggle="modal"
                            data-bs-target="#addCompModal"><i class="fa-solid fa-plus"></i></button>

                        <!-- Modal -->
                        <div class="modal fade" id="addCompModal" tabindex="-1" aria-labelledby="addCompModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog-centered modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addCompModalLabel">Thêm thành phần</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body text-start d-flex">
                                        <div class="d-flex flex-column w-100 justify-content-between mb-3">
                                            <div class="w-100">
                                                <label class="" for="comp-name">Tên thành phần:</label>
                                                <input class="w-100 form-control" type="text" id="comp-name"
                                                    v-model="newCompName" required>

                                            </div>

                                            <div class="w-100 mt-3">

                                                <label for="comp-description">Mô tả thành phần:</label>
                                                <input class="w-100 form-control" type="text" id="comp-description"
                                                    v-model="newCompNameDescription" required>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                            @click="addComp()">Thêm</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="editCompModal" tabindex="-1" aria-labelledby="editCompModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog-centered modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editCompModalLabel">Chỉnh sửa thành phần</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body text-start d-flex">
                                        <div class=" w-100  mb-3">
                                            <label for="comp-name-edit">Tên thành phần:</label>
                                            <input class="w-75 form-control" type="text" id="comp-name-edit"
                                                v-model="choosenComp.name" required>

                                                
                                                <label for="comp-desc-edit">Mô tả:</label>
                                                <textarea class="form-control" type="text" id="comp-desc-edit"
                                                    v-model="choosenComp.description" required></textarea>
                                            </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary fw-bold" data-bs-dismiss="modal"
                                            @click="editComp()" style="background-color: #fbbfc0; border: 0px">
                                            Cập nhật</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th class="fw-bold text-uppercase" style="vertical-align: middle;" scope="col">
                                            Ngày tạo</th>
                                        <th class="fw-bold text-uppercase" style="vertical-align: middle;" scope="col">
                                            Tên</th>
                                        <th class="fw-bold text-uppercase" style="vertical-align: middle;" scope="col">
                                            Mô tả</th>
                                        <th style="width: 15%;" scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody class="w-100">
                                    <tr v-for="component in VisibleComponents()" :key="component.componentId">
                                        <td>{{ component.created_at.slice(0, 10) }}</td>
                                        <td class="text-capitalize">{{ component.name }}</td>
                                        <td class="">{{ component.description }}</td>

                                        <td class="d-flex justify-content-center">
                                            <button class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                data-bs-toggle="modal" data-bs-target="#editCompModal"
                                                @click="choosenComp = component">
                                                <i class="fa-regular fa-pen-to-square"></i>
                                            </button>

                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteComp" @click="choosenComp = component">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>

                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                            <div class="w-100 d-flex justify-content-center align-items-center text-center mt-2">

                                <button @click="compVisibles += steps" v-if="compVisibles < components.length"
                                    class="btn moreUser w-50" style="border-radius: 50px; border: 2px solid black;">
                                    Xem thêm >>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="bg-light text-center rounded p-4 w-50">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h5 class="mb-0">Danh sách các nhãn dán</h5>
                        </div>
                        <button type="button" class="btn btn-dark fw-bold w-100" data-bs-toggle="modal"
                            data-bs-target="#addTagModal"><i class="fa-solid fa-plus"></i></button>

                        <!-- Modal -->
                        <div class="modal fade" id="addTagModal" tabindex="-1" aria-labelledby="addTagModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog-centered modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addTagModalLabel">Thêm nhãn</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body text-start d-flex">
                                        <div class="d-flex w-100 justify-content-between mb-3">
                                            <label for="tag-name">Tên nhãn:</label>
                                            <input class="w-75 form-control" type="text" id="tag-name"
                                                v-model="newTagName" required>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                            @click="addTag()">Thêm</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark" style="vertical-align: middle;">
                                        <th class="fw-bold text-uppercase" style="width: 15%;" scope="col">Ngày tạo</th>
                                        <th class="fw-bold text-uppercase" scope="col">Tên</th>
                                        <th style="width: 15%;" scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody class="w-100">
                                    <tr v-for="tag in VisibleTags()" :key="tag.tagId">
                                        <td>{{ tag.created_at.slice(0, 10) }}</td>
                                        <td class="text-capitalize">{{ tag.name }}</td>
                                        <td class="d-flex justify-content-center">
                                            <button class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                data-bs-toggle="modal" data-bs-target="#editTagModal"
                                                @click="choosenTag = tag">
                                                <i class="fa-regular fa-pen-to-square"></i>
                                            </button>

                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                data-bs-target="#deleteTag" @click="choosenTag = tag">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>

                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                            <div class="w-100 d-flex justify-content-center align-items-center text-center mt-2">

                                <button @click="tagVisibles += steps" v-if="tagVisibles < tags.length"
                                    class="btn moreUser w-50" style="border-radius: 50px; border: 2px solid black;">
                                    Xem thêm >>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <div class="modal fade" id="editTagModal" tabindex="-1" aria-labelledby="editTagModalLabel"
                aria-hidden="true">
                <div class="modal-dialog-centered modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editTagModalLabel">Chỉnh sửa nhãn</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-start d-flex">
                            <div class="d-flex w-100 justify-content-between mb-3">
                                <label for="tag-name-edit">Tên nhãn:</label>
                                <input class="w-75 form-control" type="text" id="tag-name-edit"
                                    v-model="choosenTag.name" required>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary fw-bold" data-bs-dismiss="modal"
                                @click="editTag()" style="background-color: #fbbfc0; border: 0px">
                                Cập nhật</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-light rounded tab-pane fade show mt-4" id="users" role="tabpanel" aria-labelledby="users-tab"
                style="width: 80vw">
                <h2 class="p-4">Các người dùng trong hệ thống</h2>
                <div class="container d-flex justify-content-center">
                    <div class="w-100">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="fw-bold text-uppercase">ID</th>
                                    <th scope="col" class="fw-bold text-uppercase">Ảnh</th>
                                    <th scope="col" class="fw-bold text-uppercase">Tên</th>
                                    <th scope="col" class="fw-bold text-uppercase">Email</th>
                                    <th scope="col" class="fw-bold text-uppercase">Vai trò</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="user in users" :key="user.accountId">
                                    <th scope="row">{{ user.accountId }}</th>
                                    <td>
                                        <img v-if="user.avatar != null" :src="user.avatar" style="border-radius: 50%"
                                            width="40" height="40" alt="">
                                        <img v-else src="https://placehold.co/40x40" style="border-radius: 50%" alt="">
                                    </td>
                                    <td>{{ user.name }}</td>
                                    <td>{{ user.email }}</td>
                                    <td>{{ user.role }}</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="bg-light rounded tab-pane fade show mt-4" id="order" role="tabpanel" aria-labelledby="order-tab"
                style="width: 80vw">

                <h2 class="ms-4 pt-4">Danh sách đơn hàng</h2>
                <h4 class="ms-4 pt-4">Đơn chưa duyệt</h4>
                <div class="bg-light text-center rounded ps-4 pe-4 pb-4">
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Ngày
                                        đặt
                                    </th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Mã
                                        đơn hàng</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Khách
                                        hàng</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Tổng
                                        tiền
                                    </th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Trạng
                                        thái</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Tình
                                        trạng</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">
                                        Phương thức thanh
                                        toán</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase width: 10%;"
                                        scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(order, index) in unconfirmOrders" :key="order.orderId">
                                    <td v-if="order.created_at != null">{{ order.created_at.slice(0, 10) }}</td>
                                    <td>{{ order.orderId }}</td>
                                    <td>{{ order.accountName }}</td>
                                    <td v-if="order.totalPrice != null">
                                        {{ order.totalPrice.toLocaleString("it-IT", {
                                            style: "currency",
                                            currency: "VND",
                                        }) }}</td>
                                    <td v-if="order.paid == 0 && order.cancel == 0" class="text-danger">Chưa thanh toán
                                    </td>
                                    <td v-if="order.paid == 1 && order.cancel == 0" class="text-success">Đã thanh toán
                                    </td>
                                    <td v-if="order.cancel == 1" class="text-danger ">
                                        Đã hủy
                                    </td>
                                    <td v-if="order.confirm == 1">Đã duyệt</td>
                                    <td v-else>Chưa duyệt</td>
                                    <td>{{ order.paymentType }}</td>
                                    <td>
                                        <a class="btn btn-sm" style="background-color: #fbbfc0; color: white" href=""
                                            data-bs-toggle="modal" data-bs-target="#detailOrder"
                                            @click="getOneDetailOrder(order.orderId, index)">
                                            Chi tiết
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- Modal -->
                        <div class="modal fade" id="detailOrder" tabindex="-1" aria-labelledby="detailOrderLabel"
                            aria-hidden="true">
                            <div id="orderDetailModal" class="modal-dialog modal-xl modal-dialog-centered ">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="detailOrderLabel">Chi tiết đơn hàng</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="text-start ms-3">
                                        <h5>Thông tin vận chuyển</h5>
                                        <div class="text-capitalize fw-bold" for="addressShip ">Địa chỉ
                                            nhận hàng: <span> {{ choosenUser.billingAddress }}
                                            </span>
                                        </div>
                                        <div class="d-flex">
                                            <div class="me-5">
                                                <div class="fw-bold">
                                                    Tên: <span>{{ choosenUser.name }}</span>
                                                </div>
                                                <div class="fw-bold">
                                                    SĐT: <span>{{ choosenUser.phone }}</span>
                                                </div>
                                            </div>
                                            <div>
                                            </div>

                                        </div>
                                        <div class="alert alert-danger me-3 fw-bold" role="alert"
                                            v-if="orderDetail.confirm == 0">
                                            Chưa xác nhận
                                        </div>
                                        <div v-else class="alert alert-success me-3 fw-bold text-success" role="alert">
                                            Đã xác nhận
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="h5">Sản phẩm</th>
                                                        <th scope="col">Đơn vị</th>
                                                        <th scope="col">Số lượng</th>
                                                        <th scope="col">Giá</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(sProductId, index) in orderDetail.selectedProductIds"
                                                        :key="sProductId + ' ' + index">
                                                        <th scope="row">
                                                            <div class="d-flex align-items-center">
                                                                <img :src="orderDetail.imageBase64[index]"
                                                                    class="img-fluid rounded-3" style="width: 120px;"
                                                                    alt="Book">
                                                                <div class="flex-column ms-4">
                                                                    <p class="mb-2"><a class="linkp fw-bold"
                                                                            :href="'http://localhost:5173/products/' + orderDetail.productIds[index]">
                                                                            {{
                                                                                orderDetail.productNames[index]
                                                                            }}
                                                                        </a>
                                                                    </p>
                                                                    <p class="mb-0">
                                                                        {{
                                                                            orderDetail.typeNames[index]
                                                                        }}</p>
                                                                </div>
                                                            </div>
                                                        </th>
                                                        <td class="align-middle">
                                                            <p class="mb-0" style="font-weight: 500;">Thỏi</p>
                                                        </td>
                                                        <td class="align-middle ">
                                                            <div class="d-flex flex-row justify-content-center">
                                                                <input disabled id="form1" min="0" name="quantity"
                                                                    :value="orderDetail.quantitySelected[index]"
                                                                    type="number" class="form-control form-control-sm"
                                                                    style="width: 50px;" />
                                                            </div>
                                                        </td>
                                                        <td class="align-middle">
                                                            <p class="mb-0" style="font-weight: 500;"
                                                                v-if="orderDetail.sellingPrices[index] != null">
                                                                {{
                                                                    orderDetail.sellingPrices[index].toLocaleString("it-IT",
                                                                        {
                                                                            style: "currency",
                                                                            currency: "VND",
                                                                        }) }}</p>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="">
                                            <div class="d-flex justify-content-end">

                                                <div class="row w-50 text-end">
                                                    <div class="col-lg-4 col-xl-3 w-100">
                                                        <div class="d-flex justify-content-between"
                                                            style="font-weight: 500;">
                                                            <p class="mb-2">Tổng giá:</p>
                                                            <p class="mb-2">{{
                                                                (orderDetail.totalPrice).toLocaleString("it-IT", {
                                                                    style: "currency",
                                                                    currency: "VND",
                                                                }) }}</p>
                                                        </div>

                                                        <div class="d-flex justify-content-between"
                                                            style="font-weight: 500;">
                                                            <p class="mb-0">Phí vận chuyển:</p>
                                                            <p class="mb-0">{{
                                                                (orderDetail.shippingPrice).toLocaleString("it-IT",
                                                                    {
                                                                        style: "currency",
                                                                        currency: "VND",
                                                                    }) }}</p>
                                                        </div>

                                                        <hr class="w-100">

                                                        <div class="d-flex justify-content-between"
                                                            style="font-weight: 500;">
                                                            <p class="mb-0">Tổng cộng:</p>
                                                            <p class="mb-0 text-danger fw-bold">{{
                                                                (orderDetail.totalPrice +
                                                                    orderDetail.shippingPrice).toLocaleString("it-IT", {
                                                                        style: "currency",
                                                                        currency: "VND",
                                                                    }) }}</p>
                                                        </div>

                                                        <div v-if="orderDetail.note != undefined && orderDetail.note.length > 0"
                                                            class="d-flex justify-content-between"
                                                            style="font-weight: 500;">
                                                            <p class="mb-0">Ghi chú:</p>
                                                            <p class="mb-0">
                                                                {{ orderDetail.note }}
                                                            </p>
                                                        </div>

                                                        <div v-if="orderDetail.shipmentTracking != ''"
                                                            class="d-flex justify-content-between mb-4"
                                                            style="font-weight: 500;">
                                                            <p class="mb-0">Tình trạng đơn hàng:</p>
                                                            <p class="mb-0">
                                                                {{ orderDetail.shipmentTracking }}
                                                            </p>
                                                        </div>

                                                        <div class="d-flex text-end justify-content-end">
                                                            <div v-if="orderDetail.cancel == 1"
                                                                class="text-danger fw-bold text-uppercase w-100">
                                                                Đơn hàng đã bị hủy

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="ms-3 me-3">

                                        <h5 class="text-start">Phương thức thanh toán</h5>
                                        <div class="d-flex justify-content-between" style="font-weight: 500;">
                                            <p class="mb-0">Phương thức thanh toán:
                                                {{ orderDetail.paymentType }} </p>
                                        </div>

                                        <div class="d-flex justify-content-between w-100 ">

                                            <div v-if="orderDetail.paid == 1 && orderDetail.cancel == 0 && orderDetail.paymentType != 'Thanh toán khi nhận hàng'"
                                                class="text-success fw-bold alert alert-success  text-start w-100"
                                                role="alert"> Đã
                                                thanh toán
                                            </div>
                                            <div v-if="orderDetail.paid == 1 && orderDetail.cancel == 0 && orderDetail.paymentType == 'Thanh toán khi nhận hàng'"
                                                class="text-success fw-bold alert alert-success  text-start w-75"
                                                role="alert"> Đã
                                                thanh toán
                                            </div>

                                            <div v-if="orderDetail.paid == 0 && orderDetail.cancel == 0 && orderDetail.paymentType == 'Thanh toán khi nhận hàng'"
                                                class="alert alert-danger fw-bold w-75 text-start" role="alert">
                                                Chưa thanh toán
                                            </div>
                                            <div v-if="orderDetail.paid == 0 && orderDetail.cancel == 0 && orderDetail.paymentType != 'Thanh toán khi nhận hàng'"
                                                class="alert alert-danger fw-bold w-100 text-start" role="alert">
                                                Chưa thanh toán
                                            </div>

                                            <div v-if="orderDetail.confirm == 1 && orderDetail.cancel == 0 && orderDetail.paymentType == 'Thanh toán khi nhận hàng' && orderDetail.shipmentTracking == 'Đang vận chuyển'"
                                                class="form-check form-switch ms-2">
                                                <input v-if="orderDetail.paid == 0" class="form-check-input"
                                                    type="checkbox" v-model="orderDetail.paid" :true-value="1"
                                                    :false-value="0" @change="updatePaid" id="switchPaid" />
                                            </div>
                                        </div>

                                        <button v-if="(orderDetail.confirm == 0 && orderDetail.cancel == 0)"
                                            class="btn btn-dark mb-3" @click="confirmOrder($event, orderDetail)">
                                            Xác nhận đơn hàng
                                        </button>
                                        <button
                                            v-if="(orderDetail.confirm == 1 && orderDetail.shipmentTracking == 'Đang chờ giao hàng')"
                                            class="btn btn-dark mb-3"
                                            @click="updateShipmentTracking(orderDetail.orderId)">
                                            Xác nhận giao hàng
                                        </button>
                                        <button disabled
                                            v-if="(orderDetail.cancel == 0 && (orderDetail.shipmentTracking == 'Đang vận chuyển' || orderDetail.shipmentTracking == 'Đã nhận được hàng'))"
                                            class="btn btn-dark mb-3">
                                            Đã xác nhận giao hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h4 class="pt-4 text-start">Đơn đã duyệt</h4>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Ngày
                                        đặt
                                    </th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Mã
                                        đơn hàng</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Khách
                                        hàng</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Tổng
                                        tiền
                                    </th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Trạng
                                        thái</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">Tình
                                        trạng</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase" scope="col">
                                        Phương thức thanh
                                        toán</th>
                                    <th style="vertical-align: middle;" class="fw-bold text-uppercase width: 10%;"
                                        scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(order, index) in orders" :key="order.orderId">
                                    <td v-if="order.created_at != null">{{ order.created_at.slice(0, 10) }}</td>
                                    <td>{{ order.orderId }}</td>
                                    <td>{{ order.accountName }}</td>
                                    <td v-if="order.totalPrice != null">
                                        {{ order.totalPrice.toLocaleString("it-IT", {
                                            style: "currency",
                                            currency: "VND",
                                        }) }}</td>
                                    <td v-if="order.paid == 0 && order.cancel == 0" class="text-danger">Chưa thanh
                                        toán</td>
                                    <td v-if="order.paid == 1 && order.cancel == 0" class="text-success">Đã thanh
                                        toán</td>
                                    <td v-if="order.cancel == 1" class="text-danger">
                                        Đã hủy
                                    </td>
                                    <td v-if="order.confirm == 1">Đã duyệt</td>
                                    <td v-else>Chưa duyệt</td>
                                    <td>{{ order.paymentType }}</td>
                                    <td>
                                        <a class="btn btn-sm" style="background-color: #fbbfc0; color: white" href=""
                                            data-bs-toggle="modal" data-bs-target="#detailOrder"
                                            @click="getOneDetailOrder(order.orderId, index)">
                                            Chi tiết
                                        </a>
                                    </td>
                                </tr>

                            </tbody>
                        </table>

                    </div>
                </div>



            </div>
        </div>
    </div>

    <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel"
        aria-hidden="true">
        <div class="modal-dialog-centered modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCategoryModalLabel">Chỉnh sửa loại sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-start d-flex flex-column">
                    <div class="d-flex w-100 justify-content-between mb-3">
                        <label for="cate-name-edit">Tên loại:</label>
                        <input class="w-75 form-control" type="text" id="cate-name-edit" v-model="choosenCategory.name"
                            required>
                    </div>

                    <label for="cat-description-edit">Mô tả:</label>

                    <textarea class="form-control" name="" id="cat-description-edit"
                        v-model="choosenCategory.description"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary fw-bold" data-bs-dismiss="modal"
                        @click="editCategory()" style="background-color: #fbbfc0; border: 0px">Cập
                        nhật</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editProduct" tabindex="-1" aria-labelledby="editProductLabel" aria-hidden="true">
        <div class="modal-dialog-centered modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editProductLabel">Chỉnh sửa sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-start d-flex flex-column">
                    <div class="w-100 mt-3">
                        <form class=" w-100 justify-content-between mb-5">
                            <div class="">

                                <div class="mb-3 mt-3">
                                    <label class="fw-bold" for="selectCategory">Loại sản phẩm</label>
                                    <select v-model="editProduct.catId" id="selectCategory" class="form-select "
                                        aria-label="Default select example">
                                        <option v-for="cate in categories" :key="cate.catId" :value="cate.catId">
                                            {{ cate.name }}
                                        </option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="fw-bold" for="selectBrand">Nhãn hiệu</label>
                                    <select v-model="editProduct.brandId" id="selectBrand" class="form-select "
                                        aria-label="Default select example">
                                        <option v-for="brand in brands" :key="brand.brandId" :value="brand.brandId">
                                            {{ brand.name }}
                                        </option>
                                    </select>
                                </div>

                                <!-- Name -->
                                <div class="mb-3">
                                    <label for="name" class="fw-bold form-label">Tên (*):</label>
                                    <input v-model="editProduct.name" type="text" class="form-control" id="name"
                                        required>
                                </div>

                                <!-- description -->
                                <div class="mb-3">
                                    <label for="description" class="fw-bold form-label">Mô tả sản phẩm (*):</label>
                                    <div class="d-flex align-items-center">
                                        <textarea v-model="editProduct.description" class="form-control"
                                            id="description" required></textarea>
                                    </div>
                                </div>

                                <div class="d-flex">
                                    <div class="mb-3 w-75">
                                        <label for="guide" class="fw-bold form-label">Hướng dẫn sử dụng (viết theo định
                                            dạng Bước 1.,Bước 2.,Bước 3., ...) (*):</label>
                                        <div class="d-flex align-items-center">
                                            <textarea v-model="editProduct.guide" class="form-control" id="guide"
                                                required>
                                        </textarea>
                                        </div>
                                    </div>

                                    <div class="mb-3 w-25">
                                        <label for="unit" class="fw-bold form-label">Đơn vị bán (*):</label>
                                        <input v-model="editProduct.unit" type="text" id="unit" class="form-control"
                                            required>
                                    </div>
                                </div>


                                <div class="mb-3">
                                    <label for="maintain" class="fw-bold form-label">Bảo quản (*): </label>
                                    <div class="d-flex align-items-center">
                                        <textarea v-model="editProduct.maintain" class="form-control" id="maintain"
                                            required> </textarea>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="note" class="fw-bold form-label">Lưu ý khi sử dụng (*):</label>
                                    <div class="d-flex align-items-center">
                                        <textarea v-model="editProduct.note" class="form-control" id="note" required>
                                    </textarea>
                                    </div>
                                </div>

                                <div class="mb-3 d-flex">
                                    <div class="d-flex flex-column w-50">

                                        <div class="d-flex w-100 mt-1" v-for="(type, index) in editProduct.types"
                                            :key="'type' + index">

                                            <div class="w-50">
                                                <label v-if="index == 0" for="type"
                                                    class="fw-bold form-label">Loại:</label>
                                                <input disabled v-model="editProduct.types[index].name" type="text"
                                                    id="type" class="form-control" required>
                                            </div>

                                            <div class="w-25">
                                                <label v-if="index == 0" for="count" class="fw-bold form-label">Số
                                                    lượng:</label>
                                                <input disabled v-model="editProduct.types[index].quantityInStock"
                                                    type="number" id="count" min="0" class="form-control" required>
                                            </div>

                                            <div class="w-25">
                                                <label v-if="index == 0" for="price" class="fw-bold form-label">Giá
                                                    loại:</label>
                                                <input disabled v-model="editProduct.types[index].unitPrice"
                                                    type="number" id="price" min="0" class="form-control" required>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="d-flex flex-column w-50 ms-3">
                                        <div class="fw-bold mb-2">
                                            Chọn nhãn cho sản phẩm:

                                        </div>
                                        <div class="d-flex flex-wrap" id="tag-wrap">
                                            <div class="me-2 mb-2" v-for="tag in tags" :key="tag.tagId">
                                                <input type="checkbox" class="btn-check" :id="'tagEdit' + tag.tagId"
                                                    v-model="editProduct.tagIds" autocomplete="off" :value="tag.tagId">
                                                <label class="btn btn-outline-dark" :for="'tagEdit' + tag.tagId"
                                                    style="border-radius: 0px;">{{ tag.name
                                                    }}</label>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="d-flex flex-column mb-3">
                                    <div class="fw-bold mb-2">
                                        Chọn thành phần cho sản phẩm:

                                    </div>
                                    <div class="d-flex flex-wrap" id="component-wrap">
                                        <div class="me-2 mb-2" v-for="component in components"
                                            :key="component.componentId">
                                            <input type="checkbox" class="btn-check"
                                                :id="'componentEdit' + component.componentId"
                                                v-model="editProduct.componentIds" autocomplete="off"
                                                :value="component.componentId">
                                            <label class="btn btn-outline-dark"
                                                :for="'componentEdit' + component.componentId"
                                                style="border-radius: 0px;">{{ component.name
                                                }}</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="formFileMultiple" class="form-label fw-bold">Ảnh sản phẩm (1 hoặc
                                        nhiều)</label>
                                    <input class="form-control" type="file" @change="uploadImageProducts($event)"
                                        id="formFileMultiple" multiple>
                                </div>

                                <button type="submit" class="btn btn-success p-3" style="border-radius: 0px;"
                                    @click="onEditProduct($event)">Cập nhật sản phẩm</button>

                            </div>
                            <!-- Profile Picture -->
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary fw-bold" data-bs-dismiss="modal"
                        style="background-color: #fbbfc0; border: 0px">Cập
                        nhật</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class=" w-100 justify-content-between p-2">
                        <div class="">

                            <div class="mb-3 mt-3">
                                <label class="fw-bold" for="selectCategory">Loại sản phẩm</label>
                                <select v-model="newProduct.catId" id="selectCategory" class="form-select "
                                    aria-label="Default select example">
                                    <option v-for="cate in categories" :key="cate.catId" :value="cate.catId">
                                        {{ cate.name }}
                                    </option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="fw-bold" for="selectBrand">Thương hiệu</label>
                                <select v-model="newProduct.brandId" id="selectBrand" class="form-select "
                                    aria-label="Default select example">
                                    <option v-for="brand in brands" :key="brand.brandId" :value="brand.brandId">
                                        {{ brand.name }}
                                    </option>
                                </select>
                            </div>

                            <!-- Name -->
                            <div class="mb-3">
                                <label for="name" class="fw-bold form-label">Tên:</label>
                                <input v-model="newProduct.name" type="text" class="form-control" id="name" required>
                            </div>

                            <!-- description -->
                            <div class="mb-3">
                                <label for="description" class="fw-bold form-label">Mô tả sản phẩm:</label>
                                <div class="d-flex align-items-center">
                                    <textarea v-model="newProduct.description" class="form-control" id="description"
                                        required></textarea>
                                </div>
                            </div>

                            <div class="d-flex">
                                <div class="mb-3 w-75">
                                    <label for="guide" class="fw-bold form-label">Hướng dẫn sử dụng (viết theo định
                                        dạng 1., 2., 3., ...):</label>
                                    <div class="d-flex align-items-center">
                                        <textarea v-model="newProduct.guide" class="form-control" id="guide" required>
                                    </textarea>
                                    </div>
                                </div>

                                <div class="mb-3 w-25">
                                    <label for="unit" class="fw-bold form-label">Đơn vị bán:</label>
                                    <input v-model="newProduct.unit" type="text" id="unit" class="form-control"
                                        required>
                                </div>
                            </div>


                            <div class="mb-3">
                                <label for="maintain" class="fw-bold form-label">Bảo quản: </label>
                                <div class="d-flex align-items-center">
                                    <textarea v-model="newProduct.maintain" class="form-control" id="maintain" required>
                                </textarea>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="note" class="fw-bold form-label">Lưu ý khi sử dụng:</label>
                                <div class="d-flex align-items-center">
                                    <textarea v-model="newProduct.note" class="form-control" id="note"
                                        required> </textarea>
                                </div>
                            </div>

                            <div class="mb-3 d-flex">
                                <div class="d-flex flex-column w-50">

                                    <div class="d-flex w-100 mt-1" v-for="(type, index) in newProduct.types"
                                        :key="'type' + index">

                                        <div class="w-50">
                                            <label v-if="index == 0" for="type" class="fw-bold form-label">Loại (Ví
                                                dụ 50ml,
                                                100ml):</label>
                                            <input v-model="newProduct.types[index].name" type="text" id="type"
                                                class="form-control" required>
                                        </div>

                                        <div class="w-25">
                                            <label v-if="index == 0" for="count" class="fw-bold form-label">Số
                                                lượng:</label>
                                            <input v-model="newProduct.types[index].quantityInStock" type="number"
                                                id="count" min="0" class="form-control" required>
                                        </div>

                                        <div class="w-25">
                                            <label v-if="index == 0" for="price" class="fw-bold form-label">Giá
                                                loại:</label>
                                            <input v-model="newProduct.types[index].unitPrice" type="number" id="price"
                                                min="0" class="form-control" required>
                                        </div>

                                        <button v-if="index > 0" type="button" class="btn btn-dark"
                                            style="border-radius: 0" @click="removeInput(index)">
                                            <i class="fa-solid fa-x"></i>
                                        </button>
                                    </div>

                                    <button type="button" id="addInputBtn" class="w-100 btn-dark btn mt-2"
                                        style="border-radius: 0px;" @click="addMoreInput"><i
                                            class="fa-solid fa-plus"></i></button>
                                </div>

                                <div class="d-flex flex-column w-50 ms-3">
                                    <div class="fw-bold mb-2">
                                        Chọn nhãn cho sản phẩm:

                                    </div>
                                    <div class="d-flex flex-wrap" id="tag-wrap">
                                        <div class="me-2 mb-2" v-for="tag in tags" :key="tag.tagId">
                                            <input type="checkbox" class="btn-check" :id="'tag' + tag.tagId"
                                                v-model="newProduct.tagIds" autocomplete="off" :value="tag.tagId">
                                            <label class="btn btn-outline-dark" :for="'tag' + tag.tagId"
                                                style="border-radius: 0px;">{{ tag.name
                                                }}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex flex-column mb-3">
                                <div class="fw-bold mb-2">
                                    Chọn thành phần cho sản phẩm:

                                </div>
                                <div class="d-flex flex-wrap" id="component-wrap">
                                    <div class="me-2 mb-2" v-for="component in components" :key="component.componentId">
                                        <input type="checkbox" class="btn-check"
                                            :id="'componentEdit' + component.componentId"
                                            v-model="newProduct.componentIds" autocomplete="off"
                                            :value="component.componentId">
                                        <label class="btn btn-outline-dark"
                                            :for="'componentEdit' + component.componentId"
                                            style="border-radius: 0px;">{{ component.name
                                            }}</label>
                                    </div>
                                </div>
                            </div>


                            <div class="mb-3">
                                <label for="formFileMultiple" class="form-label fw-bold">Ảnh sản phẩm (1 hoặc
                                    nhiều)</label>
                                <input class="form-control" type="file" @change="uploadImageProducts($event)"
                                    id="formFileMultiple" multiple>
                            </div>

                            <button type="submit" class="btn btn-danger p-3" style="border-radius: 0px;"
                                @click="addProduct($event)">Tạo sản phẩm</button>

                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-danger">Thêm</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import categoryServices from '@/services/category.services';
import tagServices from '@/services/tag.services';
import { calculateTimeElapse } from '@/utilities/utilities';
import { Chart, Grid, Line } from 'vue3-charts'

import { ref, onMounted, computed } from 'vue';
import Swal from 'sweetalert2';
import reviewServices from '@/services/review.services';
import brandServices from '@/services/brand.services';
import productServices from '@/services/product.sevices';
import orderServices from '@/services/order.services';
import componentServices from '@/services/component.services';
import { checkLogin } from "@/utilities/utilities";
import { useRouter } from 'vue-router';
import accountServices from '@/services/account.services';
import imageServices from '@/services/image.services';
import typeServices from '@/services/type.services';
const router = useRouter();

const users = ref([{
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
    role: ""
}]);

const plByMonth = ref([
    { name: 'Jan', pl: 0, avg: 0, inc: 0 },
    { name: 'Feb', pl: 0, avg: 0, inc: 0 },
    { name: 'Apr', pl: 0, avg: 0, inc: 0 },
    { name: 'Mar', pl: 0, avg: 0, inc: 0 },
    { name: 'May', pl: 0, avg: 0, inc: 0 },
    { name: 'Jun', pl: 0, avg: 0, inc: 0 },
    { name: 'Jul', pl: 0, avg: 0, inc: 0 },
    { name: 'Aug', pl: 0, avg: 0, inc: 0 },
    { name: 'Sep', pl: 0, avg: 0, inc: 0 },
    { name: 'Oct', pl: 0, avg: 0, inc: 0 },
    { name: 'Nov', pl: 0, avg: 0, inc: 0 },
    { name: 'Dec', pl: 0, avg: 0, inc: 0 }
])
const plByMoney = ref([
    { name: 'Jan', pl: 0, avg: 0, inc: 0 },
    { name: 'Feb', pl: 0, avg: 0, inc: 0 },
    { name: 'Apr', pl: 0, avg: 0, inc: 0 },
    { name: 'Mar', pl: 0, avg: 0, inc: 0 },
    { name: 'May', pl: 0, avg: 0, inc: 0 },
    { name: 'Jun', pl: 0, avg: 0, inc: 0 },
    { name: 'Jul', pl: 0, avg: 0, inc: 0 },
    { name: 'Aug', pl: 0, avg: 0, inc: 0 },
    { name: 'Sep', pl: 0, avg: 0, inc: 0 },
    { name: 'Oct', pl: 0, avg: 0, inc: 0 },
    { name: 'Nov', pl: 0, avg: 0, inc: 0 },
    { name: 'Dec', pl: 0, avg: 0, inc: 0 }
])
let orderDetail = ref({
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
    confirm: 0,
    paymentType: "",
    note: "",
    cancel: 0
})

const editProduct = ref({
    catId: 0,
    brandId: 0,
    name: '',
    description: '',
    unit: '',
    maintain: '',
    guide: '',
    note: '',
    types: [{
        typeId: 0,
        name: "",
        unitPrice: 0,
        quantityInStock: 0
    }],
    images: [] as string[],
    tagIds: [] as number[],
    componentIds: [] as number[]
})
const orders = ref([{
    orderId: 0,
    created_at: "",
    updated_at: "",
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shippingAddress: "",
    shipped: 0,
    shippedDate: "",
    shipmentTracking: "",
    paid: 0,
    accountName: "",
    confirm: 0,
    cancel: 0,
    paymentType: "",
    note: ""
}])
const unconfirmOrders = ref([{
    orderId: 0,
    created_at: "",
    updated_at: "",
    accountId: 0,
    totalPrice: 0,
    shippingPrice: 0,
    shippingAddress: "",
    shipped: 0,
    shippedDate: "",
    shipmentTracking: "",
    paid: 0,
    accountName: "",
    confirm: 0,
    cancel: 0,
    paymentType: "",
    note: ""
}])
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
    avatar: '',
    productName: ''
}])

const tags = ref([{
    tagId: 0,
    name: '',
    created_at: '',
    updated_at: ''
}])

const startDate = ref("2024-11-06")
const endDate = ref("2024-11-06")

const categoriesMap = ref(new Map<number, string>());
const categories = ref([{
    catId: 0,
    name: '',
    description: '',
    created_at: '',
    updated_at: ''
}])

const newTagName = ref('')
const newCategory = ref({
    name: '',
    description: ''
})

const newProduct = ref({
    catId: 0,
    brandId: 0,
    name: '',
    description: '',
    unit: '',
    maintain: '',
    guide: '',
    note: '',
    types: [{
        name: "",
        unitPrice: 0,
        quantityInStock: 0
    }],
    images: [] as string[],
    tagIds: [] as number[],
    componentIds: [] as number[]

})

const choosenCategory = ref({
    catId: 0,
    name: '',
    description: '',
    created_at: '',
    updated_at: ''
})

const brands = ref([
    {
        brandId: 0,
        name: '',
        created_at: '',
        updated_at: ''
    }
])

const tagVisibles = ref(5);
const steps = ref(5)

function VisibleTags() {
    return tags.value.slice(0, tagVisibles.value)
}
const filteredOrders = computed(() => {
    return orders.value.filter(
        (order: any) => {
            if (startDate.value != endDate.value) {
                return order.created_at >= startDate.value && order.created_at <= endDate.value
            } else {
                const nextDay = new Date(startDate.value);
                nextDay.setDate(nextDay.getDate() + 1); // Add one day to startDate
                return order.created_at >= startDate.value && order.created_at < nextDay.toISOString();
            }
        }
    );
});

const totalRevenue = computed(() => {
    return filteredOrders.value.reduce((sum, order: any) => {
        return sum + (order.paid === 1 ? order.totalPrice : 0);
    }, 0);
});

async function onEditProduct(e: any) {
    e.preventDefault();
    try {
        if ((editProduct.value.images == null || editProduct.value.images.length == 0) &&
            (choosenProduct.value.base64s != null && choosenProduct.value.base64s.length > 0)) {
            editProduct.value.images = choosenProduct.value.base64s.split('|')
        }
        console.log(editProduct.value.images)
        if (editProduct.value.guide == undefined || editProduct.value.guide == "" || editProduct.value.note == undefined || editProduct.value.note == "" || editProduct.value.maintain == undefined || editProduct.value.maintain == "" || editProduct.value.description == undefined || editProduct.value.description == "" || editProduct.value.name == undefined || editProduct.value.name == "") {
            throw "Vui lòng nhập đầy đủ thông tin quan trọng!"
        }

        for (let i = 0; i < editProduct.value.types.length; i++) {
            if (editProduct.value.types[i].name == null || editProduct.value.types[i].name == '' || editProduct.value.types[i].unitPrice == 0 || editProduct.value.types[i].quantityInStock == 0) {
                throw "Vui lòng nhập đầy đủ thông tin về loại!"
            }
        }

        for (let i = 0; i < editProduct.value.types.length; i++) {
            await typeServices.update(editProduct.value.types[i].typeId, {
                name: editProduct.value.types[i].name,
                unitPrice: editProduct.value.types[i].unitPrice,
                quantityInStock: editProduct.value.types[i].quantityInStock
            })
        }

        await productServices.update(choosenProduct.value.proId, editProduct.value)

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật sản phẩm thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });


    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật sản phẩm thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}
const choosenOrder = ref(0)

async function updateShipmentTracking(orderId: number) {
    try {

        await orderServices.updateShipment(orderId, {
            shipmentTracking: "Đang vận chuyển"
        })

        orders.value.forEach(e => {
            if (e.orderId == orderId)
                e.shipmentTracking = "Đang vận chuyển"
        });
        orderDetail.value.shipmentTracking = "Đang vận chuyển"
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function confirmOrder(e: any, orderDetail: any) {
    e.preventDefault();
    try {
        await orderServices.update(orderDetail.orderId)

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật đơn hàng thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
        orderDetail.confirm = 1
        orderDetail.shipmentTracking = "Đang chờ giao hàng"

        unconfirmOrders.value.forEach((o) => {
            if (o.orderId == orderDetail.orderId) {
                o.confirm = 1
            }
        })
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật đơn hàng thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function updatePaid() {
    try {

        await orderServices.updatePaid(orderDetail.value.orderId, {
            paid: orderDetail.value.paid
        })

        unconfirmOrders.value.forEach(e => {
            if (e.orderId == orderDetail.value.orderId)
                e.paid = orderDetail.value.paid
        });
        orders.value.forEach(e => {
            if (e.orderId == orderDetail.value.orderId)
                e.paid = orderDetail.value.paid
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function addCategory() {
    try {
        if (newCategory.value.name == '' || newCategory.value.description == '') throw "Vui lòng nhập đầy đủ thông tin!"

        let resp = await categoryServices.create(newCategory.value);

        if (resp == undefined) throw "Loại đã tồn tại."

        Swal.fire({
            title: "Thành công!",
            text: "Thêm loại thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}


async function editCategory() {
    try {
        if (choosenCategory.value.name == '' || choosenCategory.value.description == '') throw "Vui lòng nhập tên loại!"

        await categoryServices.update(choosenCategory.value.catId, choosenCategory.value.name, choosenCategory.value.description);

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật loại thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

const choosenTag = ref({
    tagId: 0,
    name: '',
    created_at: '',
    updated_at: ''
})


async function deleteBrand() {
    try {

        await brandServices.delete(choosenBrand.value.brandId);

        Swal.fire({
            title: "Thành công!",
            text: "Xóa thương hiệu thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa thương hiệu thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function deleteComp() {
    try {

        await componentServices.delete(choosenComp.value.componentId);

        Swal.fire({
            title: "Thành công!",
            text: "Xóa thành phần thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa thành phần thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function deleteProduct() {
    try {

        await productServices.delete(choosenProductId.value);

        Swal.fire({
            title: "Thành công!",
            text: "Xóa sản phẩm thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa sản phẩm thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function deleteTag() {
    try {

        await tagServices.delete(choosenTag.value.tagId);

        Swal.fire({
            title: "Thành công!",
            text: "Xóa nhãn thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa nhãn thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function addTag() {
    try {
        if (newTagName.value == '') throw "Vui lòng nhập tên nhãn!"

        let resp = await tagServices.create(newTagName.value);

        if (resp == undefined) throw "Nhãn đã tồn tại."

        Swal.fire({
            title: "Thành công!",
            text: "Thêm nhãn thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm nhãn thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function editTag() {
    try {
        if (choosenTag.value.name == '') throw "Vui lòng nhập tên nhãn!"

        await tagServices.update(choosenTag.value.tagId, choosenTag.value.name);

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật nhãn thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật nhãn thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

const components = ref([{
    componentId: 0,
    name: "",
    description: "",
    created_at: "",
    updated_at: ""
}])
const compVisibles = ref(5);
const choosenComp = ref({
    componentId: 0,
    name: "",
    description: "",
    created_at: "",
    updated_at: ""
})
const newCompName = ref("")
const newCompNameDescription = ref("")
const newBrandName = ref("")
function VisibleComponents() {
    return components.value.slice(0, compVisibles.value)
}

const brandVisibles = ref(5);
const choosenBrand = ref({
    brandId: 0,
    name: '',
    created_at: '',
    updated_at: ''
})
function VisibleBrands() {
    return brands.value.slice(0, brandVisibles.value)
}

const maxReview = ref(0)
const fiveStar = ref(0)
const fourStar = ref(0)
const threeStar = ref(0)
const twoStar = ref(0)
const oneStar = ref(0)

function calculateReview() {
    reviews.value.forEach(r => {
        if (r.star == 5) fiveStar.value += 1;
        if (r.star == 4) fourStar.value += 1;
        if (r.star == 3) threeStar.value += 1;
        if (r.star == 2) twoStar.value += 1;
        if (r.star == 1) oneStar.value += 1;

    })
    maxReview.value = Math.max(fiveStar.value, fourStar.value, threeStar.value, twoStar.value, oneStar.value)
}

async function addBrand() {
    try {
        if (newBrandName.value == '') throw "Vui lòng nhập tên thương hiệu!"

        let resp = await brandServices.create({
            name: newBrandName.value,
        });

        if (resp == undefined) throw "Thương hiệu đã tồn tại."

        Swal.fire({
            title: "Thành công!",
            text: "Thêm thương hiệu thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm thương hiệu thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function editBrand() {
    try {
        if (choosenBrand.value.name == '') throw "Vui lòng nhập tên thương hiệu!"

        await brandServices.update(choosenBrand.value.brandId, { name: choosenBrand.value.name });

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật thương hiệu thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật thương hiệu thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}


async function addComp() {
    try {
        if (newCompName.value == '') throw "Vui lòng nhập tên thành phần!"
        if (newCompNameDescription.value == '') throw "Vui lòng nhập mô tả thành phần!"

        let resp = await componentServices.create({
            name: newCompName.value,
            description: newCompNameDescription.value
        });

        if (resp == undefined) throw "Thành phần đã tồn tại."

        Swal.fire({
            title: "Thành công!",
            text: "Thêm thành phần thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm thành phần thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

async function editComp() {
    try {
        if (choosenComp.value.name == '') throw "Vui lòng nhập tên thành phần!"
        if (choosenComp.value.description == '') throw "Vui lòng nhập mô tả thành phần!"

        await componentServices.update(choosenComp.value.componentId, {
            componentId: choosenComp.value.componentId,
            name: choosenComp.value.name,
            description: choosenComp.value.description
        });

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật thành phần thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật thành phần thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

const toBase64 = (file: any) =>
    new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = reject;
    });

async function uploadImageProducts(event: any) {
    newProduct.value.images = []
    try {
        for (let i = 0; i < event.target.files.length; i++) {

            let code = await toBase64(event.target.files[i]);
            newProduct.value.images.push(String(code))
        }
    } catch (err) {
        console.log(err);
    }
}


async function addProduct(e: any) {
    e.preventDefault();
    try {

        console.log(newProduct.value)

        await productServices.create(newProduct.value)

        Swal.fire({
            title: "Thành công!",
            text: "Thêm sản phẩm thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });


    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm sản phẩm thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
            timer: 1500
        });
    }
}

function addMoreInput() {
    newProduct.value.types.push({
        name: '',
        quantityInStock: 0,
        unitPrice: 0,
    });
}

// Function to remove input by index
function removeInput(index: number) {
    newProduct.value.types.splice(index, 1);
}

const countTotalSaleToday = ref(0)
const countTotalPriceToday = ref(0)
const countTotalPrice = ref(0)

function countToday() {

    const currentDate = new Date().toISOString().split('T')[0];

    for (let i = 0; i < orders.value.length; i++) {
        if (orders.value[i].created_at.slice(0, 10) == currentDate) {
            countTotalSaleToday.value += 1;
            if (orders.value[i].paid == 1)
                countTotalPriceToday.value += orders.value[i].totalPrice
        }
        if (orders.value[i].paid == 1)
            countTotalPrice.value += orders.value[i].totalPrice
    }
}

const choosenUser = ref({
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

async function getOneDetailOrder(orderId: number, index: number) {
    try {

        let respOrderDetail = await orderServices.getDetailByOrderId(orderId)
        let data = respOrderDetail.data.order[0];

        let respChoosenUser = await accountServices.getOne(data.accountId)
        choosenUser.value = respChoosenUser.data.accounts[0]

        orderDetail.value = {
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
            confirm: data.confirm,
            paymentType: data.paymentType,
            note: data.note,
            cancel: data.cancel
        };

        choosenOrder.value = index
    } catch (error) {
        console.log(error)
    }
}
const doneCalculate = ref(false)

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

const choosenProductId = ref(0)
const choosenProduct = ref({
    proId: 0,
    catId: 0,
    brandId: 0,
    name: '',
    description: '',
    unit: '',
    maintain: '',
    guide: '',
    note: '',
    typeIds: "",
    imageIds: "",
    base64s: "",
    tagIds: "",
    unitPrices: "",
    typeNames: "",
    quantitiesInStock: "",
    componentIds: ""
})

async function getChoosenProduct() {
    let respCurrentProduct = await productServices.getOneDetail(choosenProductId.value)
    choosenProduct.value = respCurrentProduct.data.products[0]

    editProduct.value = {
        catId: choosenProduct.value.catId,
        brandId: choosenProduct.value.brandId,
        name: choosenProduct.value.name,
        description: choosenProduct.value.description,
        unit: choosenProduct.value.unit,
        maintain: choosenProduct.value.maintain,
        guide: choosenProduct.value.guide,
        note: choosenProduct.value.note,
        types: choosenProduct.value.typeIds ? choosenProduct.value.typeIds.split(',').map((id, index) => ({
            typeId: Number(id),
            name: choosenProduct.value.typeNames.split(',')[index] || '',
            unitPrice: parseFloat(choosenProduct.value.unitPrices.split(',')[index] || '0'),
            quantityInStock: parseInt(choosenProduct.value.quantitiesInStock.split(',')[index] || '0')
        })) : [],
        images: choosenProduct.value.base64s ? choosenProduct.value.base64s.split('|') : [],
        tagIds: choosenProduct.value.tagIds ? choosenProduct.value.tagIds.split(',').map(Number) : [], // Convert to an array of numbers
        componentIds: choosenProduct.value.componentIds ? choosenProduct.value.componentIds.split(',').map(Number) : []
    };
}

onMounted(async () => {
    try {
        if (!checkLogin()) {
            Swal.fire({
                title: "Chưa đăng nhập!",
                text: "Vui lòng đăng nhập để xem thông tin",
                icon: "error",
                confirmButtonText: "OK",
                timer: 1500
            });

            router.push({ name: "home" });
        }
        // get all orders
        let respOrders = await orderServices.getAllConfirmed();
        orders.value = respOrders.data.order

        // get top sale
        let respTopSales = await productServices.getTopSale();
        topSaleProducts.value = respTopSales.data.products

        countToday()
        for (let i = 0; i < orders.value.length; i++) {
            plByMonth.value[Number(orders.value[i].created_at.slice(5, 7)) - 1].pl += 1

            if (orders.value[i].paid == 1)
                plByMoney.value[Number(orders.value[i].created_at.slice(5, 7)) - 1].pl += orders.value[i].totalPrice
        }
        doneCalculate.value = true
        // get all unconfirmed order
        let respUnConfirmOrders = await orderServices.getAllUnConfirmed();
        unconfirmOrders.value = respUnConfirmOrders.data.order

        // get all reviews
        let respReviews = await reviewServices.getAll()
        reviews.value = respReviews.data.review;

        calculateReview()

        // get all tags
        let respTag = await tagServices.getAll()
        tags.value = respTag.data.tag

        // get all categories
        let respCat = await categoryServices.getAll()
        categories.value = respCat.data.category

        categories.value.forEach(c => {
            categoriesMap.value.set(c.catId, c.name)
        });

        // get all brands
        let resp = await brandServices.getAll();
        brands.value = resp.data.brand

        // get all components
        let respComp = await componentServices.getAll();
        components.value = respComp.data.component

        // get all users
        let respUser = await accountServices.getAll();
        users.value = respUser.data.accounts

        // get all products
        let respProducts = await productServices.getAll();
        products.value = respProducts.data.products

        for (let i = 0; i < products.value.length; i++) {
            let respBrand = await brandServices.getOne(products.value[i].brandId)
            products.value[i].brandName = respBrand.data.brand[0].name

            let respImage = await imageServices.getAllByBelongIdLimit1(products.value[i].proId)
            products.value[i].image = respImage.data.image[0].base64
        }

    } catch (error) {
        console.log(error)
    }
})

</script>
<style>
.nav-item {
    margin-left: 25px;
}

.list-group-item.active {
    border: 0px;
    background-color: #fbbfc0;
}

#tag-wrap {
    max-height: 219px;
    overflow: scroll;
    overflow-x: hidden;
}


.linkp {
    color: black;
    text-decoration: none;
}

.linkp:hover {
    text-decoration: underline;
}

@media only screen and (max-width: 700px) {
    #whole-section {
        flex-direction: column;
    }
}

.fa-star {
    color: #F4BB47;
}
</style>