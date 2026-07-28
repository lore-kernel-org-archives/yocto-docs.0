Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DF0C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:08:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7661.1785229689386398720
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=WnVyMIMz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE+OFiPXKzKei+d0w4WvxnokSc3mpBGBpeIpr7QbKpl+Fu5rhGf7ie/1qJzVfX8ujJzpPGrvj90S4TnniEEjGSsk6v12lknkearjnLfvfrl0tFn8ZySD7WeC5nlGcoS8TEc/uC3juytkLg9ZeyfZHobEkEj/HWTy64djWSChya9+N4NNR52Llp96HVCjMcFJWUhQC8s3l5ZNbUb90n5hj8k2KW2+nIQcx+vs6c/vGyLx5ctqPxzqVbCjxS0ziKy/K5EViYdyFL/j/SmNuVzVCYGbXM1NAbj+g0MZhq0ImIIKcLeEVERUuoli20heDSPqfcT1ahIWudTOv638pBF+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maUfVJFF+AlAvGHtF6bDTxluFhmeFZDM2irTWInropQ=;
 b=NJYFQHLn0HT1VbUOilbnQTMPoybpbc0D+nb7Uz7bxi+f8IG9GU4blz4sbqdjScfHK/GCpXlK3RC4rdFWNKwVHndCxRe1N+bC2Q3S7YRx8rmGHY2L/yy0Ix/AkLek+vH4QFLuSx8CmYqRspHzpBHRXRD5XXfuQO8+VSmZJ9OWUfjQI25vHxO0DqkE4DIFZ06J7JlM44Qfe0XXs564h6y2JHAejyESt8IuuuUIbvE+BpePL7BGzmyPU0eBZqtxW3SaQKkJsDiu+8xXeGksjXiMjLSkxPgHoC5rBnI5zt6+bN/Tes+PdARJNMPJ0lTePY+IzBpmWfpaFet2zKtt76UHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maUfVJFF+AlAvGHtF6bDTxluFhmeFZDM2irTWInropQ=;
 b=WnVyMIMzB7UynO7eBQTH8WOVax3y+YpnMV3Tw3wIWaRQvRAIrwc2EZbBJVWSoFoXFxRKtEurVwMWdxEZTDykJNtix0SIgJAB2Ia67SssYPPormm2ckcoWPOueQFIgF+lkmctXefiMrkl1Yt3Jw6Uu5qWsMI6h08QBallTN+Pg2IehoqDLT+6eQh1caopelzqTwj34anjKdZehEQh1iQ1Pd8jiD6LOMvuN8r1K4Pv1ZhkuYbs/2reT1N+xxfFx+/MXpHbnZqooqdLqrgV/FS1RjpxM2/Q0FS3+ksxmrH9buX+lDjeN9RN5XhIbJzjCvlNC2R0I0uKQh/6nQZFSzoLAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA1PR06MB9700.eurprd06.prod.outlook.com (2603:10a6:102:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:08:03 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:08:03 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v3 4/5] documentation: Replace non-ASCII confusable characters with ASCII
