//package com.ctt.api.service
//
//import com.ctt.api.repository.UserRepo
//import com.ctt.model.entity.User
//import kotlinx.coroutines.GlobalScope
//import kotlinx.coroutines.launch
//import org.springframework.stereotype.Service
//import org.springframework.transaction.annotation.Transactional
//import java.util.concurrent.ExecutorService
//import java.util.concurrent.Executors
//
//@Service
//class UserService(val userRepo: UserRepo) {
//    val executorService: ExecutorService = Executors.newFixedThreadPool(1);
//
//    @Transactional
//    suspend fun createUser(userService: UserService): User? {
//        println("UserService thread ${Thread.currentThread().id}")
//        val u = User(
//                username = "username2",
//                password = "password2",
//                nickname = "nickname2",
//                mobile = "mobile2"
//        );
//        userRepo.save(u)
//
//        executorService.submit {
//            GlobalScope.launch {
//                run {
//                    userService.save()
//                }
//            }
//        };
//        val user = userRepo.findByNickname("oU63z5AqBbCcWE7d8xC_8OMOukzI")
//        return user;
//    }
//
//    @Transactional
//    suspend fun save() {
//        println("UserService save thread ${Thread.currentThread().id}")
//        val u3 = User(
//                username = "username3",
//                password = "password3",
//                nickname = "nickname3",
//                mobile = "mobile3"
//        );
//        userRepo.save(u3)
//        val u4 = User(
//                username = "username4",
//                password = "password4",
//                nickname = "nickname4",
//                mobile = "mobile4"
//        );
//        userRepo.save(u4)
//    }
//}