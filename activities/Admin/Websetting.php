<?php

namespace Admin;

use database\Database;

class Websetting extends Admin{ 
        
        public function index()
        {
                $db = new DataBase();
                $websetting = $db->select('SELECT * FROM websetting ORDER BY `id` DESC')->fetch();
                require_once(BASE_PATH . '/template/admin/websetting/index.php');
        }

     
        public function edit()
        {
                $db = new DataBase();
                $websetting = $db->select('SELECT * FROM websetting;')->fetch();
                require_once(BASE_PATH . '/template/admin/websetting/edit.php');
        }

        public function update($request)
        {
                $db = new DataBase();
                $setting = $db->select('SELECT * FROM websetting')->fetch();
                if($request['logo']['tmp_name'] != '')
                {
                        $request['logo'] = $this->saveImage($request['logo'], 'setting', 'logo');
                }
                else{
                        unset($request['logo']);
                }
                if($request['icon']['tmp_name'] != '')
                {
                        $request['icon'] = $this->saveImage($request['icon'], 'setting', 'icon');
                }
                else{
                        unset($request['icon']);
                }
                if(!empty($setting))
                {
                        $db->update('websetting', $setting['id'], array_keys($request), $request);
                }
                else{
                        $db->insert('websetting', array_keys($request), $request);
                }
                $this->redirect('admin/websetting');

        }

}