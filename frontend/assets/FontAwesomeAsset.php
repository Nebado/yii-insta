<?php

namespace frontend\assets;

use yii\web\AssetBundle;

class FontAwesomeAsset extends AssetBundle
{
    public $sourcePath = '@bower/font-awesome/web-fonts-with-css/';
    public $css = [
        'css/fontawesome-all.min.css',
    ];
}
