<template>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <a href="/project"><i class="btn fa fa-chevron-circle-left fa-2x text-primary pl-0" title="Back"></i></a>
            <br>
            
            <h3>Create New Project</h3>
            <br>
            <form>
                <div class="form-group row">
                    <div class="col">
                        <label>Project Name</label>
                        <input type="text" name="name" v-model="name" class="form-control" placeholder="AeroPhalcon">
                    </div>
                    <div class="col">
                        <label>Budget</label>
                        <input type="text" name="budget" v-model="budget" class="form-control" placeholder="$10000">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col">
                        <label>Description</label>
                        <textarea class="form-control" rows="5" v-model="desc" name="desc"></textarea>
                    </div>
                </div>

                <button type="submit" @click.prevent="saveData" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data(){
        return {
            name : '',
            budget : '',
            desc : '',
            msg: ''
        }
    },
    methods: {
        saveData(){
            axios.post(
                'project',{
                    name: this.name,
                    budget: this.budget,
                    desc: this.desc
                }
            ).then(response => this.msg = response.data.msg);
        },
        clearMsg(){
            this.msg = '';
        }
    }
}
</script>>