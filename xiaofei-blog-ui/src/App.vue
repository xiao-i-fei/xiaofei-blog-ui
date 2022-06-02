<template>
    <v-app id="app">
        <!-- 导航栏 -->
        <TopNavBar></TopNavBar>
        <!-- 侧边导航栏 -->
        <SideNavBar></SideNavBar>
        <!-- 内容 -->
        <!-- 原项目使用的是将v-main变为v-context，但是使用v-context，项目会报警告。
        警告内容：'v-content' is deprecated, use 'v-main' instead.【'v-content' 已弃用，请改用 'v-main'】 -->
        <v-main>
            <router-view :key="$route.fullPath"/>
        </v-main>
        <!-- 页脚 -->
        <Footer></Footer>
        <!-- 返回顶部 -->
        <BackTop></BackTop>
        <!-- 搜索模态框 -->
        <searchModel></searchModel>
        <!-- 登录模态框 -->
        <LoginModel></LoginModel>
        <!-- 注册模态框 -->
        <RegisterModel></RegisterModel>
        <!-- 忘记密码模态框 -->
        <ForgetModel></ForgetModel>
        <!-- 绑定邮箱模态框 -->
        <EmailModel></EmailModel>
        <!-- 音乐播放器：整合网易云，需要一个id，目前不知id是何值，先将音乐播放组件注释 -->
        <!--<Player v-if="blogInfo.websiteConfig.isMusicPlayer == 1 && !isMobile"/>-->
        <!-- 聊天室【这里先将聊天室功能注释掉，聊天的话需要整合：website】 -->
        <!--<ChatRoom v-if="blogInfo.websiteConfig.isChatRoom == 1"></ChatRoom>-->
    </v-app>
</template>

<script>
import TopNavBar from "./components/layout/TopNavBar";
import SideNavBar from "./components/layout/SideNavBar";
import Footer from "./components/layout/Footer";
import BackTop from "./components/BackTop";
import searchModel from "./components/model/SearchModel";
import LoginModel from "./components/model/LoginModel";
import RegisterModel from "./components/model/RegisterModel";
import ForgetModel from "./components/model/ForgetModel";
import EmailModel from "./components/model/EmailModel";
import Player from "./components/zw-player/player.vue";
import ChatRoom from "./components/ChatRoom";

export default {
    created() {
        // 获取博客信息
        this.getBlogInfo();
        // 上传访客信息
        this.axios.post("/api/report");
    },
    components: {
        TopNavBar,
        Player,
        SideNavBar,
        Footer,
        BackTop,
        searchModel,
        LoginModel,
        RegisterModel,
        ForgetModel,
        EmailModel,
        ChatRoom
    },
    methods: {
        getBlogInfo() {
            this.axios.get("/api/").then(({data}) => {
                this.$store.commit("checkBlogInfo", data.data);
            });
        }
    },
    computed: {
        blogInfo() {
            return this.$store.state.blogInfo;
        },
        isMobile() {
            const flag = navigator.userAgent.match(
                /(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i
            );
            return flag;
        }
    }
};
</script>
