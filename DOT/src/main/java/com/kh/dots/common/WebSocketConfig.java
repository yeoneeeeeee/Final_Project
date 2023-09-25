package com.kh.dots.common;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        // 클라이언트에서 메시지를 보내거나 받을 때 사용할 메시지 브로커를 구성합니다.
        config.enableSimpleBroker("/topic");
        // 서버로 메시지를 보낼 때 사용할 프리픽스를 설정합니다.
        config.setApplicationDestinationPrefixes("/app");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // WebSocket 엔드포인트를 등록합니다. 클라이언트는 이 엔드포인트를 사용하여 WebSocket 연결을 설정합니다.
        registry.addEndpoint("/websocket").setAllowedOriginPatterns("*")
        		.addInterceptors(new HttpSessionHandshakeInterceptor())
        		.withSockJS();
    }
}


