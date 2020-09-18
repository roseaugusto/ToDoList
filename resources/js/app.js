
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

const { default: VueRouter } = require('vue-router');

require('./bootstrap');

window.Vue = require('vue');
// window.VueRouter = require('vue-router').default;

// Vue.use(VueRouter)

// const router = new VueRouter({mode:'history', routes: routes});


Vue.component('example-component', require('./components/ExampleComponent.vue'));
Vue.component('project-component', require('./components/ProjectListComponent.vue'));
Vue.component('create-project-component', require('./components/CreateProjectComponent.vue'));
Vue.component('pagination', require('laravel-vue-pagination'));
const app = new Vue({
    el: '#app'
});
