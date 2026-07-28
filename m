Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AEBC54F53
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:08:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7659.1785229682736024990
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=PbzCYFTf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrM73kPUBwKJ7KIGVaAWRI+Hxxjn1OgK08AZOhUQFvhOm+/nLW9+uMiRwH4BvQ676yB2ZkvI8yPshtfQKjlQhPU4Z1sEGjCFfTIeTa3OIAay/LLIWYTQCYDTZ7cNsbPnjZju84urs1/1BlRfBVpVuHLaJEaxd1R94BwzEWNGE6MsqNYbiMIREPhbqRNaBRvxOmpZto1JIoP27O0s+hnOGtGmwLwZw1CSqst/gBJhSvi7VC4Y2QlKrgAXkByLvMbU2cXzluAVVCuFw2CriAvyjffxWocExp5pjV4SKCvdDlSQ6qeF2xHFA9CLuQRvm80Jl/AON3ow6ixcRH9gmVv2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsV93fXwfXlzxx4GWfwj+GXnJGQW2isS9ko1pg+uXGE=;
 b=SXTlU8SpOveUCx4iwQCQFkS1Uq4AF9l1e5Zrq4I6Dc65OQSoidya9NkK9KQkC0eKV0JXErneTzs9bZ2WNFKXXRdSV1S2igmYx1AoLvqZAs1bJTIUNribDDD/AmT7DjySRjyMImr8jCYuYumR0t9k1f0x7CIwO4Ld7XZNArKzwOvd5Wf5FtfDz+UssWXElb3lTOs0D8uFhVaXQ94CTiuaps8K2Cm/OV1CJpM8zWYO+4ERu8iJO4svrPLWUnirQi9+eap9ir8hGqr7Bjs7G9/ErUOvrejfKrO4KP7J2BgMRcv2DyIsVeziOvctrjGrLc00hwwlVaGay4KKgjesoaDZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsV93fXwfXlzxx4GWfwj+GXnJGQW2isS9ko1pg+uXGE=;
 b=PbzCYFTfWKj+bk/LWYBzZIhFrMzNqPhWdA4gn8WH7bGePLfCZGxmEkBTOYA5elAmjVtIIZBNBo4pr0Vt8a5lFtvG7xVZh4JQ7P7QiwtQFSLjvsmDbO8VT83ZRjW312uGLrgQNojOQyZs9WzaWWGqF6rRolUtmaWLWMpx4ye7ZiHgUxpRgqzaWYjf+e+b/WFH4oHF9+b/kAJKzPuBXn2bEBGQUaYHw4Bf4livciBn28zkDvfzFrLah3x6zpl04D1hBBMpQ2PCbJKL5SMICivibqY97NJlOCCwQlukWcOTL0VbC6/RC/qHeLiujqonWeQa7hDnvfWuOPTx+x9VGY0mZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA1PR06MB9700.eurprd06.prod.outlook.com (2603:10a6:102:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:07:58 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:07:58 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 1/5] ref-manual: Fix occurrences of omitted space with :prepend
