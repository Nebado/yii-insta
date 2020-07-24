<?php

use yii\db\Migration;

/**
 * Class m200720_144420_alter_user_table
 */
class m200720_144420_alter_user_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%user}}', 'about', $this->text());
        $this->addColumn('{{%user}}', 'type', $this->integer(3));
        $this->addColumn('{{%user}}', 'nickname', $this->string(70));
        $this->addColumn('{{%user}}', 'picture', $this->string());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->addColumn('{{%user}}', 'picture');
        $this->addColumn('{{%user}}', 'nickname');
        $this->addColumn('{{%user}}', 'type');
        $this->addColumn('{{%user}}', 'about');
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200720_144420_alter_user_table cannot be reverted.\n";

        return false;
    }
    */
}
