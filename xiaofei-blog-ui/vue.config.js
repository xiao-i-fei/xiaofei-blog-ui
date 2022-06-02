module.exports = {
    transpileDependencies: ["vuetify"],
    //关闭代码检查
    lintOnSave: false,
    devServer: {
        port: 80,
        proxy: {
            "/api": {
                target: "http://localhost:8080",
                changeOrigin: true,
                pathRewrite: {
                    "^/api": ""
                }
            }
        },
        disableHostCheck: true
    },
    productionSourceMap: false,
    css: {
        extract: true,
        sourceMap: false
    }
};
