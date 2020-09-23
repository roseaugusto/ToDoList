import './bootstrap';
import router from './routes';

window.Vue = require('vue');

// Vue.component('example-component', require('./components/ExampleComponent.vue'));
// Vue.component('project-component', require('./components/ProjectListComponent.vue'));
// Vue.component('create-project-component', require('./components/CreateProjectComponent.vue'));
Vue.component('pagination', require('laravel-vue-pagination'));

const app = new Vue({
    el: '#app',
    router
});
