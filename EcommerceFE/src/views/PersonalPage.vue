<template>
    <div class="mb-5" style="height: 150px; background-color: #fbbfc0;">
    </div>

    <div style="width: 100vw;" class="mb-5">



        <div class="d-flex" style="margin: 0; background-color: white;">
            <nav id="sidebarMenu" style="z-index: 0" class="bg-white sticky-top">
                <div class="position-sticky">
                    <PrintPage ref="frame" />
                    <div ref="fragment" class="list-group list-group-flush mx-3 mt-4">
                        <a href="#" class="list-group-item list-group-item-action py-2 ripple active"
                            aria-current="true" data-bs-toggle="tab" data-bs-target="#personal">
                            <i class="fas fa-chart-line fa-fw me-3"></i>
                            <span>Thông tin cá nhân</span>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action py-2 ripple" aria-current="false"
                            data-bs-toggle="tab" data-bs-target="#history" aria-controls="history">
                            <i class="fa-solid fa-newspaper fa-fw me-3"></i>
                            <span>Đơn hàng của tôi</span>
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
                
                <div class="bg-light rounded tab-pane fade show active mt-4" id="personal" role="tabpanel" aria-labelledby="personal-tab"
                    style="width: 80vw">
                    <div class="container d-flex justify-content-center">
                        <div class="w-100 mt-3">
                            <h2>Hồ Sơ Của Tôi</h2>
                            <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>

                            <form @submit="updateUser" class="d-flex w-100 justify-content-between mb-5">
                                <div class="w-50">

                                    <!-- Username -->
                                    <div class="mb-3">
                                        <label for="username" class="form-label">Tên đăng nhập: {{ currentUser.username
                                            }}</label>
                                    </div>

                                    <!-- Name -->
                                    <div class="mb-3">
                                        <label for="name" class="fw-bold form-label">Tên:</label>
                                        <input type="text" class="form-control" id="name" v-model="currentUser.name"
                                            required>
                                    </div>

                                    <!-- Email -->
                                    <div class="mb-3">
                                        <label for="email" class="fw-bold form-label">Email:</label>
                                        <div class="d-flex align-items-center">
                                            <input type="email" class="form-control" id="email" 
                                                v-model="currentUser.email" required />
                                        </div>
                                    </div>

                                    <!-- Phone -->


                                    <!-- Gender -->
                                    <!-- <div class="mb-3">
                                    <label class="form-label">Giới tính</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                            id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault"
                                            id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Nữ
                                        </label>
                                    </div>
                                </div> -->
                                    <div class="d-flex">
                                        <div class="mb-3 w-75">
                                            <label for="phone" class="fw-bold form-label">Số điện thoại:</label>
                                            <div class="d-flex align-items-center">
                                                <input type="tel" class="form-control" id="phone"
                                                    v-model="currentUser.phone" required />
                                            </div>
                                        </div>
                                        <!-- Date of Birth -->
                                        <div class="mb-3 w-25">
                                            <label for="dob" class="fw-bold form-label">Ngày sinh:</label>
                                            <input type="date" id="dob" class="form-control" required>
                                        </div>
                                    </div>


                                    <div class="mb-3">
                                        <label for="address" class="fw-bold form-label">Địa chỉ:</label>
                                        <input v-model="currentUser.billingAddress" type="text" id="address"
                                            class="form-control" required>
                                    </div>
                                    <button type="submit" class="btn btn-danger">Lưu</button>

                                </div>
                                <!-- Profile Picture -->
                            </form>
                        </div>
                        <div class="mb-3 d-flex flex-column text-center mt-3 me-5">
                            <div class="d-flex flex-column">

                                <h4>Ảnh đại diện</h4>
                                <div class="d-flex align-items-center flex-column mt-3">
                                    <img v-if="currentUser.avatar != null && currentUser.avatar != ''"
                                        :src="currentUser.avatar" class="rounded-circle me-3 mb-5"
                                        style="width: 150px; height: 150px;" alt="Profile Image" />
                                    <input type="file" @change="uploadAvatar($event)" class="form-control"
                                        id="profileImage" />
                                </div>
                            </div>
                            <small class="form-text text-muted">
                                Dung lượng file tối đa 1 MB, Định dạng: JPEG, PNG
                            </small>
                        </div>


                        <!-- Save Button -->

                    </div>
                </div>
                <div class="tab-pane fade" id="history" role="tabpanel" aria-labelledby="history-tab"
                    style="width: 80vw">
                    <div>
                        <div class="container mt-4 px-2">
                            <h5 class="mb-2 d-flex justify-content-between align-items-center">
                                Thông tin tất cả bài viết đã xuất bản
                            </h5>
                            <hr />
                            <div class="position-relative">
                                <span class="position-absolute search"><i class="fa fa-search"></i></span>
                                <input class="form-control form-control-special w-100"
                                    placeholder="Tìm kiếm bằng tên bài viết" />
                            </div>
                            <div class="table-responsive">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr class="bg-light">
                                            <th scope="col" width="1%">ID</th>
                                            <th scope="col" width="10%">Ngày tạo</th>
                                            <th scope="col" width="15%">Loại</th>
                                            <th scope="col" width="25%">Tên bài viết</th>
                                            <th scope="col" width="17%">Người tạo</th>
                                            <th scope="col" width="9%" class="text-center">Lượt thích</th>
                                            <th scope="col" width="11%" class="text-center">Lượt chia sẻ</th>
                                            <th scope="col" class="text-end" width="10%"><span></span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>

                                        </tr>
                                    </tbody>
                                </table>
                                <div class="text-center">

                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="container mt-5 px-2">
                            <h5 class="mb-2 d-flex justify-content-between align-items-center">
                                Thông tin tất cả bài viết đang chờ phê duyệt
                            </h5>
                            <hr />
                            <div class="position-relative">
                                <span class="position-absolute search"><i class="fa fa-search"></i></span>
                                <input class="form-control form-control-special w-100"
                                    placeholder="Tìm kiếm bằng tên bài viết" />
                            </div>
                            <div class="table-responsive">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr class="bg-light">
                                            <th scope="col" width="1%">ID</th>
                                            <th scope="col" width="10%">Ngày tạo</th>
                                            <th scope="col" width="15%">Loại</th>
                                            <th scope="col" width="40%">Tên bài viết</th>
                                            <th scope="col" width="20%">Người tạo</th>
                                            <th scope="col" class="text-end" width="20%"><span></span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>

                                            <td class="text-end d-flex">

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="text-center">
                                    <button class="btn moreUser" style="border-radius: 50px; border: 2px solid black">
                                        Xem thêm >>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="favorite" role="tabpanel" aria-labelledby="favorite-tab"
                    style="width: 80vw">
                    <div>
                        <div class="container mt-5 px-2">
                            <h5 class="mb-2 d-flex justify-content-between align-items-center">
                                Thông tin tất cả người dùng của hệ thống
                            </h5>
                            <hr />
                            <div class="position-relative">
                                <span class="position-absolute search"><i class="fa fa-search"></i></span>
                                <input class="form-control form-control-special w-100"
                                    placeholder="Tìm kiếm bằng tên người dùng" />
                            </div>
                            <div class="table-responsive">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr class="bg-light">
                                            <th scope="col" width="1%">ID</th>
                                            <th scope="col" width="10%">Ngày tạo</th>
                                            <th scope="col" width="15%">Tài khoản</th>
                                            <th scope="col" width="35%">Tên đầy đủ</th>
                                            <th scope="col" width="15%">Email</th>
                                            <th scope="col" width="13%">Loại tài khoản</th>
                                            <th scope="col" class="text-end" width="20%"><span></span></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>

                                        </tr>
                                    </tbody>
                                </table>

                                <div class="text-center">

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
import Swal from 'sweetalert2';
import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
import { useCookies } from 'vue3-cookies';
import { checkLogin } from "@/utilities/utilities";

