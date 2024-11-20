<template>
    <div class="mb-5" style="height: 150px; background-color: #fbbfc0;">
    </div>
    <div class=" bg-white d-flex p-0 mb-5" style="width: 100vw;">

        <div class="container d-flex justify-content-center">
            <div class="w-100 mt-3">
                <div class="w-100 text-center">
                    <h2>Chỉnh sửa sản phẩm</h2>
                </div>
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
                            <input v-model="editProduct.name" type="text" class="form-control" id="name" required>
                        </div>

                        <!-- description -->
                        <div class="mb-3">
                            <label for="description" class="fw-bold form-label">Mô tả sản phẩm (*):</label>
                            <div class="d-flex align-items-center">
                                <textarea v-model="editProduct.description" class="form-control" id="description"
                                    required></textarea>
                            </div>
                        </div>

                        <div class="d-flex">
                            <div class="mb-3 w-75">
                                <label for="guide" class="fw-bold form-label">Hướng dẫn sử dụng (viết theo định
                                    dạng Bước 1.,Bước 2.,Bước 3., ...) (*):</label>
                                <div class="d-flex align-items-center">
                                    <textarea v-model="editProduct.guide" class="form-control" id="guide"
                                        required> </textarea>
                                </div>
                            </div>

                            <div class="mb-3 w-25">
                                <label for="unit" class="fw-bold form-label" >Đơn vị bán (*):</label>
                                <input v-model="editProduct.unit" type="text" id="unit" class="form-control" required>
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
                                <textarea v-model="editProduct.note" class="form-control" id="note"
                                    required> </textarea>
                            </div>
                        </div>

                        <div class="mb-3 d-flex">
                            <div class="d-flex flex-column w-50">

                                <div class="d-flex w-100 mt-1" v-for="(type, index) in editProduct.types"
                                    :key="'type' + index">

                                    <div class="w-50">
                                        <label v-if="index == 0" for="type" class="fw-bold form-label">Loại:</label>
                                        <input disabled v-model="editProduct.types[index].name" type="text" id="type"
                                            class="form-control" required>
                                    </div>

                                    <div class="w-25">
                                        <label v-if="index == 0" for="count" class="fw-bold form-label">Số
                                            lượng:</label>
                                        <input disabled v-model="editProduct.types[index].quantityInStock" type="number"
                                            id="count" min="0" class="form-control" required>
                                    </div>

                                    <div class="w-25">
                                        <label v-if="index == 0" for="price" class="fw-bold form-label">Giá
                                            loại:</label>
                                        <input disabled v-model="editProduct.types[index].unitPrice" type="number"
                                            id="price" min="0" class="form-control" required>
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
                                <div class="me-2 mb-2" v-for="component in components" :key="component.componentId">
                                    <input type="checkbox" class="btn-check" :id="'componentEdit' + component.componentId"
                                    v-model="editProduct.componentIds"  autocomplete="off" :value="component.componentId">
                                    <label class="btn btn-outline-dark" :for="'componentEdit' + component.componentId"
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
    </div>
</template>

<script setup lang="ts">
import categoryServices from '@/services/category.services';
import tagServices from '@/services/tag.services';
import { useRoute, useRouter } from 'vue-router'

import { ref, onMounted } from 'vue';
import Swal from 'sweetalert2';
import brandServices from '@/services/brand.services';
import productServices from '@/services/product.sevices';
import componentServices from '@/services/component.services';
import { checkLogin } from '@/utilities/utilities';
const router = useRouter();


const route = useRoute();

const id = ref(0)


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

const currentProduct = ref({
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
        name: "",
        unitPrice: 0,
        quantityInStock: 0
    }],
    images: [] as string[],
    tagIds: [] as number[],
    componentIds: [] as number[]
})

const brands = ref([
    {
        brandId: 0,
        name: '',
        created_at: '',
        updated_at: ''
    }
])

const components = ref([{
    componentId: 0,
    name: "",
    description: "",
    created_at: "",
    updated_at: ""
}])

const toBase64 = (file: any) =>
    new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = reject;
    });

async function uploadImageProducts(event: any) {
    editProduct.value.images = []
    try {
        for (let i = 0; i < event.target.files.length; i++) {

            let code = await toBase64(event.target.files[i]);
            editProduct.value.images.push(String(code))
        }
    } catch (err) {
        console.log(err);
    }
}


async function onEditProduct(e: any) {
    e.preventDefault();
    try {
        if ((editProduct.value.images == null || editProduct.value.images.length == 0) &&
            (currentProduct.value.base64s != null && currentProduct.value.base64s.length > 0)) {
            editProduct.value.images = currentProduct.value.base64s.split(',')
        }
        if (editProduct.value.guide == undefined || editProduct.value.guide == "" || editProduct.value.note == undefined || editProduct.value.note == "" || editProduct.value.maintain == undefined || editProduct.value.maintain == "" || editProduct.value.description == undefined || editProduct.value.description == "" || editProduct.value.name == undefined || editProduct.value.name == "") {
            throw "Vui lòng nhập đầy đủ thông tin quan trọng!"
        }
        await productServices.update(currentProduct.value.proId, editProduct.value)

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

        id.value = Number(route.params.id);
        let respCurrentProduct = await productServices.getOneDetail(id.value)
        currentProduct.value = respCurrentProduct.data.products[0]

        editProduct.value = {
            catId: currentProduct.value.catId,
            brandId: currentProduct.value.brandId,
            name: currentProduct.value.name,
            description: currentProduct.value.description,
            unit: currentProduct.value.unit,
            maintain: currentProduct.value.maintain,
            guide: currentProduct.value.guide,
            note: currentProduct.value.note,
            types: currentProduct.value.typeIds ? currentProduct.value.typeIds.split(',').map((id, index) => ({
                name: currentProduct.value.typeNames.split(',')[index] || '',
                unitPrice: parseFloat(currentProduct.value.unitPrices.split(',')[index] || '0'),
                quantityInStock: parseInt(currentProduct.value.quantitiesInStock.split(',')[index] || '0')
            })) : [],
            images: currentProduct.value.imageIds ? [currentProduct.value.imageIds] : [],
            tagIds: currentProduct.value.tagIds ? currentProduct.value.tagIds.split(',').map(Number) : [], // Convert to an array of numbers
            componentIds: currentProduct.value.componentIds ? currentProduct.value.componentIds.split(',').map(Number): []
        };

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
</style>