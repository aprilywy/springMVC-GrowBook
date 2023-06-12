INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (1, '以你為名的小時光（下）', '東奔西顧', '★熱播電視劇《我的小確幸》、暢銷小說《只想和你好好的》、《那天開始的美好時光》
甜系教主　東奔西顧　唯美浪漫之作
★當當網 2萬名讀者傾情推薦，好評率100％
★竹馬嗅青梅，暗戀的酸甜滋味，幸福到讓人嘴角揚起。', '小說;歡萌暖甜系;高寶', 237, 2000, 2);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (2, '24個最受歡迎的心理學故事: 野孩子、女巫獵殺到巴甫洛夫的狗, 揭開隱藏在實驗背後的細節與真相', '約翰．霍根', '【本書特點】
1. 以紀實手法詳細交代事件的始末
2. 精彩的心理學家性格特寫
3. 異想天開的實驗對後代的影響和意義
4. 心理學關注的主題及脈絡', '紀實手法;實驗;漫遊者文化事業股份有限公司', 420, 5000, 1);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (3, '為工作而活: 生存、勞動、追求幸福感, 一部人類的工作大歷史', '詹姆斯．舒茲曼', '傳統經濟學思維告訴我們：「工作即謀生！」
但本書要你跳脫經濟學思維，以跨學科的觀點，全面理解工作的意義！
', '理解工作的意義;八旗文化', 560, 1000, 1);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (4, '1493: 殖民、貿易、物種, 哥倫布大交換推動的新世界', '查爾斯．曼恩', '比起政治或經濟，生物大交換才是推動全球化根本的動力！', '全球化，前仆後繼;同種新世;
衛城出版', 620, 1000, 3);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (5, '在成為凶手之前: 英國逾百起命案的司法精神科權威, 透過犯罪心理學直擊殺人犯內心的黑暗實錄。', '理查．泰勒', '「人為什麼殺人？」
「殺人犯天生就是怪物嗎？」
在失格的漠視下，任何人都可能成為凶手。', '犯罪事件;精神病學;尖端出版', 380, 2000, 1);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (6, '說話的內功: 汲取世界48哲人的智慧, 八階段深度磨練言語的力量', '申道賢/ 尹娜鏤', 'BTS（防彈少年團）V隨身愛書！
日本第一男公關ROLAND推薦！
世界頂尖偶像必備的得體說話書！', '磨練言語的力量;得體說話書;野人文化股份有限公司', 360, 1000, 3);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (7, '貓小說集: 日本文豪筆下的浮世貓態', '內田百閒/ 夏目漱石/ 谷崎潤一郎/ 宮澤賢治/ 梶井基次郎/ 萩原朔太郎/ 太宰治/ 小泉八雲/ 芥川龍之介/ 等', '★無法愛人，只能愛貓────
太宰治曾說自己「缺乏愛人的能力」，首度獻出愛情的對象卻是貓？
★被譽為日本安徒生的宮澤賢治，筆下的貓族也和人類一樣鬧出霸凌風波？
★夏目漱石的不朽文學經典《我是貓》的「貓」，後來怎麼了？', '貓派文豪;木馬文化事業有限公司', 350, 1000, 3);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (8, '我想愛你所不能愛的自己', '叢非從', '本書從親密關係、人際互動、自我悅納三個角度切入，直指各種關係、場域裡的問題，皆起因於躲藏在內心深處的信念：不相信自己值得被愛。
', '改變自我;自我悅納;寶瓶文化事業股份有限公司', 380, 1000, 1);
INSERT INTO `products`(`id`, `name`, `author`, `description`, `key_word`, `price`, `counts`, `type`) VALUES (9, '盧恩符文初學指南', '喬森．西蒙', '～北歐古老智慧的祕密保佑～
★美國亞馬遜網路書店近800則5星級好評推薦
★完整剖析《魔戒》中甘道夫使用之最神祕的「盧恩符文」 意涵', '神話文化;楓樹林出版事業有限公司', 420, 1000, 3);

INSERT INTO `users`(`id`, `username`, `email`, `nick_name`, `role`) VALUES (1, 'admin', 'admin@mail.com', 'admin', 1);
INSERT INTO `users`(`id`, `username`, `email`, `nick_name`, `role`) VALUES (2, 'user1', 'user1@mail.com', 'user1', 0);

INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `gender`, `birthday`, `post_number`, `address`, `register_time`) VALUES (1, 'admin', '12345677654', 0, '2000/01/01', '000000', '地球', '2022-01-01 00:00:00');
INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `gender`, `birthday`, `post_number`, `address`, `register_time`) VALUES (2, '123', '11111111111', 1, '2000/01/01', '000000', '地球', '2022-01-01 00:00:00');
