Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE554C54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.576.1785256727391528194
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BtqUcQGf;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.142, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCdP5sN6L42BB6n9vSRwdKR/FjO3EQ3LMgf74sOAk44C9cBqs8AK5oo/eIchyTfj5eGXYmbTzNqVFe0n4PZpe6hhbl5KBlHXtsfhWyTRBQvArYNSFXrdJ1MTPSNniCgXtVm4BVqovUN/X047lP+eR6kuAHEDbsvqS4CzdU0Mh9lDJzc1Nyz7oqj2mb5P3P1XiB5AekxnpFiCbv5z3woje64Hs/h/R8W7kVDoJiwbP0cl5n3PfDQuXOxuaWj5KDwnYU1r8l8C+L48qbrBelcV5SqF6KOY6iwTKYBBwVnwtxaBgsrLQ81om2RpThBPDDcY+yVKlhdwC87QwuT/BMlmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsV93fXwfXlzxx4GWfwj+GXnJGQW2isS9ko1pg+uXGE=;
 b=ryVz2/aVzXDa0W6emSBm+gmxRO8NCsUdfDZZAtWRD/pVm5ktxOUZn7UfoDWXKznzShR7w7c55x9GUGEpX16X0adW5k69O29vqDHr7LOOgJ5XpJ+p3B7VKs5IAGRKPjsl6RU4eTkul2LMcCEBxvvWPiaTdcDHgO/xwgOtzUeEE4h1RvtZaldeohNbGDWGp4bTjhhjXbhOP3541Z3YY2vkUUOUgJ2hHk23EAdTEmgTIaf2gQRWbP0sPkqKb0vlS78Aaqy7KB/FkF5SU1Sk7vBNmPtMaR5chnwpBjj9rUyBdvzOrHRdCnf+zKAIA+9FfxZWwWZjtD7xwpqylgQ/rpi/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsV93fXwfXlzxx4GWfwj+GXnJGQW2isS9ko1pg+uXGE=;
 b=BtqUcQGfLHsE6/uL/srPO+sHkGcppf5M0EhzFp9SonPlbO5ZV93K/v29y/e0uENgdcCVKOdFuqxeK3+kki25tIM3suCquKsk7yga1M6hENF5NN5ZTkRW3uq9hwTo3dEcp1Qy1bXK9oTvJOWARXdFx1Bq8CsP6HoBEPPfKiHemL3PkLYqhIQ4GgFQwL2YIyq36B7oUZLv//eEDYh2EPwaZCoWOXUJAQ+lewJ9D1tCsnkPlwA52obugPn1ACz02sKhBF+dN4sZwKeF34Hc3BamYhO4j1FQOJf7X2usqFFSnvqSJafIH7CsBPM1UPpJVfIRoqeLiKHpTwCWMrbEPA0hVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AMBPR06MB10211.eurprd06.prod.outlook.com (2603:10a6:20b:6f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:38:42 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:38:42 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 1/5] ref-manual: Fix occurrences of omitted space with :prepend
