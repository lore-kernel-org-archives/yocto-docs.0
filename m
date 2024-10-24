Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AE5D0BB6A
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 07:19:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.129])
 by mx.groups.io with SMTP id smtpd.web11.8852.1729754346845435053
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Oct 2024 00:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=G7wRS3bf;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.129, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk2j+0NyxwM7xBNqNK48pSVI55W23fnZ9VyDc39oHOmyMjL036Z8q68GJGCV528Jb5oY98lbJiMEj65UFNpTFZxBvuC8pnlwq2K5vV6F20k2R8tjXmNf58fdcCIdTFt7soV84cigJRecZCB5eYrdKpE/1HMLn6koaJRE4+jD2agx4yvEev7dDNRD2k11/GweVhy7ZOyoveRoTy/JGA17MQdPlNLwjRskz3fA5rFDtlUbKwCnb02vOukqCVFh/c2pzp7h3eP23fcE2FHnepKWKkGK7M8asJeOrSikbpUaU9v2BgXFd4f3pXEyHU+04ACxTGJ1cduoImy+32o8duUSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaKDWtlgUOXYm6etgHa8XbL7J9jPQMFMP0piHtbObuc=;
 b=Fyk/cIyVhjIIH0wMGRWKHVYhZyZ0rHrh4bYcPoVGBMHFS1lBgV9XyaISqTZnLCEqpRKRRNPyvfHWx8CrXiQ2hC0bbgFFyImc6Jg9ySHZG3qzDsGostemWO6zmRypDPFxFX/g32K0fHryAcEQJQvxnr2iyJ9TMLSL+bitkEHkSAoVaCA85FByWx+8u8No2evRie+RiWVdTL6yumdGZEiRrG2UMZEevfZ/CBqR0bHM2OSzyED/ziZPyPY8zTvqHbGyCJYaKtl6Ij+y+6AG6h3NFnb2zxKGKQmaVYdXQhyH0XCW9XQE8VwbIlOkd0GW4WoaJa22zt/PsEQ+o4KehhwKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaKDWtlgUOXYm6etgHa8XbL7J9jPQMFMP0piHtbObuc=;
 b=G7wRS3bfR/iQrQBVxhGk0eDm+yFK8rqrM5xnSOMNgE3bNxGl7Nr+pq2f5d4xrpSIG0YB9TnmLh+cbZ2LuY26SGNwty67HfAXjQmA5SFX9NLKq3xUd9JaPYOKvEpppVYEqC54arTEfIxWpi/IzWWCNEEnrWT1POKOvMgnG7v1hABFblHUlh1mVe6H9G8jtj+c4//OR/sNSLqwkTbVrdX4W6a81FOg3+fSVRPxegCURtiaKEnxr6Eh9Pq7XNq3r5AtnTA8SsRDX7wHnwBVJ7NTRKz5c2vWJYHQJ9PLRL8gMDRrOMqHtEeOgi92AK2gD5DwH/beMrT/PfeZ203iEkACYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9604.eurprd06.prod.outlook.com (2603:10a6:102:446::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 07:19:02 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 07:19:02 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: docs@lists.yoctoproject.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] ref-manual: Sync variables letter index
