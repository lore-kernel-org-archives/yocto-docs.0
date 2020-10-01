Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.87])
 by mx.groups.io with SMTP id smtpd.web11.8635.1601544469085458738
 for <docs@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 02:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=533i9XGN;
 spf=pass (domain: arm.com, ip: 40.107.9.87, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/6fdS8Dsho6UCxt0/Bik7U0rtrOnolSTWgVCGLJm1E=;
 b=533i9XGNu26sjMq/Ka3yk4kuBpcdm7Jz/7tWR9E+naivdt21iNBmhSrwEBnh/v5em5u0KKSdi7l+JtqDACsk9Q251ys7mLs/Rqry8dzI6NgO8XyJP6f7TX3BlgjE2bVJqXg49+qy1EC8VtaFjaHhZ+t9/mMumdxaoyk/5nDUuH8=
Received: from LO2P265CA0027.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::15)
 by PR2PR08MB4633.eurprd08.prod.outlook.com (2603:10a6:101:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 1 Oct
 2020 09:27:41 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:600:61:cafe::cf) by LO2P265CA0027.outlook.office365.com
 (2603:10a6:600:61::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 09:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 09:27:41 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Thu, 01 Oct 2020 09:27:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7b09007880deff3
X-CR-MTA-TID: 64aa7808
Received: from 34270b54aaf1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4AB5E678-15BA-4414-97B0-9821B04A7D63.1;
	Thu, 01 Oct 2020 09:27:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34270b54aaf1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 09:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdiyZfx5N4rGH7MASFlVuee5ppR+u11fYn33hLFGN6CyD10WQXNh58Ubhk4Kx9UbC8v+I00eE3G8sBGzhqBfxTj0i0Hfdpv1i/JiBm0MUW5Zv7hZd+rdkSJDDFqQWvx6AmIDpk3+bR/sgJqgoOHkQotD3voOIXMmBbKEKXUsv9pQEmH7CvCQoSGX3lv4Vssx6uk3Siq62h1fG9yRnsSGCdxyp4mokXIGYqnc4Go0vPnPD3C8UVz8XlPkr3lFp7PTRI+Yh2T3VvV6ZWTdlorSoQIeqHVrnBjYx3Oe93FlSWoza4+pWy275mujE+LfR0NAFoZao5Sn4yt6AMaufP2K8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/6fdS8Dsho6UCxt0/Bik7U0rtrOnolSTWgVCGLJm1E=;
 b=cZ71mD8h2gAsmt9aE7xrzKqEeq1qeZN4+GjurQDOtENmN0iSE1wh8CM19wcvK0HPKzOBLJHH4/EcwkHq9tujo3zuoYU+iyHOGgRGEFs/OPF+7VEK16JttN0Wi6cbRD61DxAZEthQslmw9q5/OvJFsiOs+AMyzTpxAucKI4ysPGox3thTvHeLqPHvwhSJu6Fk9jMdlQzrmwOqwhhHnaG5q7+a4CXs6Da/6zsY+Hjp0MpvrfXwwYQstNjP25LC1zT8okfGs+BFQ6xDMdej3rJB/toZw5FMVpDnorwLq3AP47gcRv4Csj+onP9rMe7dJ97LTi8zZrAaQmKREyG0C0ooIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/6fdS8Dsho6UCxt0/Bik7U0rtrOnolSTWgVCGLJm1E=;
 b=533i9XGNu26sjMq/Ka3yk4kuBpcdm7Jz/7tWR9E+naivdt21iNBmhSrwEBnh/v5em5u0KKSdi7l+JtqDACsk9Q251ys7mLs/Rqry8dzI6NgO8XyJP6f7TX3BlgjE2bVJqXg49+qy1EC8VtaFjaHhZ+t9/mMumdxaoyk/5nDUuH8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB3465.eurprd08.prod.outlook.com (2603:10a6:10:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 09:27:21 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::b0a9:222:8373:97e1%3]) with mapi id 15.20.3433.036; Thu, 1 Oct 2020
 09:27:21 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH v4] ref-manual: document authentication key variables
