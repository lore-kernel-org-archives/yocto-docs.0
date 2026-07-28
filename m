Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C3DC54F53
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.121])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6565.1785223453529974003
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=KmE1NFTQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qb7hMxhqZ3kynCVf0xjymGIUkbK4LAHb8KQ5RoNDNVWTTMPPZDUJJ5sqKm9gxEqXA6EqjaHl5KPJQBen8WT333TVrZ7/vq+8p7MBrzmKHUL/c4xcOJsi4+9VrB+F/XXR7BsIccq8u4tSC0JafHzuK2lUW+Fz+P8JeR156pljbUSv5icTC29MxuOMOcEuMZqYmDxXJn9+/tuLbq6GFJyiyJl0IGWNNzID+98xPgAIB0Ivv63w5JfnloG30QzShv7rz/6kTsYsL55MQOD+pc+jKOEHk5e1EOROOseC/nacl7IKgtgyqKskj1iAfnTpwqlS8MCds9ylr5sp+sXFuVsddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd4n7spZeLrv76LBbWay1gLvN0HwwdstMxFdd6pj65Q=;
 b=n0zxUPcK2iFT6TL6dBvjOYee5tZhAXhYk+7vD9+JGMec6kneI9Kgq8/7o8dqZHOhEcu87AwdF8XHGpcvVd6R33QT7Jhl5V65peD6HhS3oPIXR6DXc2Vku/K+5lg5xmnhao6fgON0jeBdcmnfiTUYR27sNBTcrdJZwaQcrVOIHJlSz75zzbAw7D7GNFVOfweYnMOUgbAUJC0KqLGSrpLpMXWF/+q/eE28vphn5Xt8rZMUpM9A/gj9k6pKEaZTUdSdr4Uwn8FIse4POx/DiLF15xaAwNlf8Nf+pigawK27Tj7o9c9oIchejonvKvt0AWNmlgpOpZAmDZjsXH3xSLd4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd4n7spZeLrv76LBbWay1gLvN0HwwdstMxFdd6pj65Q=;
 b=KmE1NFTQW1oS3dN/Njx+o/ciJzE56nbP6aVK5W7AHu9coO8pcU+pHWwkBdGF+XKr9RAm/3YwgsSavXO43aYk2R1SrOp4oaAykdH/ohgDLuZsEmRbtWt77vvdZrbf/EzwskIF9Fz0uTvhLPD4jviFvaVymiMupMDAs2G6Svz0a9tHZXeZlL7mzdRgIG6KjPyJUOnhvlvqGbApuGEtcixTbcS0P74iUKfuzdA6KiryK8J5yJ0gholYy+zUyW36iPHDeLRM4x28mIeZDKs/yR0u5mukvi1X9Zavk0DM9jc6+DA3PrB/3oMDCTU0EuEdOKi9qfVWBARbuiQDz0Go8YefFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AS8PR06MB7559.eurprd06.prod.outlook.com (2603:10a6:20b:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:24:09 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:24:09 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 1/5] ref-manual: Fix occurrences of omitted space with :prepend