Date: Thu, 24 Oct 2024 07:18:37 +0000
Message-ID: <20241024071837.976031-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00004598.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::443) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9604:EE_
X-MS-Office365-Filtering-Correlation-Id: 3067fed6-b714-47e9-e2a2-08dcf3fc22b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YEbkTapPrtY7vb8Z+5JNPedveWL0v8gynJXmry3Ge/KINlL//um+bni7XDUl?=
 =?us-ascii?Q?CWETb4opVnl6oxI7jdHuZXVuNls0exu6iIHwGAcXiKo67PRtYdBG1hnK6i69?=
 =?us-ascii?Q?qBEb1SM7+we1Fw0ejt5c63dcC8NiMO3g6iajH7i9nsOwo/LWpBDx/GBuj5OP?=
 =?us-ascii?Q?zAWLZHvIMo7vLS4yJjFkEMi+ykyo+gLYQ/gzz2v/bQZj2lxXYO8MTtAVI0Cz?=
 =?us-ascii?Q?0THlkHT9OHhXaXCJpJ4jc0nu3Na2az4b43bM24zRevyWpmrVAcKXIuXNRt0k?=
 =?us-ascii?Q?tSHEBVzezcMHkif2w8fN/DI7Q1aCeSVBCelEdtIj/HXQQ4N3sH1nVoa4YvtT?=
 =?us-ascii?Q?3FmHz1kAz7B5AQHPg77F3p0GNM9d0V0ctRgPszEyjf0+gMHqXMp8lQJO9K5r?=
 =?us-ascii?Q?xnh4RP9awHLonnmrNdEng/6DXKXY0LWe9m+QVZKXUojz+0V3GF5erpBCgoFl?=
 =?us-ascii?Q?vMSLyo7nJZbjnDpncnIFzNDYMjqV3PFAe4l0NzhoioiIyrNZGjPbWP1M4j7Z?=
 =?us-ascii?Q?1wbB91qWeqjqCdu2M+wnLwLk8liXOZwt5jlxc+YHNHAnR7FDN6BNtVFW7sxo?=
 =?us-ascii?Q?SEf9M+LJ3uMFUUlG3YUroG1DxkzyRMJ/8viJD5ct/Oj82BI+gV+REvDJvSxf?=
 =?us-ascii?Q?ifiwZtRJQs4EJm80orJsDq/edp5QdE8Q6rDPA/By8Kpe+GvivFHNh4CXCApv?=
 =?us-ascii?Q?nRjrptYhuYs2ecTMVE8dGuLQ7cUGwWR0EUFdxCC570zt5ng+1XmfbT3pP2LD?=
 =?us-ascii?Q?dDVCbZeKZ1q9xna0R/zXDEn2eLCvUjuXFgOT/btwWNbvF0lgzF9KFmwcnDl9?=
 =?us-ascii?Q?7alkncxUv3iyyzALNDGwwrJ48LQXFpRdOhQNkUNq3WP7IP7BVg2Amb4S2veZ?=
 =?us-ascii?Q?/1OuaDbdgeOx0P7IV4dPLJMIu6Qkhm8Qap8MlnAw0pMTMZsn1aeTdXRStAPB?=
 =?us-ascii?Q?dq+F7/gXMyomAm8zTCjiYuCOduymAvlDFMYOYC0PuPCKGrrqD+2Tb2QENFXj?=
 =?us-ascii?Q?GX+YtrIDUrC+LInUut87AV7NVrugI7Sd0ENTbfkK/4O6lxsOcKpiQR5Z8co/?=
 =?us-ascii?Q?opPdziyzw+iK04rIBCb+kKvZAX+Z6ZDL5iPh+q3NpKFsqrGOc/K08oQobMH6?=
 =?us-ascii?Q?dTH97ssmBIDHAkued9uKBeUgnaV41qe7kvIj7oyXtVVS0z6nI1ltxloSy5Is?=
 =?us-ascii?Q?EZk0eJ3Bh2nDjQNR77u2ru6TLiouLUoXfAo6F3RZCxgvlL78399Oen8lV6Sw?=
 =?us-ascii?Q?W9Udl4kszO8QPR1aRWQoeFlHMdBWhpc+wAClGKN/8xyUhHiDkscYF5ovOdud?=
 =?us-ascii?Q?2MfUa5PbRxc1of3EbrdtLQ2LmcPmIXVKKZhfYoLHYHZsMvG7EfuOVDEPbcif?=
 =?us-ascii?Q?A5Jp8CI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3iwAX8bYDoY0jc5azryYW0Rx7Ccogctr06hn5lPKBOhJlZ0TDnhoXrXu1Ten?=
 =?us-ascii?Q?nqqD+NE90LvzfClVN31BWsTdE72Nj2u3SerAUEwhKiKqaM2RVRdaoOtine3u?=
 =?us-ascii?Q?b3c++NcoCbYJ+q9izP9s9X4R0eJOsh58+eED22asrfgT53YiS1EGdVET1G4u?=
 =?us-ascii?Q?7N/K9v3QnjsPSe3E8ghMcww31SKcVdQ9XE8z1y7nYeQ/uPM65dbMldTiFn1t?=
 =?us-ascii?Q?R8uRGLIVS+FLsIN5HRHU2gPFHwF/SC9L3G8MkU3nCp5gGdKxzTGl653HyNm8?=
 =?us-ascii?Q?X7yBQ2ACUhFLU6w7EnA2abO8cvYUa2Efk3SwATUrFcjWZXk7FKOFGmLrYnFd?=
 =?us-ascii?Q?KxZ7zRLUMg34IOOUNMPjTqruzCZ6p5qjGazoud7mcR1JnXN5XLuEhXOacgSB?=
 =?us-ascii?Q?VQWHkryMVbLUDdtSI9o+QlOyIutNAhELMqpHtJCPgItr+dBiykbK7pWkHYMW?=
 =?us-ascii?Q?rhelWgyDuI92wNw6IycgG2D5WXRz48hapiyQrYfF5jENeWpFg32sRWJri9YF?=
 =?us-ascii?Q?czrF6EpxRWwftDy+CmLxnLG2PO9y9rBCYfRT6Xxm+LWb8Zg5rv0Ls++cNhDT?=
 =?us-ascii?Q?Mew41YtzDtZs9JoMLrF4+gtWwnD5I0i+H0zopHPuKATxEt+GAMJZ+4BNKkX6?=
 =?us-ascii?Q?nx1ztHr7ZTcYwxYXSswawizu12Y9nlvbrpQlTwA13jPhmV+PvxqUQAOCjzM/?=
 =?us-ascii?Q?3ZfPPuVsq0kUrUGsz0s4cp4oF0lBS4ANFnNGHbeCN0k3E+lLRS30uFzalMqn?=
 =?us-ascii?Q?pSyMWYP91n3u7zBlhQkRHsBq5etAvZyoiAvYRlgdgxuOvT2y6OT7oRELwWbq?=
 =?us-ascii?Q?CXAGox4Ag+lPzpgqWw7dPF2I2yO8KCxucPRjO0UdW5adz3+q1x1rNlWMjDvu?=
 =?us-ascii?Q?ACEJNYdYi3PuwHu6LVzEGYuIjaHCC8nn+nVqoA0ed12Wl3AW/xTKikZzsp6c?=
 =?us-ascii?Q?3UDXVK6Fod/Rzf26IOwNbgHUFkYNmqyrdgxfVQSeJZQ5a3zeRWSsrSYyZiMn?=
 =?us-ascii?Q?AZSY09F4yX7HEJfi1OSEhiBsJBDWKkVG2c9XjyMHZQ5h34Kp1XlyvIloBdmD?=
 =?us-ascii?Q?95tSTOHv+7z3AL7NRlcUrRbgFm35zTyVjTktxXMeUvqgVxBLEV3CnRzkj0uk?=
 =?us-ascii?Q?NZYqu1ChiyJuomPsPubaKsabeGdPt+oCyUam5dKLnBH94VxrTckkpoeQyXQu?=
 =?us-ascii?Q?3fWUdevh4z63PPiIXIrCkKGyG7HqEqm0VZpRtfa5/w1NVLZMHvXXsGtAcNAe?=
 =?us-ascii?Q?GuA9nEpICJH6nG8dc+476YjVf7KLbyqrop0UxpR32vLG5zn2ikytQELZ9l9O?=
 =?us-ascii?Q?U4OyFzn60vZaNmF5AEIIiQfzoxU37F3xwtmt4KIz8CGs8PyTuY2Ve5/APc4W?=
 =?us-ascii?Q?vULBxrRYjEWXxzUz916qN/7ZKJLoAa/Q3U01Rzpvr7xryTJ3U9liHDHpJ59p?=
 =?us-ascii?Q?hr9gL7EiLYmFR7nVzILySuK0JRzMeZO7FhR4tHlv5HVyjinziinJglHpuxCv?=
 =?us-ascii?Q?sVQ8FhxL2P2gmzLgiGVe6LVo2QbzIBZmeUAHuZ3jKWLvVgx+I8oheDlrCQ0c?=
 =?us-ascii?Q?dZiJ9LCctP5cslkIT7S3gKxmT2c2BsNKPWZXPmfC3YCSV7YPEt91iPCspaVP?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3067fed6-b714-47e9-e2a2-08dcf3fc22b8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 07:19:02.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgfbYtjrSR6dA1lG00+1AF8WP4TozE2e5VuZCztlkTia6iFmwV3zJXdIcm2FH0scpViYkPS54D4M7M59MER11w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9604
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Oct 2024 07:19:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5576