Date: Tue, 28 Jul 2026 12:07:34 +0300
Message-ID: <20260728090746.27793-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728090746.27793-1-niko.mauno@vaisala.com>
References: <20260728090746.27793-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0039.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA1PR06MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: a7323be0-4cd9-47f4-4600-08deec87b7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/o3/NmjbKKZsMvesix9Drhqd0d10NOSYtXGa5imn85MyDtM/OCsgRzxsaoMShRlSnlliNomU3D8UsJ00+xybp/nI//viozU4aYUGktzyMwqy/HcfwmI/4Zq8XMetcLa1gQvn9uFPIPgNd2zoOgfciHOU3ZIahzhu1qSxsD5eP1AOFFOhL9DrTX95GoDi41lCbd/jegYPsROoPXqnfPDycWtqnHsafks2P10lOQbzzoMVii6YnFGjwRc1Zev7kjXutGCPIIDyHC54hwsN2LreM5sKfQjdWNA4QqREH6cxwSTV0AE19xUqFa2Y+KJJ7rWTXPm6Bv6nF8cj6zwd43XSwExIR9fhoYQXq415RoONCvjMfRpUu6MGcO2zeS4gPyykKKOzbG0ig6LF9m+YaSqB198I3Yr5/VgB5yxesGZrmTwQywB8GZYj5Tee8b3JLGUWmT/jf+uGT5mMm+oIgO0xhzBBEjmwgWvrCKQsGU50pujU65HA4/VHsUDevfpxF/nrwT3D3K/WGwWrKD3axOwVy29rlQODlrYFWe3GaRVfQ7tsHoIieAb6oEbGUT5U+Uq3MgRZ4k6yh4vV70OvkSuOw0OcPUXJPTe8ercn9Qi8sxLibaUZKFQUCRWRKbFx1pj+OYtTu/IZYv5ghXU3FqDq1GFBLFTJS5IB6aR4D255x+jVZd2BWTc9JQ6teSeU0Nm36rz0QbtwsEx8sBH1b3EtrVbHog+c+2yUhYYh8M7/7Mg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EoTTbdGM/ukgMujS0xtb+KhSHmdxHgrd8FHIM/78kkeibgS6vAshDpD09JoV?=
 =?us-ascii?Q?3ISWEhaG0mrlSeU95qkUezBLVo+UFzNxD+YUabDZ0SuUqKkI8fxLI2XQQyoo?=
 =?us-ascii?Q?mCE+m4TTKjBwR+HY0kSu35FBErsSFxyt6QE+e3W64QNMp7WFmBFx9WJvPvxE?=
 =?us-ascii?Q?TAL3mIbX5xYaPAGFXKlhzl6ADH4n0GVP7qgv0Z9C2opMVqTTNeZvr2/aHDo9?=
 =?us-ascii?Q?P5MwpQSwKpjcT8ne9dYGkApmFk3FsdxArVV0jLc+f9YGmVpwlQ6Bo9QL0dum?=
 =?us-ascii?Q?GHyqtRBSdk6eL06I4szTTuoAjll+HwWSaZMArZ7vJr3wsbp7aCBAtNdiEvsg?=
 =?us-ascii?Q?er8Xm91/2CP/5duerIGUY0SUncf7q4xJ3goi3EgtvwY7IRHL6npD02VOz9bA?=
 =?us-ascii?Q?TzwTlpqODm6nEYnxpBpk02EGoKtLU1dN04hs+BMmQkREIyIo6ttlZgNWbtDt?=
 =?us-ascii?Q?jWWZwkYcNXT6gYt31FolVMr5hcWhS7jeEuoxb26bl7EgKiWtQf3Uyd+uykZ8?=
 =?us-ascii?Q?JSvnMhV0xxMuUbsLzzKeeXU2v8GoaG1oh6GGS+vDUDRF6XjQ0HkpDPVZ3enF?=
 =?us-ascii?Q?MClbSpPEWcYpzG631MAllHwzGQC2vmnkC2Qezk8ebvuE4Xu/FFC1PvUe5Y3P?=
 =?us-ascii?Q?Ud65pN/p6O8BqKcwT5tep4fpSrSq7luJI3K1qdXV8ts5G/f01BuatCKWzFY3?=
 =?us-ascii?Q?KhmuTp4VF54OTgyPtqcwYG16ZWXmKEI1x26zLlTYyHpu/8vRSkDv8JdZ2Rcv?=
 =?us-ascii?Q?+y3Vh25iPxj8BuCR2cAVKsC7m+cPSZHbX4gyKlx8uDG2UCIAw3TjYOHvM2ts?=
 =?us-ascii?Q?IJydyNtBaTkRK0aQcoEvYLN9Cv1rMiXfsvJVpsQsqUbw0Fexq120xHzE/ywK?=
 =?us-ascii?Q?9Ho6KdsLR3YcuHm8Y+jcxl+DB3dXvqvhaL8PaSp2JpyM93CVpSZefuzPiLFm?=
 =?us-ascii?Q?F3I3BJWROuxJvIUk2s+kAy4yTn47lTfSori0vK52iQa0ifPkqNObYUTabyII?=
 =?us-ascii?Q?GJWD+briuprxm7jTuW1pbSopPj0xu5QbAd/iB0eB1f+Bc8OnqmGEwxTWt7Wx?=
 =?us-ascii?Q?5d4B4KZPRQYagEMtQj2Glr1sPFNXl3mzXaQhWHX+sAR7wPMSkiqK7bxthBie?=
 =?us-ascii?Q?+AzgXL5o0s+KqLG49bPzhuPlktxOJURv6vHxHrg0KnY9I2rhe2u8AY2kt7Zl?=
 =?us-ascii?Q?MzbMwK3S/Fa7nUeBi7Oeo3NjBVWqvhcM07XChfpA9GhGY4J70REGzA6ed67i?=
 =?us-ascii?Q?GZSi6vR7BSmkLrV8HLAZLa6eEpU0qE+akgEqQkS4plg75z5X8uLsq1yxPdoW?=
 =?us-ascii?Q?QGD/cQLf2KKn5sl1ghI8qmIo6HAEUcapRu7qSLn913OJI695DAHlkxj8rBj+?=
 =?us-ascii?Q?RP3bOmbavt1845cduMT5it+wtqEuTtGjRb2Olpc2GzHrR3Tm4GeizzPV3J5r?=
 =?us-ascii?Q?lvkvbCR2WjUAyEwv0eG66lsLiyR5EQ9bVCV2jkfqsVqTO5qwVObW30ZGWIif?=
 =?us-ascii?Q?myGDKLnQmihEgYA43Ld9/nZf8VsJ6Asa9tJg6o5iCVayFsGUSO3LdvE6fJ0G?=
 =?us-ascii?Q?a7aR7VelyXJiwA4iNmIPkmSJDqfmpzXDiOhPnRTKrXzmEniPmW425NRBll98?=
 =?us-ascii?Q?cFJqZylf5wUiA7vQqsaPSPwsIh7x2PmatpEP1CWDCnKVBRsA1mT9PaG/q45t?=
 =?us-ascii?Q?0E2MR3VbC30Am01gcfoBcrnypVtmj5BN+MVev8EaKBebuUygw8zFUVFioYAU?=
 =?us-ascii?Q?t36AqhvV6GmwDlMrviCuv14W33fBZDw=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7323be0-4cd9-47f4-4600-08deec87b7db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:07:58.8698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYrRXPaK6pVqel2NXju4jzW+wav/3cyfXbpfo+wmddMPLIFOGYRb7zxnaPHeJix+Jtj9KX2InYK8YiatPc+B6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9700
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10166

From: Niko Mauno <niko.mauno@vaisala.com>

Add trailing space to value field in :prepend assignments, in
order to avoid providing examples which could lead the users to risk
inadvertent string concatenation.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


