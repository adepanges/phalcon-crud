<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Url;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ArticleController extends Controller
{
    public function indexAction()
    {
        $this->view->url = new Url();

        $host = isset($_SERVER['HTTP_HOST'])?$_SERVER['HTTP_HOST']:'localhost';
        $base_url = "http://".$host;
        $base_url = $base_url.preg_replace('@/+$@','',dirname($_SERVER['SCRIPT_NAME'])=="\\"?"":dirname($_SERVER['SCRIPT_NAME'])).'/';
        $this->view->url->setBaseUri('/');
        $this->view->url->setStaticBaseUri($base_url);

        $this->assets->addJs("js/helper.js");
        $this->assets->addJs("js/article.js");
    }

    public function getAction()
    {
        $start = $this->request->getPost('start', 'int', 1);
        $limit = $this->request->getPost('length', 'int', 10);
        $article = new Articles();
        $paginator = new PaginatorModel(
            [
                'data'  => $article->find(),
                'limit' => $limit,
                'page'  => ceil($start/$limit) + 1,
            ]
        );
        $page = $paginator->getPaginate();

        $this->_response_json([
            'data' => $page->items,
            'recordsFiltered' => $page->total_items
        ]);
    }

    public function saveAction()
    {
        $article_model = new Articles();
        $id = (int) $this->request->getPost('id');
        $data = $this->request->getPost();

        if(!$id) {
            $data['created_at'] = date('Y-m-d H:i:s');
            $success = $article_model->create(
                $data,
                ["slug","title","content","author","created_at"]
            );
        }
        else
        {
            $row = $article_model->findFirst($id);
            $data['updated_at'] = date('Y-m-d H:i:s');
            $success = $row->update(
                $data,
                ["slug","title","content","author","updated_at"]
            );
        }

        if ($success)
        {
            $this->_response_json([
                'status' => 1,
                'message' => 'Data berhasil disimpan'
            ]);
        }
        else
        {
            $messages = $article_model->getMessages();
            $resp_msg = [];
            foreach ($messages as $message) {
                $resp_msg[] = $message->getMessage();
            }

            $this->_response_json([
                'status' => 0,
                'message' => 'Data gagal disimpan, '.implode(', ', $resp_msg)
            ]);
        }
    }

    function delAction($id)
    {
        $id = (int) $id;
        $article_model = new Articles();
        $row = $article_model->findFirst($id);

        if ($row !== false) {
            if ($row->delete() === false) {
                $messages = $article_model->getMessages();
                $resp_msg = [];
                foreach ($messages as $message) {
                    $resp_msg[] = $message->getMessage();
                }
                $this->_response_json([
                    'status' => 0,
                    'message' => 'Data gagal dihapus, '.implode(', ', $resp_msg)
                ]);
            } else {
                $this->_response_json([
                    'status' => 1,
                    'message' => 'Data berhasil dihapus'
                ]);
            }
        } else {
            $this->_response_json([
                'status' => 0,
                'message' => 'Data tidak ada'
            ]);
        }


    }

    function getbyidAction($id)
    {
        $id = (int) $id;
        $article_model = new Articles();
        $row = $article_model->findFirst($id);

        $this->_response_json([
            'status' => 1,
            'data' => $row
        ]);
    }

    protected function _response_json($resp)
    {
        $this->view->disable();
        header('Content-Type: application/json');
        echo json_encode($resp);
        exit;
    }
}