Date: Tue, 28 Jul 2026 12:07:37 +0300
Message-ID: <20260728090746.27793-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728090746.27793-1-niko.mauno@vaisala.com>
References: <20260728090746.27793-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVZP280CA0039.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA1PR06MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ff3d7a-aece-4316-210e-08deec87b9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|6133799003|56012099006|6123799006|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TRdNAW+56CvizVH5Oz3ZjHud9TZwdBn3MVF/swxNlbi36Whx293RJBVC7PK8OfdQsdTN1lnsmzYR3T9wqg1OhdmbEb5P1emkPq6ozdHRJ33JkZtpnVGo8yJYtrNwffPqUN6uZXag3BW9DfXJtM4k79eUT0156bTqsOSIvwEil9dtAMCoBsNMm9ZOvrXNmZ1HksiYs2EpVfGgpLtzXHsQkuVAj9RKUQjSVpMGlAYwQllEqNjHv3JbCfxngBORQdoib3W5vmSAuFKEonJvJUy7wSJkel3UBLNYtMUEmst1Bo0jKH1mH/BeD3BHuEF6LJPMSs0hq7f/UEfyFleL5jcfVxtmUzzEBg+z1PK+p4tBdxJVLKXBTGLzdCZezKDoUI4plQ4Z+VmOXJKSKIRmoGCv0lyeSty+kP9jlHDfheiii8FKF+1l6S6g0+fdSu/lZk359mYeIVTsPB75XCSCk2Y9n+0clWbq0UbS8IT2Gtp/X8sIjG6z7394XlMABLizrEPzZZ6085ukb5lp7RGK7Hy6SGCM4xVJVpnuyFCyVD9b+CWL2aiFQt+18dQUG0l8EbO5akzgp5oVb99ydVMb7djXLurXZrACQNWONKxBBBg8L9KtJ6bakF1aUib/kVDjO1rTk64Yg3DSy7YA56TAxuSk1jLg3Mf9nC91fvFp4EDgzuw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(6133799003)(56012099006)(6123799006)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ocd6/jEfVFV859dSQqVeP7mBintmL7/5Y7sHaiUPcreRZO92RDJtd5nZ33yZ?=
 =?us-ascii?Q?LlSwGFkdnfdkJ76vxopeSEczuGywxIpd4HCjx+G6g5iVBLb/knZMwbrs/CYJ?=
 =?us-ascii?Q?DQrVxmE6stFessFKvf973yn0lvkg/qAX6/ypOVDj28BBs4kjUc/AMG8vopZ1?=
 =?us-ascii?Q?8JQFa0R5qB43kTa5vbJo1SLf7FdmljOtCcZ0SN6+GycnUbe7aLSI3HtLWvDX?=
 =?us-ascii?Q?ZVAosJb304JqrVkBzMvbozmD6QoNP9V1KyueCYWNIISsU4Ed/nTipM/UlYL4?=
 =?us-ascii?Q?MAs4OMQs7Ywbn9sUK8B3O4PBlTw+Hp/+E6hF1MdhxixLNCx3JYRph3vWWpjn?=
 =?us-ascii?Q?J2e6R7to5KoX0s0iQ0A1F1p9l8S5w8iSV8LrIqpS3EsaDgeKkmc/knjtGCAa?=
 =?us-ascii?Q?5pP/ij+WEJEXubIcLRwZT4TdO8c2MwysXwFqcg4bWAPOzvWQ69KXC3xYm/Ht?=
 =?us-ascii?Q?mb1h1cat/WZAwZlrOV59uyWgl2Hf2DCD6HRVQUqUMHGdRKNn23a+5xoMWEN0?=
 =?us-ascii?Q?vNkNZ22UmuYHPz7cVJOpDOOkv0X+dg9fp4Lrm7LcoSC/75U+lMxnuOs98Cvb?=
 =?us-ascii?Q?mLezNjrYO9RUwb+kdwtFku9zmJbM2rszwuv7VPoPTV22Hb0nrR/meK0gCLKK?=
 =?us-ascii?Q?mr7j2+f9G/R+UZqT4SpDbYjJL18TYJJuK2aQdU5yEuYVkVUBvPKv8gG0eaVL?=
 =?us-ascii?Q?3LI7N5jdTYhiAQOjCN2M/RqYOetUcnsQ6CdOdlcD0Uc4ZcNjiUS0qtDILae7?=
 =?us-ascii?Q?+rsyt9NaMlYgafGxUFfZQqeNm4ps4tbyvavfX0+mVbdrv11/Uf1xwkxSrYAo?=
 =?us-ascii?Q?2Y7cvCyKTNJf19Sbzv+yPuoyhT5foshcqGUOsjxT453HWKaJkW1qa67ZkThu?=
 =?us-ascii?Q?+h+lnujEp3+im4QVllWMe2wzFPMCOLlP+i4O2fVcjweABdfhSuoC+a/otnDB?=
 =?us-ascii?Q?o4N1T4eVqPFcK6IFSFhq7AnXV4jZBAd+zL1PgMeKMQsnN7wrQn79xeadS3gl?=
 =?us-ascii?Q?I5H6hZF6u7XegbZkhJOHLFSav3vaWPDOEBRqwc33YUKgKfuYcLKlqMVigR9t?=
 =?us-ascii?Q?iexBESIyzqLnqlxZXT2XwsOL2+mMXvWjoVXinodTFAMuiY2uss32MPcch53h?=
 =?us-ascii?Q?gTfZ+G82x7Errl78P93qMVXh9XDFBLe7nAN7terTzsPMyv+eD7tey6xtL9Y+?=
 =?us-ascii?Q?lq2PIA9JFY11fkg8niItiJMkr8LSznhV/EI9OIWnW/qib2bSmXdTeideYy+e?=
 =?us-ascii?Q?ucNYwO8AeZmoNptRGGtF9dxqPRAt5satlFnCbXLQgE7u9TslMPgCxrfkkYFP?=
 =?us-ascii?Q?v5OOxNuStaEp7OA12iOwtAhC1/bu1g/pmgHwonfG6fycTtta4Ksyt3tupJkm?=
 =?us-ascii?Q?dGvfqpcpWRdiIZq1Ye5vQfBsCUAnI0+D6tyCtz0hFcnmZ1H/tf0TOvS4kaIH?=
 =?us-ascii?Q?rUDZsJUBciP/XSmaw1IyYDnfMm8reDjAvpmzic07mdwN6g6OvnSsBD82gUYN?=
 =?us-ascii?Q?metQrbmSanLCteQa5bk7fK/Y7FFEDnLbstRAXJtEqAlJHsoQFFvWiDqMLNbK?=
 =?us-ascii?Q?aRAVSE2mw+a98vGeRhD+d7fvsvu/hfrk6g91+7c+SbGO8H5OwqrZw9jasJWB?=
 =?us-ascii?Q?9qG8h1pRmoDVLtBtN2lGzBY7ShebMZnFFKpAa/1vDkLjObuUqPSL4xKMux3V?=
 =?us-ascii?Q?+E3K45x1jKhxgwM+9bdTHru3rFjWDCpNg02LuQWarGqY21dsyk8u8U5OC3IV?=
 =?us-ascii?Q?llueohyNK3YmJ9MA40+qy3q3RaxI1aI=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ff3d7a-aece-4316-210e-08deec87b9a7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:08:01.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRbeD8NgcGpkZH9jaytKoFdvCodwkycZFucFdnLxq6b+Zu7/BgqIcGOcxicZd1exTh+wtUPt7o8NwClZMsNumA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9700
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10168

