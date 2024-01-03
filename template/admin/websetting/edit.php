<?php

require_once BASE_PATH . '/template/admin/layouts/header.php';

?>
    <section class="pt-3 pb-1 mb-2 border-bottom">
        <h1 class="h5">Set Web Setting</h1>
    </section>

<section class="row my-3">
    <section class="col-12">

        <form method="post" action="<?= url('admin/websetting/update') ?>" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="<?= $websetting['title'] ?>" autofocus>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control" id="description" name="description" value="<?= $websetting['description'] ?>" autofocus>
        </div>

        <div class="form-group">
            <label for="keywords">Keywords</label>
            <input type="text" class="form-control" id="keywords" name="keywords" value="<?= $websetting['keywords'] ?>" autofocus>
        </div>


        <div class="form-group">
        
            <img style="width: 100px;" src="<?= asset($websetting['logo']) ?>" alt="">
            <hr/>
         
            <label for="logo">Logo</label>
            <input type="file" id="logo" name="logo" class="form-control-file" autofocus>
        </div>

        <div class="form-group">
           
            <img style="width: 100px;" src="<?= asset($websetting['icon']) ?>" alt="">
            <hr/>
         
            <label for="icon">Icon</label>
            <input type="file" id="icon" name="icon" class="form-control-file" autofocus>
        </div>

        <button type="submit" class="btn btn-primary btn-sm">set</button>
        </form>
        </section>
        </section>


        <?php

        require_once BASE_PATH . '/template/admin/layouts/footer.php';

        ?>