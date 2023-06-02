INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (1, '酒吞童子', 'aaa', 'SSR！全新的SSR！', '陰陽師;遊戲;網易', 199, 200000, 1);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (2, '古劍奇譚二', 'aaa', '國產單機遊戲，阿阮我的！', '單機遊戲;國產;古劍', 69, 100000, 2);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (3, 'BJD娃娃', 'aaa', '每一個娃娃都是天使，娃媽娃爹就是天使長！', 'BJD;娃娃', 19999, 300000, 3);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (4, '瘋狂Android講義', 'aaa', '這是用來看的嘛？不，這是用來砸人的！裝備後攻擊+100，防禦-100，體力-100，幸運-10，知識+100，固有技能：Android Studio！', '李剛;瘋狂系列;Android;安卓', 129, 300000, 3);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (5, '小米MIX', 'aaa', '全面屏！正面都是屏幕！', '小米;全面屏;手機', 3999, 20000, 2);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (6, '雪中飛羽絨服', 'aaa', '少年，穿上這件衣服，下雪你就可以飛了！', '羽絨服;保暖', 799, 10000, 1);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (7, '蘋果筆記本', 'aaa', '辦公必備', '蘋果;筆記本', 19999, 100000, 2);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (8, '化妝品', 'aaa', '比ps好用，你信不', '化妝品', 1999, 10000, 1);
INSERT INTO `products`(`id`, `name`, `auther`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (9, '足球', 'aaa', '圓圓的，白白的，會滾，一斤三塊？要不，來兩斤？', '足球;運動', 199, 100000, 2);

INSERT INTO `users`(`id`, `username`, `email`, `nick_name`, `role`) VALUES (1, 'admin', 'admin@mail.com', 'admin', 1);
INSERT INTO `users`(`id`, `username`, `email`, `nick_name`, `role`) VALUES (2, 'user1', 'user1@mail.com', 'user1', 0);

INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `gender`, `birthday`, `post_number`, `address`, `register_time`) VALUES (1, 'admin', '12345677654', 0, '2000/01/01', '000000', '地球', '2022-01-01 00:00:00');
INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `gender`, `birthday`, `post_number`, `address`, `register_time`) VALUES (2, '123', '11111111111', 1, '2000/01/01', '000000', '地球', '2022-01-01 00:00:00');
