<?php

namespace frontend\tests\functional;

use frontend\tests\FunctionalTester;
use frontend\tests\fixtures\UserFixture;

class LoginCest
{
    public function _before(FunctionalTester $I)
    {
        $I->haveFixtures([
            'user' => [
                'classe' => UserFixture::className(),
            ],
        ]);
    }

    // tests
    public function checkLoginWorking(FunctionalTester $I)
    {
        $I->amOnRoute('user/default/login');

        $formParams = [
            'LoginForm[email]' => '1@example.com',
            'LoginForm[password]' => '12345',
        ];

        $I->submitForm('#login-form', $formParams);

        $I->see('John', 'form button[type=submit]');
    }

    public function checkLoginWrongPassword(FunctionalTester $I)
    {
        $I->amOnRoute('user/default/login');

        $formParams = [
            'LoginForm[email]' => '1@example.com',
            'LoginForm[password]' => 'wrong',
        ];

        $I->submitForm('#login-form', $formParams);

        $I->seeValidationError('Incorrect email or password');
    }
}
