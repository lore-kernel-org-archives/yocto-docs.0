Return-Path: <stefan-koch@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ABBC021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 17:44:56 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.52])
 by mx.groups.io with SMTP id smtpd.web11.29483.1740159892842703872
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 09:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=a7gtmctc;
 spf=pass (domain: siemens.com, ip: 52.101.71.52, mailfrom: stefan-koch@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcNmsllP1lz3jTWHya/F1XhGAPL/wKVeejgWU+TJZmSCXySPIIFdGNLBWIdv9t8xXF6cgWcXwNesxOIYu/Rz7qUCLq0BtKda+N2bxaED5y4rq+rMzKUhtcJ525P9hD63MFv7u8b97zYryxaB1O8LwLviZ1h4RJO7dcJ8JEGXxbAWCCWdyNVgHhyNTgeUalpa0hbMnf596Ahqf3l73tzeHvQ5jZ+OSCxidpHlGmx3VOGM8a0SVjEsiGvfbSFxHK2am6xL99kTKpuTFVT7X3Y64p5GTdks/XdvDgxlUa0I6QiLkIVfJj21eqWyVlw5ZJ96z35pA5RAEIizp/5kpxVytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ep9gVdmoez24eqEvUdrVa5lIjDVPIIxFdg0UsYElOJ4=;
 b=bPhC3EnOhETyRaNY54gIH6SNqwDXG/sK5dSJc4PbxVi+Ip1VTkiXgsjTz082NHpyaRpGyYsKMmb+c6lA9M8M9yh1fOv3JJeNLXT93HEsUJS6uJgC30RxmxzIwwLSXqf8nrBnBk5eK9QbfoFuzkqVWI0VGownnSyoIbPhHFPy5hCzjMXBgra3DTocB+9iWR8YaiARdNbkKkkh4zhcJ+ri8UfCmxSjeSwXGBUN55Ucr+h7RCRlPX7sZdJvGoFbXXgRRdpcg7WwN0GpcXVaJqCk7gmLCOzOIIfjfrXYvN8x/Oog4ZVfV7/7034EcT1RIsgQ4v398U4WzbkvAZ5WTcibYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ep9gVdmoez24eqEvUdrVa5lIjDVPIIxFdg0UsYElOJ4=;
 b=a7gtmctct44m4SxIXtyZks2+zzrEmMsoSMwm+OuUzDiuG3u2SaJC6APkhsfpTCosdKSF/gBDrUUqFH5c2+/f5x2124sgg2CaVd8FmMtSx25hdGpQT+XGRRCgphHYbHCQh0nvdWqjN1l5uTo5FXyKqAA1IuFzekeWKqooRl4iIFvewH3+CbXDmsYT5IMf41/YFr4eE33f5jqP8npyyNkgtmPDJdLVZlbiDMCtgY10PNo1mt85DLUxHAwPh0cekkvcuGsJ5V+EqqtTeWrGBjxmbkZuwFah5+bXSWTSGFnb21f7EnqwpwGve9FunGEsqREXkYQuLTPcDbKwFWPB/loffQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:41e::11)
 by DU0PR10MB5776.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:323::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 17:44:49 +0000
