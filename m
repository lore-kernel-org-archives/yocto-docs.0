Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88945C54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:08:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7659.1785229682736024990
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RNk6vO6e;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IC2REXEOlOtNKwMXn4w9u2L/HR8zbQuRhEU6C/ae32H5OSyRae8hIT07q14XQptPEGhhuSGOmoT+s6zPdZ/yoQm35iH9TRJXxL4rSaZWWqjEYKIRCDLC5621djNOrRCaQ5lt16IL4LD2papMmpN+7cQ37jM0Jzi1gphlSxPuXKRfwR7Kg+6Vbj9U8b+fBKN4hqKrBwg9ln4/KyoY2jwW1HFxU2Y0ZEs69Mzw6HYRt7BLAtsFu7VjD6gTrjWF3za0V4uDqpDmua+SI7sBB2Gpqxf9t5j4jEBeRIbrgYNlv+JzGsja3ZrWZz8k++XZQmFG40OLfgRE7iUSRZbFi6xqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3cTTJm4c18BUgcdlLObFshOXsfc3LOcUy8PoKrrhUA=;
 b=lxoEpT9yp6/3feXFVZ688EUcF29RrGITl+k6D/NirbJ/axLx/0C4Q3dpiDnF5JT57eMAseTfE5Lf/zIp7BTNtrvDGMA6TzzD1zpHC6dlDvRCknZ+jS/d2V6cbNAgg2ARvwyS1MsJu20sNzw4F65BnXWobyCFZG3LW+bexj4Kl+eTi6YIDhmRYMlfBMNKAbnbQTY1WCJ2llL8S79rmEB6n+J8vA8W6hgla/1IIcNpIUI/ytlwEwbFW7aOWj1NjNEZKqVdoH4MpXwZDGr8i+TBvz5t1sRtHjSGC1kIeFq/Z3hjcohsPZDZjzJP0o+v4iXCmAEFeAVJyTxE3iYj51b3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3cTTJm4c18BUgcdlLObFshOXsfc3LOcUy8PoKrrhUA=;
 b=RNk6vO6efvAia2/OzxaXzqY0hvNEkrpWSfHfw/HrOlP7k5ahT/6KZJLXaMs0YzurGl/Dl5Eq7M7fI4l8Bl7PVW1/5idZBY/UUV4rQsB47FvyAO9w7vXVDOOXgU836mRqlsDAXFHIwcJq87SIoFl1Y1oCr7+75m+Avt3xk7DLVAnDrVvcCrAuA7f4rvFNnyIqKW6TJvFGaWoUkCmkQNZHeMWqYasE/XME46BoQ5SzcqnwxKbnikQVNbkBC6Pu/bvAdD42asbVNH/iq/rzF/nMEn3f/7vSpATcWccmjOlwNdQVIuRp2Ve4/reqGbWEqlxcDlJd0KgeZkVAWLdrKiJWbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA1PR06MB9700.eurprd06.prod.outlook.com (2603:10a6:102:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:07:59 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:07:59 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 2/5] ref-manual: Prune superfluous space with :append
