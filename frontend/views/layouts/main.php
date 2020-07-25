<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use frontend\assets\FontAwesomeAsset;
use common\widgets\Alert;

AppAsset::register($this);
FontAwesomeAsset::register($this);
?>

<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <meta charset="<?= Yii::$app->charset ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <?php $this->registerCsrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
        <!-- load CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">        <!-- Google web font "Open Sans" -->

        <!-- <script>
             var renderPage = true;

             if (navigator.userAgent.indexOf('MSIE') !== -1
             || navigator.appVersion.indexOf('Trident/') > 0) {
             /* Microsoft Internet Explorer detected in. */
             alert("Please view this in a modern browser such as Chrome or Microsoft Edge.");
             renderPage = false;
             }
             </script> -->

    </head>
    <?php $this->beginBody() ?>
    <body class="loaded">

        <!-- Loader -->
        <div id="loader-wrapper">
            <div id="loader"></div>
            <div class="loader-section section-left"></div>
            <div class="loader-section section-right"></div>
        </div>

        <div class="tm-main">

            <div class="tm-welcome-section">
                <div class="container tm-navbar-container">
                    <div class="row">
                        <div class="col-xl-12">
                            <nav class="navbar navbar-expand-sm">
                                <?php
                                $menuItems = [
                                    ['label' => 'NewsFeed', 'url' => ['/site/index']],
                                ];
                                if (Yii::$app->user->isGuest) {
                                    $menuItems[] = ['label' => 'Signup', 'url' => ['/user/default/signup']];
                                    $menuItems[] = ['label' => 'Login', 'url' => ['/user/default/login']];
                                } else {
                                    $menuItems[] = ['label' => 'My profile', 'url' => ['/user/profile/view', 'nickname' => Yii::$app->user->identity->getNickname()]];
                                    $menuItems[] = ['label' => 'Create post', 'url' => ['/post/default/create']];
                                    $menuItems[] = '<li>'
                                                 . Html::beginForm(['/user/default/logout'], 'post')
                                                 . Html::submitButton(
                                                     'Logout (' . Yii::$app->user->identity->username . ') <i class="fas fa-logout"></i>',
                                                     ['class' => 'btn btn-link logout']
                                                 )
                                                 . Html::endForm()
                                                 . '</li>';
                                }
                                echo Nav::widget([
                                    'options' => ['class' => 'navbar-nav navbar-right'],
                                    'items' => $menuItems,
                                ]);
                                ?>
                            </nav>
                        </div>
                    </div>
                </div>

                <div class="container text-center tm-welcome-container">
                    <div class="tm-welcome">
                        <i class="fas tm-fa-big fa-image tm-fa-mb-big"></i>
                        <h1 class="text-uppercase mb-3 tm-site-name">Insta</h1>
                    </div>
                </div>

            </div>

            <div class="container">
                
                <?= Alert::widget() ?>
                <?= $content ?>
                
                <footer class="row">
                    <div class="col-xl-12">
                        <p class="text-center p-4">Copyright &copy;
                            <a href="<?php echo Url::to(['/site/about']); ?>">Insta</a>
                            <span class="tm-current-year">2020</span> Nebado
                        </p>
                    </div>
                </footer>
            </div> <!-- .container -->

        </div> <!-- .main -->

        <!-- $(function () {

             if (renderPage) {
             $('body').addClass('loaded');
             }

             $('.tm-current-year').text(new Date().getFullYear());  // Update year in copyright
             }); -->

        </script>
    <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
