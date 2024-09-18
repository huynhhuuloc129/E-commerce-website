<template>
    <div style="width: 100vw;">

        <div style="height: 200px; background-color: #fbbfc0;">
        </div>

        <div class="container mt-5">
            <h2>Hồ Sơ Của Tôi</h2>
            <p>Quản lý thông tin hồ sơ để bảo mật tài khoản</p>

            <form class="d-flex w-100 justify-content-between mb-5" @submit.prevent="">
                <div class="w-50">

                    <!-- Username -->
                    <div class="mb-3">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="username" readonly />
                    </div>

                    <!-- Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên</label>
                        <input type="text" class="form-control" id="name" />
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <div class="d-flex align-items-center">
                            <input type="email" class="form-control" id="email" readonly />
                        </div>
                    </div>

                    <!-- Phone -->
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <div class="d-flex align-items-center">
                            <input type="tel" class="form-control" id="phone" readonly />
                        </div>
                    </div>

                    <!-- Gender -->
                    <div class="mb-3">
                        <label class="form-label">Giới tính</label>
                        <div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="male" value="Nam" />
                                <label class="form-check-label" for="male">Nam</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="female" value="Nữ" />
                                <label class="form-check-label" for="female">Nữ</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="other" value="Khác" />
                                <label class="form-check-label" for="other">Khác</label>
                            </div>
                        </div>
                    </div>

                    <!-- Date of Birth -->
                    <div class="mb-3">
                        <label for="dob" class="form-label">Ngày sinh</label>
                        <div class="row g-2">
                            <div class="col">
                                <select class="form-select" aria-label="Day">
                                    <option></option>
                                </select>
                            </div>
                            <div class="col">
                                <select class="form-select" aria-label="Month">
                                    <option></option>
                                </select>
                            </div>
                            <div class="col">
                                <select class="form-select" aria-label="Year">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-danger">Lưu</button>

                </div>
                <!-- Profile Picture -->
                <div class="mb-3 d-flex flex-column text-center">
                    <div class="d-flex flex-column">

                        <label for="profileImage" class="form-label">Ảnh đại diện</label>
                        <div class="d-flex align-items-center flex-column mt-3">
                            <img class="rounded-circle me-3 mb-5" style="width: 60px; height: 60px;" alt="Profile Image" />
                            <input type="file" class="form-control" id="profileImage" />
                        </div>
                    </div>
                    <small class="form-text text-muted">
                        Dung lượng file tối đa 1 MB, Định dạng: JPEG, PNG
                    </small>
                </div>


                <!-- Save Button -->

            </form>
        </div>

    </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';

import accountServices from '@/services/account.services';

const account = ref({
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

</script>

<style scoped></style>