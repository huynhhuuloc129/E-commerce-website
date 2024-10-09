<template>
  <header>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </header>
  <div id="app">
    <HeaderComponent v-if="!$route.meta.hideNavbar"></HeaderComponent>
    <RouterView :key="$route.fullPath" />
    <FooterComponent v-if="!$route.meta.hideNavbar"></FooterComponent>
  </div>
  <footer>
  </footer>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
import HeaderComponent from './components/HeaderComponent.vue'
import FooterComponent from './components/FooterComponent.vue';
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&display=swap');

#app {
  display: flex;
  flex-direction: column;
  overflow-x: hidden;
  max-width: 100vw;
  min-height: 100vh;
  margin: 0;
  padding: 0;
}

.archivo-light {
  font-family: "Archivo", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
  font-variation-settings:
    "wdth" 100;
}
.archivo-medium {
  font-family: "Archivo", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
  font-variation-settings:
    "wdth" 500;
}
.archivo-bold {
  font-family: "Archivo", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
  font-variation-settings:
    "wdth" 900;
}
</style>