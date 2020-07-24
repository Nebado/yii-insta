<?php

namespace frontend\components;

use Yii;
use yii\base\Component;
use yii\web\UploadedFile;
use yii\helpers\FileHelper;

class Storage implements StorageInterface
{
    private $fileName;
    /**
     * Save given UploadedFile instance to disk
     * @param UploadedFile $file
     * @return string|null
     */
    public function saveUploadedFile(UploadedFile $file)
    {
        $path = $this->preparePath($file);

        if ($path && $file->saveAs($path)) {
            return $this->fileName;
        }
    }

    /**
     * Prepare path to save uploaded file 
     */
    protected function preparePath(UploadedFile $file)
    {
        $this->fileName = $this->getFileName($file);
        // 0c/a9/djf8838aghahg838ghag.jpg

        $path = $this->getStoragePath() . $this->fileName;
        // /var/www/project/frontend/web/uploads/0c/a9/djf8838aghahg838ghag.jpg

        $path = FileHelper::normalizePath($path);
        if (FileHelper::createDirectory(dirname($path))) {
            return $path;
        }
    }

    protected function getFilename(UploadedFile $file)
    {
        // $file->tempname - tmp/qitgh8w

        $hash = sha1_file($file->tempName); // 0ca9djf8838aghahg838ghag

        $name = substr_replace($hash, '/', 2, 0);
        $name = substr_replace($name, '/', 5, 0); // 0c/a9/djf8838aghahg838ghag 
        return $name . '.' . $file->extension; // 0c/a9/djf8838aghahg838ghag.jpg
    }

    /**
     * @return string
     */
    protected function getStoragePath()
    {
        return Yii::getAlias(Yii::$app->params['storagePath']);
    }

    /**
     * @param string $filename
     * @return string
     */
    public function getFile(string $filename)
    {
        return Yii::$app->params['storageUri'].$filename;
    }
}
