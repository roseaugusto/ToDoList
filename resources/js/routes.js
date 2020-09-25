import VueRouter from 'vue-router';

//views
import projectsView from './views/projects/ProjectList';
import tasksView from './views/tasks/TaskList';
import usersView from './views/users/UserList';
import myAccountView from './views/users/myAccount';

//components
import addProjectComponent from './components/CreateProjectComponent';


let routes = [
  
    {
        path: '/projects',
        component: projectsView
    },
    {
        path: '/projects/create',
        component: addProjectComponent
    },
    {
        path: '/projects/:id/task',
        component: tasksView
    },
    {
        path: '/users',
        component: usersView
    },
    {
        path: '/myaccount',
        component: myAccountView
    }
];

export default new VueRouter({
    mode: 'history',
    routes
});