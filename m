Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web12.19304.1599568692098443898
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 05:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oeFNigxd;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ciVtucfQFL2IOl0Ay0JFSNTFKkX2TuGf+LCcJ/8QrY=;
 b=oeFNigxdf/F4WDWfR7DF90338lxAGbBDgqljP5zzcMcZNm0vxk58apdWqKBhVQtacqphP/2wk9xu8JMWzGll6itktuLdW5rRYzeAakWAcUjBcMzkyrrLlL939vd3EpnfRlNUmmvLyToxnVo3ce49r2jw+33M+s+1IxoytiiahhQ=
Received: from AM5PR0601CA0029.eurprd06.prod.outlook.com
 (2603:10a6:203:68::15) by HE1PR0801MB1850.eurprd08.prod.outlook.com
 (2603:10a6:3:86::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 12:38:09 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::9a) by AM5PR0601CA0029.outlook.office365.com
 (2603:10a6:203:68::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Tue, 8 Sep 2020 12:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 12:38:08 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Tue, 08 Sep 2020 12:38:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 164c68e3e2f84e43
X-CR-MTA-TID: 64aa7808
Received: from d08f10fcdb01.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 913D1BB5-D193-4752-BC2E-A3743CA8D283.1;
	Tue, 08 Sep 2020 12:38:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d08f10fcdb01.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 12:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjApJRKE10gQbWkNbvIRhrHuI3dSQfZu6GcQutfojVg8yAeQWAiwXvtv6NUkcURFeXS/ebID/QjCBmSpEsTmlnp8FR/ugDKEZHo5U8wkTceloOSsj2Imkpj2E/RLtbIKyfXH2NJVg3KJlyPCftIBLZv/9v1jwKuuz/gDJfU1vFt+kJZovssfyP1Bj3zbEyxVlbfLd45s5DyZhbBenMsiWjdSoU0tXdnmABhs3ZQu3jts5fnUvCc9de9SoY66IdYF8GuMUJB3no50lYhkV8U8/4p3qfCm02jVaNbShoqY9e/DNSfmP3f/+CeylmZpLKSl8NcRw93avFZ9t19QLLuxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ciVtucfQFL2IOl0Ay0JFSNTFKkX2TuGf+LCcJ/8QrY=;
 b=dOsu5QVhnUgikQOjIYvLj2FiFEuQZCE1HyULmKABwsqU8v50Umsd0i98IlyDIAu5ZgLCp/i3RzYDmIdqSds17QV92CkGaXzikK/Jm3qw6pzxgD4GYfKnz+APs1+r1N/q6fOOqEIVzz/wk34xieWwCTlpdbzlw8s1tCXXiloofQNEtw7zIuIguyjo8DUh/NkgFIvSRN5Cq+yqdJoBTIxQZ1Ytv/V0827kF/ZEh5Ck4o34vfFzOs0bj1lwtctd8AGiBqIxrOlAbWHtXjuKjJ5DurX2OjFPV3DWAzby1IGY5ZO+qejGLSlrVVWyaXd7opPzRCVu72VUhfcvoQnJxMqYdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ciVtucfQFL2IOl0Ay0JFSNTFKkX2TuGf+LCcJ/8QrY=;
 b=oeFNigxdf/F4WDWfR7DF90338lxAGbBDgqljP5zzcMcZNm0vxk58apdWqKBhVQtacqphP/2wk9xu8JMWzGll6itktuLdW5rRYzeAakWAcUjBcMzkyrrLlL939vd3EpnfRlNUmmvLyToxnVo3ce49r2jw+33M+s+1IxoytiiahhQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 8 Sep
 2020 12:38:01 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 12:38:01 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] ref-manual: document authentication key variables
