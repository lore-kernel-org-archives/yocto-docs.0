Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1E1E77197
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 21:23:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.129])
 by mx.groups.io with SMTP id smtpd.web11.17737.1735853017642853145
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Jan 2025 13:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=riLO8k2U;
 spf=pass (domain: navimatix.de, ip: 40.107.21.129, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOyfPxEKeLS25xDIFcq/EyD+4xON6HWoCLszE8NNYFn47SklmC2uxDj2MiRT4EVh634iHm0aryRAvLHWubXq4TT4B81GAg4zxnieBDigmzE5Er74QedrjGingH3yzdzXE4ocw6OnBKDrs8DRKE1mqc54uFT5v+BCsIva6uDxdncEYSDZQiLmXjsF55aG70UMOeBkEqD5BeN/Ibu8kFgnKsKn/dWORPVloLkNkx2CAe306LU2WTPYEKHQBrrImwOQq1wrZrAXEoTszN2RdPHkjWQ6KoGL+x2aTgM2w9Jigp4DOfoH17MtuYwTXRyGssvP2C2Sc8cPrPH+9vgo819eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnRYwfw1drhER3ItUrULIi6D6OYpsE/cHxjR/Nl0kg0=;
 b=IJ53pZKcjwc0gVZF98Gg0RLD70MaTcKeRrGz+s4NlHcDh9v38C668GZDwKqG1/uvn5U9aaNY3ayEV7vPQBQz1yDlVR+Nb13ASrGktR7+VhCTg+4fRMduyh0DtHa5azAoQbyZdPloVXKI05QaFqj/vixsdXo5kAbQStdYzyOmmV49f731ghqHj3vfqSTMoxUCfcqeQp8kNgUWgwv+hfEaJn17f2+aCAb++QAA5vR8Me9C7/8oYraZOuSIngCh+z60rFRImafDVaaLpuOK+rkf6D/0uOGL3JFs61pEah+RY72H0bMXnNNBDzq9cKBgmnTFDzTeT6qxliVYlwMrrxUk4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnRYwfw1drhER3ItUrULIi6D6OYpsE/cHxjR/Nl0kg0=;
 b=riLO8k2U2Va4isBxb7RAuqApO18/1R5OI7/zfxh+LXGq6Q5U9Yao3ZkZlDhFVEVgim9qrjKAH6Ysg5ojZL33Rtthn2AUConAFliqUYb2hHCmrp76m1slEQ+SG1hrxxKGBsDjIzb+kPjZXGIBjn6qnb4lT8hGOxCVLpHnQyJKC7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7749.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Thu, 2 Jan
 2025 21:23:31 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 21:23:31 +0000
Date: Thu, 2 Jan 2025 22:23:30 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	joerg.sommer@navimatix.de
CC: docs@lists.yoctoproject.org, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] doc/logging: convert warn.json to YAML
Message-ID: <bcd0593418a1217f73f4a6946b13a5b603a58fb5.1735852948.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.45.2
References: <2bf2a340cbf86391ae6722739f750f9d44f550b3.1735852948.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2bf2a340cbf86391ae6722739f750f9d44f550b3.1735852948.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0410.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::8) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 460270e2-fbfe-4227-1564-08dd2b73b4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aumsCZnjXdLAkxgAiBJiw8LBw2jFCq0z45IKoJUQiRisXktpFynjYjrUg08t?=
 =?us-ascii?Q?s7He2nY9HQL/lHydReufTyOCTO5WKTLKYfgxY3zvxTxD9mbWr4wLffkmjbLE?=
 =?us-ascii?Q?nZL9/G5RLfY/5B/vbdN7Zyf5gLv2HrxDMlOYyUyY+XWOfSXcD6rnYYqQ8cAR?=
 =?us-ascii?Q?KxPPbCE0C/G8L4fS6uXGvade1iR6pk+TDDQtPStHXo+1wgT0nydbovYrFhlb?=
 =?us-ascii?Q?fBFeE6tFL6jEzLnXdctCxD1vItw9KwS5M4k6WFESOCCvbPZ7qyEJCv2YPHm6?=
 =?us-ascii?Q?S+SrIDj0/58E09rkM4CD+6KP+ORtJr7QL92HD6UydzUG2lSu8po4WuR+R2tb?=
 =?us-ascii?Q?RK4PADX5felKUEw7G6xRMFEcjr2llr47whJIMCl2T9BVoAxuthx66auZQYNZ?=
 =?us-ascii?Q?5poW6LzAz7MHnj+jj37EppNPPqs8k6iGM1PovQU/SV8Gi/PKnmZDA7Rz0Ux4?=
 =?us-ascii?Q?OAlzx5dYcHWA0FjaZetW/obHaBYSgjtFdUmoYHZ+uXAnrd1xBaWQO+YiC9KW?=
 =?us-ascii?Q?qgOuvF61/Y35AMDndSbUEAYsKSp64sSHKUnQzaze0H+CYlzqmDz0d6ogiXrO?=
 =?us-ascii?Q?w4PWWcpsi1qKkimm3+xBMcKKbzUPtpb93IhW4+lrsiYBSNM5EPK0GtR6owS2?=
 =?us-ascii?Q?JUZBaAkWynoBHsEj4hdfRSDUYwnk4B0yTNcgC9YXlQhE4viHlkM+t505n7Wv?=
 =?us-ascii?Q?OANGddjPHVRkQsJk02HkQJpYLfEscflnHGwGdva6w3RzdfndffslRoEv72ox?=
 =?us-ascii?Q?u7RMdmp+1VjKzHHQFZoZs6WarQmINccgh1mcNz37Ps2WMZT4KmcYDMswm2SA?=
 =?us-ascii?Q?YQ7ZMKck1A7S0h6/KsoQVRfYodDC6IWVX6rfH+UFhOPcr2a5Jr1RdxU4xaLx?=
 =?us-ascii?Q?HoiqE28HVw+QVvzYVwfiJ9DfP5CMd4Bsb9WzjnYAfLcRjwvyrmHdj3LypAf0?=
 =?us-ascii?Q?h7J1Kzm/bDOKv4/pYWGt754oFpsq+TaTmLNac0/p+BXFdxOixCkF64mEMnO1?=
 =?us-ascii?Q?pfhrgSQ2yrQYcTXKubKKAAC9+F0NgkMHJzT26RijQ31cYon/HbecjxfTkPKI?=
 =?us-ascii?Q?3qFUxci3y4ZlyBLLyXNk4paS52H2QSL71SZ9UcCbGBNrHKQzdLhzQTpmSFlK?=
 =?us-ascii?Q?sX2V2VyKqTpt1dnBSoJ/nmoMeILoSYuk+qSWxnS1XcHMnw0eEUuVtogcr9Wk?=
 =?us-ascii?Q?D0bZME6y9KUavbJ3WK1ZNuD6N1UuUWDAE5xnABUzDoJcUFZ8KvfMBUnh2Inp?=
 =?us-ascii?Q?PgsF7pYhkkSS02Z6sHS0r/YoSrmftFPtRyL3oOV0U5YYMhlr4bQkq8ptdk3n?=
 =?us-ascii?Q?oYpLgY7fbf5Z3rGP/3X+ZKgT2WEAjH8gIg7pbTI2bizNSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tI8iDGEobhodqGiG0N3ZlXw7HrFWhC9UuvSUvvmyAxLThCQf3QNnvoU3a/rF?=
 =?us-ascii?Q?xR+6Y1Qf5jP6SAzcUjJ3BxJHgkgsCy0UP0BhG/SiDnJ+haC2PpT9PRakztjm?=
 =?us-ascii?Q?ngfkU7uYdwpz2Eq5OlgUB7d8soHBGGMalLY252LFduaQpyH34YpQrWhn3/CH?=
 =?us-ascii?Q?sqrOvrkuIjmN0vW3azc3EirBJfr2gGXiV+OhXgnOMOMCdLe/lsbAXyUSLnMF?=
 =?us-ascii?Q?Hn1MZX/RwNad5DSGAjyzwzg0hs0OiAm53r5HLp+voOMhNiM2endhnXuyCyiz?=
 =?us-ascii?Q?/7pJaWSqiSGYZjEY2Enp/74cMcpe0ci9DRBhiPtEaLPmzG9qgT8bB38lm1EA?=
 =?us-ascii?Q?TXeQVg42Rs0Q9berGol8X5/CnBEEjKSc0OSPPtIenO17P5//fJL0GVOaqxzV?=
 =?us-ascii?Q?Y8Te5QHy0hRhhJ7buZUnmd5MLxGcWoG9xsgM8QsoOuEAkIaaxCd5xWdOY+60?=
 =?us-ascii?Q?SzI97Xa5hL/tlegwoP2JYsbVJeXtIwoyVQrrjZcF71/NFhfNDH40gyhc4e1v?=
 =?us-ascii?Q?WjOAFrBLVnnrmh8pgmrUjMEOSUB2KaQZBHjbWH9cHlf/P4NNH1Uu8arRBcZw?=
 =?us-ascii?Q?jglC5RpDNukX0N+E8EXq8bW7XDdPkwonogACsrI85L+YJzJZuCbYeBm9GDiB?=
 =?us-ascii?Q?XFEFuwFsXvlFAz/r4t3EInvdUifQV/ZP9oRgDILEHLxEekB0cBsv8J3v7cdw?=
 =?us-ascii?Q?cPvnYHUv+O29XTSjfqa0oVq76C8jC64fq4DVeGzUAtI5TWZF3QqLVtag5m7Y?=
 =?us-ascii?Q?OAQv5Phk+27o6p9nCQrawpUZ8+ZyciyErn8l3FDPkeRuAqhJHVMfnfN2WDng?=
 =?us-ascii?Q?3T1ArC63YPh7w+QrSYr2wPx1OYHl+IOniF4CWJymxRpOWB6L71S+b5xkMoA4?=
 =?us-ascii?Q?rSGNcG1oS0N3KqS0OrFo3FEpWXUV3yra0dtkUMdhVMTzNGTbITg1+lh4XoxH?=
 =?us-ascii?Q?cZcQDAIjZGk++V90xL1ZM5CvnhHPBSmDx+emMnDR+8JcTVoXEtCiVZpo5jUg?=
 =?us-ascii?Q?MhjsZyKzfjGCLsFpgPxiRNmL0IhLJoaRzt1uBh4En6slD1fcj48j2+DmIEGu?=
 =?us-ascii?Q?9uPVsuF/DAtJ9Q6Fc61DQmzrbUfToJyK9nhImJTe+f//Uus1Ub7mgLwIb+mW?=
 =?us-ascii?Q?ALpIprfPUfpQfuy0kTrOEQVB0tJ2ghtSrWT88FoktBbsJQ7zWbEO+cK+om8v?=
 =?us-ascii?Q?bkljqPzvedcNpvtaWKTroYbNq+AIPp9zvG1gpCPXoFwQVtYB4qVfdmlhyMHe?=
 =?us-ascii?Q?oHLIMj59o/OsQ3nkFX/8wpDF9NdTu8iWDMPuVQLeeT3H3O1inLyPUDBnzxI1?=
 =?us-ascii?Q?YBZ94pUiBIPYJBlKVMb0zjmDMeT03WVP5C/hTtllLLQkprSuXDyxwOg8SCM1?=
 =?us-ascii?Q?M6qQAMTIl1hRgJ3df35gacUB987cUH2HLpzoI6tP8N67oCUnobNb0v75Qz85?=
 =?us-ascii?Q?NHOg4Bv34/40PcwpfbuV/3w/b8EEj9e7EtWomPHoucKL0+Iaw14vQjPIdajD?=
 =?us-ascii?Q?5hw0zB36SB58GBuQwYHwgwSuR0NuZrIsXnyasJPtsv6jtKowDTO/qw1V9pLE?=
 =?us-ascii?Q?XpWZNdzcHglOcY8QEsxZZ2KdVgAIYQ6Gu5E0dqgRMq1LrpbBF49pk7A8Y0w7?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 460270e2-fbfe-4227-1564-08dd2b73b4d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:23:31.2693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQ+CdCVzBDX0aFO1qtBKZnlP2k6b2ghVErQXEIaV3GcB8w9DOB0vrtp2YVGeJnVwp1uxtz8gQBrjx5j39x0XS/mZ1dLsXAGWgnzFOuBblGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7749
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Jan 2025 21:23:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6058

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

