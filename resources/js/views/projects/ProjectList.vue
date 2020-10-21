<template>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div v-if="msg">
                <div class="alert alert-success">
                    {{msg}}
                </div>
                <br>
            </div>
            <div class="card card-default">
                <div class="card-header">List of Projects 
                    <span class="float-right">
                        <a href="projects/create" class="btn btn-primary btn-sm">Add New Project</a>
                    </span>
                </div>
                <div class="container table-responsive p-3">
                    <div class="container form-group">
                        <input type="text" class="form-control" v-model="searchQuery" placeholder="search..">
                    </div>
                    <br>
                    <table class="table table-striped">
                        <thead>
                            <tr class="table-primary">
                            <th scope="col">Name</th>
                            <th scope="col">Budget</th>
                            <th scope="col">Description</th>
                            <th scope="col" colspan="2" class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="p in projectQuery" :key="p.id">    
                                <th scope="row">{{p.name}}</th>
                                <td>{{p.budget}}</td>
                                <td>{{p.description.substring(0,20)+"..."}}</td>
                                <td><i data-toggle="modal" data-target="#editModal" @click="editProject(p.id)" title="Edit" class="btn p-0 fa fa-edit fa-lg text-primary text-lg-right"></i></td>
                                <td><i data-toggle="modal" data-target="#confirmModal" title="Delete" class="btn p-0 fa fa-trash fa-lg text-primary" @click="confirmDeletion(p.id)"></i></td>
                            </tr> 
                        </tbody>
                    </table>
                    <pagination :data="projects" @pagination-change-page="getResults"></pagination>
                </div>
            </div>
        </div>
    </div>


    <!-- EDIT MODAL -->
    <div class="modal" tabindex="-1" role="dialog" id="editModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Project</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form>
                <div class="form-group row">
                    <div class="col">
                        <label>Project Name</label>
                        
                        <input type="text" name="name"  v-model="name" class="form-control" placeholder="AeroPhalcon">
                    </div>
                    <div class="col">
                        <label>Budget</label>
                        <input type="text" name="budget" v-model="budget" class="form-control" placeholder="$10000">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col">
                        <label>Description</label>
                        <textarea rows="5" class="form-control" v-model="desc" name="desc"></textarea>
                    </div>
                </div>
            </form>
            </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" @click="updateProject()">Save changes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- CONFIRM MODAL -->
    <div class="modal" tabindex="-1" role="dialog" id="confirmModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Project</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4>Are you sure you want to delete this project?</h4>
                    <h6>{{name}} and all tasks will be deleted too.</h6>
                    <br>
                    <button type="button" class="btn btn-danger" @click="deleteProject()">Submit</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
    export default {
       data(){
           return {
               projects: {},
               name: '',
               budget: '',
               desc: '',
               id: '',
               msg:'',
               searchQuery:''
           }
       },
       mounted() {
            // Fetch initial results
            this.getResults();
       },
       computed:{
            projectQuery(){
                if(this.searchQuery){
                    return this.projects.data.filter((project)=>{
                        return this.searchQuery.toLowerCase().split(' ').every(v => project.name.toLowerCase().includes(v));
                    });
                }
                else{
                    return this.projects.data;
                }
            }
       },
       methods: {
		    // Our method to GET results from a Laravel endpoint
            getResults(page = 1) {
                axios.get('/showAllProjects?page=' + page)
                    .then(response => {
                        this.projects = response.data;
                    });
            },
            editProject(id){
                axios.get('project/'+id).then(response =>{
                    this.name = response.data.name;
                    this.budget = response.data.budget;
                    this.desc = response.data.description;
                    this.id = response.data.id;
                });
            },
            updateProject(){
                axios.patch('project/'+this.id,{
                    name: this.name,
                    budget: this.budget,
                    desc: this.desc
                }).then(response =>{
                    $('#editModal').modal('hide');
                    this.msg = response.data.msg;
                    this.getResults();
                });
            },
            confirmDeletion(id){
                axios.get('project/'+id).then(response=>{
                    this.id = response.data.id;
                    this.name = response.data.name;
                });
            },
            deleteProject(){
                axios.delete('project/'+this.id).then(response =>{
                    $('#confirmModal').modal('hide');
                    this.msg = response.data.msg;
                    this.getResults();
                });
            },
            clearMsg(){
                this.msg = '';
            }
        }
    }
</script>
