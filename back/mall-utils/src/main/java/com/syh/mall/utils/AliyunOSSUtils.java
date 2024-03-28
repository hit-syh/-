package com.syh.mall.utils;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.common.auth.CredentialsProviderFactory;
import com.aliyun.oss.common.auth.EnvironmentVariableCredentialsProvider;
import com.aliyun.oss.model.PutObjectResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.UUID;
@Slf4j
public class AliyunOSSUtils {

    //    public static void main(String[] args) throws Exception {
//         // Endpoint以华东1（杭州）为例，其它Region请按实际情况填写。
//        String endpoint = "https://oss-cn-beijing.aliyuncs.com";
//        // 从环境变量中获取访问凭证。运行本代码示例之前，请确保已设置环境变量OSS_ACCESS_KEY_ID和OSS_ACCESS_KEY_SECRET。
//        EnvironmentVariableCredentialsProvider credentialsProvider = CredentialsProviderFactory.newEnvironmentVariableCredentialsProvider();
//        // 填写Bucket名称，例如examplebucket。Bucket名称在OSS范围内必须全局唯一。
//        String bucketName = "ctc-mall-product-images";
//
//        // 创建OSSClient实例。
//        OSS ossClient = new OSSClientBuilder().build(endpoint, credentialsProvider);
//
//        try {
//            // 创建存储空间。
//            ossClient.createBucket(bucketName);
//
//        } catch (OSSException oe) {
//            System.out.println("Caught an OSSException, which means your request made it to OSS, "
//                    + "but was rejected with an error response for some reason.");
//            System.out.println("Error Message:" + oe.getErrorMessage());
//            System.out.println("Error Code:" + oe.getErrorCode());
//            System.out.println("Request ID:" + oe.getRequestId());
//            System.out.println("Host ID:" + oe.getHostId());
//        } catch (ClientException ce) {
//            System.out.println("Caught an ClientException, which means the client encountered "
//                    + "a serious internal problem while trying to communicate with OSS, "
//                    + "such as not being able to access the network.");
//            System.out.println("Error Message:" + ce.getMessage());
//        } finally {
//            if (ossClient != null) {
//                ossClient.shutdown();
//            }
//        }
//    }
    static String ossPath="https://ctc-mall-product-images.oss-cn-beijing.aliyuncs.com/";
    static String endpoint = "https://oss-cn-beijing.aliyuncs.com";
    // 从环境变量中获取访问凭证。运行本代码示例之前，请确保已设置环境变量OSS_ACCESS_KEY_ID和OSS_ACCESS_KEY_SECRET。
    static EnvironmentVariableCredentialsProvider credentialsProvider;

    static {
        try {
            credentialsProvider = CredentialsProviderFactory.newEnvironmentVariableCredentialsProvider();
        } catch (com.aliyuncs.exceptions.ClientException e) {
            throw new RuntimeException(e);
        }
    }

    // 填写Bucket名称，例如examplebucket。
    static String bucketName = "ctc-mall-product-images";
    // 填写Object完整路径，例如exampledir/exampleobject.txt。Object完整路径中不能包含Bucket名称。
    static OSS ossClient = new OSSClientBuilder().build(endpoint, credentialsProvider);
    public static String fileUpload(MultipartFile file){
        UUID uuid = UUID.randomUUID();
        String originName = file.getOriginalFilename();
        String ednFix=originName.substring(originName.lastIndexOf('.'));
        String name=uuid+ednFix;

        try {
            ossClient.putObject(bucketName, name, file.getInputStream());
        }catch (Exception e){
            log.error("OSS上传失败"+e.getMessage());
            return null;
        }
        return ossPath+name;
    }
}