From: Niko Mauno <niko.mauno@vaisala.com>

Several documentation sources contain non-ASCII "confusable" characters
such as curly quotes, en and em dashes, and non-breaking or zero-width
spaces. These look almost identical to their
plain ASCII counterparts but break tooling and mislead readers who copy
text out of the manuals.

For example, the curly double quotes present in the recipe style guide
example caused parse errors when copied into an actual recipe:

  ERROR: ParseError at .../foobar.bb:158: unparsed line: 'RDEPENDS:${PN} =
=3D "foo"'

and dash substitutions silently corrupt command-line options, turning
"--help" and "--dump-signatures" into unusable non-ASCII look-alikes.

Replace all such occurrences across the documentation with their
regular ASCII equivalents. Legitimate non-ASCII content is left
untouched: the box-drawing characters and no-break spaces that the
tree command emits in directory listings, accented letters in
contributor names, and CJK characters.

These occurrences were detected with the
documentation/tools/check-confusables script introduced in the
following commit.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../contributor-guide/identify-component.rst       |  4 ++--
 documentation/contributor-guide/index.rst          |  4 ++--
 .../contributor-guide/recipe-style-guide.rst       |  8 ++++----
 documentation/contributor-guide/submit-changes.rst |  4 ++--
 documentation/dev-manual/build-quality.rst         |  2 +-
 documentation/dev-manual/debugging.rst             | 14 +++++++-------
 documentation/dev-manual/new-recipe.rst            |  4 ++--
 documentation/kernel-dev/common.rst                | 10 +++++-----
 .../migration-guides/release-notes-4.1.rst         |  2 +-
 documentation/ref-manual/classes.rst               |  4 ++--
 documentation/ref-manual/devtool-reference.rst     |  4 ++--
 .../yocto-project-supported-features.rst           | 10 +++++-----
 .../test-manual/yocto-project-compatible.rst       |  2 +-
 .../transitioning-to-a-custom-environment.rst      |  2 +-
 documentation/what-i-wish-id-known.rst             | 14 +++++++-------
 15 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/documentation/contributor-guide/identify-component.rst b/docum=
