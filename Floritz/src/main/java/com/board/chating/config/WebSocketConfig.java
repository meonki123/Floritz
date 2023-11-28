package com.board.chating.config;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;


@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer{

	@Autowired
	SocketHandler socketHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(socketHandler, "/chating/{roomNumber}");
	}
	 
	@Bean 
	public ServletServerContainerFactoryBean createWebSocketContainer() {
	  ServletServerContainerFactoryBean container = new
	  ServletServerContainerFactoryBean();
	  container.setMaxTextMessageBufferSize(800000);
	  container.setMaxBinaryMessageBufferSize(800000); 
	  return container; 
	  }
	 

}