import accountServices from '@/services/account.services';

const cookies = useCookies();
const token = cookies.cookies.get("Token");

const router = useRouter();

const currentUser = ref({
    accountId: 0,
    username: '',
    password: '',
    name: '',
    email: '',
    phone: '',
    birthDate: '',
    avatar: '',
    billingAddress: '',
    created_at: '',
    updated_at: ''
})

var updateUser = async (e: any) => {
    e.preventDefault();
    try {
        await accountServices.update(currentUser.value.accountId, {
            accountId: currentUser.value.accountId,
            name: currentUser.value.name,
            email: currentUser.value.email,
            phone: currentUser.value.phone,
            birthDate: currentUser.value.birthDate.slice(0, 10),
            billingAddress: currentUser.value.billingAddress
        })

        Swal.fire({
            title: "Thành công!",
            text: "Cập nhật tài khoản thành công!",
            icon: "success",
            confirmButtonText: "OK",
        });
    } catch (error) {

        Swal.fire({
            title: "Thất bại!",
            text: "Cập nhật tài khoản thất bại! Error: " + error,
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


async function uploadAvatar(event: any) {
    try {
        let code = await toBase64(event.target.files[0]);

        currentUser.value.avatar = String(code);

        let resp = await accountServices.updateAvatar(currentUser.value.accountId, { avatar: currentUser.value.avatar })

        window.location.reload();
    } catch (err) {
        console.log(err);
    }
}

onMounted(async () => {
    try {
        if (!checkLogin()) {
            Swal.fire({
                title: "Chưa đăng nhập!",
                text: "Vui lòng đăng nhập để xem thông tin",
                icon: "error",
                confirmButtonText: "OK",
            });

            router.push({ name: "home" });
        }
        let resp = await accountServices.getMe(token);
        currentUser.value = resp.data.account[0];

    } catch (error) {
        console.log(error);
    }
})

</script>

<style scoped>
.list-group-item.active {
    border: 0px;
    background-color: #fbbfc0;
}
</style>