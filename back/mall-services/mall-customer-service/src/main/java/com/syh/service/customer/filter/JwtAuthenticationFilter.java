package com.syh.service.customer.filter;

import com.syh.mall.utils.JwtUtils;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = request.getHeader("Authorization");

        // 验证令牌的有效性 (这里需要实现具体的验证逻辑)
        boolean valid = JwtUtils.valid(token)==JwtUtils.TOKEN_VALID_SUCCESS;
        if (valid) {
            Long id = JwtUtils.getIdByToken(token);
            List<String> roleList = JwtUtils.getRolesByToken(token);
            List<String> authorityList=JwtUtils.getAuthoritiesByToken(token);
            List<SimpleGrantedAuthority> roles = roleList.stream()
                    .map(role -> new SimpleGrantedAuthority("ROLE_" + role))
                    .toList();

            List<SimpleGrantedAuthority> authorities = authorityList.stream()
                    .map(SimpleGrantedAuthority::new)
                    .toList();

            // 合并角色和权限列表
            List<SimpleGrantedAuthority> combinedAuthorities = Stream.concat(roles.stream(), authorities.stream())
                    .collect(Collectors.toList());
            // 如果令牌有效, 设置认证信息到SecurityContext
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                    id, // 在这里可以设置一个认证前的principal对象
                    null, // 通常这里是credentials信息，对于JWT认证可以置为null
                    combinedAuthorities  // 这里是权限信息（GrantedAuthority），可以从JWT解析得到
            );
            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }

        filterChain.doFilter(request, response);
    }
}
