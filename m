Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE94C54F4D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.121])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6565.1785223453529974003
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=PehUhCtY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISAeg3+OqI5/nRVQrj8f3Q7AKYTXYD8CzTcHH8EY5wrKX5wzrZQT7TJ35al83J+nfu9ujlsiG2/txKZvM847gCkV7EwKpy8qZpQZtsZ+cGqBTtOF4ksSnsEsioaca9KPxHDeCpjPl8NHJtJLV8XOTR68I88bX4vPu4E4Z+DLo9iLOqMuFVBPHqFmgF8Uem0vMqh1d/0tY4BEeo7hmf0/3RP66/60OgPfCUO0LzSnJ7YdJD1iftGFQGUucJTqHYvCVVfcD4j94614W/oHGFPdkzJX0Juw2YNhuCfiSbJtpB1eCxSV42Pqouqs0XSNR+mnQxytn9A3hNgsSctH842thA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLYhYIfwJWufcBX5Kh1GevvAx5wW1gUeogxRyekRwIE=;
 b=l/GkNNZvxS3MdUo2OPS6CEKuH3QkoFfTP925WWnJ5jcNbQnV5fheEk4uUD+O53Ug8PB0UnQFJCLf/6zIZrqs83i31K7XggK6AvkuP9ALhcddhJUyuegdpSDM7IBfxR0rI7stXs46/tQT/+oXaYOCJiKkg/3nNHzyQ31h8nky3B8mS2VqlexRAKeqVCwRbieeS4PJJOjn0fw/iGbIJC5B9v1W7SzDohvA4bZiUrxV3LfaRUTxEVCCsb7QeqfAYlpNCI7lTiBqDblRekHGJ0LiC1oUZ0DuYYrfFPnPuv/nis5klnwG0byBbFxi3/wIbU6cuYNd203xF8CtE+fKRu8eDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLYhYIfwJWufcBX5Kh1GevvAx5wW1gUeogxRyekRwIE=;
 b=PehUhCtYZyi/7J8WPcGeqfsoE4vbbPS9yT2jDcyxY6WZVktL5fFcXwMedmwwgM6zgzbtSYkvFvethG5bkDK887x+RE0m+lFPU3UL87z2LD11XKLJVYtvtk+KMuNdTWW98Fn0x51snwoAqFLq9vQSDdXQYeeMnlyk1sGt0idCw2EatpLnqCHNmWNTtN4gq5Yv9QPitd1cMTYKUsShVYrsVcUlNRDiimR6CF1t91vf4P0yCyI8XlD/I4PxN4KyUDSWgcifEIw2qTbBNdQOBZYDTDi0ShlJ1YyVbqoLBAMzJiqR9Wkx2Pj/z4/1PDsHgsiY8ktuHAXj68JgCJPv+/Ejtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AS8PR06MB7559.eurprd06.prod.outlook.com (2603:10a6:20b:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:24:11 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:24:11 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 2/5] ref-manual: Prune superfluous space with :append
