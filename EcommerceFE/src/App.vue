<template>
  <header>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </header>
  <div id="app">
    <HeaderComponent v-if="!$route.meta.hideNavbar"></HeaderComponent>
    <RouterView />
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
#app {
  display: flex;
  flex-direction:  column;
  overflow-x: hidden;
  max-width: 100vw;
  min-height: 100vh;
  margin: 0;
  padding: 0;
}
</style>