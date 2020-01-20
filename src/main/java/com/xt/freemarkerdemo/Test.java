package com.xt.freemarkerdemo;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.time.LocalDateTime;
import java.util.*;

/**
 * @author xt
 * @create 2020/1/20 15:37
 * @Desc
 */
public class Test {
    public static void main(String[] args) throws IOException, TemplateException {
        // 1.创建配置类
        Configuration configuration = new Configuration(Configuration.getVersion());
        // 2.设置模板所在的目录
        configuration.setDirectoryForTemplateLoading(new File("D:\\ideaProjects\\freemarker-demo\\src\\main\\resources\\templates\\"));
        // 3. 设置字符集
        configuration.setDefaultEncoding("utf-8");
        // 4.加载模板
        Template template = configuration.getTemplate("test.ftl");
        // 5.创建数据模型
        Map map = new HashMap();
        map.put("name", "Sanae");
        map.put("message", "欢迎来到我的世界！");
        map.put("success", false);

        List<Map> goodsList = new ArrayList();
        Map<String, Object> goods1 = new HashMap();
        goods1.put("name", "苹果");
        goods1.put("price", 5.8);
        Map<String, Object> goods2 = new HashMap();
        goods2.put("name", "香蕉");
        goods2.put("price", 2.5);
        Map<String, Object> goods3 = new HashMap();
        goods3.put("name", "橘子");
        goods3.put("price", 3.2);
        goodsList.add(goods1);
        goodsList.add(goods2);
        goodsList.add(goods3);
        map.put("goodsList", goodsList);
        map.put("today", new Date());
        map.put("timestamp", LocalDateTime.now());
        map.put("point", 102920122);

        // 6.创建Writer对象
        Writer writer = new FileWriter("D:\\test.html");
        // 7.输出
        template.process(map, writer);
        // 8.关闭Writer对象
        writer.close();
    }
}
