<template>
    <div class="mb-5" style="height: 150px; background-color: #fbbfc0;">
    </div>
    <div class=" bg-white d-flex p-0 mb-5" style="width: 100vw;">
        <nav id="sidebarMenu" style="z-index: 0" class="bg-white sticky-top">
            <div class="position-sticky">
                <PrintPage ref="frame" />
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
                        data-bs-toggle="tab" data-bs-target="#favorite" aria-controls="favorite">
                        <i class="fa-solid fa-users fa-fw me-3"></i>
                        <span>Danh sách yêu thích</span>
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
                                        <h6 class="mb-0">$1234</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-bar fa-3x" style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Tổng lượt bán</p>
                                        <h6 class="mb-0">$1234</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-area fa-3x" style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Doanh thu hôm nay</p>
                                        <h6 class="mb-0">$1234</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-xl-3">
                                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                    <i class="fa fa-chart-pie fa-3x" style="color: #fbbfc0"></i>
                                    <div class="ms-3">
                                        <p class="mb-2">Tổng doanh thu</p>
                                        <h6 class="mb-0">$1234</h6>
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
                                    <canvas id="worldwide-sales"></canvas>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xl-6">
                                <div class="bg-light text-center rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Thống kê doanh thu</h6>
                                    </div>
                                    <canvas id="salse-revenue"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Sales Chart End -->


                    <!-- Recent Sales Start -->
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
                                            <th style="width: 10%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Recent Sales End -->

                    <!-- Widgets Start -->
                    <div class="container-fluid pt-4">
                        <div class="row g-4">
                            <div class="col-sm-12 col-md-6 col-xl-4">
                                <div class="h-100 bg-light rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <h6 class="mb-0">Đánh giá</h6>
                                        <a href="">Show All</a>
                                    </div>
                                    <div v-for="review in reviews" :key="review.reviewId"
                                        class="d-flex align-items-center border-bottom py-3">
                                        <img class="rounded-circle flex-shrink-0" alt=""
                                            style="width: 40px; height: 40px;">
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
                            <div class="col-sm-12 col-md-6 col-xl-4">
                                <div class="h-100 bg-light rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">Calender</h6>
                                        <a href="">Show All</a>
                                    </div>
                                    <div id="calender"></div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-xl-4">
                                <div class="h-100 bg-light rounded p-4">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <h6 class="mb-0">To Do List</h6>
                                        <a href="">Show All</a>
                                    </div>
                                    <div class="d-flex mb-2">
                                        <input class="form-control bg-transparent" type="text" placeholder="Enter task">
                                        <button type="button" class="btn btn-primary ms-2">Add</button>
                                    </div>
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <input class="form-check-input m-0" type="checkbox">
                                        <div class="w-100 ms-3">
                                            <div class="d-flex w-100 align-items-center justify-content-between">
                                                <span>Short task goes here...</span>
                                                <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <input class="form-check-input m-0" type="checkbox">
                                        <div class="w-100 ms-3">
                                            <div class="d-flex w-100 align-items-center justify-content-between">
                                                <span>Short task goes here...</span>
                                                <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <input class="form-check-input m-0" type="checkbox" checked>
                                        <div class="w-100 ms-3">
                                            <div class="d-flex w-100 align-items-center justify-content-between">
                                                <span><del>Short task goes here...</del></span>
                                                <button class="btn btn-sm text-primary"><i
                                                        class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center border-bottom py-2">
                                        <input class="form-check-input m-0" type="checkbox">
                                        <div class="w-100 ms-3">
                                            <div class="d-flex w-100 align-items-center justify-content-between">
                                                <span>Short task goes here...</span>
                                                <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center pt-2">
                                        <input class="form-check-input m-0" type="checkbox">
                                        <div class="w-100 ms-3">
                                            <div class="d-flex w-100 align-items-center justify-content-between">
                                                <span>Short task goes here...</span>
                                                <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Widgets End -->

                    <div class="container-fluid pt-4">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Các sản phẩm gần đây</h6>
                            </div>
                            <button class="btn btn-dark fw-bold w-100">+</button>

                            <div class="table-responsive">
                                <table class="table text-start align-middle table-bordered table-hover mb-0">
                                    <thead>
                                        <tr class="text-dark">
                                            <th scope="col">Ngày</th>
                                            <th scope="col">Mã hóa đơn</th>
                                            <th scope="col">Khách hàng</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Trạng thái</th>
                                            <th style="width: 10%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm" style="background-color: #fbbfc0; color: white"
                                                    href="">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>01 Jan 2045</td>
                                            <td>INV-0123</td>
                                            <td>Jhon Doe</td>
                                            <td>$123</td>
                                            <td>Paid</td>
                                            <td><a class="btn btn-sm btn-primary"
                                                    style="background-color: #fbbfc0; color: white" href="">Chi tiết</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid pt-4">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Danh sách thể loại</h6>
                            </div>
                            <button class="btn btn-dark fw-bold w-100" data-bs-toggle="modal"
                                data-bs-target="#addCategoryModal">+</button>

                            <!-- Modal -->
                            <div class=" modal fade" id="addCategoryModal" tabindex="-1"
                                aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog-centered modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addCategoryModalLabel">Thêm thể loại</h5>
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
                                            <th style="width: 15%;" scope="col">Ngày tạo</th>
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
                                        @click="editCategory()">Cập nhật</button>
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
                                data-bs-target="#addTagModal">+</button>

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
                                    <tbody>
                                        <tr v-for="tag in tags" :key="tag.tagId">
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
                                    <label class="fw-bold" for="selectBrand">Nhãn hàng</label>
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
                                                required> </textarea>
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
                                            required> </textarea>
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

                                        <div class="d-flex w-100">

                                            <div class="w-50">
                                                <label for="type" class="fw-bold form-label">Loại (Ví dụ 50ml,
                                                    100ml):</label>
                                                <input v-model="newProduct.types[0].name" type="text" id="type"
                                                    class="form-control" required>
                                            </div>

                                            <div class="w-25">
                                                <label for="count" class="fw-bold form-label">Số lượng:</label>
                                                <input v-model="newProduct.types[0].quantityInStock" type="number"
                                                    id="count" min="0" class="form-control" required>
                                            </div>

                                            <div class="w-25">
                                                <label for="price" class="fw-bold form-label">Giá loại:</label>
                                                <input v-model="newProduct.types[0].unitPrice" type="number" id="price"
                                                    min="0" class="form-control" required>
                                            </div>
                                        </div>

                                        <button class="w-100 btn-dark btn mt-2" style="border-radius: 0px;">+</button>
                                    </div>

                                    <div class="d-flex flex-column w-50 ms-3">
                                        <div class="fw-bold mb-2">
                                            Chọn nhãn cho sản phẩm:

                                        </div>
                                        <div class="d-flex flex-wrap" id="tag-wrap">
                                            <div class="me-2 mb-2" v-for="tag in tags" :key="tag.tagId">
                                                <input type="checkbox" class="btn-check" :id="'tag' + tag.tagId"
                                                    autocomplete="off">
                                                <label class="btn btn-outline-dark" :for="'tag' + tag.tagId"
                                                    style="border-radius: 0px;">{{ tag.name
                                                    }}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                <div class="mb-3">
                                    <label for="formFileMultiple" class="form-label fw-bold">Ảnh sản phẩm (1 hoặc
                                        nhiều)</label>
                                    <input class="form-control" type="file" @change="uploadImageProducts($event)"
                                        id="formFileMultiple" multiple>
                                </div>

                                <button type="submit" class="btn btn-danger p-3" style="border-radius: 0px;" @click="addProduct">Tạo sản phẩm</button>

                            </div>
                            <!-- Profile Picture -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Content Start -->
