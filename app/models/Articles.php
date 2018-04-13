<?php

use Phalcon\Mvc\Model;

class Articles extends Model
{
    public $id;
    public $slug;
    public $title;
    public $content;
    public $author;
    public $created_at;
    public $updated_at;
}