entation/contributor-guide/identify-component.rst
index 6cf8ed985..26308a0e9 100644
--- a/documentation/contributor-guide/identify-component.rst
+++ b/documentation/contributor-guide/identify-component.rst
@@ -18,5 +18,5 @@ maintainers.
=20
 If the issue is in the core metadata layer (OpenEmbedded-Core) or in BitBa=
ke,
 issues can be reported in the :yocto_bugs:`Yocto Project Bugzilla <>`. The
-:yocto_lists:`yocto </g/yocto>` mailing list is a general =E2=80=9Ccatch-a=
ll=E2=80=9D location
-where questions can be sent if you can=E2=80=99t work out where something =
should go.
+:yocto_lists:`yocto </g/yocto>` mailing list is a general "catch-all" loca=
tion
+where questions can be sent if you can't work out where something should g=
o.
diff --git a/documentation/contributor-guide/index.rst b/documentation/cont=
ributor-guide/index.rst
index a83216945..b374cc1c4 100644
--- a/documentation/contributor-guide/index.rst
+++ b/documentation/contributor-guide/index.rst
@@ -7,8 +7,8 @@ Yocto Project and OpenEmbedded Contributor Guide
 The Yocto Project and OpenEmbedded are open-source, community-based projec=
ts so
 contributions are very welcome, it is how the code evolves and everyone ca=
n
 effect change. Contributions take different forms, if you have a fix for a=
n
-issue you=E2=80=99ve run into, a patch is the most appropriate way to cont=
ribute it.
-If you run into an issue but don=E2=80=99t have a solution, opening a defe=
ct in
+issue you've run into, a patch is the most appropriate way to contribute i=
t.
+If you run into an issue but don't have a solution, opening a defect in
 :yocto_bugs:`Bugzilla <>` or asking questions on the mailing lists might b=
e
 more appropriate. This guide intends to point you in the right direction t=
o
 this.
diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/docum=
entation/contributor-guide/recipe-style-guide.rst
index f81ffb2ab..84c6bb14e 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -192,11 +192,11 @@ Custom tasks should be sorted similarly.
=20
 Package specific variables are typically grouped together, e.g.::
=20
-    RDEPENDS:${PN} =3D =E2=80=9Cfoo=E2=80=9D
-    RDEPENDS:${PN}-libs =3D =E2=80=9Cbar=E2=80=9D
+    RDEPENDS:${PN} =3D "foo"
+    RDEPENDS:${PN}-libs =3D "bar"
=20
-    RRECOMMENDS:${PN} =3D =E2=80=9Cone=E2=80=9D
-    RRECOMMENDS:${PN}-libs =3D =E2=80=9Ctwo=E2=80=9D
+    RRECOMMENDS:${PN} =3D "one"
+    RRECOMMENDS:${PN}-libs =3D "two"
=20
 Recipe License Fields
 ---------------------
diff --git a/documentation/contributor-guide/submit-changes.rst b/documenta=
tion/contributor-guide/submit-changes.rst
index ae7a097ad..48c8af2fe 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -17,7 +17,7 @@ Both Yocto Project and OpenEmbedded have many key compone=
nts that are
 maintained by patches being submitted on mailing lists. We appreciate this
 approach does look a little old fashioned when other workflows are availab=
