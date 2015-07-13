# test
测试使用客户端创建代码仓库，push到远程服务器
## hello my first git repository
    *1.创建本地仓库，提交更改
    *2.push到远程服务器
    *3.==============
    *4. i'll delete the sentence soon~~
    *5. change on dev..
    *n. change on master..
    *n+2. 这样对模块化开发很有帮助..
    *n+3. another guy join in.
    ===========- (NSData *) RSAEncryptDataUsingKey:(NSData *)certificateData
{
    SecKeyRef publicKey;
    SecTrustRef trust;
    size_t maxPlainLen;
 
    NSString *str1 = [HTBase64 encode:certificateData];
    NSData *data = [HTBase64 decode:str1];
    NSLog(@"%@", [HTBase64 decodeString:RSA_KEY_BASE64]);
    SecCertificateRef certificate = SecCertificateCreateWithData(NULL, (CFDataRef)data);
    NSLog(@"%@", (NSString *)SecCertificateCopySubjectSummary(certificate));
    if (certificate == nil) {
        NSLog(@"Can not read certificate from pub.der");
        return nil;
    }
 
    SecPolicyRef policy = SecPolicyCreateBasicX509();
    OSStatus returnCode = SecTrustCreateWithCertificates(certificate, policy, &trust);
    if (returnCode != 0) {
        NSLog(@"SecTrustCreateWithCertificates fail. Error Code: %ld", returnCode);
        return nil;
    }
 
    SecTrustResultType trustResultType;
    returnCode = SecTrustEvaluate(trust, &trustResultType);
    if (returnCode != 0) {
        NSLog(@"SecTrustEvaluate fail. Error Code: %ld", returnCode);
        return nil;
    }
 
    publicKey = SecTrustCopyPublicKey(trust);
    if (publicKey == nil) {
        NSLog(@"SecTrustCopyPublicKey fail");
        return nil;
    }
 
    maxPlainLen = SecKeyGetBlockSize(publicKey) - 12;
 
    size_t plainLen = [self length];
    if (plainLen > maxPlainLen) {
        NSLog(@"content(%ld) is too long, must < %ld", plainLen, maxPlainLen);
        return nil;
    }
 
    void *plain = malloc(plainLen);
    [self getBytes:plain
               length:plainLen];
 
    size_t cipherLen = 128; // 当前RSA的密钥长度是128字节
    void *cipher = malloc(cipherLen);
 
    returnCode = SecKeyEncrypt(publicKey, kSecPaddingPKCS1, plain,
                                        plainLen, cipher, &cipherLen);
 
    NSData *result = nil;
    if (returnCode != 0) {
        NSLog(@"SecKeyEncrypt fail. Error Code: %ld", returnCode);
    }
    else {
        result = [NSData dataWithBytes:cipher
                                length:cipherLen];
    }
 
    free(plain);
    free(cipher);
    CFRelease(certificate);
    CFRelease(trust);
    CFRelease(policy);
    CFRelease(publicKey);
 
    return result;
}===============