Date: Tue, 28 Jul 2026 19:38:02 +0300
Message-ID: <20260728163816.17230-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728163816.17230-1-niko.mauno@vaisala.com>
References: <20260728163816.17230-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF000167FB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::675) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AMBPR06MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: a383a926-815b-428c-0025-08deecc6af6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	d+diieYepkw5W/BvTp0fE/mWcjGHBZoHXawr7V3TkCtsAy5+qFFv8gD8DM2UjsJozHlB871AZZ8/sGV5rJTxGmfU1nWMA0G3QKo6tg0ebKIVvV5AVE6+wM9b7H3dWBeG65fGNJUc+5O4Qihcd03S03Qw8Cbm1XJtSQ2y/5FqvG39S6yNEjngZPXoAPGZTtoKUkQiDQ/Ja8ZuWUpXUwG3J34NuLNIDBRwGseoyIzmTdjpAwCmMOtp9ui7HdJc8zru5nIaOnd0qHbgqFDooIoHQCFPUS8zS8eFeOnY3NDbxPOqAkgaHeMV4S6VSJsheQWG+JA6rnVztSy1aq8LXCVhejrYWvCnlK43rdZUvxufWgCTMNFOEE60EhHucjZBsruNqxrFnVem5TqTjGn2bqx7fEEzhjVL9HqRzqLpeYgOVa5PWqod7WULO/cEyaHkv01dP8H0vljWicuhiZspqSkb6gPQhEAZ0PulphZRE34UJef6gzm1U+0PDi3pVGupgn3zfWlzbjBPYwk3TD6QUGiFjBXse7P4bV27TRfQWqUzYJg3MvCRBID4Bahldiw73Ta/hBk5xOrX6uFpEeU+Cnq3HwQSG+rYv/2PUDm2XrPoVYbWLGgCn03iO365jqv9sdQLVVVdOqXnmNEDIeKqXNZKIWpihupbO4BHQfibVbGk+U/qqA/tuZD3D3O9plCP1jGAEm41SUYdu6RmWzbFBBSmidR+WLtXk1z+b3c+zug6dDk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5dsEJ+2pZSEC+Yqw2e67ikvXLM78Qdp/Jf1XGCayh7eoneFaRHHXkmasdGbt?=
 =?us-ascii?Q?+PLiKHxsR0DrEtqoiCLCaGA4OqNVUs41KFx34SsCdH+QqSiW2B+MVs1c0kdY?=
 =?us-ascii?Q?M2Z2PVXaSWIqaIJ7dsoTd+/M8VMidBBBSDZcxfhjtpTZ1CpnyKZDwHWiIdft?=
 =?us-ascii?Q?UPFBzhRNXif6z2Pg6wMYD0QBnaIHtOQkj9vqCa/jXB5XXuuLg7AFsfVeA8pK?=
 =?us-ascii?Q?X7x8P9qoyaHjEpQVnaM8Kzqel0GUk2VsJk4QT5g18EJHLG6qBw6DROYDj5U4?=
 =?us-ascii?Q?228fAA/CleMSJCJhMkSCCsez9sCeopBuVdr6wC6QEUBksWF07V9xGzufZnD0?=
 =?us-ascii?Q?vhMAUbica6DnsCOt8TIX8ZlhxV3TfrKXZ1KbG0MFjuHjQO6nEQFR+ZrFR2IC?=
 =?us-ascii?Q?zBYvzKBo0+ixleUSAWT02eOoxKEb85Gb7XH5XWd2F1AiQfFbWYKzJ84KzYVm?=
 =?us-ascii?Q?e5EqiIOaMY0bX2osFFQG3SIlKTdgANEgkcuvJakyuIauvc03qVRj4bch3jsb?=
 =?us-ascii?Q?yCYkgFEkNu+2l/YIWR/HoEwW+ANxlhNOXtHcoE4XHsK8ZmWmxJwphlw5RBp6?=
 =?us-ascii?Q?AIw4lTuWBDGZn9h945/vH/eyxnjP7NSir2dUUt3di0ToTfyQg4EeyWwWRBFg?=
 =?us-ascii?Q?S34ZimZrWAEnlC4JVS4jBMmInvWj7kmT7zLaFEAUjbe2DKmcec0ol9xnb2C2?=
 =?us-ascii?Q?0UtbaDkxKc1roIoCuqCWhjSJv+r7tuRKmkfzd4ltHv+qZaQY4uAxQtvGVLay?=
 =?us-ascii?Q?KtjPSqavYAy1PfPbCLf5EhTY8wAuK1+EdIEAB2FHkxPCo7m/WL+HjitjX1T/?=
 =?us-ascii?Q?UKzB1Sy2iIeT9NmwLkkcO4nBo31bX29XNWCGczWQxW8SY6obLTSoE5bAorRN?=
 =?us-ascii?Q?jiy2a5gmFJUqhvghmxrfvIBHmMGQnGTlXHC59wKDghS6cOUxaf/pialO8FE6?=
 =?us-ascii?Q?7FD5BIhUppuSe4ymGAXtrBI1VwOPhF6bkdCxiUeEa1xaO256WxyRC1SMFdhA?=
 =?us-ascii?Q?AdSpAAVkb1mTL0nfQTHZRIIGhAvnWC/8McdeZsX1OGpf9q0oMC0pLNXrWk2v?=
 =?us-ascii?Q?OW/IVxbieYa7DVrMQZvMlxOJ7dCvYx03MIP8JdxT915oLKv8zLUu6sgWz3ZV?=
 =?us-ascii?Q?XSUusf2mUIyPIPXlwxFp/1Mvva5sBmoRFxumIpfT5gAnIeRaSXf4L80WwjqX?=
 =?us-ascii?Q?IhVKtsv8nUmGbOuJHVN20qp0ZGQU2c0mRrprXkcWkL/sPJ5NP5hFfiU7eMMx?=
 =?us-ascii?Q?BLqaXcuo/EYPVsc0eGRJbMouOEKUHM/ok3oagxw4t+CzShFwUW4CIEKT+gzw?=
 =?us-ascii?Q?4FKm8Bibe9tA0CpNsZ7VYlT3ingy3iALwb9ofeFXRKtuqMTF9Po63B4BYG4M?=
 =?us-ascii?Q?VSze3c1mCmRlI9jyYFPEKdUZzgz2GXtdKvCxbqpynwk29E3Q29WQqZzyik8b?=
 =?us-ascii?Q?yRurThLjHZKyHPOWAYZDkv3ROS2+p/xdJYMCdTST0cCoLMzVcxl8x1rYflM+?=
 =?us-ascii?Q?CxLAbUhRc6y8Q543LQfTeCHMogmxM0acgI9tNc4gEZ+BmII1C9hoF1OhKSSz?=
 =?us-ascii?Q?jLQkk80xeB/354IKM8JPjdOZMDspYygKk/I5RY3VRb2/5P3yOt7KW/1NyMRu?=
 =?us-ascii?Q?IulCCk42sO2WLOTxcMZgog0H9WkRt76rBDD4hIaek8lNeWQnkKhF8Kt1o2Bf?=
 =?us-ascii?Q?+e783DeP6frzYjvq8n0rIw1m1nl8v+Nv4F2ANaLs4TqYi9olFpWSA0TYF41S?=
 =?us-ascii?Q?fL0QXGnIB8YxE+Kd1UtMEkTfUsvfQSI=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a383a926-815b-428c-0025-08deecc6af6c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:38:42.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRhRzfeGrTNL4bAWK9n+VDiTZSGJRXSR4o/19xoDbXc0RC5wRdUfpDfuo0ApJZU5t2f4mMNxx/DieibPa5UiqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10211
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10178

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