le
 through web technology such as GitHub, GitLab and others. Since we are oft=
en
-asked this question, we=E2=80=99ve decided to document the reasons for usi=
ng mailing
+asked this question, we've decided to document the reasons for using maili=
ng
 lists.
=20
 One significant factor is that we value peer review. When a change is prop=
osed
@@ -40,7 +40,7 @@ of key people from the project, which would again be to i=
ts detriment.
=20
 The projects are acutely aware that potential new contributors find the
 mailing list approach off-putting and would prefer a web-based GUI.
-Since we don=E2=80=99t believe that can work for us, the project is aiming=
 to ensure
+Since we don't believe that can work for us, the project is aiming to ensu=
re
 `patchwork <https://patchwork.yoctoproject.org/>`__ is available to help t=
rack
 patch status and also looking at how tooling can provide more feedback to =
users
 about patch status. We are looking at improving tools such as ``patchtest`=
` to
diff --git a/documentation/dev-manual/build-quality.rst b/documentation/dev=
-manual/build-quality.rst
index c2e46b69c..e9b066c44 100644
--- a/documentation/dev-manual/build-quality.rst
+++ b/documentation/dev-manual/build-quality.rst
@@ -358,7 +358,7 @@ You can examine build history output from the command l=
ine or from a web
 interface.
=20
 To see any changes that have occurred (assuming you have
-:term:`BUILDHISTORY_COMMIT`=C2=A0=3D "1"),
+:term:`BUILDHISTORY_COMMIT` =3D "1"),
 you can simply use any Git command that allows you to view the history
 of a repository. Here is one method::
=20
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-man=
ual/debugging.rst
index 21fb10537..3afc17ad4 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -152,7 +152,7 @@ Shell functions and tasks can also be inspected with th=
e same mechanism::
=20
 For Python functions and tasks, ``bitbake -e recipename`` can be used inst=
ead.
=20
-Moreover, the output of the ``bitbake -e`` and ``bitbake -e``=C2=A0recipe =
commands
+Moreover, the output of the ``bitbake -e`` and ``bitbake -e`` recipe comma=
nds
 includes the following information:
=20
 -  The output starts with a tree listing all configuration files and
@@ -187,7 +187,7 @@ Here are a few of the available ``oe-pkgdata-util`` sub=
commands.
    that have been built, optionally limiting the match to packages that
    match pattern.
=20
--  ``oe-pkgdata-util list-pkg-files=C2=A0package=C2=A0...``: Lists the
+-  ``oe-pkgdata-util list-pkg-files package ...``: Lists the
    files and directories contained in the given packages.
=20
    .. note::
@@ -205,7 +205,7 @@ Here are a few of the available ``oe-pkgdata-util`` sub=
commands.
       directory, make sure that :ref:`ref-classes-rm-work` is not
       enabled when you build the recipe.
=20
--  ``oe-pkgdata-util find-path=C2=A0path=C2=A0...``: Lists the names of
+-  ``oe-pkgdata-util find-path path ...``: Lists the names of
    the packages that contain the given paths. For example, the following
    tells us that ``/usr/share/man/man1/make.1`` is contained in the
    ``make-doc`` package::
@@ -213,7 +213,7 @@ Here are a few of the available ``oe-pkgdata-util`` sub=
commands.
       $ oe-pkgdata-util find-path /usr/share/man/man1/make.1
       make-doc: /usr/share/man/man1/make.1
=20
--  ``oe-pkgdata-util lookup-recipe=C2=A0package=C2=A0...``: Lists the name
+-  ``oe-pkgdata-util lookup-recipe package ...``: Lists the name
    of the recipes that produce the given packages.
=20
 For more information on the ``oe-pkgdata-util`` command, use the help
@@ -362,7 +362,7 @@ You can also use BitBake to dump out the signature cons=
truction
 information without executing tasks by using either of the following
 BitBake command-line options::
