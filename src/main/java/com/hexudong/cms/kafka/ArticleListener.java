package com.hexudong.cms.kafka;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.listener.MessageListener;

import com.alibaba.fastjson.JSON;
import com.hexudong.cms.dao.ArticleMapper;
import com.hexudong.cms.pojo.Article;

public class ArticleListener implements MessageListener<String,String>{
	
	@Autowired
	ArticleMapper articleMapper;
	
	//监听消息的方法
	public void onMessage(ConsumerRecord<String, String> data) {
		System.err.println("收到了消息");
		
		String jsonString = data.value();
		//由于jsonString是json类型的字符串,我们需要把它转成文章类型,然后保存到数据库
		Article article = JSON.parseObject(jsonString, Article.class);
		
		//直接注入articleMapper然后就能直接调用保存方法
		articleMapper.insert(article);
		System.err.println("保存了文章到MySQL数据库.........");
	}

}
