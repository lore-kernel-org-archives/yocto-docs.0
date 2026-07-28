Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E82C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.576.1785256727391528194
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ops7MlB4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.142, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN/+vfvVwThm+9HJW04VQzmxvhNIRPUuGpdheDXYSTRuBKPr0Q6Pg81J6AuN5bn46Y4JrHio9Xoq+dEOFAD/q2U4mYCJ4avSKtAoYiWdLIfeRc7BsNOmEeexXU/B5BXZiHpezR3BBOb4EZsFRL1SF803RIesDl4z8m7RKSFwXQlEQLdi7M3ADDyxFmZgaTqNKRFXf/mU7qxsKe0+PBfwZEVuG65qwtn5SL+Lr9AsSzwFXsJniDQjvce9MfzoEKvhc8r6ubCPpI9D/92Onnr2vwTrDFHoRzUBqHlB9JnXwT7nbYan6n0Rq5N3Auob2Khr9PJ9ViAAKpOnTluP4A7iaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3cTTJm4c18BUgcdlLObFshOXsfc3LOcUy8PoKrrhUA=;
 b=VD/pQwqAPOLR32It+0b+wD63WjKJW/udrvirO4UK5BM+Fl8vyjJQfNRMWdQ9ZTokjvbZIMXMXr5c8pmUYlqzKVLvuNHIgyFTMmb/YUyWZh0GiCmFSBLywePQKvjFBiMc6Ed7XNiCKJSM1F/K5+ikxUuvlQfFOvcPd3nQkfumDysVPaGlkNeS1EFUaQXPBdWgidWX5N4ufUFOQFOUUh8kK6bgcr/jlNUDHWNgptZFG/YOKEtaNNVIaEeBPrFj4yqaVLllMEonq06+T/I5jy5Mgu7OHqvltUkIYL61GOlUs20W2CNLTDstfzvDPKF1jlLV7abYlxg2WddwqvwrPxbAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3cTTJm4c18BUgcdlLObFshOXsfc3LOcUy8PoKrrhUA=;
 b=ops7MlB49pExn2x70cBuKkOGLXDWlO+s02E/NuOnKeJMVMVBgffuvh2/Mywbohp/p61FyStL/XII2OW1182xI82+6qEktHSXuSfakR8M7w9A49TO6N5WL3MLmLtf7vHTVfRQlyB207tPh58NzG9CJy7QiA0j2GRRjieF0ZDrlY0hijY3TM/rSV9pyYCjMXGLbu0P1uhp6GUoDCTDk1yF7fAhjX2+JeCFRLjNiScOh4abIoaXg0AKR/j9vLra29g/WvpSm/7g7iHpGO08gNc4vUgIkLqPEfmSWTRvFuY+RXxJ/ntFMsQCoo7MiP0X8bTRR4VzqaltgrEbHz6c0+14og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AMBPR06MB10211.eurprd06.prod.outlook.com (2603:10a6:20b:6f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:38:43 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:38:43 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v4 2/5] ref-manual: Prune superfluous space with :append