=20
-   =E2=80=90=E2=80=90dump-signatures=3DSIGNATURE_HANDLER
+   --dump-signatures=3DSIGNATURE_HANDLER
    -S SIGNATURE_HANDLER
=20
=20
@@ -1072,7 +1072,7 @@ debugger.
       the actual image (e.g. ``gdb-cross-i586``). The suggestion is usuall=
y the
       actual name you want to use.
=20
-#. *Set up the*=C2=A0``debugfs``\ *:*
+#. *Set up the* ``debugfs``\ *:*
=20
    Run the following commands to set up the ``debugfs``::
=20
@@ -1106,7 +1106,7 @@ debugger.
=20
    .. code-block:: shell
=20
-      root@qemux86:~# gdbserver localhost:1234 /bin/gzip =E2=80=94help
+      root@qemux86:~# gdbserver localhost:1234 /bin/gzip --help
=20
    For
    additional gdbserver options, see the `GDB Server
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-ma=
nual/new-recipe.rst
index 6888bb46a..d1c863117 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -99,14 +99,14 @@ command::
                        otherwise $EDITOR, otherwise vi.
    Use recipetool <subcommand> --help to get help on a specific command
=20
-Running ``recipetool create -o=C2=A0OUTFILE`` creates the base recipe and
+Running ``recipetool create -o OUTFILE`` creates the base recipe and
 locates it properly in the layer that contains your source files.
 Here are some syntax examples:
=20
  - Use this syntax to generate a recipe based on source. Once generated,
    the recipe resides in the existing source code layer::
=20
-      recipetool create -o OUTFILE=C2=A0source
+      recipetool create -o OUTFILE source
=20
  - Use this syntax to generate a recipe using code that
    you extract from source. The extracted code is placed in its own layer
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev=
/common.rst
index 136524e63..4e7d015e4 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -577,7 +577,7 @@ applies the new configuration before building the kerne=
l.
 For a detailed example showing how to configure the kernel, see the
 ":ref:`kernel-dev/common:configuring the kernel`" section.
=20
-Using an "In-Tree"=C2=A0=C2=A0``defconfig`` File
+Using an "In-Tree"  ``defconfig`` File
 --------------------------------------
=20
 It might be desirable to have kernel configuration fragment support
@@ -973,7 +973,7 @@ possible.
 For more information on kernel configuration, see the
 ":ref:`kernel-dev/common:changing the configuration`" section.
=20
-Using=C2=A0=C2=A0``menuconfig``
+Using  ``menuconfig``
 ---------------------
=20
 The easiest way to define kernel configurations is to set them through
@@ -1079,7 +1079,7 @@ kernel layer.
    Be sure to make a copy of the ``.config`` file and do not just rename i=
t.
    The build system needs an existing ``.config`` file from which to work.
=20
-Creating a=C2=A0=C2=A0``defconfig`` File
+Creating a  ``defconfig`` File
 ------------------------------
=20
 A ``defconfig`` file in the context of the Yocto Project is often a
@@ -1708,12 +1708,12 @@ Showing a Particular Feature or Branch Change
 ---------------------------------------------
=20
 Tags in the Yocto Project kernel tree divide changes for significant
-features or branches. The ``git show``=C2=A0tag command shows changes base=
d
+features or branches. The ``git show`` tag command shows changes based
 on a tag. Here is an example that shows ``systemtap`` changes::
=20
    $ git show systemtap
=20
-You can use the ``git branch --contains``=C2=A0tag command to
+You can use the ``git branch --contains`` tag command to
 show the branches that contain a particular feature. This command shows
 the branches that contain the ``systemtap`` feature::
=20
diff --git a/documentation/migration-guides/release-notes-4.1.rst b/documen=
tation/migration-guides/release-notes-4.1.rst
index 81d541fac..4a3fb0d2c 100644
--- a/documentation/migration-guides/release-notes-4.1.rst
+++ b/documentation/migration-guides/release-notes-4.1.rst
@@ -191,7 +191,7 @@ Known Issues in 4.1
 ~~~~~~~~~~~~~~~~~~~
=20
 - The change to :ref:`migration-4.1-complementary-deps` means that images
-  built with the ``ptest-pkgs`` :term:`IMAGE_FEATURES` don=E2=80=99t autom=
atically
+  built with the ``ptest-pkgs`` :term:`IMAGE_FEATURES` don't automatically
   install ``ptest-runner``, as that package is a recommendation of the
   individual ``-ptest`` packages.  This will be resolved in the next point
   release, and can be worked around by explicitly installing ``ptest-runne=
r``
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst
index 98dff1bac..f3d1aa64e 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -152,7 +152,7 @@ barebox, enabling tasks such as :ref:`ref-tasks-menucon=
fig` and
=20
 The generated barebox binaries are deployed to
 :term:`DEPLOY_DIR_IMAGE` as well as installed to ``BAREBOX_INSTALL_PATH``
-(``/boot`` by default) making them part of the recipe=E2=80=99s base packa=
ge.
+(``/boot`` by default) making them part of the recipe's base package.
 This setup supports both using the barebox binaries as independent artifac=
ts
 and installing them into a rootfs.
 :term:`BAREBOX_BINARY` can be used to select a distinct binary to deploy a=
nd
@@ -3687,7 +3687,7 @@ for details.
 The :ref:`ref-classes-upstream-stable-release-point` class automatically
 generates the :term:`UPSTREAM_STABLE_RELEASE_REGEX` variable for recipes
 whose version uses a dot-separated scheme. This enables stable point relea=
se
-upgrades =E2=80=94 version upgrades constrained to the same stable series =
(e.g.
+upgrades -- version upgrades constrained to the same stable series (e.g.
 ``1.4.2`` to ``1.4.3`` but not to ``1.5.0``).
=20
 The class uses the :term:`STABLE_VERSION_PARTS` variable (defaults to ``"2=
"``)
diff --git a/documentation/ref-manual/devtool-reference.rst b/documentation=
/ref-manual/devtool-reference.rst
index 863825b06..6b21d302f 100644
--- a/documentation/ref-manual/devtool-reference.rst
+++ b/documentation/ref-manual/devtool-reference.rst
@@ -517,7 +517,7 @@ Deploying Your Software on the Target Machine
 Use the ``devtool deploy-target`` command to deploy the recipe's build
 output to the live target machine::
=20
-   $ devtool deploy-target recipe=C2=A0target
+   $ devtool deploy-target recipe target
=20
 The target is the address of the target machine, which must be running
 an SSH server (i.e. ``user@hostname[:destdir]``).
@@ -588,7 +588,7 @@ command to work, you must have previously used the
 ":ref:`devtool deploy-target <ref-manual/devtool-reference:deploying your =
