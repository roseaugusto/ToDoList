import Vue from 'vue';
import axios from 'axios';
import VueRouter from 'vue-router';
import Popper from 'popper.js';
import Jquery from 'jquery';
import Bootstrap from 'bootstrap';


try {
    window.$ = window.jquery = Jquery;

    window.Bootstrap = Bootstrap;
} catch (e) {}

window.Vue = Vue;
window.axios = axios;
window.Popper = Popper;
window.VueRouter = VueRouter;
Vue.use(VueRouter);

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
} else {
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}