To give an example how the YAML format can be used, the example of the
warnings logger should be converted to YAML.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../bitbake-user-manual-execution.rst         | 42 ++++++++-----------
 1 file changed, 18 insertions(+), 24 deletions(-)


Is the @ in front of disable_existing_loggers correct? In
https://docs.python.org/3/library/logging.config.html#dictionary-schema-det=
ails
it's not given. Or can we remove the whole line? At me it works.


diff --git a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst b/do=
c/bitbake-user-manual/bitbake-user-manual-execution.rst
index 0e20d5933..99b91ba50 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-execution.rst
@@ -728,35 +728,29 @@ bitbake, or set it in ``conf/local.conf``::
=20
    BB_LOGCONFIG =3D "hashequiv.json"
=20
-Another example is this ``warn.json`` file to log all ``WARNING`` and
+Another example is this ``warn.yaml`` file to log all ``WARNING`` and
 higher priority messages to a ``warn.log`` file::
=20
-  {
-      "version": 1,
-      "formatters": {
-          "warnlogFormatter": {
-              "()": "bb.msg.BBLogFormatter",
-              "format": "%(levelname)s: %(message)s"
-          }
-      },
+  version: 1
=20
-      "handlers": {
-          "warnlog": {
-              "class": "logging.FileHandler",
-              "formatter": "warnlogFormatter",
-              "level": "WARNING",
-              "filename": "warn.log"
-          }
-      },
+  '@disable_existing_loggers': false
=20
-      "loggers": {
-          "BitBake": {
-              "handlers": ["warnlog"]
-          }
-      },
+  formatters:
+    warnlogFormatter:
+      '()': bb.msg.BBLogFormatter
+      format: '%(levelname)s: %(message)s'
=20
-      "@disable_existing_loggers": false
-  }
+  handlers:
+    warnlog:
+      class: logging.FileHandler
+      formatter: warnlogFormatter
+      level: WARNING
+      filename: warn.log
+
+  loggers:
+    BitBake:
+      handlers:
+        - warnlog
=20
 Note that BitBake's helper classes for structured logging are implemented =
in
 ``lib/bb/msg.py``.
--=20
2.45.2