software on the target machine>`"
 command::
=20
-   $ devtool undeploy-target recipe=C2=A0target
+   $ devtool undeploy-target recipe target
=20
 The target is the
 address of the target machine, which must be running an SSH server (i.e.
diff --git a/documentation/ref-manual/yocto-project-supported-features.rst =
b/documentation/ref-manual/yocto-project-supported-features.rst
index d7229f1c2..e209e54c4 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -164,7 +164,7 @@ to support, however there isn't wide enough interest an=
d support to justify
 testing all incoming changes on it. There are however project member
 organisations and maintainers willing to run tests and review fixes.
=20
-This category may be applicable=C2=A0as support/usage in an area develops =
and grows,
+This category may be applicable as support/usage in an area develops and g=
rows,
 or as support/usage fades but we continue to have tests. It can also apply=
 where
 resourcing isn't available for full primary support but there is
 member/maintainer support for running tests.
@@ -173,21 +173,21 @@ We therefore have the following criteria and policies=
 for such items:
=20
 -  It can be clearly isolated and defined by specific configuration.
=20
--  There is a clear documented group of maintainers agreeing to maintain=
=C2=A0it.
+-  There is a clear documented group of maintainers agreeing to maintain i=
t.
=20
 -  Those maintainers are active and responsive.
=20
 -  It is being actively and publicly tested (potentially using
-   the=C2=A0:ref:`Autobuilder <test-manual/intro:Yocto Project Autobuilder=
 Overview>`
+   the :ref:`Autobuilder <test-manual/intro:Yocto Project Autobuilder Over=
view>`
    by agreement, or otherwise).
=20
--  Testing would not be part of standard incoming change testing and=C2=A0=
regressions
+-  Testing would not be part of standard incoming change testing and regre=
ssions
    would not block incoming patches.
=20
 -  The :yocto_wiki:`SWAT </Yocto_Build_Failure_Swat_Team>` team would not =
handle
    any test builds on the Autobuilder.
=20
--  Test results can be submitted as part of the release process if=C2=A0de=
sired.
+-  Test results can be submitted as part of the release process if desired=
.
=20
 The Yocto Project :yocto_wiki:`Technical Steering Committee (TSC) </TSC>` =
makes
 decisions on features in this status and Autobuilder testing. Such support=
 would
diff --git a/documentation/test-manual/yocto-project-compatible.rst b/docum=
entation/test-manual/yocto-project-compatible.rst
index 7a2e00a99..b4da178ec 100644
--- a/documentation/test-manual/yocto-project-compatible.rst
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -115,7 +115,7 @@ Here are key best practices the program tries to encour=
age:
    user changes a configuration setting to activate the layer, by selectin=
g
    a :term:`MACHINE`, a :term:`DISTRO` or a :term:`DISTRO_FEATURES` settin=
g.
=20
--  Layers should be documenting where they don=E2=80=99t support normal "c=
ore"
+-  Layers should be documenting where they don't support normal "core"
    functionality such as where debug symbols are disabled or missing, wher=
e
    development headers and on-target library usage may not work or where
    functionality like the SDK/eSDK would not be expected to work.
diff --git a/documentation/transitioning-to-a-custom-environment.rst b/docu=
mentation/transitioning-to-a-custom-environment.rst
index c69ab5361..b4dbc5224 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -33,7 +33,7 @@ Transitioning to a custom environment for systems develop=
ment
    Layer Index <>` to find and acquire the best BSP for your
    target board. The Yocto Project layer index BSPs are regularly validate=
