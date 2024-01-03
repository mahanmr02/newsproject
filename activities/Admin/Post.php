<?php

namespace Admin;

use database\Database;

class Post extends Admin{ 
        
        public function index()
        {
                $db = new DataBase();
                $posts = $db->select('SELECT posts.*, categories.name AS category_name, users.email AS email FROM posts LEFT JOIN categories ON posts.cat_id = categories.id LEFT JOIN users ON posts.user_id = users.id ORDER BY `id` DESC');
                require_once(BASE_PATH . '/template/admin/posts/index.php');
        }

        public function create()
        {
                $db = new DataBase();
                $categories = $db->select('SELECT * FROM categories ORDER BY `id` DESC');
                require_once(BASE_PATH . '/template/admin/posts/create.php');

        }

        public function store($request)
        {
                date_default_timezone_set('Iran');
                $realTimestampt = substr($request['published_at'], 0, 10);
                $request['published_at'] = date("Y-m-d H:i:s", (int)$realTimestampt);
                $db = new DataBase();
                if($request['cat_id'] != null)
                {
                        $request['image'] = $this->saveImage($request['image'], 'post-image');
                        if($request['image'])
                        {
                                $request = array_merge($request, ['user_id' => 1]);
                                $db->insert('posts', array_keys($request), $request);
                                $this->redirect('admin/post');
                        }
                        else{
                                $this->redirect('admin/post');
                        }
                }
                else{
                        $this->redirect('admin/post');
                }
        }

        public function edit($id)
        {
                $db = new DataBase();
                $post = $db->select('SELECT * FROM posts WHERE id = ?;', [$id])->fetch();
                $categories = $db->select('SELECT * FROM categories ORDER BY `id` DESC');
                require_once(BASE_PATH . '/template/admin/posts/edit.php');
        }

        public function update($request, $id)
        {
                date_default_timezone_set('Iran');
                $realTimestampt = substr($request['published_at'], 0, 10);
                $request['published_at'] = date("Y-m-d H:i:s", (int)$realTimestampt);
                $db = new DataBase();
                if($request['cat_id'] != null)
                {
                        if($request['image']['tmp_name'] != null)
                        {
                                $post = $db->select('SELECT * FROM posts WHERE id = ?;', [$id])->fetch();
                                $this->removeImage($post['image']);
                                $request['image'] = $this->saveImage($request['image'], 'post-image');
                        }
                             
                        else{
                                unset($request['image']);
                        }
                        $request = array_merge($request, ['user_id' => 1]);
                        $db->update('posts', $id , array_keys($request), $request);
                        $this->redirect('admin/post');
                }
                else{
                        $this->redirect('admin/post');
                }
              

        }

        public function delete($id)
        {
                
                $db = new DataBase();
                $post = $db->select('SELECT * FROM posts WHERE id = ?;', [$id])->fetch();
                $this->removeImage($post['image']);
                $db->delete('posts', $id);
                $this->redirectBack();
        } 
        
        public function selected($id)
        {
                
                $db = new DataBase();
                $post = $db->select('SELECT * FROM posts WHERE id = ?;', [$id])->fetch();
                if(empty($post)){
                        $this->redirectBack();  
                }
                if($post['selected'] == 1){
                        $db->update('posts', $id, ['selected'], [2]);
                }
                else{
                        $db->update('posts', $id, ['selected'], [1]);
                }
                $this->redirectBack();
        } 
        
        public function breakingNews($id)
        {
                $db = new DataBase();
                $post = $db->select('SELECT * FROM posts WHERE id = ?;', [$id])->fetch();
                if(empty($post)){
                        $this->redirectBack();  
                }
                if($post['breaking_news'] == 1){
                        $db->update('posts', $id, ['breaking_news'], [2]);
                }
                else{
                        $db->update('posts', $id, ['breaking_news'], [1]);
                }
                $this->redirectBack();
        }
}