Received: from AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::71d7:e998:3abf:a1ec]) by AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::71d7:e998:3abf:a1ec%6]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 17:44:49 +0000
From: Stefan Koch <stefan-koch@siemens.com>
To: docs@lists.yoctoproject.org
CC: stefan-koch@siemens.com
Subject: [PATCH v4 2/4] bitbake-user-manual: Update documentation for fast `BB_GIT_SHALLOW` and add documentation for `BB_GIT_SHALLOW_SKIP_FAST`
Date: Fri, 21 Feb 2025 18:44:38 +0100
Message-ID: <20250221174440.542065-2-stefan-koch@siemens.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:41e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4959:EE_|DU0PR10MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: d5275539-1f88-41b4-ee40-08dd529f7076
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gx4bWnVk4FiOvRTt+l64H2YNVx71uBeLctYuHpfiBoewEWqWOUu8TfZSPsSl?=
 =?us-ascii?Q?QIxrUJ1igXYb8TSqP8m5VcOSakzI0Y/zyMj8KEP0QuZ81s4ZduBI4gMSqLDc?=
 =?us-ascii?Q?PqZZLX6de2UvXn8ZnGOjS7K94ywsbg+ZwgC3HKhXamfEv1nFiP0v4E9CCBId?=
 =?us-ascii?Q?ae6CWxmoD6M+TaQUhoeuiCKKnF2aB1v3r1VXdGUIfnQPO0QnPflW8QG0zfGF?=
 =?us-ascii?Q?9vbny0ci/+qPeCLUxZokzk32Qknki3AEbV+N4IIfYQS+autgw4G1GV3aB9Co?=
 =?us-ascii?Q?k7DJYjvdkwnvaDfMYrpmKtQOK0GEyQNre9ByAbqANtjidDnGCQpdbLRCQ3Jh?=
 =?us-ascii?Q?YQE4Ecq7p/7Gv0K3vxteFeSook3dkO8nvMlsfkx70EmrQjzCqYsz2jHvEXm/?=
 =?us-ascii?Q?EkiVa4NsOZ0J6VHGwHITEBAU3Iuhuenc69B9VIY54H71naGq+sbqs/u+aj8d?=
 =?us-ascii?Q?HKyokWj4ae7VO+3Ye8fLM94R/ObNNevzu+yocyFZFOLUUWjLXLETNFy2EtEi?=
 =?us-ascii?Q?I0f1FZcvfZS6oT32wXW2r7c7jKDa18yx3wnfugQuo16YBxOrZA0Ns23xYTkn?=
 =?us-ascii?Q?p2H95d2KfgXJZl1f4TBos5PkI2y+ekM5zQVKnO+RXCOVwOdFYhjUE2Cmjdzh?=
 =?us-ascii?Q?AL5hkYYavN8pBPlfAcxZI8D/4NLjPyi8eGK9/Y+ybicSngc9NrA3EcWaQNR9?=
 =?us-ascii?Q?5s4sYs1PgUko6Kro6Otp8+6cXeoCaxHqGkG16/D67csYNNhNz5vXCSkSHnFC?=
 =?us-ascii?Q?UXwn1zxxJK159R0U1JkIKS7SIkHK1CBiERasr25Z1ve3DVGWezgJ0uSKoZDO?=
 =?us-ascii?Q?rAWYOZioV1N0seSS0S2gymMBpJoqYxOQphJ81eiMIgRX6lf+/+N5gQaNHDRa?=
 =?us-ascii?Q?qKtreNKlBgQyBjknoQy7sZzWYlInxA1ZhdGWrlJ9vSWOGNQfJCF+AfFHA0l7?=
 =?us-ascii?Q?Jr8JNkYRlMWONqY7FGOI3BvGNd6HX8BLyuVGDeWcQwDyleje7rrzt4cRHfuF?=
 =?us-ascii?Q?SvkuhQ5zbSfFWjxuePDmbZ8rawgCjaajawU8A1uQRaHMXTHEs/5hTjMk9t+n?=
 =?us-ascii?Q?rK9A504auGlOgZgyMSuhnGW/goT69oB1LI2Joph/KJ1hCS2WMG63WqqX2kgg?=
 =?us-ascii?Q?lFBKhUZL8XUtgv1Xaj3LeQxlm7bmPVRjKQ7UytQFnCENius93ec+bo+e9MFU?=
 =?us-ascii?Q?cDumR5vYcXgz4P7fAeKql/Gd2MJ+zh1E3DD5LZVS7svSPUXKZIZ2BIB7NLR2?=
 =?us-ascii?Q?UMg4C/QTi+KxLRW11ypqhVJ5r1igCdbHMVXjwFWw7kJ7kPXEUS3Zm0uCVu/K?=
 =?us-ascii?Q?TZbCdDG5G16GiXU4MMxGqtCEB8ZJHS7L5u6djC9M78vG3Sy/ESqf4n5KheLw?=
 =?us-ascii?Q?t/zhZptdVy33gB00L6FYBINw9hyK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ae+mP5H3uugUs45xWnMAKglt3S24yGkPc9zsoweZQQ25vNCFrRKKGspNwkfI?=
 =?us-ascii?Q?EqULCdiEjcuoKsk1SyTfe4NhWr6NH2/HlCyrZylr7eijJbt2CpGyABNjDESa?=
 =?us-ascii?Q?ZBUiHcvSY6iODGnb9JTJxF8sDaWHih4n77B6pOtiSkpErk++m4OR18AskPoc?=
 =?us-ascii?Q?lM805Bx6HagcI468v1YqjlnRuMMCZxIvlqqLd7FVeZStxwtkuy7F5UbDLhKr?=
 =?us-ascii?Q?PiMWVwzTNwFo3fgueI3E5cv86sIbUkqHRVGoHP5wvgDzkdFHWgKwYRmAqFdF?=
 =?us-ascii?Q?kBRED4YgIgpTuCen3nyLfg9W6RU6/HAkPxZmmhCkTvZtMbLhJO7ZQXcJGMQY?=
 =?us-ascii?Q?HU0zo5PG2mBWt8ycnuaxbln6bFFDklub6Avrx0Ba7370WDtWX7VYVew1c/+K?=
 =?us-ascii?Q?C/OttWKg0RaXfFpp0Gh8Mo7fYU6rOmUW+TRBki8u8nxUiJayfsynwV7TjfhZ?=
 =?us-ascii?Q?i+7ME8gvBNGcMPw6ZQf9T4XG5hTG97G+4DVGi66ex/Sk7NQnvLeg0lPpAwsG?=
 =?us-ascii?Q?YgrgKTfWOWCA4ueQ12vaWV5Z5spHpWuCQgeAiZatSoRRaCgmr1rEoIyUS6cY?=
 =?us-ascii?Q?QQDmKiIjahhUeNnNSRlChejd3SpcwIOZgpHImESQkD9azfaCwZ76n57OCDmf?=
 =?us-ascii?Q?Gz5U768kGG11GDVU22YklVISfpzp6HYNir3jvZtTw2UKarSX8urdjUfJWAL8?=
 =?us-ascii?Q?e33AtzQHsVUMVnZ1Vg+XjUUrINy5fKswpzJw1ETvCfVx3YjsH5fx9+VolNE1?=
 =?us-ascii?Q?qsVyF/6ZdXMhb9QtOUraKGwwzvTgyDfAMC15awMcW9LuTU0X7igZ7GmISEmv?=
 =?us-ascii?Q?ke/tl0RK0ueO+eXcnpEVC9BmXgfgym27u3oxOAmT71NUxrzKSdLgu6/NVvaI?=
 =?us-ascii?Q?zP1ivCg6nnhzf8sIwpeZTBNOSlE0/Th/wJjXL12fD3754e+1LgjQEMdgmvoy?=
 =?us-ascii?Q?ewvn6j5HVIEZ49iEyi4OIipom8NcV9qEn6MEjhSVUFMhnVaq6wEdSJJcn1H3?=
 =?us-ascii?Q?I4XKaQ7u5zeArI0LUa/sLx+OKxGg5PjXaanniuFbLJYf931hBn8GSwafdAtZ?=
 =?us-ascii?Q?CdcP945auhnkeAdHwwcXZl/1oyA5SqJd9WHwtGh9W4TkTg8F4H325xaDfTub?=
 =?us-ascii?Q?nk+1CTDa4toxT2xY9d5IbG1D77zH09zzzkHpMDGetd1N+cXHCm0lDMm2iUFH?=
 =?us-ascii?Q?Pd7AsKAprzHkb2a8ZK1VihNtIJF3TLYO2yjZcZ+0mPytH/OYgqRM9yusd3K9?=
 =?us-ascii?Q?qzKvarUm5bYwNqLdzuXnW/hNOn8VsWvFtNoaKpoVDr9orVBL0Un889xEISjC?=
 =?us-ascii?Q?Wuv8mL/LestFWrHnsU2ezx/QJgCsFyy93ftV/L7PXZSouUV6Ur8QB4g1nEUb?=
 =?us-ascii?Q?zt7waAWg51RAft39wHTrJ8xk55bjri6h3byViXKMfJHQaJagxj2GlaJ/Exlz?=
 =?us-ascii?Q?8vN7gDYlth5kKjLQh1BmyuKMnn+WrFIs1Q1dKFoo8c1VbOXfbv7JuiqqUPte?=
 =?us-ascii?Q?yb0u7WvulA+WiD5ItUl18+a+xT1ByYYNFWGPJKoucywX96XXQAeIWj+gVsfd?=
 =?us-ascii?Q?oaS4h0RMjpCUGl4P5qLcNHcp7o5BK1dbbzDixnt6DwOJaO9rdQrUCM1CwNhu?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5275539-1f88-41b4-ee40-08dd529f7076
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4959.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 17:44:49.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VogoF2Vp2QehB7Fy3wlC/loOZAz3b9gaFVHK90GJfbTNoZDnTPswfJhx0kftil4JrZk2PKlGLd7QtSfUkHvOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5776
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Feb 2025 17:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6428

