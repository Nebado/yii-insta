<?php

namespace frontend\modules\post\controllers;

use Yii;
use yii\web\Controller;
use yii\web\UploadedFile;
use frontend\modules\post\models\forms\PostForm;
use frontend\models\Post;

/**
 * Default controller for the `post` module
 */
class DefaultController extends Controller
{
    /**
     * Renders the create view for the module
     * @return string
     */
    public function actionCreate()
    {
        $model = new PostForm(Yii::$app->user->identity);

        if ($model->load(Yii::$app->request->post())) {
            $model->picture = UploadedFile::getInstance($model, 'picture');

            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Post created!');
                return $this->goHome();
            }
        }
        
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    public function actionView($id)
    {
        return $this->render('view', [
            'post' => $this->findPost($id),
        ]);
    }

    private function findPost($id)
    {
        if ($user = Post::findOne($id)) {
            return $user;
        }
        throw new NotFoundHttpException();
    }
}
