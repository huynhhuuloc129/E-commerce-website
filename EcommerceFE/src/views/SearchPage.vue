<template>
    <div style="width: 100vw;">

        <div style="height: 400px; background-color: #fbbfc0;">
        </div>
        <div class="search-container-main">
            <input type="text" placeholder="Search..." id="search-input-main">
            <button id="search-button-main">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
                    viewBox="0 0 16 16">
                    <path
                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.415l-3.85-3.85a1.007 1.007 0 0 0-.115-.098zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                </svg>
            </button>
        </div>

        <div class="container mb-5 mt-5">

            <h1>
                Không có kết quả
                <span style="color: brown;" class="fw-bold">
                    ASDFASDFSAF
                </span>
            </h1>
        </div>
    </div>
</template>

<script setup lang="ts"></script>
import { onMounted, ref } from 'vue';

<style>
.search-container-main {
    position: relative;
    bottom: 30px;
    display: flex;
    align-items: center;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
    padding: 10px;
    max-width: 600px;
    margin: 0 auto;
}

#search-input-main {
    border: none;
    outline: none;
    width: 100%;
    padding: 10px;
    font-size: 16px;
}

#search-button-main {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0 10px;
}

#search-button-main svg {
    fill: #000;
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
    #search-button{
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
</style>