Date: Tue, 28 Jul 2026 10:23:15 +0300
Message-ID: <20260728072328.11926-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728072328.11926-1-niko.mauno@vaisala.com>
References: <20260728072328.11926-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000239FF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2b7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AS8PR06MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: af8241f4-d86b-4f3c-3acc-08deec793700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/qnlMvHWGtpWmIpnF1TDNXGSTyPnc3vRwfHixWDdicP5087BK5HC1cjk3XVmu95D2BCrG3wa56unRY/IiNIdbtxvjpMEL1YVcZu4suVRzgrhsQiR17BgQICKX5tq2fOI3RfWDF1F/mndQl3vKeYntBZ55ymnXHJ9ed6T86eGT8lHc9csGW6q4jUJp2MTuXBAJqX7uIIrxZWsOHt/+h8q83HzE41kITjrD1ZCMxJjdYTwxSjp3i2bPGSJVw7ZeH4wexlEpcAOM2YftafXge+cDWSb2dAJqoiCVxQa1su1lD7ExUdmpsSUSTD3ZDTI3GX+NQ17hkAcLBq4/XYeynRVj5SujSOeHiZ+Nw+BfQ0y59fb8TOKT8Qf0yenEYuPIzKWM+pOAEfaeBqrM8XU4FlL8gf/mb38XsJpIrm9BMhW8/g45ifO7fwV+qy6tniDVbvw56DNZ3AkcAhl65UvsVkSX9koE19D6N/NOzTjk7DixjNxUUaEMv8hXForKYDVg8PRoVTcrdAZv8tZ156dl5XujYS+FV637nzvz47pVHj7SJ2zdF6y4MWJ3SWvWHcnHJ3IdQ5PUOHZXjKgvN7IBPgNe/tXB669ZEoxu7bZQxSbKi4KXyqXMRtjfAeYB91sROBtdPIwcBUjRwgXgNfo9mayO4/b2bQoZZftnQ0NI4QnsImN0HD9pDe/MACTVFz1zjvshZu2gvgc2B95k5OTZE0fDJXq9TGJJmCHmbkrWRthJ4k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T6oQ+JpaFzR4fYzcu7FH1NKx2jnI/6d5U4wSZ/zlXxMEi/k1NFlzCGcm84EX?=
 =?us-ascii?Q?7LqLN59I5V4hD0zhRlj6yUzLPowIfzyHKf23oOK4D1xu53hlpXrWMATE1DFO?=
 =?us-ascii?Q?dvWh4tJqeecTa0Doj/y658GG7N+TWxCJkV1RKZGVc4k8mjAKzD5T0YiqOBtk?=
 =?us-ascii?Q?LYBCZcbAkBSvIGzat1LjphVesa44/CILmOU3NMvAPjoF5NXutx4xt1YsPJH3?=
 =?us-ascii?Q?qeLUKs+fCHRma6xJYLwvPzDCvl4EBMTzJLd7AAIJyS7JEVr41nH99ttBJ6co?=
 =?us-ascii?Q?huLn7aDC5WWzCt83ENkZaauAvc5Mm3qtd+MDqq8m/3C9gehzOH45BrCKLE0t?=
 =?us-ascii?Q?RHsEqhwlfsLSpRR1EuyrHq1x7fhgzymoCvH77W2WkeFrZ4ZrcxL99gnlk90K?=
 =?us-ascii?Q?mII3hceHooMBmTc08P+zeBqUycFY6tFbPvXqdZMUHZAc1cUTNkUzAJa9wgmO?=
 =?us-ascii?Q?USyjpdH0uAlfDIIiezvad1aZjDdeeTeaayNhN5dvJ31n4MbGcL0q4nohy2wb?=
 =?us-ascii?Q?rKxXKkeKidPui0fDX6EaNrf1Yr93i0PvMTO8+EQcfPd08Wg+ndZzygl/c0g2?=
 =?us-ascii?Q?0gk86hiuEUXkbclEbQ3fQ+ZN4eUR2xTsKSaOv8ecN1LjIKd77SvV9214ScEl?=
 =?us-ascii?Q?HFbYWYUjoa8/3KXn5j5m4YJshJdem80IcXffnI+BpAjn371o4n1okf0wXyu0?=
 =?us-ascii?Q?d5RJDW/JKvJFor2DY7MqS8FyMG9r5xqgXNgUUg2WrwiwIkp8uxRKH/o0n0Pj?=
 =?us-ascii?Q?GEvFLn9Ht1h1D2UmFlF1b0idEau1O4OU/ls487VgAN010CIy9AIU78yp1PYo?=
 =?us-ascii?Q?3+QytZNQTjsKI4qZMDHg+r759rApNonDfy5BYlqM3/CrtkyoiLLqybuX18YN?=
 =?us-ascii?Q?MKXI9LBGMrYAiwvzmL8NMFrFZPjIRxYckqVA7Q99xQrIpW37H59xkvbW69bs?=
 =?us-ascii?Q?iTErPMxs86MuqocG6ERZEQJBKJqjHUo3uFOV3XtnJA5GWwyAixrtK+Kadtaj?=
 =?us-ascii?Q?GortH3BxP7xKNwfdj/ERo6PZgFce34bEw4JE1MfkxpWaCtWB9XTqrgGEfQ5o?=
 =?us-ascii?Q?CJgf7ylwo9oOBssrBQSxzi+dVC6VT1+BrdiUXmDLJ4epJg7u23jHgzBUfcVV?=
 =?us-ascii?Q?SnuQQ/vE22FZSKTvPeB87zFDs+SoJvC0+sogHqrju7+6ZK5D9VYpwwZnE9PK?=
 =?us-ascii?Q?6xZhtBhB/jgDIzMeRR74COhg8jrJOSpbjUVR/NsMbvtKksZCYMKQK6rX7zlH?=
 =?us-ascii?Q?KA59WtZiT9FLDyVD2ECY20QaLwOXsQV55gDioT1A3Q5jCvc7IpmRDplgLJJX?=
 =?us-ascii?Q?sMgP2O1F7iOvus/rvtmpRTYB1stEfewnoawsCwInjCkBeRwE8nhrSMYX4PFF?=
 =?us-ascii?Q?91Lff9BTEG2S158OEYR1PBgt0UDJSVzHyKC72W2rD6HMNJmWCBoiAhN0rcu6?=
 =?us-ascii?Q?8+UPb4WnVcCWOvb2c9Bv0KyV4AEjC1Po2ptaEyWj+JMtzKSCt9HCkUg/FIJd?=
 =?us-ascii?Q?Yd4gJXa9cexkeIqhCWygTVVQpumZSYMLRFFBsVtBFQHUIeVYBQN2xF3VpAon?=
 =?us-ascii?Q?Xw8lRFZnsKk4B6akfrzJaxia+QCsXVsfZ97IxpNSHbRdMy40gpgK85Qv/tCK?=
 =?us-ascii?Q?kYhK7HGXkK7Anr5ISx/UQwfC76MwSsFdl3A+hk7D00vjDq88ZjatJWZpX4m0?=
 =?us-ascii?Q?D0A7rYL+iVSun4j+azJvyn3ywnspkBy2tjuweH0L2rkdkrMejNVj3zIaS72v?=
 =?us-ascii?Q?TWcaUW8NoA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8241f4-d86b-4f3c-3acc-08deec793700
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:24:09.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YitBUP9zL+7qspOCxxdz6oMwOEKSn80qsMZfIVf1HJfmRAXhvW+wxpE5ClHXLQd24rZus/8i6Zb8tEvgVlYv7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7559
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10155

