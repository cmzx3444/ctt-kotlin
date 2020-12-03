package com.ctt.pub.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;

@Slf4j
public class Jwt {
    private final JwtProperties prop;

    public Jwt(JwtProperties prop) {
        this.prop = prop;
    }

    public DecodedJWT verify(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(prop.getSecret());
            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer("lrc")
                    .build();
            return verifier.verify(token);
        } catch (TokenExpiredException ignored) {
            return null;
        } catch (JWTVerificationException e) {
            log.error("jwt verify failed token: " + token, e);
            return null;
        }
    }

    public String token(String name, String value) {
        Algorithm algorithm = Algorithm.HMAC256(prop.getSecret());
        return JWT.create()
                .withIssuer("lrc")
                .withExpiresAt(new Date(new Date().getTime() + prop.getExpires()))
                .withClaim(name, value)
                .sign(algorithm);
    }

    public String token(String name, Integer value) {
        Algorithm algorithm = Algorithm.HMAC256(prop.getSecret());
        return JWT.create()
                .withIssuer("lrc")
                .withExpiresAt(new Date(new Date().getTime() + prop.getExpires()))
                .withClaim(name, value)
                .sign(algorithm);
    }
}
