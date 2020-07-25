<?php namespace frontend\tests;

use Yii;
use frontend\tests\UserTest;
use frontend\tests\fixtures\UserFixture;

class UserTest extends \Codeception\Test\Unit
{
    /**
     * @var \frontend\tests\UnitTester
     */
    protected $tester;

    public function _fixtures()
    {
        return ['users' => UserFixture::className()];
    }

    public function _before()
    {
        Yii::$app->setComponents([
            'redis' => [
                'class' => 'yii\redis\Connection',
                'hostname' => 'localhost',
                'port' => 6379,
                'database' => 1,
            ],
        ]);
    }

    public function testGetNicknameOnNicknameEmpty()
    {
        $user = $this->tester->grabFixture('users', 'user2');
        expect($user->getNickname())->equals(4);
    }

    public function testGetNicknameOnNicknameNotEmpty()
    {
        $user = $this->tester->grabFixture('users', 'user1');
        expect($user->getNickname())->equals('IP4zh');
    }

    public function testGetPostCount()
    {
        $user = $this->tester->grabFixture('users', 'user1');
        expect($user->getPostCount())->equals(2);
    }

    public function testFollowUser()
    {
        $user1 = $this->tester->grabFixture('users', 'user1');
        $user2 = $this->tester->grabFixture('users', 'user2');

        $user1->followUser($user2);

        $this->tester->seeRedisKeyContains('user:3:subscriptions', 4);
        $this->tester->seeRedisKeyContains('user:4:followers', 3);

        sleep(10);

        $this->tester->sendCommandToRedis('del', 'user:3:subscriptions');
        $this->tester->sendCommandToRedis('del', 'user:4:followers');
    }
}
