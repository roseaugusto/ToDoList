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
                    <div class="card-header">Account Details
                         <span class="float-right" title="Edit" v-if="!isEditMode" @click="isEditMode=true"><i class="btn btn-primary fa fa-edit"></i></span>
                         <span class="float-right" title="View" v-if="isEditMode" @click="isEditMode=false"><i class="btn btn-primary fa fa-info-circle"></i></span>
                    </div>
                    <div class="card-body">
                        <form @submit.prevent="validateData()" enctype="multipart/form-data" id="userform">
                            <div class="container profilepic" v-if="!isEditImage">
                                <img class="rounded-circle bg-secondary" :src="`/storage/user_images/${profilepic}`"  alt="pic">
                                <i class="btn fa fa-edit fa-lg " v-if="isEditMode" @click="isEditImage=true">&nbsp;Edit</i>
                            </div>
                            <div class="container">
                                <div class="form-group" v-if="isEditImage">
                                    <label>Profile Picture</label>
                                    <input type="file" :disabled="!isEditMode" name="profile_pic" class="form-control" v-on:change="onFileChange">
                                </div>
                                <div class="form-group">
                                    <label>Name <b v-if="isEditMode" class="text-danger">*</b></label>
                                    <input type="text" :disabled="!isEditMode" name="name" placeholder="Name" class="form-control" v-model="name">
                                    <div class="invalid-feedback">Name is required.</div>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" :disabled="!isEditMode" name="address" placeholder="Address" class="form-control" v-model="address">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" :disabled="!isEditMode" name="email" placeholder="someone@example.com" v-model="email" class="form-control" >
                                    <div class="invalid-feedback"></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col">
                                        <label>Mobile No.</label>
                                        <input type="text" :disabled="!isEditMode" name="mobileno" placeholder="09xxxxx" class="form-control" v-model="mobileno">
                                    </div>
                                    <div class="col">
                                        <label>Birthdate</label>
                                        <input type="date" :disabled="!isEditMode" name="birthday" class="form-control" v-model="birthday">
                                    </div>
                                </div>
                                <button type="submit" v-if="isEditMode" class="btn btn-primary">Submit</button>
                            </div>
                        </form> 
                        <hr>
                        <p>
                            <h5>GeoLocation Information</h5>
                            <ul>
                                <li>IP: {{ip}}</li>
                                <li>Country: {{country}}</li>
                                <li>Currency: {{currency}}</li>
                            </ul>
                        </p>   
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
                name: '',
                address: '',
                email: '',
                mobileno: '',
                birthday: '',
                file: '',
                isEditMode: false,
                isEditImage: false,
                msg: '',
                profilepic:'',
                ip: '',
                country: '',
                currency: '',
            }
        },
        mounted(){
            this.showData();
        },
        methods :{
            showData(){
                axios.get('/showUserData').then(response=>{
                    this.name = response.data.userinfo.name;
                    this.address = response.data.userinfo.address;
                    this.mobileno = response.data.userinfo.mobileno;
                    this.birthday = response.data.userinfo.birthday;
                    this.email = response.data.userinfo.email;
                    this.profilepic = (response.data.userinfo.profilepic==null) ? 'default.jpg': response.data.userinfo.profilepic;
                    this.ip = (response.data.geoinfo.ip_address==null) ? 'N/A': response.data.geoinfo.ip_address;
                    this.country = (response.data.geoinfo.country_name ==null)? 'N/A': response.data.geoinfo.country_name;
                    this.currency  = (response.data.geoinfo.currency==null) ? 'N/A':response.data.geoinfo.currency;
                });
            },
            onFileChange(e){
                this.file = e.target.files[0];
            },
            validateData(){   
                if(this.file){
                    //upload first photo
                    this.uploadImage();
                }
                else{
                    //save changes directly
                    this.updateData('0')
                }
            },
            uploadImage(){
                let formData = new FormData();
                formData.append('file', this.file);

                const config = {
                    headers: { 'content-type': 'multipart/form-data' }
                }

                axios.post('/updateUserImage',
                    formData,
                    config
                ).then(response=>{
                    this.updateData(response.data.filename);
                });

            },
            updateData(filename){  
                axios.post('/updateUser',{
                    name: this.name,
                    address: this.address,
                    mobileno: this.mobileno,
                    birthday: this.birthday,
                    filename: filename
                }).then(response=>{
                    this.msg = response.data.msg;
                    this.isEditMode = false,
                    this.isEditImage = false,
                    this.showData();
                });
            }
        }
    }
</script>