Date: Tue, 28 Jul 2026 10:23:16 +0300
Message-ID: <20260728072328.11926-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e127e2c-7c76-4e59-85e7-08deec7937e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|56012099006|11063799006|5023799004|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	uGeTNqUaFqElRtWUokIhg38187C7TQnqvNamDHk2m3tmivGRuggHlxgvTXXXKLZ7glaK/kVUTwlVAiWvFc8/ZYJkr/48Egtn04J6U6RuPPfkvdhk6zYnvj5Sm3n47kE862jnYpNChNXU9NaNEXfz/C4dLFf94yMgDbt/I1a6GiAvtu1RzQp8CEEDUKzjYTb7VFgmwQxgRZyBzLWmchc325JYDA3MHg5v7eBhXU7z9wAxMWBXQRjf4pJHg/j91hUAs/MBMWHi4nggTD9jOXBR9f1JmNgcTmP9REYykHoicmmEb1YIeNz9EfasHEXQ+GVZPJNajepnm2tPhyFO7VR5Akd3J7qR5YIBc6lAgVLbBSKe0LOtRHC0/4TQa/wKltOT7/OeJE9+ht4nnWZkvVNfs1G40RO9sjEVbsyw2aYA+O9C6QopcyhgV56xSnN+1SQn3TDNPOftEnfm6lMttSjWT78150e5VTl1GZ9kCqEf6sDYhKFSDTnCiIGW1g6QNRxIRbmuLL0uv/kc3K/OYJ1qXqf+5nQBtuQIn38urmW6twqhL+8OTRU8yUdxLnyjuZy/HpCkp6GnsRfM65ZyxN5nD+DePRNGgbpz+jgr97DNgLPPol9anEaSb6VYimRC5oYbZDDKHxUZydyOGAjInEvBODA9B5e3IVchRprnqoFPJsI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(56012099006)(11063799006)(5023799004)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZneVZ8LFaIR7+jSyj/SdFZFHmLDiboQ4gWJ0BwqyPRw6M5rRGBeBhNPy2e5f?=
 =?us-ascii?Q?/R05i7rhENaQ7B0IFQ3PixC6Shcpv+RRjcvVmMZ0RCSf4LIySxdt9boKx1oT?=
 =?us-ascii?Q?OZANIKmgXOyCRWIUV1d5foOZMurYVmZ1h8mX/WPko3rLD+jb947XvrHbKc0w?=
 =?us-ascii?Q?ofUclLtDTO7KNUSwphA0cJoMNtZIqlv7ycWd2F+fJHtYAHEPhQKM5DJE6F7a?=
 =?us-ascii?Q?zIYaGrJ/5FybprZk1HNWFNhSGt0riT6LtLbGOM82wwQIRgwUdmYP87A3DSCD?=
 =?us-ascii?Q?E/V7+MjU4ILYc0s9HT8PDbyzEaR1XxE4LOtnt/J/Q51DmzYhmcW7fQ2e6dCw?=
 =?us-ascii?Q?qGCf15Nmsn043nF8SYRoge9mC9dOj+KJ1bFhXC9YOMIoyxfV+v+UCXbC2BM8?=
 =?us-ascii?Q?F9f1Erzq79koSa4Fc21nvybXPHNOrkmyHhxx9X1UqzpZ+GiK/JPztdtXKUPy?=
 =?us-ascii?Q?HVKAS6ToCA4NwWvxO3Fv1+qK6sznPogY8Uqm38N6kB0Q2tQt6vhVqppG6fLB?=
 =?us-ascii?Q?5DRF3upgAK9i1o5VdUxqMjoXGfZUUOpHd8SI5bHrNRZCdqTQKhF9HyUWtR3V?=
 =?us-ascii?Q?kjVueVXeN6xHfaJNslRu/53lCGeWa3Y5jKlp9ZOztCW3kNe6WPddOWra0K0k?=
 =?us-ascii?Q?dvfJz/fFCuXjEMxPmcs3bcyRyZcQtzarZIucHsrN6oaTROAsvdZFfH2fP3V/?=
 =?us-ascii?Q?A6lWOTCnPfA2gGMq0X0tV8ukoD/3iwKQadYKFKRXRwXkvy9OTA8e5i5g0ZDL?=
 =?us-ascii?Q?b+x9oZ1c591QTQXWX9G6eVh9D6KyPKm4b6eoz388c5l5tZRtY+mSKzC9OEaW?=
 =?us-ascii?Q?P0LtbFe7oAtYQuhPxG+kkDUCmsIaGHrNzDvrZlt6rksSVrqVINB1ayIjnQzH?=
 =?us-ascii?Q?bQFG4XznDLc+7q6E0AQXbnmM13Y8oQ99CMEXKQB4yhV+cT9+ld4ToJGCGHI/?=
 =?us-ascii?Q?PsE2mDIUWqI8JpoMtcPS3pRXICP3N6MK179yzh1nDNauxVsX1bxma7Pu7T/o?=
 =?us-ascii?Q?vEgiEZmF730/qmX8qPDESJToRPCvsKi/mxs0b0YrbrOauuyOPhAK8Tl3p8M5?=
 =?us-ascii?Q?BGKw7jfYAVjz7KtvGQbcdFrv25Nh3sIEU0cHkqCiZRr+myCxjuhQ/aO5hjUm?=
 =?us-ascii?Q?9UySbY0hxNCxFt1V44daCfeA15com5u4n687U6RYykPLSxCI0Cdd0NWkTACJ?=
 =?us-ascii?Q?NBNw2rl5TEh3S3Fuz4pzH3LMYr8mQsq5BEyt4hq+4DntfIPZwb+utCB14dkx?=
 =?us-ascii?Q?fFsiwAvrphlHEAYDLpOfks/r4wza2g5/9k9pfYjmEVMKZwoh9ak+Z66rvHbj?=
 =?us-ascii?Q?RuaU1l5PSY0lGUtsGjrmanvN5M8OCYNQlxjsBdCH/VIzAG7gCUk1f4a7rlNS?=
 =?us-ascii?Q?XQ3n52rNCvLa4gWnaEGNxBgI1AQ4hQ/tkff/0k97Oeq7kZijyREZJGNyAxfv?=
 =?us-ascii?Q?XoPsleW6UXhAS0MWbkQozZivF4sm+01dZwwhzth7v1MgoIeggfjs9NcazCm2?=
 =?us-ascii?Q?Jlw4EJCrnirqxvc6n6DHZblLQwJApgZfZyEfAP37APOVZoWxXkOEk2eaktEr?=
 =?us-ascii?Q?yDpTIBFVmxsVW2nfSaHZ6A0RFH9u4KRVaLp5/81ytQPLwpzcU3q72XQ0I4sS?=
 =?us-ascii?Q?XKcAzuNs25J1Kp5gFHbKysFtNPK6JKJvTVGfdFheBR2j8tk4hRtZ8MNfh52o?=
 =?us-ascii?Q?iZrppAL9pB7Ssg+qUv/Vgo3rYuo5DzVPNJAcPIiQutlI2e82QFYjoI5qVrhE?=
 =?us-ascii?Q?4VlepeZ8Yw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e127e2c-7c76-4e59-85e7-08deec7937e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:24:10.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRxwMPAcCTlX0y2NyCtyRnKEftV0REML/afQ0zfb3HgPSAzW3QcvEqVUFEiiNwMfndzG7gkqWuhLBv9/OhliWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7559
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10157

