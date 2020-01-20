<html>
<head>
    <meta charset="utf-8">
    <title>Freemarker入门Demo</title>
</head>
<body>
<#-- include指令：此指令用于模板文件的嵌套 -->
<#include "head.ftl">

<#-- 这是一个注释，不会有任何输出 -->
你好，${name}。${message}! <br>

<#-- assign指令：此指令用于在页面上定义一个变量 -->
<#assign linkman="Christain">
联系人：${linkman} <br>

<#assign info={"mobile":18812345678, "address":"Tokyo"}>
电话：${info.mobile}  地址：${info.address} <br>

<#-- if指令 可以使用 = 也可以使用== -->
<#if success=true>
    你也通过实名认证
<#else >
    你未通过实名认证
</#if>
<br>

<#-- list指令 -->
----商品列表----<br>
<#list goodsList as goods>
    ${goods_index + 1} 商品名称：${goods.name}  商品价格：${goods.price} <br>
</#list>

<#-- 内建函数： 变量+?+函数名称 -->
<#-- 获取集合的大小: size-->
共${goodsList?size}条记录 <br>

<#-- 转换JSON字符串为对象: eval-->
<#assign text="{'bank':'工商银行','account':'10101920201920212'}" >
<#assign data=text?eval>
开户行：${data.bank}  账号:${data.account} <br>

<#-- 日期格式化 -->
当前日期：${today?date}<br>
当前时间：${today?time}<br>
当前日期+时间：${today?datetime}<br>
日期格式化：${today?string("yyyy年MM月")}<br>
当前时间戳：${timestamp}<br>

<#-- 数字转换为字符串
    数字会以每三位一个分隔符显示，
    不需要这个分隔符，需要将数字转换为字符串,使用内建函数c
-->
累计积分：${point}<br>
累计积分：${point?c}<br>

<#-- 空值处理运算符
    如果在模板中使用了变量但是在代码中没有对变量赋值，那么运行生成时会抛出异常。
    但是有些时候，有的变量确实是null，怎么解决这个问题呢？
    判断某变量是否存在: 用法为:variable??,如果该变量存在,返回true,否则返回false
    缺失变量默认值:“!”，
    除了可以判断是否为空值，也可以使用!对null值做转换处理,为null则返回！后边的内容

-->
<#if aaa??>
    aaa变量存在
<#else >
    aaa变量不存在
</#if>
<br>

${aaa!'-'}<br>

<#-- 运算符
1. 算术运算符包括:+, - , * , / , %
2. 逻辑运算符：&& || ! 只能作用于布尔值,否则将产生错误
3. 比较运算符：=或者==、!=、>或者gt、>=或者gte、<或者lt、<=或者lte

注意:
=和!=可以用于字符串,数值和日期来比较是否相等,但=和!=两边必须是相同类型的值,否则会产生错误
FreeMarker是精确比较,"x","x ","X"是不等的.
其它的运行符可以作用于数字和日期,但不能作用于字符串
大部分的时候,使用gt等字母运算符代替>会有更好的效果,因为 FreeMarker会把>解释成FTL标签的结束字符,
当然,也可以使用括号来避免这种情况,如:<#if (x>y)>
-->
</body>
</html>