From: Niko Mauno <niko.mauno@vaisala.com>

Add trailing space to value field in :prepend assignments, in
order to avoid providing examples which could lead the users to risk
inadvertent string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/faq.rst       | 6 ++++--
 documentation/ref-manual/variables.rst | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/fa=
q.rst
index 65d5db5d2..2ffacaf94 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -126,7 +126,8 @@ attempt before any others by adding something like the =
following to the
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
-       https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
+       https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+   "
=20
 These changes cause the build system to intercept Git, FTP, HTTP, and
 HTTPS requests and direct them to the ``http://`` sources mirror. You
@@ -165,7 +166,8 @@ file as long as the :term:`PREMIRRORS` server is curren=
t::
        git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
        http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
-       https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
+       https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+   "
    BB_FETCH_PREMIRRORONLY =3D "1"
=20
 These changes would cause the build system to successfully fetch source
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 394797ca3..0066ede0f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7843,7 +7843,8 @@ system and gives an overview of their function and co=
ntents.
              git://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
              ftp://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
              http://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
-             https://.*/.* &YOCTO_DL_URL;/mirror/sources/"
+             https://.*/.* &YOCTO_DL_URL;/mirror/sources/ \
+         "
=20
       These changes cause the
       build system to intercept Git, FTP, HTTP, and HTTPS requests and
--=20
2.47.3