Update variable name letter index so that each letter leads to first
variable name entry in the list. Also add letters Q and Z to index.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/variables.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index dc7a19efef..07ed143ac5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8,13 +8,13 @@ This chapter lists common variables used in the OpenEmbed=
ded build
 system and gives an overview of their function and contents.
=20
 :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
-:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FEATURE_PACKAGES>`
-:term:`G <GCCPIE>` :term:`H <HOMEPAGE>` :term:`I <ICECC_DISABLED>`
+:term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FAKEROOT>`
+:term:`G <GCCPIE>` :term:`H <HGDIR>` :term:`I <ICECC_CLASS_DISABLE>`
 :term:`K <KARCH>` :term:`L <LABELS>` :term:`M <MACHINE>`
 :term:`N <NATIVELSBSTRING>` :term:`O <OBJCOPY>` :term:`P`
-:term:`R <RANLIB>` :term:`S` :term:`T`
-:term:`U <UBOOT_CONFIG>` :term:`V <VIRTUAL-RUNTIME>`
-:term:`W <WARN_QA>` :term:`X <XSERVER>`
+:term:`Q <QA_EMPTY_DIRS>` :term:`R <RANLIB>` :term:`S` :term:`T`
+:term:`U <UBOOT_BINARY>` :term:`V <VIRTUAL-RUNTIME>`
+:term:`W <WARN_QA>` :term:`X <XSERVER>` :term:`Z <ZSTD_THREADS>`
=20
 .. glossary::
    :sorted:
--=20
2.39.2


