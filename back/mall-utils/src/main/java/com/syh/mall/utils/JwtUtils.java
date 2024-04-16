package com.syh.mall.utils;


import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SecureDigestAlgorithm;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.time.Instant;
import java.util.*;


public class JwtUtils {
    public static final int TOKEN_INVALID=-1;
    public static final int TOKEN_OUT_OF_TIME=0;
    public static final int TOKEN_VALID_SUCCESS=1;

    public static final SecretKey KEY = Keys.hmacShaKeyFor("MDk4ZjZiY2Q0NjIxZDM3M2NhZGU0ZTgzMjYyN2I0ZjY".getBytes());
    public static final String SUBJECT="MALL-AUTH";
    public static final String JWT_ISS="MALL-ADMIN";
    public static final long ACCESS_EXPIRE=60*30*1000;
    private final static SecureDigestAlgorithm<SecretKey, SecretKey> ALGORITHM = Jwts.SIG.HS256;
    // 生产ID
    public static String genTokenByIdAndRolesAndAuthorities(Long id,List<String> roles,List<String> authorities){
        String uuid = UUID.randomUUID().toString();
        return Jwts.builder()
                // 设置头部信息header
                .header()
                .add("typ", "JWT")
                .add("alg", "HS256")
                .and()
                // 设置自定义负载信息payload
                .claim("id", id)
                .claim("roles",roles)
                .claim("authorities",authorities)
                // 令牌ID
                .id(uuid)
                // 过期日期
                .expiration(new Date(System.currentTimeMillis()+ACCESS_EXPIRE))
                // 签发时间
                .issuedAt(new Date())
                // 主题
                .subject(SUBJECT)
                // 签发者
                .issuer(JWT_ISS)
                // 签名
                .signWith(KEY, ALGORITHM)
                .compact();
    }


    public static Jws<Claims> parseClaim(String token) {
        return Jwts.parser()
                .verifyWith(KEY)
                .build()
                .parseSignedClaims(token);
    }


    public static Claims parsePayload(String token) {
        return parseClaim(token).getPayload();
    }
    public static Long getIdByToken(String token){
        return Long.parseLong(parsePayload(token).get("id").toString());
    }
    public static List<String> getRolesByToken(String token){
        return (List<String>) parseClaim(token).getPayload().get("roles");
    }
    public static List<String> getAuthoritiesByToken(String token){
        return (List<String>) parseClaim(token).getPayload().get("authorities");
    }
    public static int valid(String token){
        try {
            Claims claims = parsePayload(token);
            if(claims.getExpiration().getTime()-new Date().getTime()>ACCESS_EXPIRE){
                return TOKEN_OUT_OF_TIME;
            }
            return TOKEN_VALID_SUCCESS;
        }catch (Exception e){
            return TOKEN_INVALID;
        }

    }


}