</template>

<script setup lang="ts">
import categoryServices from '@/services/category.services';
import tagServices from '@/services/tag.services';

import { checkLogin, calculateTimeElapse } from '@/utilities/utilities';
import { ref, onMounted } from 'vue';
import Swal from 'sweetalert2';
import reviewServices from '@/services/review.services';
import brandServices from '@/services/brand.services';
import imageServices from '@/services/image.services';

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
        name: '',
        unitPrice: 0,
        quantityInStock: 0
    }],
    images: [] as string[],
    tags: [{ tagId: 0 }]
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

async function deleteCategory() {
    try {

        await categoryServices.delete(choosenCategory.value.catId);

        Swal.fire({
            title: "Thành công!",
            text: "Xóa loại thành công!",
            icon: "success",
            confirmButtonText: "OK",
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
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
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
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
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
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
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Xóa nhãn thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
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
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm nhãn thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
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
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật nhãn thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
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

const base64s = ref([] as string[])

async function uploadImageProducts(event: any) {
    base64s.value = []
    try {
        for (let i = 0; i < event.target.files.length; i++) {

            let code = await toBase64(event.target.files[i]);
            base64s.value.push(String(code))
        }
    } catch (err) {
        console.log(err);
    }
}


async function addProduct() {
    try {
        if (newCategory.value.name == '' || newCategory.value.description == '') throw "Vui lòng nhập đầy đủ thông tin!"

        let resp = await categoryServices.create(newCategory.value);

        if (resp == undefined) throw "Loại đã tồn tại."

        Swal.fire({
            title: "Thành công!",
            text: "Thêm loại thành công!",
            icon: "success",
            confirmButtonText: "OK",
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Thêm loại thất bại! Error: " + error,
            icon: "error",
            confirmButtonText: "OK",
        });
    }
}

onMounted(async () => {
    try {
        // get all reviews
        let respReviews = await reviewServices.getAll()
        reviews.value = respReviews.data.review;

        console.log(reviews.value)

        // get all tags
        let respTag = await tagServices.getAll()
        tags.value = respTag.data.tag

        // get all categories
        let respCat = await categoryServices.getAll()
        categories.value = respCat.data.category

        // get all brands
        let resp = await brandServices.getAll();
        brands.value = resp.data.brand
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
</style>