Date: Tue, 28 Jul 2026 12:07:35 +0300
Message-ID: <20260728090746.27793-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: f662879f-45ba-441a-be4b-08deec87b8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|56012099006|5023799004|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	JGhsIxBWewxqADH5GlkQJSitnsaC4HLlEZ9s2grKiUfvd4hpCk3vEY7VKGcJ9nkSvCvJ1FLzZvbEZvBDHV4j12X5/lM5uoWEkYZlnuMTX/0AA0J7kUkB7VXEo8rl1zYBEtP5RzrAd823hMuQuMI3XV3BBW+tBsipy7yPRw7NwK/jMK9wImK1ryeZ7UhMFYRLs4yt3bnnPL6sZq8SvmQsoWEoSgYz3ti+m6U6ly/kpt0/4YZ7DirPQN94a0JfGxTa9eLR5s9FxX1DjSB4cBbosNV4u5RprlnOJcQe3L5HIoVpbBi6aFpSPzmAX5MTKcHQusOedOEHKAoVmMkx/Gax9T53k3BJJ9omYtAgRX17Ni5oPCVz0NBW9PKVyl+JhgWurPBqEEo9FzkxNF5co332m8FO71BUdfVo3HtqNvM6FD/dA+FuNtNjo7eDnkbAZVqr3M2daH1AjdSISwznm2aEkFZoUetICjdEbmZn14zmKS/k5ZF1pikH1lpr889EVv9pYKKLkvIoeby6CPl3OrvDy7UTB+C+oE2MT1URpxQNCvQYKOc/UnUvq+nL60aSRee2L9saEKUY+FPIK1IGkGtsyDFBS+A80Hq4vIDtsgmCtfhqCOne+VU/BBF2223CC//msWjTVQ9KHPpEb9i64HAGax4URuNutB/cDGw9xyHxVPw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tG802Rnpet0jTYK8q6CT0rL+8jn5xeou44OVRnP6XLPjRTflPawStRLl/VX0?=
 =?us-ascii?Q?BhxQ+C5hG+OO6JAiO8HS/16iyHRQz688U0mHXuMwAB4IL88GskHY5LhcQKcw?=
 =?us-ascii?Q?4XMtlHmwwCL3atKMxeXYek66PLAnfBBbBWvcJ4gbIYKtWXf4l25SXdhOaV/S?=
 =?us-ascii?Q?AzYzmSt5gCK2bwY/PabXG1r0YwsX+OMZ899ZMuyA8zFq11zn73yDFoV0+4am?=
 =?us-ascii?Q?un4MwIkw7v+lbOhtP/Bs4H0I3HJAlnz3Ze2fHs0c9PD1J3up+p476M7Hl0cq?=
 =?us-ascii?Q?L50tPkVtG1gVkwyqozOQm4+aQsEgyQpX7xM42yYMgKp1wI54jRlBnJpV6GcJ?=
 =?us-ascii?Q?lcsqQgMsXmDB6LtwTKcYmZkP2x1glfxUCSBPDoPlArHHRe2ndwoV8S+NWaMS?=
 =?us-ascii?Q?Ss0XgP07zxOJbs/h3lhuQzUG/cEJK4dsRRclIZqSJ8C+T/HaVLw5OhBev9ZF?=
 =?us-ascii?Q?kdvMGkVfgGaugEc2uaE9Au1RlIKkVXE6v/yMddf3tMbJRXGAShyCpmq5XguF?=
 =?us-ascii?Q?paREWr0HqV/h6VJLvX1CEY2DoOauXLzniNF7QB5AOc1uBEBabqt0YatOC8/U?=
 =?us-ascii?Q?9M/HjY+fDRUI6Cs0q0mz/Btt94AYnDx2+5Io4vA8RtarAKBHPO/Ecy0OMm9E?=
 =?us-ascii?Q?H2G93wTBK0rMCXFp7lTH4SI75RDc23TbMcp6fO34R0EQfl0QiMUuD/ThLVYK?=
 =?us-ascii?Q?R71s9e7wWRasIwAocUXZ7nz3ykwTmhuBemCzlSiplbaZN3B0WsS7REnhK1+1?=
 =?us-ascii?Q?Znr/kl5X/myd46GPYjFb/ymoy6n03qu0kKMRSVfKD6OZSQ3q0631dPbvROXG?=
 =?us-ascii?Q?nRlYbEf7ZWk9+Sbyt5yAULS0qdooQP1Wt5Cnl2aFrsE2dgL/lio8f1balkip?=
 =?us-ascii?Q?/KUFR0cbylqBGOdPWvOeQ/mreGei0AL1lhtxL0J9sLykH+60ew7IvDHYOcKr?=
 =?us-ascii?Q?gHMp2DhAoNeBvm/YTPeb6TTeQG1UVQJsv+adZv+JGiXXWnDJbDyYrJVl6cMr?=
 =?us-ascii?Q?bF7apf02qanszzq+1z/3esTRymMIYcchBC8YV/+UuwaWQ37NiGs0FfIChfoS?=
 =?us-ascii?Q?gdoLq+4VU1hf8Y+v/plrwjh+Ei7NRNUrGF7L5gA4v4eVFIrcJaCC5QRIs3HC?=
 =?us-ascii?Q?1aoDLhBJRxCXm+Gb+dHFmiu7EVm6gydhUKXn+fOXUCxK7lxIVOmUpiun8pNI?=
 =?us-ascii?Q?aWl8yFborZsYwMzHxSdOYWGQmWV9PKxIjV/yeQAeTwv3AaXli2pN2M6LABLu?=
 =?us-ascii?Q?leOeSNKyalFzL33++XjN5LdYiaTSbVW8AWGFPE5/4FQpyyHShNXn2Zu7tS+Z?=
 =?us-ascii?Q?YOD3Gz91m5I31gxkI06AyJcdwFhUyCl7ZWMf6+btGlid6bzaotUCgK0hbRdo?=
 =?us-ascii?Q?tsucBkGw2+yWUIPk5xjBSaUFTS+1vMhqaDyql/tAXpJXpmssg9CLokDXq4lt?=
 =?us-ascii?Q?VbANbite3tJ0JMKViLnruObO5DZ6yUw7P5PrNK6+z+vC7TvNVNU8LebexJ5C?=
 =?us-ascii?Q?t/2ssnGEmTgdUJqHnEkhBEz32cZcaWVLdbGQbU/X97XBQirEP8gfzUhvRULV?=
 =?us-ascii?Q?1pghk7BgLDfZ6DDIHoFN/QG07iZCGv7NdDHigD0Yi01SHbPz9NpYH2E6qfdh?=
 =?us-ascii?Q?BphAqX7Xl5gCoFf83FeXNZzE2lNnX4ePLLa1LhUHZDAOtiPXIPNhjsWAuk/P?=
 =?us-ascii?Q?IjmA9vpES7vmnQ3RZbs6cel/CEq34QZiB/bgyH3wIGfCeiFunoVR/L1tv4zK?=
 =?us-ascii?Q?oKyyFZU6jRl1644qUe1Fbp4Cqeq8N/c=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f662879f-45ba-441a-be4b-08deec87b8a0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:07:59.7706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //6E4b+zwGP9TXiNjG23IzJaBhGo2d4In47MrXU8yPwIqAteqwChniFOe1HV4J9wloksZISn41LUVP6LYkkHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9700
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10167

From: Niko Mauno <niko.mauno@vaisala.com>

Remove occurrences of superfluous space characters in value field of
:append assignments.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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


