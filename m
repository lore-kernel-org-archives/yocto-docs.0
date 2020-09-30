Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.49])
 by mx.groups.io with SMTP id smtpd.web12.16450.1601475120093630066
 for <docs@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 07:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Wiay1VBR;
 spf=pass (domain: arm.com, ip: 40.107.0.49, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGqWxBPL0jPJyYHSncEy+jFfS4plmQlrmie5esHfscs=;
 b=Wiay1VBRUccL0a3ZBHqP+wV7xTUrkY4ZtoJlbcjFyw4OdLP0eLgmjk3QYH1Su+pyYlOpjX64KRlhC1NZGGlLwD50nKarJNZ8wmQHmLOAl9THaXpHk/4kY3faYrKeleLAiR2FKcPUfZEGHZXc371mF4lcSPgEunZZSvTXn+mvXnc=
Received: from AM6P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::37)
 by PR3PR08MB5564.eurprd08.prod.outlook.com (2603:10a6:102:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Wed, 30 Sep
 2020 14:11:56 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::9b) by AM6P191CA0060.outlook.office365.com
 (2603:10a6:209:7f::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Wed, 30 Sep 2020 14:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 14:11:55 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Wed, 30 Sep 2020 14:11:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6684f04a7015b21f
X-CR-MTA-TID: 64aa7808
Received: from e784f2617293.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 95F3B238-B747-487D-A9DA-D0ED8A361FC5.1;
	Wed, 30 Sep 2020 14:11:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e784f2617293.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 14:11:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvZ2XsRh4VMv+I2/cmR8aVqE5CPF3P04ug0fy0/yBJ3kPF+GhXmoGMYTn7VgHqC7muCQ0sw9ymr9ONcMylfDrO+q/mk6vm0fX05B3bGHdtlQdEcCrJopdfJ1rPUR5efFfPVrusLthM8JV3tgedHE9blZkH9Fm8qNfS+u6EonkuxMU7APbMKxjEeMzAbwdQub32SmeAAwq9FVMMPIUbqzuXzyuefMc+I8PXOxaBZ1xKR1Gh+PLcYXSRj8X6/FsUq+N33YcdxwHkYIuSxdXilFnQfl7cujM4wI5i6sOFYuf4v+DlVFGq8K5z5Be4Teomzq335XFBvFBwC4sEbiRAsqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGqWxBPL0jPJyYHSncEy+jFfS4plmQlrmie5esHfscs=;
 b=iJbjMywF0IA5INqhQDy5e9CFXn/m2BxbWKYhwusF6Tn1sJhR/9iFvlYifc6hF7MlpDOoUyfY2mZ3N0KtyR8BnZIl1pqnpjtBpVoR0HF7Dl1q/PAhoYFW1b1BOvOHEtNVv+grKSsW58ovreDA6w/Hc+u5XvUNagkzo426xmBdRfuXBnfudrSUkBAxIYBUNsSg3jMuJTYEJTjvh6VFxHlJC37mXPdWQtPYW2xOYizVzSHx9fUjdPf01BMyE1JM9m1Ak38W+nT+JKevT6BnyqylIqB4esVhhpxkAE/J0yV8BI++dSY8plo2pVrC9eysj0rEaPPYqWA0qXDraQuS9dlhBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGqWxBPL0jPJyYHSncEy+jFfS4plmQlrmie5esHfscs=;
 b=Wiay1VBRUccL0a3ZBHqP+wV7xTUrkY4ZtoJlbcjFyw4OdLP0eLgmjk3QYH1Su+pyYlOpjX64KRlhC1NZGGlLwD50nKarJNZ8wmQHmLOAl9THaXpHk/4kY3faYrKeleLAiR2FKcPUfZEGHZXc371mF4lcSPgEunZZSvTXn+mvXnc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM6PR08MB3925.eurprd08.prod.outlook.com (2603:10a6:20b:a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 30 Sep
 2020 14:11:30 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 14:11:30 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: docs@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH v2] ref-manual: document authentication key variables
Date: Wed, 30 Sep 2020 15:11:18 +0100
Message-Id: <20200930141118.44916-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0408.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::36) To AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0408.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend Transport; Wed, 30 Sep 2020 14:11:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7475426e-f679-4736-ee01-08d8654ac9a1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3925:|PR3PR08MB5564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5564533E3571F6D578153C5492330@PR3PR08MB5564.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BsSNqYaB1vS9jjCRebrSNQI0Du1RIZPPD0i3o4/AxATLrqjt5tmY84vZGXnbEtdSAINgtDiMjy2uC98X8PTKNZHSonVPXSjC96tjC+2X5KyrmW1+fAyeRi49ODQVRbQM9bfPBrCHz5divRiYOZQrrMIs2uk2/1KnRPd1DgXfm8W7L+NCqjUQOi5agG7x1L5SefSfuS652INxECA48SolsaHNkCEYFr7odVy746L2q5AltruF26pYG+4BXGYHcgKFjjXyikdTF/bIECmgLV0dO0RHbd9BbHiyiooRpn9QOhWcGhFttXO2FUrNqRgMASSH/pJWCCqJjuvcgZTROwMLl4E+UGfVHDsdsD2GCN++XJzgcOqmfFoirab08R5e0IIi
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(6486002)(5660300002)(66556008)(1076003)(66946007)(66476007)(6666004)(86362001)(26005)(16526019)(186003)(52116002)(7696005)(956004)(83380400001)(2616005)(44832011)(6916009)(478600001)(2906002)(4326008)(36756003)(8936002)(316002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 jFTVq4eucqQwTowSUejDAOEmE018oMIakK+4x0seE8RgSTZjgvewlIt6reg52n3qsifMwV8HyQpdIgAfXhAlgKjAJieLfTxK2nGnz0yxtHkEgYngReUGPMesuxGycZ7hditApgbHHYm5jnUFbHZ+ZqxGiaXzHwDLSGR4aepdIuzJtC+vU4HwV53gDjBdpHZgql8pwbh31QdKnBZKCP6pEjnI4zMsoEv1FIImYBAXJugQByZiQIznK5DuI6pdSfxZlAju5nBVwSd2Y3hQzHftBgK7i3NwMEfTDuB/rvEHP8vuCi7TI6GiN0uGKbxnBpt5bj/U51JwRsNUTUegfYUgVZc/JI4fIIoZtrxvmJkvHzhgBIQ5EyVTwgIz0BP2+aaJqhq/zaBZz46Fuo4tvtOCtWcfh+N7MQTcuI4AIrUUarVw3ZYE4Spl2P/Ut/pCsAlj5Smj4WM1YEcBp7G5Xvf4bu+mBYREuOQvhCCdtAK++jbqm8FVd22Y4mJcN76ZZi97W0YZ/kYfhnqdaLV4XyfMbp+whR5Cvsoi1u65Z/VvVsatXpvkafzPeJhD/yZoprPLjIXllu+zHuy6lQa7agxpYVzlZf09sfn4kH5cLFFDAEeHhy6CL8GZv57o8vzTxX3E6L4pVAiNC/rIla/FRDNUUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3925
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39976565-bbc1-4f5f-440e-08d8654aba1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xEdcHBrJMq1xl6Kka77LFrsdsgPq4eQXbsq5MA+4ir23uCV1WiO1s7UzMw8+JlQCxH0l6Rm7xfaN7Mx7by7hINkWPzpE9I4BvoAPKSrI9989d04xnlb8qAmFSUaEg6WbFBRTvmFxCUnCyF0sMVLWY1txnl4jlR7dkgykuATvHq9F1lLHxG0nZGPnVDe2/fzqZY1d/5DLjXrRLXJZ/KuUqdvTpgk58IRORO/ELq0rQOsorSlnFMukaWXhFxu7/Ewaeha+v0MWtFeAfkUyIyPvz5z9pzrANu5a5NJcnjHp/xp7EHL5digAdrbWfyhI8SOWsbMdvdT0pXI42b60JWnEMQeDyJefkn5y/Xift+po1Ln1b6RlAaauPPGMJK2QO3aAQVUcn8kQg91we+gVt/0R7l9Kwgj/w0QV55a7gTVMf6cjF4P/qKKvKPk+34Ztslh+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(186003)(8676002)(16526019)(356005)(86362001)(2906002)(6666004)(8936002)(316002)(82310400003)(81166007)(82740400003)(83380400001)(2616005)(36906005)(26005)(47076004)(36756003)(1076003)(6916009)(336012)(6486002)(44832011)(5660300002)(956004)(478600001)(7696005)(70206006)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 14:11:55.7179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7475426e-f679-4736-ee01-08d8654ac9a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5564
Content-Type: text/plain

This documents the variables used to create keys for
signing fitImage.

Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 documentation/ref-manual/ref-classes.xml   |  7 ++-
 documentation/ref-manual/ref-variables.xml | 65 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)

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
index a5064807e5..3881fc81a5 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -4991,6 +4991,20 @@
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
+                    The default value is "0".
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-FIT_HASH_ALG'><glossterm>FIT_HASH_ALG</glossterm>
             <info>
                FIT_HASH_ALG[doc] = "Specifies the hash algorithm used in creating the FIT Image."
@@ -5015,6 +5029,57 @@
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

