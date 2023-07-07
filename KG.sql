/*
 Navicat Premium Data Transfer

 Source Server         : localhst
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3306
 Source Schema         : KG

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 07/07/2023 10:27:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '内容',
  `user` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名称',
  `time` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发布时间',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `md5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文章概述',
  `userid` int DEFAULT NULL COMMENT '作者的id',
  `typeid` int DEFAULT NULL COMMENT '文章类型的id',
  `readnumber` int DEFAULT NULL COMMENT '阅读次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (128, '健身经验分享', '## 健身老手分享\n学习这9条健身干货，让你少走弯路，用最少时间收获更好的效果！\n1、切忌三分钟热度。健身是一件需要长期坚持才能有所收获的事情，三天打鱼两天晒网的行为是不可取的。想要收获健身的好处，我们需要一周锻炼3次以上，定制一份适合自己的健身计划，才能收获健身的多个好处。\n2、不要过度健身，每次健身时间不要超过2小时。目标肌群不要每天锻炼，而要合理分配肌群训练，一周安排1-2天休息时间，这样才能在健身路上走得更远。\n3、肌肉跟脂肪是两种不同的物质，是无法互相转化的，健身是为了减脂增肌，力量训练可以提升肌肉维度，练出肌肉身材，而有氧运动可以消耗更多卡路里，促进脂肪分解，改善肥胖问题。\n4、有氧运动要多样化，不要一成不变，单一的运动模式会让身体逐渐适应运动的模式，燃脂效率也会大打折扣，健身也会慢慢陷入瓶颈期。\n我们刚开始进行有氧运动的时候，可以从低强度运动开始，然后循序渐进提升训练强度，更换燃脂效率更高的运动，这样才能让你持续燃脂，更快收获一副好身材。\n5、力量训练以复合动作为主，孤立动作只能锻炼单一肌群，而复合动作可以带动多个肌群一起发展，有效提升增肌效率，非常适合新手。复合动作包括深蹲、弓步蹲、山羊挺身、推举、引体向上、俯卧撑、硬拉、双杠臂屈伸等动作。\n6、空腹锻炼不可取。空腹状态锻炼会诱发低血糖，身体力量会很快流失，健身表现力远不如非空腹状态的时候，健身效率也会大打折扣。\n因此，无论增肌还是减脂，我们都要避免空腹锻炼，你可以在健身前1小时吃点东西，补充蛋白质跟碳水食物。\n7、不要忽略练腿。腿部肌群是身体最大的一个肌群，决定了下肢的力量跟行走的动力。健身练腿可以带动腰腹跟臀部肌群的发展，可以有效促睾，保持双腿灵活性，抵抗衰老速度。\n坚持练腿还能预防腿部肌肉流失，均衡身材发展，避免健身陷入瓶颈期，还能有效提升基础代谢值，让你更快瘦下来。\n8、进行健身餐计划，三分吃七分练，只有健身结合饮食，才能提升健身效果。增肌人群要进行增肌餐结合，适当提升卡路里摄入，加强蛋白质的摄入，才能提升肌肉维度。\n减脂人群要进行减脂餐计划，控制卡路里摄入，降低脂肪跟碳水化合物的摄入，才能提升减脂效率。\n9、多喝水，学会主动喝水，充足的喝水量可以促进身体循环代谢，加速废物的排出，有助于身体的修复，让你更快练出好身材。', 'admin', '2023-07-06 23:00:26', NULL, NULL, '健身老手分享：学习这9条健身干货，让你少走弯路，用最少时间收获更好的效果！', 107, 1, 7);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (129, '健身指南', '当谈到健身经验分享时，以下是一些值得考虑的方面：\n目标设定：在开始健身之前，明确您的目标是什么。是增肌、减脂、增强力量还是提高耐力？确立明确的目标可以帮助您更有针对性地制定训练计划并保持动力。\n健身计划：制定一份合理、可行的健身计划非常重要。平衡有氧运动和力量训练，并确保适当的休息时间。根据自己的时间和能力，安排每周的训练日程，并严格遵守计划。\n动作正确性：正确的动作技术对于健身的效果和安全性至关重要。花时间学习每个动作的正确形式，并在开始使用重量之前，掌握良好的技术。如果可能的话，寻求专业教练的指导，以确保您的动作正确无误。\n营养与饮食：健康的饮食是成功的关键之一。确保您的饮食富含优质蛋白质、健康脂肪和复杂碳水化合物。合理控制热量摄入，并注意补充足够的水分以保持身体的水平衡。\n休息与恢复：在健身过程中，休息和恢复同样重要。给身体足够的休息时间来修复和成长。合理安排每周的休息日，同时确保每天有足够的睡眠。\n自我监测与调整：定期监测自己的进展是非常重要的。记录您的训练数据、体重、身体尺寸和感受，并根据需要进行调整。逐渐增加训练的强度和难度，挑战自己，但也要注意身体的信号，避免过度训练和受伤。\n坚持与激励：健身旅程不是一蹴而就的，需要持续的坚持和自我激励。找到适合自己的激励方式，例如与健身伙伴一起训练、设立小目标并奖励自己等，以保持动力和积极的心态。\n最重要的是，尊重自己的身体和个人限制。每个人的身体状况和健身进程都是独一无二的，所以请确保您的健身经验', '许智尧', '2023-07-06 23:04:34', NULL, NULL, '健身指南', 108, 1, 9);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (132, '古典健美巨兽：克里斯！', '## 感谢关注，持续输出健美硬核文章及合成代谢知识，欢迎私聊提问！\n提起健美，人们就会想到施瓦辛格，提起古典健美，人们就会想起克里斯，其实，两人都算得上是古典健美的代表，特别是克里斯，有人说他就是为古典健美而生的人，光看长相和胡子就已经很古典了，他是最受欢迎的古典健美天才，身材高，颜值高，体型古典而健美，他被粉丝亲切的称为“C宝”，继去年奥赛古典健美夺冠后，今年他成功卫冕，意味着他的古典时代来临了。\n“C宝”克里斯：为古典健美而生，2020年奥赛古典健美二连冠\n有人问：“施瓦辛格不是健美吗？怎么变成古典健美人物了？”\n因为施瓦辛格那个时期的健美运动，科技药物还并未普及，没有出现像现在无差别健美运动员的那种肌肉量，那时还未分无差别和古典健美。古典健美是在2016年才开始的，是更接近施瓦辛格的冠军标准的，更追求形体的整体匀称和美感。\n**为古典健美而生**\n克里斯·巴姆斯特德，1994年出生于加拿大，美国国籍，从小就喜欢体育运动，有着很好的运动天赋。他身高1.85m，赛季体重99公斤，能够轻松完成扣篮，又被粉丝们亲切地称为“人形野兽”，“C宝”。\n2016年，他获得了北美健美锦标赛奖杯，并获得了IFBB职业卡。\n由于克里斯的身材和弗兰克.赞恩非常相似，兼具了块头匀称和美感，特别是他的腹肌，他的“真空腹”和赞恩一样漂亮。\n2019年，克里斯展露了他王者霸气的一面，比赛状态非常好，以一分的微弱优势战胜安斯利，成功获得奥赛古典冠军。\n克里斯每周训练6天，每天都会按照计划进行训练，周而复始，从不间断。\n\n==第一天：手臂（肱二头肌，肱三头肌），腹肌；==\n\n==第二天：腿部；==\n\n==第三天：背部，肱二头肌；==\n\n==第四天：胸肌；==\n\n==第五天：肩膀、肱三头肌，腹肌；==\n\n==第六天：胸肌，背阔肌。==\n\n==周日休息。==\n\n', '许智尧', '2023-07-06 23:19:18', NULL, NULL, '古典健美巨兽：克里斯！', 108, 4, 6);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (133, '健身怎么吃', '## 健身时到底该怎么吃？才能增肌又减脂？\n	开篇简单粗暴一句话：健身运动，练而不吃，视同白练。\n\n==也许，你是一位资深瘦子或欲练肌肉而不得的人士。==\n我相信，你已经尝试过不少让自己的身材看起来能更阳刚一点的方法。很多人会（不负责任的）告诉你，大量的吃高热量不健康的食物，比如啤酒炸鸡吃到吐，大嚼巧克力顶到嗓子眼。\n当然，我也相信，这些方法都没让你得到自己想象中的好身材。要不也不会有这么多人在微信里询问瘦人怎么增肥了……很多不幸的朋友，只吃肥了肚腩，依然支楞着细瘦的四肢。更不幸的，还有因为吃了太多饱和脂肪酸和低密度胆固醇得了脂肪肝啥的…\n\n==也许，你是一位想要减脂、瘦身、塑形的朋友。==\n你为了能够减下去那几公分腰腿围，放弃了自己心爱的美食。某种程度上，放弃了自己生活很大的一部分乐趣。你不再敢吃心爱的甜食糖果，也不再敢吃鲜美多汁的牛排烤肉。\n你的节制，很可能在开始有一定的成效，但也很让自己苦恼。一方面，你放弃了很多生活中的幸福。人生，无非衣食住行。一方面，你的节制渐渐不再那么有效，体重和腰围很久都不变了，你也没得到自己梦想中的身材。\n吃很重要，健身中，吃更重要。\n\n==正确的吃，吃正确的东西。在正确的时间，吃正确的东西。可能在你的健身计划里，就差这一步了。==\n（一些表格和文章中出现，但在此未涉及的理论，可以去我微信订阅号：硬派健身 或搜索 oh-hard中查看，我会把关键字放到最后面，大家在订阅号内回复关键字就可以了。）\n增肌与减脂能并行不悖么？\n减脂塑身运动前，应该吃点啥~？\n\n**蛋白质——为增肌减脂事业添砖加瓦**\n关于高蛋白饮食对于减肥和瘦身的效果，在这篇已经谈过了【硬派健身】高蛋白饮食的减肥效力！。不多做赘述咯。这里主要说说，资深瘦子们和目标是增肌的人士。\n首先明确一点，无论是为了身材还是健康。如果你体型比较单薄，你的目标应该增长肌肉围度，让自己看起来英武。而非长一身肥膘……那……那你还不如瘦着好了……至少给内脏与身体的健康压力没那么大……\n穿衣要显瘦，脱衣要有肉。女孩很少会喜欢比她还瘦的男纸……伤自尊……\n\n很多偏单薄的朋友也正在进行力量训练健身。但有些人效果不错。有些人肌肉增长可能不太明显。我身边也有一些有类似问题的朋友。我发现，健身中、健身后的饮食改善，是此类同学很好的切入点。\n瘦人其实有很多天生的因素（代谢速率、激素水平、肠道菌群等）决定了，他们不太可能集聚太多的脂肪。但这些因素，并不会限制他们生长肌肉的哦~（有些比如激素水平等可能还会有利于肌肉生长，有极少数因素也会限制，但这是极少数了）。\n\n所以在力量训练中，增加自己的肌肉围度，就是解决单薄身材的最好、最健康、最简易方法咯。而为了训练中的极限增肌，我们需要加强肌肉蛋白的合成速率。而健身饮食是很多朋友需要改善的因素！尤其是摄入的营养种类、配比和时间。\n\n健身中、健身后，应该补充大量的简单碳水化合物和蛋白质。拉高胰岛素的分泌，促进肌肉蛋白合成速率。\n最简单的碳水化合物来源是糖、蜂蜜、水果、细粮等。最简单的蛋白质来源是蛋白粉、脱脂牛奶（此时，不要有脂肪摄入）、蛋清等。如果你不想喝蛋白粉，比如摄入脱脂奶加很多糖，就也不错。（但脱脂奶GI值较低，总体效果可能不如蛋白粉）', '朱俊杰', '2023-07-06 23:23:23', NULL, NULL, '吃很重要，健身中，吃更重要。\n\n正确的吃，吃正确的东西。在正确的时间，吃正确的东西。可能在你的健身计', 117, 3, 15);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (134, '肱二头肌训练指南', '前方有一只装X怪正在做“反握高翻”。站姿双手反握杠铃，用一个一个标准的顶髋动作将杠铃翻上颈前。\n\n不明真相的围观群众摇头道：“你这练到了二头？你的动作不标准，你的训练技术没有说服力。”\n\n此时装X怪用怪异的眼神看着你（就像下图一样）：\n\n\n装X怪怒道：\n\n1.我今年XX岁训练了XX年XX月（强调训练时间短）\n\n2.三大项XXX（强调自己有点劲）\n\n3.臂围XX（露出自己臂围超过40的脂肪臂）\n\n4.我的动作会没用说服力？（傻X一样的逻辑）\n\n\n抱歉！没听懂你仔说什么，请勿随地装X。\n\nNo jay-zhuangbing\n\n训练要有效果遵从的是科学正确的人体运动学，而不是装X。\n\n正文\n\n我们了解一下肱二头肌的功能：\n\n近端固定：屈肘、外旋前臂及一定程度的屈肩\n\n远端固定：屈肘同时使上臂向前臂靠拢\n\n显然我们常练的弯举类动作都属近端固定的动作，引体向上就属于远端固定的动作。\n\n现在我们根据肱二头肌近端固定的功能来分析如何正确训练弯举。\n\n==屈肘：==\n\n屈肘就是让前臂在肘关节处屈，这个动作是所有弯举类训练的动作主体，为了能有效地完成这个动作，以下两个细节点是应该做到的：\n\n1. 大臂固定\n\n2. 固定肩胛\n\n这两点的目的都是为了维持近端固定这个条件，弯举就是近端固定的动作，若近端无法保持稳定，则会严重影响训练效果。\n\n比如出现了肩后伸，肩胛上提等动作（很可能出现在重量选择过大或力竭的情况下），那么此时此刻肱二头肌的远端向近端收缩的程度会受到影响，因为身体的其他肌肉代偿了。\n\n\n==杠铃弯举==\n同时，大臂和肩胛的固定是因动作而异的，站姿弯举时，大臂应紧贴身体，但斜托弯举时我们所说的大臂固定，是基于斜托板这个器械而言的固定。\n\n所以从屈肘的角度来说，维持近端固定是前提，然后需要根据具体的动作去固定大臂和肩胛。\n\n\n\n\n\n==外旋前臂：==\n\n既然外旋前臂也是肱二头肌的一个重要功能，那么为了让肱二头肌彻底发挥这个功能，我们基于屈肘的动作的前提下加上外旋前臂这个动作。\n\n当我们处在弯举动作的起始姿势时，我们应该将掌心面向身体来抓握哑铃（显然杠铃类的动作会抑制外旋功能的发挥，这里我们讨论单臂动作）。\n\n\n==坐姿哑铃交替弯举==\n事实上换一个角度可能更好理解，以掌心朝向身体的起始位置开始弯举，如果没用外旋前臂的过程，那么就做成了锤式弯举，而锤式弯举正是因为没有了外旋前臂这个动作，肱二头肌的参与程度大大降低，导致这个动作成了主要训练肱桡肌和肱肌的动作。\n\n==屈肩：==\n\n二头有一定的屈肩功能，那在训练中的主动屈肩对弯举训练有帮助吗？作者不建议这么做，因为二头的屈肩功能是很有限的，而屈肩的主力肌是三角肌。我们训练弯举是为了训练手臂而不是肩膀，但是不是基于这一点功能，我们就无法完善弯举训练技术了呢？\n\n\n==哑铃前平举==\n反过来想，利用二头肌有一定程度屈肩功能的特点，如果在弯举动作的起始位就让肩膀稍微后伸，就相当于拉长了二头肌，加大了弯举动作的难度和做功距离，但这里说的后伸肩膀需要是被动的，所以可以借助上斜凳和绳索来完成（显然这里同前臂外旋的细节一样，只适用于单臂训练）。\n\n\n==上斜凳哑铃弯举==\n以上斜凳哑铃弯举为例，这个动作可以将二头肌的所有功能都完美覆盖到，屈肘、前臂外旋和屈肩。\n\n至此，我们基于肱二头肌的功能分析了如何有效地训练弯举动作，下面进行总结：\n\n**1. 弯举训练要尽量固定近端。**\n\n**2. 要尽可能覆盖到肱二头肌的所有功能，即屈肩、屈肘和外旋前臂。**\n\n**3. 重量选择要合适，避免代偿不受控制地发生。**\n说来说去其实第三点才是最重要的，本文啰嗦了这么多，道理人人都懂，但能保持高质量的训练，并不容易。感谢你看完这篇罗嗦的文章，希望你此时此刻觉得这一整篇文章都在说废话，那么我相信你很有可能真的掌握了肱二头肌训练。', '黄昭博', '2023-07-06 23:32:31', NULL, NULL, '肱二头肌弯举的正确训练诀窍', 118, 2, 11);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (135, '健美类固醇', '前言：别乱喷了，不卖药的，用药有害\n\n这是一篇关于类固醇的文章，前几天肖恩雷登的去世是促使我写这篇文章的原因。\n\n不过在开始之前，我要先声明的是：我并不是类固醇专家，更没有体验过它。和各位的一样，写这篇文章之前，我对类固醇的认知也仅仅停留在「增肌牛逼，有害，违法......」这种层面上，并未深入了解它。\n\n今天这篇文章的所有信息，它们绝大部分都来自于我对网上信息的整合。\n\n==类固醇增肌有多牛逼？==\n想知道类固醇增肌有多牛逼，最好的方法就是去观察各个年代顶尖健美运动员的身材，毫不夸张地说，健美运动员的身材进化史就是用药技术的发展史。\n\n\n各个年代的健美运动员\n让我们假设1930年代的健美运动员Eugen sandow是自然的（虽然类固醇30年代就出现了），并且他代表了他那个年代里最好的基因。我们可以看到，80年前的健美运动员和现在的健美运动员相比，肌肉量整整少了50多公斤，那可是足足60%的差距啊（一个普通基因的自然训练者一辈子能得到的肌肉也就20公斤左右)。\n\n当然，你可以说这是因为相比于70年前，训练技术和饮食手段有了很大的突破。你还可以说是因为有更多的人参与了这项运动，这让我们可以看到更多基因天赋更好的人......\n\n不好意思，以上的说辞在这种级别的肉量提升面前很无力。\n\n如果你去看现代自然健美赛事最顶尖的运动员，你会发现即便使用了更好的训练技术和饮食，他们也都基本集中在70~80公斤左右，与80年前别无二致。\n\n\n自然健美高手Eric helms，83公斤左右，穿上衣服，emmm，只能说能看出来练过\n健美运动员这种恐怖的肉量提升只有一个解释：用药的技术变得更先进了，或者单纯就是用药更猛了。\n\n==类固醇的研究==\n首先来看看这个最著名的「练得好不如扎得好」实验\n\n实验人员把43个人分成了4组，他们分别是：安慰剂组、运动组、类固醇组、类固醇+运动组。\n\n经过了10周的实验，实验人员检测了他们了肌肉量变化\n\n\n实验结果\n即便完全没运动，类固醇组（3.2公斤）获得了比运动组（2公斤）更好的肌肉增长。运动+类固醇组获得了最好的效果（6.1公斤），比前两者加起来还要多（这说明类固醇不仅能让你凭空涨肌肉，还能优化你训练的效果）。\n\n值得一提的是，这个实验的类固醇剂量只有600mg/每周，仅仅6倍于医用标准（100mg），这显然远远小于健美运动员的剂量，PRO们的用药量往往是以克为单位的。\n\n那么如果像Pro一样加大药量会怎么样呢？\n\n当然是更牛逼了！\n\n在「Gilbert Forbes 1985」的研究中发现，当在一个C中，用药量达到10000mg时，你可以获得20KG的肌肉量（again，这是自然选手一辈子的肉量），真的练不如扎。\n\n\n==类固醇总用量与增肌量==\n健美运动员不仅仅只会使用类固醇，他们还会使用生长激素，胰岛素......而这些激素还会进一步提升他们的肌肉量。\n\n此外，多种药物同时使用，其效果往往不是1+1=2这么简单，它们可能还会相互促进效果，达到1+1=3的效果。\n\n比如，这篇实验「James Ginbey,troelys wolthers 2005」里发现，单独使用生长激素能提高人体IGF-1（人体一种重要的合成代谢因子）水平，单独使用类固醇不能。如果把类固醇和生长激素一起使用，人体产生的IGF-1水平能超过单独使用生长激素。\n\n再比如，虽然还没有健康人体的试验，但在非健康人的实验里（比如性腺减退、二型糖尿病、老人.....），我们已经发现类固醇可以提高人体的胰岛素敏感性，这意味着你注射的胰岛素可以发挥更大的威力（把更多热量送进肌肉）。\n\nInsulin Resistance and Inflammation in Hypogonadotropic Hypogonadism and Their Reduction After Testosterone Replacement in Men With Type 2 Diabetes\nTestosterone replacement therapy improves insulin resistance, glycaemic control, visceral adiposity and hypercholesterolaemia in hypogonadal men with type 2 diabetes\nTestosterone replacement therapy improves insulin sensitivity and decreases high sensitivity C-reactive protein levels in hypogonadotropic hypogonadal young male patients\n最后，除了更大的药量和更多的药物，职业健美运动员还有一样普通人所没有的东西：基因。\n\n更好的基因对药物的反应更好（也许是因为更好的敏感性），使用同样的药量，他们就是能获得更多的肌肉。为什么鹿程辉用了药是鹿程辉，里维学长用了药还是里维学长？就是因为基因差异。\n\n\n\n\n==类固醇与运动表现==\n除了健美领域外，所有极度依赖力量素质的运动领域（比如举重、力量举、短跑等等）也存在类固醇的滥用。\n\n之所以这些运动员要使用类固醇，那是因为在度过新手时期之后，训练者的力量增长高度依赖于肌肉增长。而通过训练获得肌肉很难且慢，所以才想要走捷径。\n\n那么类固醇对运动表现的帮助有多大呢？\n\n我们先来看看类固醇对纯力量运动，比如力量举的影响有多大。\n\n那么到底有多大呢？\n\n在力量举领域，用药与不用药的差别是：10%。\n\n10%这个数据是Greg Nuckols对比了有药检和无药检各个级别的力量举世界记录所得出的数字。\n\n我要指出的是，这并不是非常严谨的方法，因为首先，你无法保证通过药检的运动员没有用药（因为总有方法混过药检），有相当数量的药检比赛运动员后来被查出使用药物。\n\n其次，你也无法保证药检运动员和无药检运动员的基因都一样优秀，因为更好的基因对药物的反应会更好。\n\n换句话讲，类固醇带给力量表现的真实差距可能大于10%。\n\n\namanda paulauskas，2018年120公斤IPF冠军，在2017年查出用药\n不过，即便不严谨，10%仍然是非常大的提升了，因为在绝大部分比赛里，第一名和第二名的差距往往不会超过5%。举个例子，2019年IPF74公斤级的第一名总成绩是785公斤，假设他用了药，成绩减去10%，那么他将直接掉到第7名开外，没人会记得他的名字。\n\n如果运动带有爆发力属性（比如举重和短跑），那么10%的优势会进一步被缩小，因为爆发力运动给运动员「产生力」的时间很短，运动员往往只能展示自身力量的某个百分比。\n\n举个例子，在100赛跑的运动里，运动员每次蹬地大概只有0.1秒不到的时间，而神经系统募集全部肌纤维/发出极限力却需要0.4秒以上，所以在短跑时，运动员每次蹬地可能只能展示其极限力量的25%不到。\n\n换句话讲，类固醇带来的10%力量优势，如果换算到短跑里，可能只剩下2.5%不到。再考虑到短跑是单腿完成的，最后的优势可能只有1.25%\n\n那么1.25%的优势对短跑意味着什么呢？\n\n我们看看东京奥运会男子百米的成绩：\n\n\n东京奥运会100米前6名\n在短跑领域，即便是只有1.25%的优势，它也直接决定你能否登上领奖台。\n\n类固醇，肌肉，力量\n你的力量能从类固醇中受益多少，这高度取决于你需要多少肌肉。因为在度过了新手期之后，训练者的技术和神经系统募集能力已经被开发殆尽，此后的力量增长高度依赖于肌肉增长，而类固醇最大的作用就是直接给你肌肉，并且这部分肌肉不需要训练参与。\n\n在你的体重级别里，如果受限于训练知识/基因，你无法通过自然训练获得足够的肌肉量，那么此时使用类固醇将大幅提升你的力量\n\n举个例子，你是一个体脂率9%的83公斤力量举运动员，你要升100公斤级别，但是因为自然训练可获得的肌肉有限，你无法在100公斤仍维持9%的体脂率，那么此时用类固醇你将受益，加上类固醇给你的肌肉，你能在100公斤也维持9%的体脂率，此时你的竞争力可想而知。\n\n但是，通过自然训练，如果你已经获得了你的体重级别里的极限肌肉量/极限体脂率，那么使用类固醇将不会让你获益那么多，因为你已经没什么体脂空间让你涨肌肉了。\n\n举个例子，两个同样83公斤的力量举运动员，一个体脂率20%，另一个体脂率9%，前者使用类固醇可以大幅提升成绩，因为前者还有很多体脂率可以降/肌肉可以涨，而后者不行。\n\n同样地，我们可以倒推回去，如果你是从65升74，亦或是从74升83，那么可能就不需要类固醇了，因为自然训练也可以让你获得那么多的肌肉（当然，类固醇能帮你更快地获得那些肌肉）。\n\n通过以上分析，我们就知道为什么类固醇对力量运动员的帮助（10%)，它没有像对健美运动员（60%）的帮助那么大了，因为绝大部分力量运动员都有级别限制，他们不需要那么多的肌肉，级别所需的肌肉通过自然训练也能获得。\n\n类固醇与恢复能力\n虽然还没有确切的证据，但我们可以相信类固醇帮你增加力量的另一方式是：提高恢复能力。\n\n几乎所有的类固醇使用者都宣称自己变得更像“永动机”，能够应对容量更大，强度更高，频次更集中的的训练（当然也有可能是因为他们变强了，之前的强度就会变得轻松）。\n\n恢复能力是限制高阶自然训练者进一步往前走的重要因素。为了照顾自身的恢复能力，高阶训练者需要非常小心翼翼地增加训练量和强度，自然地，此时的进步也会变得非常慢。\n\n类固醇的使用可以直接打破恢复能力对训练者的限制，让本来不合理的训练计划变得合理，而印证以上观点的最好例子就是著名的保加利亚训练模式（Bulgarian method）。\n\n保加利亚模式因保加利亚举重队而出名，因为当时保加利亚举重队统治了举重这项比赛。\n\n保加利亚模式非常简单：一周6练，专注于6个动作，它们分别是：挺举、抓举、高抓、高翻、深蹲、前蹲（还有一些辅项）。一天选择3个动作，动作和动作之间间隔30分钟。\n\n真正让保加利亚模式出名的是它变态的强度，它要求训练者使用95%1RM以上的强度进行训练（这意味着每组的次数不超过3个以上），并且是every day，every movement！！\n\n如果你是练力量举的，这就相当于有人告诉你：你一周6练，每天都包含深蹲卧推硬拉，并且强度都在95%1RM以上。\n\n（注：这种强度高，容量低的训练，它带来的疲劳往往不是肌肉层面的，而是神经层面的。虽然还是没有直接证据，但我相信类固醇能促进力量训练之后神经系统的恢复，因为有很多证据证明雄性激素高度参与了神经系统的发育，修复等等过程）\n\n这种训练计划严重违反了「刺激-恢复」原则，事实也证明，所有后来试图模仿保加利亚模式的国家队亦或是个人都没有成功，他们中的绝大多数要么以受伤，要么以过度训练而收场，他们百思不得其解，直到......保加利亚举重队员被爆出使用类固醇。\n\n类固醇的使用，它就完美地解释了「为什么保加利亚人行，但我不行」的现象，因为你没有类固醇，你就没有保加利亚人的恢复能力。\n\n事实上，即便是有类固醇的加持，保加利亚模式的生存率也非常低。根据当时的保加利亚举重队教练Angel Spassov的说法，66个运动员里大概只有1个能从保加利亚模式里走出来，走出来的这个人就是世界冠军。\n\n保加利亚举重队的故事告诉我们，世界级运动员之间的竞争，合理的训练计划也许一点也不重要，药物和筛选才是关键。我先筛选出一堆天赋异禀的运动员，给他们药物，给他们极度严苛的计划（不合理没关系），谁能活下来，我就派谁去奥运会。\n\n类固醇与不可量化的优势\n除了肌肉和力量这些相对可以被量化的优势，类固醇还能带给运动员其他无法被量化的优势，比如时间优势。\n\n==什么是时间优势？==\n\n首先，类固醇能让你以更快的速度获得肌肉，这里就能帮你节省很多花在训练上的时间。\n\n举个例子，原本忌惮于自身的恢复能力，你的深蹲可能一个月只加2.5公斤，可是有了类固醇的加持，你可能每周都敢加2.5公斤（更别说你不练也能涨了）。换句话讲，你能以更快的速度达到目标成绩。\n\n其次，提高成绩需要的不仅仅是训练时间，还需要知识，而获取知识也是需要时间的。\n\n举个例子，一个运动员在不犯任何错误的情况下，深蹲300公斤可能需要5年。可如果他因为知识储备不足而经常犯错呢？那这个战线可能就会被无限地拉长了，直到他获取到正确的知识。\n\n时间优势有什么用？\n\n这么说吧，一个20岁就深蹲到300公斤的运动员，一个35岁才深蹲到300公斤的运动员，你觉得哪个运动员以后的可能性更大？\n\n当然是前者，因为前者有更多的时间发展其他素质，比如技术、爆发力、耐力等等。\n\n此外，运动员更早地获得他体重级别所需的肌肉和力量，这往往意味着他能更早地脱颖而出。而更早地脱颖出往往意味着更早地参加比赛积累经验，并且受到更多关注，能享受更好的训练资源（所谓资源倾斜，强者恒强，在运动领域也是一样），而这些类固醇所带来的优势都是无法被量化的。\n\n即便停药，用药者可能也会有优势\n很多的研究证明，类固醇能促进卫星细胞与肌细胞融合，而这是类固醇能直接给你肌肉的原因之一。\n\nTestosterone-induced muscle hypertrophy is associated with an increase in satellite cell number in healthy, young men\nEffects of testosterone supplementation on skeletal muscle fiber hypertrophy and satellite cells in community-dwelling older men\n什么是卫星细胞？\n\n卫星细胞是分布在肌细胞周围的一种未分化的细胞（类似于干细胞），它最主要的功能是「在必要时与肌细胞融合，把自身的细胞核变成肌细胞的细胞核」。\n\n\n==卫星细胞的工作原理==\n\n\n为什么肌细胞需要卫星细胞的细胞核？\n\n细胞核是肌细胞合成蛋白质的重要细胞器，可是一个细胞核的工作效率是有限的，只能负责一定肌细胞区域的蛋白质合成，而当肌细胞肥大到一定程度时，一个细胞核就不够用了。如果肌细胞想要进一步变大，此时就需要卫星细胞的细胞核。\n\n当肌细胞得到了新的细胞核，合成蛋白质的效率就会变高，进而能被照顾到的蛋白质合成区域就被扩大了，肌细胞就有可能变得更大。\n\n这就类似于一个WIFI路由器只能照顾一定区域的网络信号，想要扩大网络信号的覆盖面积，你需要多个路由器。\n\n当肌细胞得到了卫星细胞的细胞核，这个细胞核就会永远留存在于这个肌细胞内。而之所以你停训之后复训能以更快的速度重新获得肌肉（我们称这种现象为肌肉记忆），这正是因为经过训练之后的肌细胞已经拥有了多个细胞核，而拥有多个细胞核的肌细胞能以更快的速度合成蛋白质。\n\n类固醇以非训练的方式将大量的卫星细胞注入肌细胞，这意味即便你停了药，可当你训练的时候，相比于自然训练者，你能以更快的速度合成新的蛋白质，并且这种优势会永远伴随着你。', '唐瑞', '2023-07-06 23:37:58', NULL, NULL, '用药有害', 119, 3, 9);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (136, '健身秘诀', '当谈到健身秘诀时，以下是一些值得注意的要点：\n\n设定明确的目标：在开始健身之前，确保您有明确的目标。是增加肌肉质量、减脂塑形、提高体力还是改善某个特定方面？明确的目标将帮助您制定合适的计划并保持动力。\n综合训练：综合训练是健身成功的关键。包括有氧运动（如跑步、游泳、骑自行车）和力量训练（如举重、俯卧撑、深蹲）在内的全面训练，能够提高心肺健康、塑造身体线条并增加代谢率。\n适度增加负荷：为了持续进步，逐渐增加训练负荷是必要的。通过增加重量、增加重复次数或增加训练强度，使肌肉面临新的挑战，促进力量和肌肉的增长。\n保持正确的姿势和技巧：正确的姿势和技巧对于健身的效果和安全性至关重要。花时间学习每个动作的正确形式，并在开始使用重量之前，确保掌握良好的技术。寻求教练的指导可以帮助您更好地掌握正确的姿势和技巧。', 'admin', '2023-07-07 01:29:00', NULL, NULL, '健身秘诀', 107, 1, 0);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (137, '背部健身', '124afdawdawd', '黄昭博', '2023-07-07 01:30:02', NULL, NULL, '背部锻炼教程', 118, 2, 1);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (138, '跑步', 'wdawdadwdwdadaw', '黄昭博', '2023-07-07 01:34:11', NULL, NULL, '跑步', 118, 2, 2);
INSERT INTO `article` (`id`, `name`, `content`, `user`, `time`, `enable`, `md5`, `summary`, `userid`, `typeid`, `readnumber`) VALUES (139, '健身测试', '123', 'admin', '2023-07-07 10:05:42', NULL, NULL, '努力健身', 107, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `articleid` int DEFAULT NULL,
  `authorid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------
BEGIN;
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (36, 108, 128, 107);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (37, 108, 129, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (38, 108, 131, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (40, 117, 132, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (41, 117, 131, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (42, 117, 129, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (44, 118, 132, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (45, 118, 129, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (46, 119, 135, 119);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (48, 119, 131, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (49, 119, 129, 108);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (50, 119, 134, 118);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (51, 119, 133, 117);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (52, 118, 133, 117);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (54, 118, 135, 119);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (55, 118, 128, 107);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (56, 108, 138, 118);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (57, 107, 139, 107);
INSERT INTO `collection` (`id`, `userid`, `articleid`, `authorid`) VALUES (58, 107, 135, 119);
COMMIT;

-- ----------------------------
-- Table structure for LikedVideo
-- ----------------------------
DROP TABLE IF EXISTS `LikedVideo`;
CREATE TABLE `LikedVideo` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `videoUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of LikedVideo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for LoginLog
-- ----------------------------
DROP TABLE IF EXISTS `LoginLog`;
CREATE TABLE `LoginLog` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `IP` varchar(254) DEFAULT NULL,
  `OS` varchar(254) DEFAULT NULL,
  `Browser` varchar(254) DEFAULT NULL,
  `LoginTime` date DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of LoginLog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Message
-- ----------------------------
DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `messageId` int NOT NULL AUTO_INCREMENT,
  `sendUid` int DEFAULT NULL,
  `recUid` int DEFAULT NULL,
  `content` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Schedule
-- ----------------------------
DROP TABLE IF EXISTS `Schedule`;
CREATE TABLE `Schedule` (
  `scheduleId` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `Content` varchar(254) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `SPoints` int DEFAULT NULL,
  `IsFinished` int DEFAULT NULL,
  PRIMARY KEY (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Schedule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable` tinyint(1) DEFAULT '1' COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (109, '5b6ba6f33ac6c.jpg', 'jpg', 256, 'http://localhost:9090/file/0bd4771fcb814483b8a1ea4e30eee739.jpg', '48effa998b4c4a41840dac760b0739c2', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (110, 'IMG_2427 2.JPG', 'JPG', 92, 'http://localhost:9090/file/583d9c8f19ff4c198e50b1e36d331a69.JPG', 'e3b094b4ac1c98a245f47609dade4a02', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (111, '108017768.jpeg', 'jpeg', 25, 'http://localhost:9090/file/4d6127dbf9344e55a5be7e4a2cfa6d05.jpeg', '699b751819b7bd6173c023e17f9ff0d7', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (112, '109836761.jpeg', 'jpeg', 12, 'http://localhost:9090/file/45d1f32913a34dd98df05d305029485b.jpeg', '742b88b25efdcbc5ffa882d52285b2a3', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (113, '截屏2023-07-06 22.33.22.png', 'png', 13, 'http://localhost:9090/file/a9a19253650349ecade145e38822632e.png', 'ddf9171693693fed0a08586ce4b99ae9', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (114, '截屏2023-07-06 22.34.36.png', 'png', 25, 'http://localhost:9090/file/7580b6341b294e7d920c5da9a3e44850.png', 'b16e32817fe7b77a6c820551326eedb7', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (115, 'images.jpeg', 'jpeg', 4, 'http://localhost:9090/file/5fc5986bcebd4a2db8c3cdfd39723379.jpeg', '9b18c8ec860a18495996c86d5c497917', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (116, 'IMG_4120.heic', 'heic', 852, 'http://localhost:9090/file/37793ac0580a47198900b363644a6bd6.heic', '38729978dd2b58363ba61c4c97b397b6', 0, 1);
INSERT INTO `sys_file` (`id`, `name`, `type`, `size`, `url`, `md5`, `is_delete`, `enable`) VALUES (117, 'guanggaoOfHome.jpg', 'jpg', 77, 'http://localhost:9090/file/8eed6ee9d861412d8989800ed7c1cb4b.jpg', '667a68ca1cae02eaa6a24e8259c00fc7', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '性别',
  `brief` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '个人简介',
  `birthday` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生日',
  `nameOfShcool` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '学校名称',
  `education` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '学历',
  `major` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '专业',
  `schoolTime` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '入学时间',
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '用户身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `sex`, `brief`, `birthday`, `nameOfShcool`, `education`, `major`, `schoolTime`, `role`) VALUES (107, 'admin2', '123456', 'admin', '1932063838@qq.com', '18801510867', '武汉大学信息学部国软C3宿舍', '2023-07-06 22:31:19', 'http://localhost:9090/file/583d9c8f19ff4c198e50b1e36d331a69.JPG', '男', '无聊的时候你大多会做些什么', '2003.5.03', '武汉大学', '本科', '软件工程', '2023.7', '管理员');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `sex`, `brief`, `birthday`, `nameOfShcool`, `education`, `major`, `schoolTime`, `role`) VALUES (108, 'xzy123', '123456', '许智尧', '2021302111081@whu.cn', '18921109286', '武汉大学湖滨2舍', '2023-07-06 22:31:43', 'http://localhost:9090/file/4d6127dbf9344e55a5be7e4a2cfa6d05.jpeg', '男', '当人生起航，健康为舵。', '2003.3.17', '武汉大学', '本科', '软件工程', '2023.7', '用户');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `sex`, `brief`, `birthday`, `nameOfShcool`, `education`, `major`, `schoolTime`, `role`) VALUES (117, 'zjj123', '123456', '朱俊杰', '1763847523@qq.com', '17834157684', '武汉大学文理学部桂园4舍', '2023-07-06 22:32:07', 'http://localhost:9090/file/45d1f32913a34dd98df05d305029485b.jpeg', '男', '在每一次的努力中保持坚持，只有持之以恒，才能取得辉煌的成就。', '2003.5.20', '武汉大学', '本科', '软件工程', '2023.7', '用户');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `sex`, `brief`, `birthday`, `nameOfShcool`, `education`, `major`, `schoolTime`, `role`) VALUES (118, 'hzb123', '123456', '黄昭博', '18674477332@qq.com', '15865548753', '武汉大学计算机学院C-103', '2023-07-07 01:25:46', 'http://localhost:9090/file/a9a19253650349ecade145e38822632e.png', '男', '每一步都是梦想实现的加速器，只有付诸行动，梦想才能成真。', '2003.5.21', '武汉大学', '本科', '软件工程', '2023.7', '用户');
INSERT INTO `sys_user` (`id`, `username`, `password`, `nickname`, `email`, `phone`, `address`, `create_time`, `avatar_url`, `sex`, `brief`, `birthday`, `nameOfShcool`, `education`, `major`, `schoolTime`, `role`) VALUES (119, 'tr123', '123456', '唐瑞', '2021302111091@whu.edu.cn', '15061887123', '武汉大学计算机学院B-303', '2023-07-06 22:52:07', 'http://localhost:9090/file/7580b6341b294e7d920c5da9a3e44850.png', '男', '不满足于现状，勇敢地挑战自己的极限。', '2002.3.17', '武汉大学', '本科', '软件工程', '2023.7', '用户');
COMMIT;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论内容',
  `user_id` int DEFAULT NULL COMMENT '评论人id',
  `time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '评论时间',
  `pid` int DEFAULT NULL COMMENT '父id',
  `origin_id` int DEFAULT NULL COMMENT '最上级评论',
  `article_id` int DEFAULT NULL COMMENT '关联文章的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2101407745 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-2017456126, '的', 98, '2022-07-20 14:49:05', 1514205185, 1514205185, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1967067134, 'sad撒多', 107, '2022-07-19 15:01:53', NULL, NULL, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1904185342, '444', 98, '2022-07-20 05:16:07', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1904091134, '阿萨德撒大', 114, '2022-07-21 10:51:48', -1602195454, -1967067134, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1732243454, '学到了', 118, '2023-07-06 23:33:00', NULL, NULL, 128);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1711206399, 'asd', 107, '2022-07-24 17:54:25', -167649278, -167649278, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1673523199, '阿斯顿撒多', 107, '2022-07-20 14:52:20', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1639968766, '这是回复', 108, '2023-07-06 23:01:52', 1010831361, 1010831361, 128);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1602195454, 'asdsas', 98, '2022-07-20 05:17:04', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1568657407, 'sad ', 107, '2022-07-24 13:40:00', -398446591, 1744887810, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1551835135, '按市场', 107, '2022-07-21 00:42:38', 1644224513, 1644224513, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1438642174, '萨达', 98, '2022-07-20 14:42:33', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1283457023, '213', 107, '2022-07-24 14:29:01', NULL, NULL, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1124012030, '姜晨吃屁', 107, '2022-07-19 14:43:55', NULL, NULL, 7);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1073737727, '一键三连！', 117, '2023-07-06 23:24:32', NULL, NULL, 129);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1073647614, 'sadasdsad', 98, '2022-07-22 13:57:03', -742297599, -398450686, 33);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-1061154815, 'asdad', 107, '2022-07-25 09:42:04', 356519938, 356519938, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-960491518, '我吃吃吃吃吃吃', 118, '2023-07-06 23:32:49', NULL, NULL, 133);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-889184255, 'sad', 107, '2022-07-21 12:23:28', 1119887361, 1119887361, 34);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-865849342, 'asdasdas', 107, '2022-08-09 22:37:38', NULL, NULL, 120);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-851353599, 'asd ', 107, '2022-07-27 20:10:40', NULL, NULL, 115);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-834662398, '单位', 98, '2022-07-20 14:52:05', 1501564930, 2101407745, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-742297599, 'asdsad', 98, '2022-07-22 13:57:00', -398450686, -398450686, 33);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-717221887, '这也是回复', 118, '2023-07-06 23:33:06', 1010831361, 1010831361, 128);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-708833279, 'sad ', 98, '2022-07-20 07:00:30', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-671084542, 'asd', 98, '2022-07-21 09:17:48', -1551835135, 1644224513, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-633270271, 'asd', 107, '2022-07-24 17:54:12', NULL, NULL, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-532668414, '测试', 107, '2022-07-21 16:43:59', 1958797314, 1958797314, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-419426302, '一键三连！！', 117, '2023-07-07 00:45:08', NULL, NULL, 134);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-398450686, 'ass大所', 107, '2022-07-21 12:23:15', NULL, NULL, 33);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-276754431, 'asd', 107, '2022-07-24 17:54:26', NULL, NULL, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-260046847, 'asdasd', 107, '2022-07-24 16:13:30', NULL, NULL, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-222244863, '呈现出', 107, '2022-07-24 20:42:46', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-201322495, 'sadsad', 107, '2022-07-25 10:41:19', 1656754178, 1656754178, 114);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-167649278, '哈哈哈哈哈哈哈哈或或或', 114, '2022-07-21 10:52:31', NULL, NULL, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-138407935, '下次一定', 117, '2023-07-07 00:45:18', -419426302, -419426302, 134);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-138403839, '测试2', 107, '2022-07-21 19:10:51', -532668414, 1958797314, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-73125887, 'sadas', 107, '2022-08-09 22:37:49', 994066434, 637550593, 120);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (-16654335, '红红火火恍恍惚惚或或或或或', 114, '2022-07-21 10:52:52', 1124077570, 1644224513, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (146804737, '这也练的太大了！！', 117, '2023-07-06 23:24:12', NULL, NULL, 131);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (247525378, '真', 107, '2022-07-19 14:43:45', NULL, NULL, 7);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (281141250, '嗷嗷嗷', 114, '2022-07-21 10:51:43', -1967067134, -1967067134, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (356519938, '呃呃呃 ', 107, '2022-07-25 09:00:16', NULL, NULL, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (369102849, '有道理', 107, '2023-07-06 23:00:43', NULL, NULL, 128);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (448798722, '嘿嘿嘿', 107, '2022-07-21 12:23:04', 1698754561, 1698754561, 32);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (453107713, '阿萨德sad撒多撒', 107, '2022-07-19 19:25:47', NULL, NULL, 30);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (574623746, '多多点赞，一键三连！！！', 108, '2023-07-06 23:05:01', NULL, NULL, 129);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (620761089, '太牛逼了', 118, '2023-07-06 23:35:44', NULL, NULL, 129);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (637550593, '测试', 107, '2022-07-29 09:11:04', NULL, NULL, 120);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (645935106, 'sd ', 107, '2022-07-24 13:39:46', 1958797314, 1958797314, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (920924161, 'sadcassad', 107, '2022-08-09 22:37:41', NULL, NULL, 120);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (994066434, '测试222', 114, '2022-07-29 09:11:29', 406863873, 637550593, 120);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1010831361, '博主说的好，继续加油～', 108, '2023-07-06 23:01:43', NULL, NULL, 128);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1086332930, '撒大声地', 107, '2022-07-24 17:13:42', NULL, NULL, 29);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1111490561, '213', 107, '2022-07-24 14:28:59', -1568657407, 1744887810, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1119887361, '阿斯顿撒', 107, '2022-07-21 12:23:24', NULL, NULL, 34);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1124077570, '哈哈哈哈', 107, '2022-07-21 09:18:12', -671084542, 1644224513, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1170214913, '莱维贝贝！！！', 108, '2023-07-06 23:13:33', NULL, NULL, 131);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1266683906, '阿萨德sad撒', 98, '2022-07-20 14:42:47', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1300238338, 'asdasd', 107, '2022-07-25 10:41:16', NULL, NULL, 114);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1304432641, '太强了', 117, '2023-07-06 23:24:19', 1170214913, 1170214913, 131);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1459671041, '阿萨德', 107, '2022-07-24 20:42:54', 281141250, -1967067134, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1501564930, 'sad', 98, '2022-07-20 14:36:32', 2101407745, 2101407745, 35);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1537486849, '奥术大师多', 107, '2022-08-09 22:39:29', NULL, NULL, 123);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1656754178, 'asdsa', 107, '2022-07-25 09:42:43', NULL, NULL, 114);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1698754561, 'sadsadsad', 98, '2022-07-19 14:40:10', NULL, NULL, 32);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1702903809, 'sdsad', 107, '2022-07-29 11:12:20', NULL, NULL, 120);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1744887810, '666', 98, '2022-07-21 01:42:46', NULL, NULL, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (1757429762, 'w ', 107, '2022-07-22 17:27:39', -532668414, 1958797314, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (2038435841, 'asdsa', 107, '2022-07-25 09:41:53', 1744887810, 1744887810, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (2076250114, 'asd', 107, '2022-07-24 17:54:09', NULL, NULL, 19);
INSERT INTO `t_comment` (`id`, `content`, `user_id`, `time`, `pid`, `origin_id`, `article_id`) VALUES (2097221633, 'asdasd', 107, '2022-07-24 17:54:14', NULL, NULL, 19);
COMMIT;

-- ----------------------------
-- Table structure for Team
-- ----------------------------
DROP TABLE IF EXISTS `Team`;
CREATE TABLE `Team` (
  `teamId` int NOT NULL AUTO_INCREMENT,
  `teamName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `teamCreater` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `points` int DEFAULT NULL,
  `bonus` int DEFAULT NULL,
  `theme` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Team
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for Team_Member
-- ----------------------------
DROP TABLE IF EXISTS `Team_Member`;
CREATE TABLE `Team_Member` (
  `teamId` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `isCreater` int DEFAULT NULL,
  PRIMARY KEY (`teamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Team_Member
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章类型id',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文章类型名称',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文章类型概述',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '文章背景图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` (`id`, `name`, `content`, `url`) VALUES (1, '健身经验分享', '以健身经验、干货为主要内容的文章，主要分享健身过程中应该注意的点，有利于推广适度健身、快乐生活', '');
INSERT INTO `type` (`id`, `name`, `content`, `url`) VALUES (2, '健身动作教程', '以健身动作指导、纠正为主要内容的文章，主要介绍健身时合理的发力、肌肉的训练集群等', '');
INSERT INTO `type` (`id`, `name`, `content`, `url`) VALUES (3, '营养补充', '以健身过程中营养补充（各类补剂）、健身餐的选择为主要内容的文章，主要分享健身饮食习惯。', NULL);
INSERT INTO `type` (`id`, `name`, `content`, `url`) VALUES (4, '专业指导', '为专业健美、健体选手提供信息服务，分享比赛动态、备赛指南等', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
