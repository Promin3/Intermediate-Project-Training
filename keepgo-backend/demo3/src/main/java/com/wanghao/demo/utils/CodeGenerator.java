//package com.wanghao.demo.utils;
//
//import com.baomidou.mybatisplus.generator.FastAutoGenerator;
//import com.baomidou.mybatisplus.generator.config.OutputFile;
//import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;
//
//import java.util.Collections;
//
///**
// * by xzy
// */
//public class CodeGenerator {
//    public static void main(String[] args) {
//        generate();
//    }
//    private static  void generate() {
//
//        FastAutoGenerator.create("jdbc:mysql://localhost:3306/KG?serverTimezone=GMT%2b8", "root", "Xzy030317")
//                .globalConfig(builder -> {
//                    builder.author("许智尧") // 设置作者
//                            .enableSwagger() // 开启 swagger 模式
//                            .fileOverride() // 覆盖已生成文件
//                            .outputDir("/Users/autt/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat/2.0b4.0.9/d56044650f5ba17854bf91bfa00f761b/Message/MessageTemp/09f0bd7ce5f477ee6823c7a968cf36f2/File/demo3/src/main/java"); // 指定输出目录
//                })
//                .packageConfig(builder -> {
//                    builder.parent("com.xzy.demo") // 设置父包名
//                            .moduleName(null) // 设置父包模块名
//                            .pathInfo(Collections.singletonMap(OutputFile.mapperXml, "/Users/autt/Library/Containers/com.tencent.xinWeChat/Data/Library/Application Support/com.tencent.xinWeChat/2.0b4.0.9/d56044650f5ba17854bf91bfa00f761b/Message/MessageTemp/09f0bd7ce5f477ee6823c7a968cf36f2/File/demo3/src/main/resources/mapper")); // 设置mapperXml生成路径
//                })
//                .strategyConfig(builder -> {
//                    builder.entityBuilder().enableLombok();
//                    builder.controllerBuilder().enableHyphenStyle()
//                            .enableRestStyle();
//                    builder.addInclude("KG") // 设置需要生成的表名
//                            .addTablePrefix("t_", "sys_"); // 设置过滤表前缀
//                })
//                //.templateEngine(new FreemarkerTemplateEngine()) // 使用Freemarker引擎模板，默认的是Velocity引擎模板
//                .execute();
//    }
//}
