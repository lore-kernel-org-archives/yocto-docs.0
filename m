Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web10.17425.1601478186347473904
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 08:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=a4r14FSp;
 spf=pass (domain: arm.com, ip: 40.107.21.49, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdAR34y9p7gEvteLoeEOaz+6bjwrW/jGZMGUQdwjpnA=;
 b=a4r14FSpJCgcCQgnEvlkG7R15Je5Po4/aX/6SCPskpx5nMD5qU1z2JteuKjo+tnMQA680xN0Z/2b9rSLeeNiI/cyFa1hbtkR19EmWZwQ5gMdWHSlyzLaZJWPbji3DP+i2bSn9w+/OodjGKBri4S8WSXxi6Mv2lMtBGafnmnuY+g=
Received: from AM7PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:20b:100::19)
 by AM0PR08MB3123.eurprd08.prod.outlook.com (2603:10a6:208:5b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 15:03:01 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::2e) by AM7PR02CA0009.outlook.office365.com
 (2603:10a6:20b:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Wed, 30 Sep 2020 15:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 15:03:00 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Wed, 30 Sep 2020 15:03:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40050b4022b67feb
X-CR-MTA-TID: 64aa7808
Received: from 225c02d16a7c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1F1B647C-2648-4457-B6FF-2858A6049BF9.1;
	Wed, 30 Sep 2020 15:02:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 225c02d16a7c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 15:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTrHwmEunQ+895wyF1U8yjIwwzEKQlWm4aUpJNGVhp6bH/anOqAM5L+XMc3BQv494wuZYa5wrJpDihaRCiBMJJn19JDCMVF2ZyUnFfyhSabwZgOu8SILwSoEHIiMpn4aytKFn5kzVCizoG56ajLB/stLGNLOEwsitZibtTFRJygiV4Wz+NCJdFAUjOOBDlkshob+TXNAYTdgLRqnQmJjy3IJ77IKzFTPVxSKL4wKPuAq163KHJT0WlBMNnxR9kXZXzxmjGhd7xHxAT3jqvcUDQPaRf/HEVVqx+8uGGarxejdjS3WHz0OQ4MoMFBEozL+wx9KCfMZlTLeuV1SC9h7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdAR34y9p7gEvteLoeEOaz+6bjwrW/jGZMGUQdwjpnA=;
 b=YZviA3acZjBWH1VlEqUS5N404cOhZ0CSVVH3oomCz5ZWmAJiXK8T0EYoX/RLAVMOyZtjr8aEewpIQxP/0grv0Piqjec48/NJOezd+YKEPkODtHdsj0l/KUkNb2RyU8szW0AdJxmgLHoPdAOXe4fsida27d7oY1/h0DR+A/9DsEjIwNcJQUobzKvo1cb+Dxli1+ip2ts6XyFrpQ563pzwDZsgQ+UlMs+zgMGxD8eu+dNLzGiH/ArNm1P7Ka57EQj9BInYrpod/QzjuZwZqOtKvmF1/aPiovx+DqcyliKamy5GY+QayVjt1+ipdGlR31ffe9nUl/YpG/en0v6cSFzhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdAR34y9p7gEvteLoeEOaz+6bjwrW/jGZMGUQdwjpnA=;
 b=a4r14FSpJCgcCQgnEvlkG7R15Je5Po4/aX/6SCPskpx5nMD5qU1z2JteuKjo+tnMQA680xN0Z/2b9rSLeeNiI/cyFa1hbtkR19EmWZwQ5gMdWHSlyzLaZJWPbji3DP+i2bSn9w+/OodjGKBri4S8WSXxi6Mv2lMtBGafnmnuY+g=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM6PR08MB3254.eurprd08.prod.outlook.com (2603:10a6:209:4d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 15:02:35 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 15:02:35 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH v3] ref-manual: document authentication key variables
Date: Wed, 30 Sep 2020 16:02:27 +0100
Message-Id: <20200930150227.47145-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::18)
 To AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 15:02:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 32dfb37c-1d58-49c2-ba23-08d86551ec9b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3254:|AM0PR08MB3123:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3123623073BB1C9B751846C192330@AM0PR08MB3123.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NY/vnYWlJRsIckePrYzRmVyoJ2CyI94gsHKca9rWiYgcE6m1ZdB3c74wna84Esuj8MFdVfRr98xFu5RSGcDGdgU3QKc6uF5EbIjG0Nn6nTkQFUHMD92qhWwD3KVUW+bnMjm9KsBTeJwhMk+CaJX6xP6DRjFVCsAcZahuNaKl9ota8qQvDL2zodWJFW8JwwZUThsHeUqcamIicsA4tpnEHalKT3u1tmrBjt2pc/Emtwsyw09GJuuTODfyhJsOFbHOXRZnmp8AP/TDRiJs+gVYsoC5TdSrQwza09npHjUEkVXkyBaVdBodvPMKpwycdHCBVaNJiwPR0TbQviPGeL/AFA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(36756003)(66946007)(8676002)(66476007)(66556008)(2906002)(86362001)(956004)(2616005)(44832011)(16526019)(186003)(26005)(316002)(6916009)(6486002)(83380400001)(52116002)(7696005)(4326008)(8936002)(478600001)(1076003)(6666004)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 P3Uw1DvXyh0UhZQuvjpatqaJchqSPgJBe5do0YP49IdFdqvwlfDxuItTMI6sHuChinngJM3s+/WBa+FN1aKIKML+XngAUNHgJ4r322XmpVtHoMI4JMG2+faUYVTwwDAwRI1Zj3PaTXG52WjXTJ1bCqyU4e9Hk+iUG2GZgGjaR9cB9OHEYn31FnB8NDLkJWfbMX/n5RI8xv0ecUhy0J72DPt6THwgXL2PLxm461cmrGutAxUNDyVirepOcle8wDedEXfIgMX7/NT7N+lGIFQmEcszQnZnvr4LT4OUfAIwzHEEDAxpnHpVVk06DTS6Q9xTsSjA/ZoyZQi3rm6qWJt6DXRJ5KzgXg1mz1mbzQ9jWAv7DjaLUvq+LHYLuZEQ5IjFMwnMwWdNtVaIQ8pG6gu83QZzd2kgpWD2fMHCsV1W7TmvarjaM5Jt4mnbrN0pWmsX2ZQHIU8ovEQyLh1BxJlWv2jM5YZVcvRpVm0/uV49b2CA3BQOEsDjPieDKh6S2WaiZl3LGzjfUmDpRyVe5lEPf308SRRG+C+zqfa/SSwmjuQNJDEIkdZdSehE1kv+lgKJ7+ygTazJQ+3wg0pcQiP8Id8vhdvpU8KamhvMY/Wx/dMJ8H9DJ1SLgUpsXrZW7S8kcDZo+ecscTpTKn/wuzOOdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3254
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d548968-8ee9-4a3f-afa6-08d86551dd3a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GTMdXJxW+RM6mz4cKvcqrcxgfaL0oI3vjS9FiUEkPnjiuSspi+HlB+b5+j3RqBp42trqnFd5fm1zbWpJgZ12nMJ6Ciqa0zF4YEfjHjTQKnjhy42ypQVkLZDH3rVEyTItjhTRxdwYDte5Pu2WAcSe4q0NYZYtCNpY3oCRz5BYuRYqb/UQ2LGwsznsIy4MUU1Zebm0pV6z2WEQmdl6o35qmFkH6ZbxFQhbDz4ZWwA668e3DOgchqbO862h6lTudRvyw63x/S7nJxZZrqkZvWrO4XIRFCr3tRHsQFUMA9NnO7AxoVjQPeYeX2GtC3TqqK4iS+1txiENfNQM4U3F0uYvvYXXLyqyT2J3N2H2cDXMQjEezhDyeGRfcsaBDGVru0w7ZhYRlyiuIPmS5u0rumkqPA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(136003)(376002)(46966005)(8936002)(4326008)(36906005)(7696005)(83380400001)(5660300002)(82310400003)(6666004)(356005)(1076003)(478600001)(81166007)(70206006)(8676002)(2906002)(86362001)(956004)(2616005)(82740400003)(70586007)(47076004)(336012)(36756003)(6486002)(6916009)(44832011)(16526019)(186003)(26005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 15:03:00.8700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dfb37c-1d58-49c2-ba23-08d86551ec9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3123
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
index cf37703814..e206871c94 100644
--- a/documentation/ref-manual/ref-variables.rst
+++ b/documentation/ref-manual/ref-variables.rst
@@ -2585,6 +2585,11 @@ system and gives an overview of their function and contents.
       For guidance on how to create your own file permissions settings
       table file, examine the existing ``fs-perms.txt``.
 
+   FIT_GENERATE_KEYS
+      Decides whether to generate the keys for signing fitImage if they
+      don't already exist. The keys are created in ``UBOOT_SIGN_KEYDIR``.
+      The default value is 0.
+
    FIT_HASH_ALG
       Specifies the hash algorithm used in creating the FIT Image. For e.g. sha256.
 
@@ -2592,6 +2597,24 @@ system and gives an overview of their function and contents.
       Specifies the signature algorithm used in creating the FIT Image.
       For e.g. rsa2048.
 
+   FIT_SIGN_NUMBITS
+      Size of private key in number of bits used in fitImage. The default
+      value is "2048".
+
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
    FONT_EXTRA_RDEPENDS
       When inheriting the :ref:`fontcache <ref-classes-fontcache>` class,
       this variable specifies the runtime dependencies for font packages.
-- 
2.17.1

