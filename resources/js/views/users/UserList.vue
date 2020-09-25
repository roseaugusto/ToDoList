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
                <div class="card-header">List of Users
                   
                </div>
                <div class="container table-responsive p-3">
                    
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
           
           }
       },
       mounted() {
         
       },
       methods: {
		    
        }
    }
</script>
