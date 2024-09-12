<template>
    <div style="width: 100vw;">
        <div class="d-flex justify-content-center m-auto align-items-center"
            style="height: 500px; background-color: #EEEEEE;">
            <div>
                Color Riche
                <h1>
                    Son lì Matte Son Mịn lì Cao cấp 129 I Lead
                </h1>
            </div>
        </div>
        <div class="container align-items-center d-flex flex-column  justify-content-center mt-3 mb-3"
            style="max-width: 50%;">
            <div class="w-50">
                <CustomSelect :options="['go', 'python', 'rust', 'javascript']" :default="'go'" class="select" />
            </div>
            <hr class="w-100">
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
        </div>

    </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
// @ts-ignore
import CustomSelect from "../components/CustomSelect.vue";
</script>

<style>
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
.collapse{
    margin: 15px 5px 15px 5px;
}
</style>