Date: Tue, 28 Jul 2026 19:38:03 +0300
Message-ID: <20260728163816.17230-3-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3b890ab9-7cc5-4beb-a1b6-08deecc6b020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|5023799004|11063799006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	bRjcQryJE8h3SNSEDvVW3WKOVcwDcYmvIaBVYalW5crSL0IKRgOzHiSluots0hq9B19rUiLCnhpzqEeGITxCl9hHzMZFsx5jI26ooCodqb8A5TP9buBAn/c1x+PEkVH8nz8uJfNWq9Ui8FILCX+ula2UP3oQlzv4hS6g7sCrUqxmTvGnrUjNIuVofqSIimH/+5caOX2uaPGltUwFhCPQFb0KFT0EapQcqHy+TT4rGo25K7nlADxOWahlC5ACmsDD5nAOnlVL/8cck5xCSrR4P1/iYAzepgHTCSAW7uDlliQk2HMl7fOwXQAeWfweMG5PGG02/QfkeKWYDbatsBtyNqN6abQ6UltduT3vL4yYl8ZdAhCG2Pc7ETE4JBBXmudp3qb6oc50cNElD2+rvWmVANGhL2l7j09l6pUHccOWWr3fiBck1pS1sD+ZV5KB0h+eWcJuvRqRNLvauwYGSwJPs7haexnVqkCtc7+Jl0WNr3vT+HlloGHICQ6f+yM5iguCfhP+aYxcav12xqOMNHtddtajg4tXArCG+52s546VXpIATZLTQ3mnjcnqhxi+AMJ1MBEMOe4HCnoy99i+5HCShIZBV7P+FHYNa5+G1Up+6Uk1+IcdH+u4Np8X9oUbSic7f0Vlh7g7ixT6KuHk95y+UFI7SWMVWaBUYb7M3ZYc8Ls=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4GupYnXE+2kDb5q3GMLawd9XR4R/CcpxwcNN3d7K73CooyEnBAqrXdiUjB1r?=
 =?us-ascii?Q?MULwxMj9cqOGgOn2o0ECUWCsaio6XPFQMxJtRaWI6fZ7522/CHm1spqd1PmR?=
 =?us-ascii?Q?u37xA3pN3mcHISkwIednmEKK+fkutQtsC7WdABMYeufSLXA1bjW2Z2VF4Fyn?=
 =?us-ascii?Q?HlSVEuSHBP6yoGXVmgj8BF1ErJTPMTojugXtOGi0ovoiRn5mnQDejUtCz9aQ?=
 =?us-ascii?Q?kJsdhuKQI1r++m6dw69TRydplXdD9bcbNk9N7HmtR9VjAsuB6arlzVg6RSz5?=
 =?us-ascii?Q?wLXnO/+0STe2wJh2W5xQtZ/oEIcjpYZjl0gE2/838pO6CVU7v6OqxvH0vW6O?=
 =?us-ascii?Q?Q6EKsjo/R0wcsjjB7WPgpO4p896VwR0GOO5pbj/6/Oa8zXEsXWukEpgeTDlJ?=
 =?us-ascii?Q?+sPKsQDMpYfgTZ7is4P1VW6kWxMeta5S0ata67Qm/3ovz3MQctA5FYds1J89?=
 =?us-ascii?Q?mxV+tQfx+iAlahQEYVu4kopwS8qK71fIob/tV0SPGB+nwg5ZghmBOgbp8hyw?=
 =?us-ascii?Q?th3nPgZyUDcr4ytRXOQjFpzZG5wqj6NYdhqy5L+wMp56wukRE6JoC93mISyZ?=
 =?us-ascii?Q?+N5XluGdw36vSKp7mFayPMPFAUvr2EgwcqPNWWeIANh17C+YY70F0vxICKft?=
 =?us-ascii?Q?PixrdRuEw36bPCWdV6PocWGslAkYIn/yf5XHRO+xeXmHc+0apSJyCkNIB6Qa?=
 =?us-ascii?Q?Ri2KbkAmp+snC4zjf6KFKZrb5iELor828mdR9o0q4ceGBEC+UI7B6oAtmdzr?=
 =?us-ascii?Q?9ZwSUFR4fsNkcMBTpfuRnJk1o9TyF05+1rmQ/A7dRxPfSTe0UYjHyfwGwMbT?=
 =?us-ascii?Q?SwmTfs0od1kUp5kBeNx6OEtnVdR7Guy7Qc7glC5Hvt3CeEMAZardTRR9AzjA?=
 =?us-ascii?Q?L6zo+bVnL1QP33Zf6jrvBAtZ70jcWvpcu14c4tRJuHbSIvtusZZRD6sKzENW?=
 =?us-ascii?Q?YuZZcqJP6YPiWs7qDzq6FxzwRJepIfsZljsIh3o9VCNebYOsdhxqLsr8WCOl?=
 =?us-ascii?Q?XcFczhaLAI/e5V+MiVTUSJuK0DvU69HE2Rgx2uiTACwt8Bx1uIRBM3BB/SDW?=
 =?us-ascii?Q?6w4KthR2ZgREBeDSSAXcTWV8SpF3NB5cPxLsSgviq47/HzN56ONx5aFJsk1k?=
 =?us-ascii?Q?PqbLZwcj1/ObB+w+Qt9GY5Ufccnlq6cFh3Bm7QFjG7FYTtQgW/R8Y1j8PlRk?=
 =?us-ascii?Q?0fox3eH2uJrM/SLIvOmHKIKvd/GTJQWoFruPcZ4uJYDTYspOBCSnEN4DaXiu?=
 =?us-ascii?Q?Md5Du99Ku4WVtnDiJTzmbEvupa1TVVr8nnRS49+dscm4rZ98xELIbyAJ2PU7?=
 =?us-ascii?Q?eL2gPUFoeJLrnQmxOlo8Lq4xlbVmCZbEjZUdtNREFilbnqH1c5jekGa2PstI?=
 =?us-ascii?Q?i7rSrkPA+vNPd5/OpWWwv4w/2wtPPr0m3d1RiHyQ7v83p5seBy1PKcvf1ZjR?=
 =?us-ascii?Q?Y3F2tP7C+SAC9zSGDA3BiXUXVFv/6Zdf5J3b2sqXBXdfHQ8ui0uQiWfAGNZg?=
 =?us-ascii?Q?yznik5F2snEl6x6UgD/JMlLi0fyicjOT0CXe8WusxD6i+RB1Cr9XF2wQ/5I8?=
 =?us-ascii?Q?PEFxrSC1P3e7WvgB6Sf3w7NC2ZndH6vqorpHDpDrBtYNj+29aaFGMx+IADx8?=
 =?us-ascii?Q?vtwjgJKEaoK5+mw3lRBuwVVKdwkUAn3n3/E88MpOqckQ/9JlyXLM94ESQ7ua?=
 =?us-ascii?Q?5+z2Hw61U7gSHU/SOSXBM28mKnIfbYLydzlBLbWGAdRuAoxsMMwnjNGlNIHI?=
 =?us-ascii?Q?f/Oqan5or4qlzllPr//qZ8qPAbvIVOY=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b890ab9-7cc5-4beb-a1b6-08deecc6b020
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:38:43.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yODP4oR8frXDMwSJsIZzCpj7WtKLIuP/vvyRSD2o6HkZBifgE4yywX7Kjdq8vsyRRbeutLUAJxA4L6O3DCKk2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10211
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10175

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


