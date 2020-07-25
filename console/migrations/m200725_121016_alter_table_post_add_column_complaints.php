<?php

use yii\db\Migration;

/**
 * Class m200725_121016_alter_table_post_add_column_complaints
 */
class m200725_121016_alter_table_post_add_column_complaints extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%post}}', 'complaints', $this->integer());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('{{%post}}', 'complaints');
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200725_121016_alter_table_post_add_column_complaints cannot be reverted.\n";

        return false;
    }
    */
}