Date: Tue,  8 Sep 2020 13:29:12 +0100
Message-Id: <20200908122912.39196-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::24) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 12:38:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef1dabc0-b8bc-4515-57f5-08d853f40a53
X-MS-TrafficTypeDiagnostic: DBAPR08MB5592:|HE1PR0801MB1850:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1850E7BCB2F87A89C547F09892290@HE1PR0801MB1850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QJWq4q9qE9XBeAQwp7fwHkpLvinKMV8M93aK6LMFPYho+PpB5+LhjsOSsT0Q4GYxICMnfvH90YCTi6e/mUqXr3JhS64WMeWvtBCV+AewNQsFHGFnk2XFiCmVbcecLahwVLK1fLc98plWOMjvAgpIuD3++6lLE0W7mJwcsHVomkJSa/oYUCU8lzaMNVItzy76u39UOlcsl3SSXdaFHtPjJLrSaG+NtrgACbTVhz4puIzpnNC9aw9MNojwI2KKoq2cVDTQhlMU8zn93M0ag/DyJ7/1oeWzMyvA54/KvXQVmjo6PDKs0LCdq+SefenmHbtz
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(1076003)(7696005)(52116002)(316002)(26005)(83380400001)(4326008)(6666004)(2906002)(36756003)(8676002)(5660300002)(6486002)(66556008)(66476007)(66946007)(16526019)(86362001)(44832011)(478600001)(186003)(6916009)(2616005)(956004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UcTZgVbOjGf8wmQeyEvGo5GehuWvr6raezQu/1JiGX4s8naFYWeXAOPVTBZ5RR8V8Ilq1NWOXngE9xkv9MVyBF5YUIfzB8FMM3ZNpe9Cgyg6Gyv01pi1QB4hKdoj59SagnJ9E+3KBPAjHe+cqCXHlEhx7EmJ3RxLfCeabXAjfAQQvo64F+X1E8pyk5qtnwwoNHHHHWZPwX/kw2zAbPZ0yNDuU9U2k+mD1NGibdQgNVGLcCxkCDosIR6J8sw5OIrLXihzys2bDsu/gHPU5NaGPqc4w8tH5b5oou904MOISHVc9J37Md4k6z0vxOH89e4y11rBSniwm1aBHhkUbNto0VqOXVq31OFiWqLZCMgE4vv9GXQSoBC8bkVpbUr7ttG/TqJ7kVUIxZL1l33G/x4/1dVdeEchcJVQ2ezKUlCJOWx/OBmevXZaLueDcZXIJeRtlSyoKbBBbbfSxFNEIg1lo86PJ4OUy/P1A4D2Do//OKQH9YI2j0KZZ4XCsARV1a1XZRXbjNYj14PfpTxKfcaWHSmftynlELcvynTkOPWjHoJoYAf68Vi/jwdUkOOOQYXkU4TwjmwQAhNWbwBOeNk8xxnRgIOrhhf1CQrgwgTsE+ComkpPzVmvQNPGIF2/OxTlKgQWtrJU46sHLgdK6R3Jcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	761bd4a1-f81b-4211-b0b7-08d853f405de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZFxcEYP88YVM48TP0FKeG2OE2oPGObtRWMlcewl3ddRf6HTm95pi6k5H1G+0qUrNZwCMkmGr2AK5QxQWTe6pzj+qW7zKH/pt1WaZ9wXkAaXJulVN0MqKOFJ1w8hi4bLKdcteCQFKtBwc0Q62fWDp6gSa8hve7DBB2uHk8GzJNVHodGXwTTCVSFO0H4NNX1EZaHjmmuQk842ONiq5UIB/3pd0JJyOYphk2zf8ChfiiojmtV/v7IU71C2ot0z+DKbI73bylYylQiWlrqXIp2I8sKzf3NnHlFB0LNw9uqaB5qNuDCxr5fsz6l5umMFp7oylj4b29NSPKBmk+eWHu9OwFdUQ9gcMcKyfmpwBYZ56hHgWW+6NBJB//x17sWqvAuRv9/Ia9bvDBQo7fKJt8Jr8VQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(47076004)(4326008)(6486002)(82740400003)(83380400001)(5660300002)(70586007)(356005)(81166007)(2906002)(336012)(7696005)(1076003)(70206006)(26005)(16526019)(186003)(8936002)(2616005)(478600001)(86362001)(6916009)(316002)(36906005)(8676002)(82310400003)(44832011)(6666004)(956004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 12:38:08.2125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1dabc0-b8bc-4515-57f5-08d853f40a53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1850
Content-Type: text/plain

This documents the variables used to create keys for
signing fitImage.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 documentation/ref-manual/ref-classes.xml   |  7 ++-
 documentation/ref-manual/ref-variables.xml | 67 ++++++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index 1dcd5fdd03..03151c10bf 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -1953,7 +1953,12 @@ This check was removed for YP 2.3 release
         and
         <filename><link linkend='var-FIT_SIGN_ALG'>FIT_SIGN_ALG</link></filename>
         in <filename>kernel-fitimage</filename> are "sha256" and "rsa2048"
-        respectively.
+        respectively. The keys for signing fitImage can be generated using the
+        <filename>kernel-fitimage</filename> class when both
+        <filename><link linkend='var-FIT_GENERATE_KEYS'>FIT_GENERATE_KEYS</link></filename>
+        and
+        <filename><link linkend='var-UBOOT_SIGN_ENABLE'>UBOOT_SIGN_ENABLE</link></filename>
+        are set to "1".
     </para>
 
 </section>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index a5064807e5..2c9f551077 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -4991,6 +4991,22 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-FIT_GENERATE_KEYS'><glossterm>FIT_GENERATE_KEYS</glossterm>
+            <info>
+               FIT_GENERATE_KEYS[doc] = "Decides whether to generate the keys for signing fitImage"
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Decides whether to generate the keys for signing fitImage
+                    if they don't already exist. The keys are created in
+                    <filename><link linkend='var-UBOOT_SIGN_KEYDIR'>UBOOT_SIGN_KEYDIR</link></filename>.
+                    The default value is "1" if
+                    <filename><link linkend='var-UBOOT_SIGN_ENABLE'>UBOOT_SIGN_ENABLE</link></filename>
+                    is set to "1", otherwise "0".
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-FIT_HASH_ALG'><glossterm>FIT_HASH_ALG</glossterm>
             <info>
                FIT_HASH_ALG[doc] = "Specifies the hash algorithm used in creating the FIT Image."
@@ -5015,6 +5031,57 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-FIT_SIGN_NUMBITS'><glossterm>FIT_SIGN_NUMBITS</glossterm>
+            <info>
+               FIT_SIGN_NUMBITS[doc] = "Size of private key in number of bits."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Size of private key in number of bits used in fitImage.
+                    The default value is "2048".
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-FIT_KEY_GENRSA_ARGS'><glossterm>FIT_KEY_GENRSA_ARGS</glossterm>
+            <info>
+               FIT_KEY_GENRSA_ARGS[doc] = "Arguments to openssl genrsa for generating RSA private key."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Arguments to openssl genrsa for generating RSA private key
+                    for signing fitImage.
+                    The default value is "-F4". i.e. the public exponent 65537 to use.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-FIT_KEY_REQ_ARGS'><glossterm>FIT_KEY_REQ_ARGS</glossterm>
+            <info>
+               FIT_KEY_REQ_ARGS[doc] = "Arguments to openssl req for generating certificate."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Arguments to openssl req for generating certificate for
+                    signing fitImage.
+                    The default value is "-batch -new". batch for non interactive mode
+                    and new for generating new keys.
+                </para>
+            </glossdef>
+        </glossentry>
+
+        <glossentry id='var-FIT_KEY_SIGN_PKCS'><glossterm>FIT_KEY_SIGN_PKCS</glossterm>
+            <info>
+               FIT_KEY_SIGN_PKCS[doc] = "Format for public key ceritifcate."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+                    Format for public key ceritifcate used in signing fitImage.
+                    The default value is "x509".
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-FONT_EXTRA_RDEPENDS'><glossterm>FONT_EXTRA_RDEPENDS</glossterm>
             <info>
                 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
-- 
2.17.1