Date: Thu,  1 Oct 2020 10:27:13 +0100
Message-Id: <20201001092713.37930-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 09:27:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1ada1fb-cfc8-4522-d95c-08d865ec3ead
X-MS-TrafficTypeDiagnostic: DB7PR08MB3465:|PR2PR08MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4633278410BC6AAC5D97DA4B92300@PR2PR08MB4633.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 R9OxuK55VZwGECJqUzuqX1AizTI2FA7GVg50j4vj/vtJ/mjMClAT2auIQdTb9mXFXW1xRrOPR+88isQYwF42ax1jrbr2yjB/amRsV+fqgdwr674hhk+MXfxxjSw1iUX2B3tKzmuOGCqktEkcC63WH/5L4sWw9J0KkEPNe/dXSuss9qmYFbR6ECs75Kjaw/asqvRb7+iDloVo/Oooiabe10qKZQzpwGEneRCaCLnaq7B5whpDjyafJqi2d/hCpMQnerr9KDTBXOFUSx0/PLBuJGFM/6t4a9nbjDnTLjXIEkc9+QTuRILlEIVecvYIJsvd4KZkRoFd6P03iNtHXAb+rg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(8936002)(4326008)(26005)(36756003)(5660300002)(16526019)(86362001)(2616005)(8676002)(186003)(478600001)(6916009)(83380400001)(44832011)(66946007)(6666004)(7696005)(6486002)(52116002)(316002)(2906002)(956004)(1076003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 XiNgS0aEjseo50WWM3w80OQWPZka1R9UrwO1nhcvdCa4DPQmam6jXCSMxlDXwjDxyteb2TDyfL+xDR8nF5MDf4pq7H44S2363cCNAz0QGKnBWxmqSHcT5OejBh7O48praKzMEeZeH2t5Nl8FYcxBNLbPg92E+9Fh81Jndk0xwIh6BhHXKLqwzkB1yHYd0/OsL0SBcrEU1KW7NAwyN2/7N7qjHQQYXZZLSC/XnWPom9ylq0F40LM31C0npvjaBrgR+FkCDoC2Caiql7yv8E9j9gkJ0NN/Hei9xa6+3ayvmdntH9NsSpGAGtIZ290Xk+oYz1FlvtTy15DxEFS5l6T37tioTHRzeO79P8IEu9emujt+cZ0g2SepYRQ/SBKN/oO2eH6/zaudTSqSer/6pvehG2BNL0DZQf2xiOSbJZFvgid3OyenTj+uHgF4v9FrrpXtrHOTQN0dYpm0jdcGL0J8IlXU/ZrjvaUiu+npRs+Onzs4QPztaN3A310mg54WeAHXblHDySyFZG2adLd4HJlMBGtEyGTxwFZ863+px8bskZ1Afe0HQ5aEmtBtFhamZ5MKJG3VnLjKE+peKsuY9P9Jo0yKS2x7N4K8pqVlep8MpAzW95NStEuT0+2SLAYKGlYXhRln1zoMXjeYneWhv22CBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8474002d-ff71-44a9-2099-08d865ec32cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ybscaPEMqaGAhj0idJwVySTqhqN+a4skQ5X/QBcypWkFDTLuGSSmEWETBFGgE0tNiUuAc/+W/TuAExTi/N3w1dNppfyx4z9MvcyYzJ/Lx9KEE1LfaOTT2DCaDfiKnYjx+a5C/HCzWQuYuCtWXCyvQKGc1q3oIfbATlAkwyU2JpkIy/mzs+0KcwX9nGOqd3Z4fgRWuLT07F5Sbeb1Ybs6VQgOJ9sd/K7kMARhn1Ms307AyRpQiWVUqO9vOuvABTJ/SWEM/cKh9/9iSW4bqamnhUhVzFFAEWGhqNjvYajL9tpaMGyfpWg4awRTzK0npNtNe9Bd1+RuTG8YNLaKPUx8a88tra6LG+ocLnj8BP6a/rXdhVsjSbuWLSSGswFLmiJ/mKgGGnjjtViKRf7strpYGw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(336012)(26005)(1076003)(82310400003)(6486002)(6666004)(36756003)(8676002)(81166007)(83380400001)(956004)(5660300002)(2616005)(44832011)(8936002)(356005)(478600001)(47076004)(70206006)(316002)(4326008)(82740400003)(6916009)(16526019)(186003)(7696005)(2906002)(86362001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 09:27:41.1023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ada1fb-cfc8-4522-d95c-08d865ec3ead
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4633
Content-Type: text/plain

This documents the variables used to create keys for
signing fitImage.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 documentation/ref-manual/ref-classes.rst   |  4 +++-
 documentation/ref-manual/ref-variables.rst | 23 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
index 60ce8efd21..b007e34826 100644
--- a/documentation/ref-manual/ref-classes.rst
+++ b/documentation/ref-manual/ref-classes.rst
@@ -1413,7 +1413,9 @@ variables :term:`UBOOT_SIGN_ENABLE`, :term:`UBOOT_MKIMAGE_DTCOPTS`,
 :term:`UBOOT_SIGN_KEYDIR` and :term:`UBOOT_SIGN_KEYNAME` are set
 appropriately. The default values used for :term:`FIT_HASH_ALG` and
 :term:`FIT_SIGN_ALG` in ``kernel-fitimage`` are "sha256" and
-"rsa2048" respectively.
+"rsa2048" respectively. The keys for signing fitImage can be generated using
+the ``kernel-fitimage`` class when both :term:`FIT_GENERATE_KEYS` and
+:term:`UBOOT_SIGN_ENABLE` are set to "1".
 
 
 .. _ref-classes-kernel-grub:
diff --git a/documentation/ref-manual/ref-variables.rst b/documentation/ref-manual/ref-variables.rst
index cf37703814..2d6719df11 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -2585,13 +2585,36 @@ system and gives an overview of their function and contents.
       For guidance on how to create your own file permissions settings
       table file, examine the existing ``fs-perms.txt``.
 
+   FIT_GENERATE_KEYS
+      Decides whether to generate the keys for signing fitImage if they
+      don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
+      The default value is 0.
+
    FIT_HASH_ALG
       Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
 
+   FIT_KEY_GENRSA_ARGS
+      Arguments to openssl genrsa for generating RSA private key for signing
+      fitImage. The default value is "-F4". i.e. the public exponent 65537 to
+      use.
+
+   FIT_KEY_REQ_ARGS
+      Arguments to openssl req for generating certificate for signing fitImage.
+      The default value is "-batch -new". batch for non interactive mode
+      and new for generating new keys.
+
+   FIT_KEY_SIGN_PKCS
+      Format for public key ceritifcate used in signing fitImage.
+      The default value is "x509".
+
    FIT_SIGN_ALG
       Specifies the signature algorithm used in creating the FIT Image.
       For e.g. rsa2048.
 
+   FIT_SIGN_NUMBITS
+      Size of private key in number of bits used in fitImage. The default
+      value is "2048".
+
    FONT_EXTRA_RDEPENDS
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable specifies the runtime dependencies for font packages.
-- 
2.17.1