From: Niko Mauno <niko.mauno@vaisala.com>

Remove occurrences of superfluous space characters in value field of
:append assignments.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 documentation/ref-manual/qa-checks.rst | 2 +-
 documentation/ref-manual/variables.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-man=
ual/qa-checks.rst
index 9654cf08e..09b0f628a 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -889,7 +889,7 @@ or "-fpic" to the compiler command-line options. For ex=
ample, given
 software that reads :term:`CFLAGS` when you build it,
 you could add the following to your recipe::
=20
-   CFLAGS:append =3D " -fPIC "
+   CFLAGS:append =3D " -fPIC"
=20
 For more information on text relocations at runtime, see
 https://www.akkadia.org/drepper/textrelocs.html.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index 0066ede0f..b124e9c30 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5559,7 +5559,7 @@ system and gives an overview of their function and co=
ntents.
          KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc feat=
ures/taskstats/taskstats.scc"
          KERNEL_FEATURES:append =3D " ${KERNEL_EXTRA_FEATURES}"
          KERNEL_FEATURES:append:qemuall =3D " cfg/virtio.scc"
-         KERNEL_FEATURES:append:qemux86 =3D "  cfg/sound.scc cfg/paravirt_=
kvm.scc"
+         KERNEL_FEATURES:append:qemux86 =3D " cfg/sound.scc cfg/paravirt_k=
vm.scc"
          KERNEL_FEATURES:append:qemux86-64 =3D " cfg/sound.scc"
=20
    :term:`KERNEL_FIT_LINK_NAME`
--=20
2.47.3