Signed-off-by: Stefan Koch <stefan-koch@siemens.com>
---
 .../bitbake-user-manual-ref-variables.rst     | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst =
b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index ad219b531..47e327277 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -315,11 +315,21 @@ overview of their function and contents.
       mirror tarball. If the shallow mirror tarball cannot be fetched, it =
will
       try to fetch the full mirror tarball and use that.
=20
-      When a mirror tarball is not available, a full git clone will be per=
formed
-      regardless of whether this variable is set or not. Support for shall=
ow
-      clones is not currently implemented as git does not directly support
-      shallow cloning a particular git commit hash (it only supports cloni=
ng
-      from a tag or branch reference).
+      This setting causes an initial shallow clone instead of an initial f=
ull bare clone.
+      The amount of data transferred during the initial clone will be sign=
ificantly reduced.
+
+      However, every time the source revision (referenced in :term:`SRCREV=
`)
+      changes, regardless of whether the cache within the download directo=
ry
+      (defined by :term:`DL_DIR`) has been cleaned up or not,
+      the data transfer may be significantly higher because entirely
+      new shallow clones are required for each source revision change.
+
+      Over time, numerous shallow clones may cumulatively transfer
+      the same amount of data as an initial full bare clone.
+      This is especially the case with very large repositories.
+
+      Existing initial full bare clones, created without this setting,
+      will still be utilized.
=20
       See also :term:`BB_GIT_SHALLOW_DEPTH` and
       :term:`BB_GENERATE_SHALLOW_TARBALLS`.
@@ -347,6 +357,13 @@ overview of their function and contents.
=20
       For example usage, see :term:`BB_GIT_SHALLOW`.
=20
+   :term:`BB_GIT_SHALLOW_SKIP_FAST`
+      Set to "1" to skip the fast initial shallow fetch.
+      This setting forces an initial full bare clone
+      instead of the default initial shallow clone.
+
+      For further details, see :term:`BB_GIT_SHALLOW`.
+
    :term:`BB_GLOBAL_PYMODULES`
       Specifies the list of Python modules to place in the global namespac=
e.
       It is intended that only the core layer should set this and it is me=
ant
--=20
2.39.5


