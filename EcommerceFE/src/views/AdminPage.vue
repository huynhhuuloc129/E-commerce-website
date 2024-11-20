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
                        <i class="fa-solid fa-newspaper fa-fw me-3"></i>
                        <span>Tạo sản phẩm mới</span>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="false"
                        data-bs-toggle="tab" data-bs-target="#order" aria-controls="order">
                        <i class="fa-solid fa-newspaper fa-fw me-3"></i>
                        <span>Đơn hàng trong hệ thống</span>
                    </a>
                </div>
            </div>
        </nav>

        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active mt-4" id="metric" role="tabpanel" aria-labelledby="metric-tab"
                style="width: 80vw">
                <div class="content w-100 me-5">
                    <!-- Navbar Start -->


                    <!-- Sale & Revenue Start -->
                    <div class="container-fluid ">
                        <div class="row g-4">
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-line fa-3x " style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Lượt bán hôm nay</p>
                                        <h6 class="mb-0">{{ countTotalSaleToday }}</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-bar fa-3x" style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Tổng lượt bán</p>
                                        <h6 class="mb-0">{{ orders.length }}</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-area fa-3x" style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Doanh thu hôm nay</p>
                                        <h6 class="mb-0">{{ countTotalPriceToday.toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-pie fa-3x" style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Tổng doanh thu</p>
                                        <h6 class="mb-0">{{ countTotalPrice.toLocaleString("it-IT", {
                                                style: "currency",
                                                currency: "VND",
                                            }) }}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sale & Revenue End -->


                    <!-- Sales Chart Start -->
                    <div class="container-fluid pt-4">
                        <div class="row g-4">
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
                    </div>

                    <!-- Widgets Start -->
                    <div class="container-fluid pt-4 d-flex w-100">
                        <div class="w-50 me-2">
                            <div class="">
                                <div class="h-100 bg-light rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <h6 class="mb-0">Đánh giá</h6>
                                    </div>
                                    <div v-for="review in reviews" :key="review.reviewId"
                                        class="d-flex align-items-center border-bottom py-3">
                                        <img v-if="review.avatar != '' && review.avatar != null"
                                            class="rounded-circle flex-shrink-0" alt="" :src="review.avatar"
                                            style="width: 40px; height: 40px;">
                                        <img v-else src="https://placehold.co/40x40"
                                            class="rounded-circle flex-shrink-0" alt="">
                                        <div class="ms-3" style="width: 90%;">
                                            <div class="d-flex w-100 justify-content-between">
                                                <h6 class="mb-0 w-75">{{ review.name }} đã đánh giá
                                                    <a :href="'http://localhost:5173/products/' + review.productId">{{
                                                        review.productName }}</a>
                                                </h6>
                                                <small>{{ calculateTimeElapse(review.created_at) }}</small>
                                            </div>
                                            <span style="display: block;" class="text-truncate">{{ review.content
                                                }}</span>
                                        </div>
                                    </div>

                                </div>
                            </div>



                        </div>
                        <div class="w-50">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Danh sách thể loại</h6>
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
                                                <th scope="col">Ngày tạo</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Mô tả</th>
                                                <th style="width: 15%;" scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="cat in categories" :key="cat.catId">
                                                <td>{{ cat.created_at.slice(0, 10) }}</td>
                                                <td>{{ cat.name }}</td>
                                                <td>{{ cat.description }}</td>
                                                <td class="d-flex justify-content-around"><button class="btn btn-sm"
                                                        style="background-color: #fbbfc0; color: white"
                                                        @click="choosenCategory = cat" data-bs-toggle="modal"
                                                        data-bs-target="#editCategoryModal">Chỉnh sửa</button>

                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                        data-bs-target="#deleteCategory" @click="choosenCategory = cat">
                                                        Xóa
                                                    </button>


                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                    <!-- Widgets End -->



                    <!-- edit Modal -->
                    <div class="modal fade" id="editCategoryModal" tabindex="-1"
                        aria-labelledby="editCategoryModalLabel" aria-hidden="true">
                        <div class="modal-dialog-centered modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editCategoryModalLabel">Chỉnh sửa loại sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-start d-flex flex-column">
                                    <div class="d-flex w-100 justify-content-between mb-3">
                                        <label for="tag-name-edit">Tên loại:</label>
                                        <input class="w-75 form-control" type="text" id="tag-name-edit"
                                            v-model="choosenCategory.name" required>
                                    </div>

                                    <label for="cat-description-edit">Mô tả:</label>

                                    <textarea class="form-control" name="" id="cat-description-edit"
                                        v-model="choosenCategory.description"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                        @click="editCategory()">Cập
                                        nhật</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="deleteCategory" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="deleteCategoryLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteCategoryLabel">Modal title
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có chắc chắn muốn xóa loại sản phẩm này?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                        @click="deleteCategory()">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid pt-4">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Danh sách các nhãn dán</h6>
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
                                        <tr class="text-dark">
                                            <th class="fw-bold" style="width: 15%;" scope="col">Ngày tạo</th>
                                            <th class="fw-bold" scope="col">Tên</th>
                                            <th style="width: 15%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="w-100">
                                        <tr v-for="tag in VisibleTags()" :key="tag.tagId">
                                            <td>{{ tag.created_at.slice(0, 10) }}</td>
                                            <td class="text-capitalize">{{ tag.name }}</td>
                                            <td class="d-flex justify-content-around">
                                                <button class="btn btn-sm"
                                                    style="background-color: #fbbfc0; color: white"
                                                    data-bs-toggle="modal" data-bs-target="#editTagModal"
                                                    @click="choosenTag = tag">
                                                    Chỉnh sửa
                                                </button>

                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                    data-bs-target="#deleteTag" @click="choosenTag = tag">
                                                    Xóa
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

                    <!-- edit Modal -->
                    <div class="modal fade" id="editTagModal" tabindex="-1" aria-labelledby="editTagModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog-centered modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editTagModalLabel">Chỉnh sửa nhãn</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body text-start d-flex">
                                    <div class="d-flex w-100 justify-content-between mb-3">
                                        <label for="tag-name-edit">Tên nhãn:</label>
                                        <input class="w-75 form-control" type="text" id="tag-name-edit"
                                            v-model="choosenTag.name" required>
                                    </div>


                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                        @click="editTag()">Cập
                                        nhật</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="deleteTag" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="deleteTagLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteTagLabel">Modal title
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn có chắc chắn muốn xóa loại sản phẩm này?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                        @click="deleteTag()">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid pt-4">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Danh sách các thành phần</h6>
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

                            <div class="modal fade" id="editCompModal" tabindex="-1"
                                aria-labelledby="editCompModalLabel" aria-hidden="true">
                                <div class="modal-dialog-centered modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editCompModalLabel">Chỉnh sửa thành phần</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body text-start d-flex">
                                            <div class="d-flex w-100 justify-content-between mb-3">
                                                <label for="tag-name-edit">Tên thành phần:</label>
                                                <input class="w-75 form-control" type="text" id="tag-name-edit"
                                                    v-model="choosenTag.name" required>
                                            </div>


                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                                @click="editComp()">Cập
                                                nhật</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-dark">
                                            <th class="fw-bold" scope="col">Ngày tạo</th>
                                            <th class="fw-bold" scope="col">Tên</th>
                                            <th class="fw-bold" scope="col">Mô tả</th>
                                            <th style="width: 15%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody class="w-100">
                                        <tr v-for="component in VisibleComponents()" :key="component.componentId">
                                            <td>{{ component.created_at.slice(0, 10) }}</td>
                                            <td class="text-capitalize">{{ component.name }}</td>
                                            <td class="">{{ component.description }}</td>

                                            <td class="d-flex justify-content-around">
                                                <button class="btn btn-sm"
                                                    style="background-color: #fbbfc0; color: white"
                                                    data-bs-toggle="modal" data-bs-target="#editCompModal"
                                                    @click="choosenComp = component">
                                                    Chỉnh sửa
                                                </button>

                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                    data-bs-target="#deleteComp" @click="choosenComp = component">
                                                    Xóa
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
                    </div>
                </div>
            </div>


            <div class="bg-light rounded tab-pane fade show mt-4" id="product" role="tabpanel"
                aria-labelledby="product-tab" style="width: 80vw">
                <div class="container d-flex justify-content-center">
                    <div class="w-100 mt-3">
                        <h2>Tạo sản phẩm mới</h2>

                        <form class=" w-100 justify-content-between mb-5">
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
                                    <label class="fw-bold" for="selectBrand">Nhãn hiệu</label>
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
                                    <input v-model="newProduct.name" type="text" class="form-control" id="name"
                                        required>
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
                                            <textarea v-model="newProduct.guide" class="form-control" id="guide"
                                                required>
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
                                        <textarea v-model="newProduct.maintain" class="form-control" id="maintain"
                                            required>
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
                                                <input v-model="newProduct.types[index].unitPrice" type="number"
                                                    id="price" min="0" class="form-control" required>
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
                                        <div class="me-2 mb-2" v-for="component in components"
                                            :key="component.componentId">
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
                </div>
            </div>

            <div class="bg-light rounded tab-pane fade show mt-4" id="order" role="tabpanel" aria-labelledby="order-tab"
                style="width: 80vw">
                <div class="container-fluid pt-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Lượt bán gần đây</h6>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Mã hóa đơn</th>
                                        <th scope="col">Khách hàng</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Tình trạng</th>
                                        <th style="width: 10%;" scope="col"></th>
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
                                        <td v-if="order.paid == 0" class="text-danger">Chưa thanh toán</td>
                                        <td v-else class="text-success">Đã thanh toán</td>
                                        <td v-if="order.confirm == 1">Đã duyệt</td>
                                        <td v-else>Chưa duyệt</td>

                                        <td>
                                            <a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                href="" data-bs-toggle="modal" data-bs-target="#detailOrder"
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
                                <div id="orderDetailModal" class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="detailOrderLabel">Chi tiết đơn hàng</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
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
                                                                        class="img-fluid rounded-3"
                                                                        style="width: 120px;" alt="Book">
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
                                                                        type="number"
                                                                        class="form-control form-control-sm"
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
                                            <div class="mb-5 mb-lg-0">
                                                <div class=" p-4 d-flex justify-content-end">

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
                                                                <p class="mb-0">{{ (orderDetail.totalPrice +
                                                                    orderDetail.shippingPrice).toLocaleString("it-IT", {
                                                                        style: "currency",
                                                                        currency: "VND",
                                                                    }) }}</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between"
                                                                style="font-weight: 500;">
                                                                <p class="mb-0">Địa chỉ giao hàng:</p>
                                                                <p class="mb-0">
                                                                    {{ orderDetail.shippingAddress }}
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

                                                            <div v-if="orderDetail.paid == 0"
                                                                class="text-danger fw-bold">
                                                                Chưa thanh toán
                                                            </div>
                                                            <div v-else class="text-success fw-bold"> Đã thanh toán
                                                            </div>

                                                            <button v-if="orderDetail.confirm == 0"
                                                                class="btn btn-primary mt-3"
                                                                @click="confirmOrder($event, orderDetail)">Duyệt
                                                                đơn</button>
                                                            <button v-if="orderDetail.confirm == 0"
                                                                class="btn btn-danger ms-2 mt-3"
                                                                @click="deleteOrder($event, orderDetail)">Xóa
                                                                đơn</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Các hóa đơn chưa duyệt</h6>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Mã hóa đơn</th>
                                        <th scope="col">Khách hàng</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Tình trạng</th>
                                        <th style="width: 10%;" scope="col"></th>
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
                                        <td v-if="order.paid == 0" class="text-danger">Chưa thanh toán</td>
                                        <td v-else class="text-success">Đã thanh toán</td>
                                        <td v-if="order.confirm == 1">Đã duyệt</td>
                                        <td v-else>Chưa duyệt</td>
                                        <td>
                                            <a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                href="" data-bs-toggle="modal" data-bs-target="#detailOrder"
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
                                <div id="orderDetailModal" class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="detailOrderLabel">Chi tiết đơn hàng</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
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
                                                                        class="img-fluid rounded-3"
                                                                        style="width: 120px;" alt="Book">
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
                                                            <td class="align-middle">
                                                                <div class="d-flex flex-row">
                                                                    <input disabled id="form1" min="0" name="quantity"
                                                                        :value="orderDetail.quantitySelected[index]"
                                                                        type="number"
                                                                        class="form-control form-control-sm"
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
                                            <div class="mb-5 mb-lg-0">
                                                <div class=" p-4 d-flex justify-content-end">

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
                                                                <p class="mb-0">{{ (orderDetail.totalPrice +
                                                                    orderDetail.shippingPrice).toLocaleString("it-IT", {
                                                                        style: "currency",
                                                                        currency: "VND",
                                                                    }) }}</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between"
                                                                style="font-weight: 500;">
                                                                <p class="mb-0">Địa chỉ giao hàng:</p>
                                                                <p class="mb-0">
                                                                    {{ orderDetail.shippingAddress }}
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

                                                            <div v-if="orderDetail.paid == 0"
                                                                class="text-danger fw-bold">
                                                                Chưa thanh toán
                                                            </div>
                                                            <div v-else class="text-success fw-bold"> Đã thanh toán
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

import { ref, onMounted } from 'vue';
import Swal from 'sweetalert2';
import reviewServices from '@/services/review.services';
import brandServices from '@/services/brand.services';
import productServices from '@/services/product.sevices';
import orderServices from '@/services/order.services';
import componentServices from '@/services/component.services';
import { checkLogin } from "@/utilities/utilities";
import { useRouter } from 'vue-router';

const router = useRouter();

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
    confirm: 0
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
    cancel: 0
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
    confirm: 0
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

const choosenOrder = ref(0)
async function deleteOrder(e: any, orderDetail: any) {
    e.preventDefault();
    try {
        await orderServices.delete(orderDetail.orderId)

        Swal.fire({
            title: "Thành công!",
            text: "Xóa đơn hàng thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
        });
        unconfirmOrders.value.splice(choosenOrder.value, 1)
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa đơn hàng thất bại! Error: " + error,
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

async function deleteCategory() {
    try {

        await categoryServices.delete(choosenCategory.value.catId);

        Swal.fire({
            title: "Thành công!",
            text: "Xóa loại thành công!",
            icon: "success",
            confirmButtonText: "OK",
            timer: 1500
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

function VisibleComponents() {
    return components.value.slice(0, compVisibles.value)
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
        if (choosenTag.value.name == '') throw "Vui lòng nhập tên thành phần!"

        await tagServices.update(choosenComp.value.componentId, choosenComp.value.name);

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

async function getOneDetailOrder(orderId: number, index: number) {
    try {
        let respOrderDetail = await orderServices.getDetailByOrderId(orderId)
        let data = respOrderDetail.data.order[0];

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
            confirm: data.confirm
        };

        choosenOrder.value = index
    } catch (error) {
        console.log(error)
    }
}
const doneCalculate = ref(false)
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

        // get all tags
        let respTag = await tagServices.getAll()
        tags.value = respTag.data.tag

        // get all categories
        let respCat = await categoryServices.getAll()
        categories.value = respCat.data.category

        // get all brands
        let resp = await brandServices.getAll();
        brands.value = resp.data.brand

        // get all components
        let respComp = await componentServices.getAll();
        components.value = respComp.data.component
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

#orderDetailModal {
    max-width: 1000px;
    /* Change this value as needed */
}

.linkp {
    color: black;
    text-decoration: none;
}

.linkp:hover {
    text-decoration: underline;
}
@media only screen and (max-width: 700px) {
    #whole-section{
        flex-direction: column;
    }
}
</style>