d. The
    best place to get your first BSP is from your silicon manufacturer or b=
oard
-   vendor =E2=80=93 they can point you to their most qualified efforts. In=
 general, for
+   vendor - they can point you to their most qualified efforts. In general=
, for
    Intel silicon use ``meta-intel``, for Texas Instruments use ``meta-ti``=
, and so
    forth. Choose a BSP that has been tested with the same Yocto Project re=
lease
    that you've downloaded. Be aware that some BSPs may not be immediately
diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-=
wish-id-known.rst
index d89f43304..a8b9fabad 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -86,13 +86,13 @@ contact us with other suggestions.
    pinpoint where trouble is occurring and how the build is breaking. The
    workflow breaks down into the following steps:
=20
-   #. Fetch =E2=80=93 get the source code
-   #. Extract =E2=80=93 unpack the sources
-   #. Patch =E2=80=93 apply patches for bug fixes and new capability
-   #. Configure =E2=80=93 set up your environment specifications
-   #. Build =E2=80=93 compile and link
-   #. Install =E2=80=93 copy files to target directories
-   #. Package =E2=80=93 bundle files for installation
+   #. Fetch - get the source code
+   #. Extract - unpack the sources
+   #. Patch - apply patches for bug fixes and new capability
+   #. Configure - set up your environment specifications
+   #. Build - compile and link
+   #. Install - copy files to target directories
+   #. Package - bundle files for installation
=20
    During "fetch", there may be an inability to find code. During "extract=
",
    there is likely an invalid zip or something similar. In other words, th=
e
--=20
2.47.3


