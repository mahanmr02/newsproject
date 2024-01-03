<?php

        require_once(BASE_PATH . '/template/admin/layouts/header.php');


?>
    <section class="pt-3 pb-1 mb-2 border-bottom ">
        <h1 class="h5 ">Show Comment</h1>
    </section>
<section class="row my-3 ">
    <section class="col-12 ">
        <h1 class="h4 border-bottom ">Selected Comment</h1>
        <p class="text-secondary border-bottom ">Comment ID: <?= $comments['id']?></p>
        <p class="text-secondary border-bottom ">Made by: <?= $comments['username']?></p>
        <p class="text-secondary border-bottom ">Related post: <?= $comments['title']?></p>
        <p class="text-secondary border-bottom ">Comment: <?= $comments['comment']?></p>
        <p class="text-secondary border-bottom ">Status: <?= $comments['status']?></p>
        <?php if($comments['status'] == 'seen'){?>
                    <a role="button" class="btn btn-sm btn-success text-white" href="<?= url('admin/comment/change-status/'. $comments['id'])?>">click to approved</a>
                    <?php }else{?>
                    <a role="button" class="btn btn-sm btn-warning text-white" href="<?= url('admin/comment/change-status/'. $comments['id'])?>">click not to approved</a>
                    <?php }?>
                    <a class="btn btn-sm btn-warning btn-dark text-white" href="<?=url('admin/comment/'); ?>">Back to Comments</a>
           
                </section>
                </section>


                </main>
        </div>
    </div>

                <?php

        require_once(BASE_PATH . '/template/admin/layouts/footer.php');


?>