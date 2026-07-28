Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9CEC54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.121])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6407.1785223457282552894
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=TkDkEken;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQwHwRy/M/wA5DAitjYDLTYxSppUq6ph8nc1cyfsFxA7YrGbzoHOYltXeMCWP3ISXYrj8PMt7jJ44IsDmQvyYwz6gS/WyZjpsGQIx31q2CEDzN/zPofmXNiOQjeV6b02foWRVx3N5ZIerckYjWCrY79mWk6xfpx7Q6jPU2DfFFlzX8m+Q9X/YYXuIU6bcC7D8V+MJ5tQx8hhcwxfjZa2vzu5Tk3fqMSonozAfPPjwGY9SdnbPWOgIyqTUNfLNEyyKqu5dHAjb5LtlpwNSLVEfhIIAzXGsquN1GA0SZ9ySUH8QTSStAygqgOPaIxCoPestLvouj6lXeCHLiXttloKWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcfcAlyIepzzTDdeEZyKRWtOwkY4VFSPL8yDukhBPdA=;
 b=DDzquWkKYMtdU1ObUDxPBj9Sn18bpg91RfyCEQ8/e7zs7w0HF0rrLg6O52EaIAQWH728PjxcmmpOZAbB42m/s8h/zD1AVRn1V+rN2c/WynpyFGqaNw5F3oqvQz7cYn4hTJQ928Q8ti07QEEsB0tROMDwcXQMUUuxNvCAtY4KHAoOFf/IVfQhbDGV7fBh8weB6S7H51ftOH8qY77z/GebjuKdzwxNkpcBdd+8Pd8M8ZXLgoukTk6KvvEhEkgTyyjVV5gFdIZ8BPz9L8WjkGa7XqJKjSRNUc8jWtpDnPjFOqk3y3VoxQvF08nCjM98NO6HKLzfbCLtaxSPluKA+78WSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcfcAlyIepzzTDdeEZyKRWtOwkY4VFSPL8yDukhBPdA=;
 b=TkDkEkenmt7U3w1G2dwcxI99O+hhkzl/LBzo3nRPvTrluBlQmyCuuxIu1j9+dJapQb0VejJzVE4pXy6rtzocpe+2v3kEbCO53JhfuBhfNJspMBpTddwqRbYteizgrGjK4+R5T3HQNqNlwEGudPBSGJ+mNQhjkw1b18kGXDn1w6cxevOkwi8OqhcsvC82FvXZGCEAVFH3QXQjgs/qnfqPkX4Wnu1o/NNPbkr6YojZ/DH7usWMkwd3i6VPcvM1jyR8BkbE1DdYvpyE5K2mHqV0H62/Gcyn5bCpD+/kWSDKgd3Z5KodZS9OT6Znfpqc1dGWTbcACDgjwpTKkOOYYiynBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by GV4PR06MB10528.eurprd06.prod.outlook.com (2603:10a6:150:2e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:24:13 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:24:13 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v2 4/5] documentation: Replace non-ASCII confusable characters with ASCII
Date: Tue, 28 Jul 2026 10:23:18 +0300
Message-ID: <20260728072328.11926-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728072328.11926-1-niko.mauno@vaisala.com>
References: <20260728072328.11926-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF000239FF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2b7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|GV4PR06MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f37be5-07f8-49e2-57fd-08deec79392d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|52116014|376014|38350700014|6133799003|6123799006|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	/EF0HaIeTN2p4DyJ0fMdg4jAMg4K3z5Jupg8/NhNVCIYbPL7/J+JyMlNEHqvWP8miP040QyW8rf8VPmcZf1+pwMEk3BWrwit8vdMFaXKyKITDjV/9GpNR+WpqbmHd1rmuJ1TE7enqn2axiyfS7dxS4x/NWbAjnwTSwFAQIGPQXxtrqA2IsmgTmh3xe2RMCUCaKn2fY8UQgJrgYl6UNumrQDqSOqJqwyMD9WS3Au2KZZfXcjP8aDtm0U9rs49bITIGgqCagqjYj+bMghzMtMYTXz9m7WMMAzRyffwLByKWuuDzcof8nzmqBsb8hoed9kE2MQKYygx3Nlw2d4HaDpqvVZgn73a6VSPJ1xg7ov/L0VULCoBvWuMfW1xzy1fStCUsOEYaa7SYpiE0Kwt+zorXxTCkc3N9g5wVAq8aT/3vvRK8Kt/cI14Vo7LHl9RjNEuCvxQn0b5Gg51LJAYklz+/BIikUTGLvLpyk/6UjS9FH0cngHwcGOugwQOg0omxAAu6rYmm8dz6jtlhnhIUv6dm2Ed/IP8U4DHSudXj5oD0gShuUabC1c5evY0sWlUsTFJRjNVddHzldWP+gL4S5Vrqp3g7+kZYplXF7S5+ybORcgt2bPggnqdhVCwmfVQtLnDEwlObJ93hLgRXxjGwIYEkuqbvhtrNbbv/GZC3BZ0NlY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(52116014)(376014)(38350700014)(6133799003)(6123799006)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6XWaQvIKlBto0RbEW4TOSfx+yER7Rm7Mp3WIlMvUoQG0DMWNr0pAuuoEraLA?=
 =?us-ascii?Q?t/woc+66J40C3Bb5yJUV/0EwPtfJLWDB50S4wTTLj0YFdlAkZ9rAWEpQgmcM?=
 =?us-ascii?Q?u+Tu0D6xO7y8tm5ZU60MK7tKUnmcl1E/+j3j2zlSwrXkgAY4BJrK8UeqoTtk?=
 =?us-ascii?Q?2NfjeFeHzFpbI4WbLERITLOYFWYiUe4Dy1SrBOdAzlHb1ISdD05vU8tJOq1t?=
 =?us-ascii?Q?L8CV2L9heIbKbemPVQ4D4T2g7+nIUN8xCgabnNWTjBoqlmeb0NMkxo+HEd4L?=
 =?us-ascii?Q?33PioO8VSt9+mXTQyndWwub/lk0NDaiIbsjfo8443uBuUYURQRHj+JcP47R7?=
 =?us-ascii?Q?BxtxDRmERvX+cb5QlDDTWB69l9ezvqrYfGt2NZlbCMS1DXd5g+z2PoBgFCbf?=
 =?us-ascii?Q?nRY4MxjB2V0fkFehEnNeChtDor/bkpojwkj9yqQkvY9f50iMID0AQzmld3l3?=
 =?us-ascii?Q?/m+UjeIxIyVrqG4D1OKK7ea0UOHUp2j/d7InjTsvmi2gytfgUmQeWfWWL/dl?=
 =?us-ascii?Q?CWwneDypG1w+SX5aJfShi31kovb6Ms9QgM6f+8HtM1PJn0Sz/Dtqzn3bCHw5?=
 =?us-ascii?Q?kUV1Y1wEta+GxImfcFXJZBYaux68pe9m7aG4KSRyxVVRsUqhdV56roctHTVW?=
 =?us-ascii?Q?v3DaV4q5nxkKK1dftFi3M6bJTtO6ymS9kFEhmeAR3+Jy2nxVc/Il1V+fUf6N?=
 =?us-ascii?Q?1rZSJAstYOpf+b4+QL4uOgW/NktvESbwkaqeLfqoyeD7mA2LMZ46P2SbdUZf?=
 =?us-ascii?Q?JgKpSPlz8n5hG9xtmqM9vbYPICKsIs+S1Iuv0w/SN2+Mgr7WRsq9T54fCQGi?=
 =?us-ascii?Q?9WKqyIJdyjLYj22t2KNNqlceGCyFAzkaWJWrQ0+Dabf708ZePMhdN+uvJkUO?=
 =?us-ascii?Q?D+wga3YyuB/nDu173Ov4ZrxFnuBCavH4Wx8dMATCOsJdpdt7jHceBDdAOW2P?=
 =?us-ascii?Q?1T6Oo7vmvg+PM9UIV1COJTPNsUb/MC1Zv9CKsmBQEn/8MWgwx5eSiu6gLJPg?=
 =?us-ascii?Q?1SO/jesviiL8FIKZiiQpk1EmcxJHV3v1KIIVAFFNtZZaoSuv/o8XBQQPRxme?=
 =?us-ascii?Q?u9jqsCTkwDKeFEuu6GF1TVwOdHwKb06fZNrC8HqTChszqlBDLsUW+X/xLBCk?=
 =?us-ascii?Q?jUdoZLHVyMcz70cOn3Z9iAuWZPuINJVylv9vY4YZe0fuul0hn288GH6tlvAf?=
 =?us-ascii?Q?s1AnMQXbgJoBEfI5vhSC/kMAlMxNOHCo+yCLfkIPaT6YjGeQkvSdRj6uNQeB?=
 =?us-ascii?Q?OEK+0QHJJWmeqQLrNO0om0NexhKAOhA3cV+/bzEPW5LqI1oLWMIXX1eVqT3l?=
 =?us-ascii?Q?wewUYdy79HuDcFa4ca+m97hvo+EsKt/tg1KYnA4g2jbiMmbal9xPB+RZCuQJ?=
 =?us-ascii?Q?pFHbSfTBZ1HqM5gX4GfLBe4J2jq93uNf9kPGQ26pN1b3gutT3Ue0egplWVjc?=
 =?us-ascii?Q?/MkXlwxP7ORZKBGLwtWdvAw4pqsvvKfJkLrW44zV31TaTZqhFJJxeRmVd6AH?=
 =?us-ascii?Q?+28hmYGcgSktdPh9O1peacHd5FSM2GJ4wQpXhFAqyID6KRYh6QKLhebsmM+9?=
 =?us-ascii?Q?gJUuF7A4ohgu9bEQiWUa/96xDG+no3i03j967EQ9KHtVZmQlpNdUvPQM9VUu?=
 =?us-ascii?Q?QbkosORFWwn/5bvwBUYvs2Au0OyMAwtDb4lstUkNchOKeI8sgV/5hLhh9uow?=
 =?us-ascii?Q?fYD75G7pJ5TI2GATHdrttREZyEwOumFa/AhilMqEjRhvJDjOZgMTya03Jzek?=
 =?us-ascii?Q?A778F5zVYnyzDeLw8CRTJlwyaNcJiFo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f37be5-07f8-49e2-57fd-08deec79392d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:24:13.0674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IadnCIOBl9p/mTK4cXfcuLFoMR3WjQpzzrmBLApimz2uju3haC+7rhHVPg57V++VNMXpBxfWpV1wSMxkMJ5qkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10528
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10158

From: Niko Mauno <niko.mauno@vaisala.com>

Several documentation sources contain non-ASCII "confusable" characters
such as curly quotes, en and em dashes, a horizontal ellipsis and
non-breaking or zero-width spaces. These look almost identical to their
plain ASCII counterparts but break tooling and mislead readers who copy
text out of the manuals.

For example, the curly double quotes present in the recipe style guide
example caused parse errors when copied into an actual recipe:

  ERROR: ParseError at .../foobar.bb:158: unparsed line: 'RDEPENDS:${PN} =
=3D "foo"'

and dash substitutions silently corrupt command-line options, turning
"--help" and "--dump-signatures" into unusable non-ASCII look-alikes.

Replace all such occurrences across the documentation with their
regular ASCII equivalents. Legitimate non-ASCII content, such as the
box-drawing characters used in directory trees, accented letters in
contributor names and CJK characters, is intentionally left untouched.

These occurrences were detected with the
documentation/tools/check-confusables script introduced in the
following commit.

Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../contributor-guide/identify-component.rst  |  4 +-
 documentation/contributor-guide/index.rst     |  4 +-
 .../contributor-guide/recipe-style-guide.rst  |  8 ++--
 .../contributor-guide/submit-changes.rst      |  4 +-
 documentation/dev-manual/build-quality.rst    |  2 +-
 .../dev-manual/creating-fragments.rst         | 18 ++++----
 documentation/dev-manual/debugging.rst        | 14 +++---
 documentation/dev-manual/new-recipe.rst       |  4 +-
 .../dev-manual/prebuilt-libraries.rst         | 28 ++++++------
 documentation/kernel-dev/common.rst           | 10 ++---
 .../migration-guides/release-notes-4.1.rst    | 22 +++++-----
 .../migration-guides/release-notes-5.0.rst    | 12 ++---
 .../migration-guides/release-notes-5.1.rst    | 16 +++----
 .../migration-guides/release-notes-5.2.rst    | 40 ++++++++---------
 .../migration-guides/release-notes-5.3.rst    | 42 +++++++++---------
 .../migration-guides/release-notes-6.0.rst    | 44 +++++++++----------
 documentation/ref-manual/classes.rst          |  4 +-
 .../ref-manual/devtool-reference.rst          |  4 +-
 documentation/ref-manual/structure.rst        | 14 +++---
 documentation/ref-manual/variables.rst        |  2 +-
 .../yocto-project-supported-features.rst      | 10 ++---
 .../test-manual/yocto-project-compatible.rst  |  2 +-
 .../transitioning-to-a-custom-environment.rst |  2 +-
 documentation/what-i-wish-id-known.rst        | 14 +++---
 24 files changed, 162 insertions(+), 162 deletions(-)

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
diff --git a/documentation/dev-manual/creating-fragments.rst b/documentatio=
n/dev-manual/creating-fragments.rst
index 7f437d7c9..8c3e24452 100644
--- a/documentation/dev-manual/creating-fragments.rst
+++ b/documentation/dev-manual/creating-fragments.rst
@@ -37,9 +37,9 @@ You can create one or more :term:`configuration fragment`=
 files in your
=20
    meta-custom
    =E2=94=9C=E2=94=80=E2=94=80 conf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 fragments
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 custom-fragment.conf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 layer.conf
+   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fragments
+   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 custom-fragment.con=
f
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 layer.conf
    ...
=20
 For our ``custom-fragment.conf`` file, the following variables **must** be=
 set
@@ -99,12 +99,12 @@ example, it's possible to create sub-directories to org=
anize your fragments::
=20
    meta-custom
    =E2=94=9C=E2=94=80=E2=94=80 conf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 fragments
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 networking
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=
=94=94=E2=94=80=E2=94=80 mirrors.conf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 resources
-   =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0     =E2=94=94=E2=94=80=E2=
=94=80 numberthreads.conf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 layer.conf
+   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fragments
+   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 networking
+   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 mirrors=
.conf
+   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 resources
+   =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 numberthreads.c=
onf
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 layer.conf
    ...
=20
 In the above example, the ``meta-custom/networking/mirrors`` and
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
diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentatio=
n/dev-manual/prebuilt-libraries.rst
index 9cc8bd2d9..cf8cf54d9 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -30,30 +30,30 @@ Libraries are built for several target architecture var=
iants and packaged in
 an archive as follows::
=20
    =E2=94=9C=E2=94=80=E2=94=80 build-arm-hisiv300
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-arm-v5-sf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-arm-v6-hf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-arm-v7-hf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-arm-v8
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-i386
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-i486
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-mips-eglibc-hf
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-pentium
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 build-x86_64
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 libft4222.so.1.4.4.44
    =E2=94=9C=E2=94=80=E2=94=80 examples
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 get-version.c
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 i2cm.c
-   =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 spim.c
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 spis.c
+   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 get-version.c
+   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 i2cm.c
+   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 spim.c
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 spis.c
    =E2=94=9C=E2=94=80=E2=94=80 ftd2xx.h
    =E2=94=9C=E2=94=80=E2=94=80 install4222.sh
    =E2=94=9C=E2=94=80=E2=94=80 libft4222.h
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
index 81d541fac..45f47d82b 100644
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
@@ -305,7 +305,7 @@ Recipe Upgrades in 4.1
 - fontconfig 2.13.1 -> 2.14.0
 - freetype 2.11.1 -> 2.12.1
 - gcc 11.3.0 -> 12.2.0
-- gcompat 1.0.0+1.1+gitX (4d6a5156a6eb=E2=80=A6) -> 1.0.0+1.1+gitX (c6921a=
1aa454=E2=80=A6)
+- gcompat 1.0.0+1.1+gitX (4d6a5156a6eb...) -> 1.0.0+1.1+gitX (c6921a1aa454=
...)
 - gdb 11.2 -> 12.1
 - ghostscript 9.55.0 -> 9.56.1
 - git 2.35.4 -> 2.37.3
@@ -315,7 +315,7 @@ Recipe Upgrades in 4.1
 - gnu-efi 3.0.14 -> 3.0.15
 - gnutls 3.7.4 -> 3.7.7
 - go 1.17.13 -> 1.19
-- go-helloworld 0.1 (787a929d5a0d=E2=80=A6) -> 0.1 (2e68773dfca0=E2=80=A6)
+- go-helloworld 0.1 (787a929d5a0d...) -> 0.1 (2e68773dfca0...)
 - gpgme 1.17.1 -> 1.18.0
 - gptfdisk 1.0.8 -> 1.0.9
 - harfbuzz 4.0.1 -> 5.1.0
@@ -333,7 +333,7 @@ Recipe Upgrades in 4.1
 - kea 2.0.2 -> 2.2.0
 - kexec-tools 2.0.23 -> 2.0.25
 - kmod 29 -> 30
-- kmscube git (9f63f359fab1=E2=80=A6) -> git (3bf6ee1a0233=E2=80=A6)
+- kmscube git (9f63f359fab1...) -> git (3bf6ee1a0233...)
 - less 600 -> 608
 - libaio 0.3.112 -> 0.3.113
 - libbsd 0.11.5 -> 0.11.6
@@ -391,13 +391,13 @@ Recipe Upgrades in 4.1
 - mesa-demos 8.4.0 -> 8.5.0
 - mesa-gl 22.0.3 -> 22.2.0
 - meson 0.61.3 -> 0.63.2
-- mmc-utils 0.1+gitX (b7e4d5a6ae99=E2=80=A6) -> 0.1+gitX (d7b343fd2628=E2=
=80=A6)
+- mmc-utils 0.1+gitX (b7e4d5a6ae99...) -> 0.1+gitX (d7b343fd2628...)
 - mpg123 1.29.3 -> 1.30.2
 - msmtp 1.8.20 -> 1.8.22
 - mtools 4.0.38 -> 4.0.40
-- musl 1.2.3+gitX (7a43f6fea908=E2=80=A6) -> 1.2.3+gitX (37e18b7bf307=E2=
=80=A6)
+- musl 1.2.3+gitX (7a43f6fea908...) -> 1.2.3+gitX (37e18b7bf307...)
 - musl-obstack 1.1 -> 1.2
-- ncurses 6.3+20220423 (a0bc708bc695=E2=80=A6) -> 6.3+20220423 (20db1fb41e=
c9=E2=80=A6)
+- ncurses 6.3+20220423 (a0bc708bc695...) -> 6.3+20220423 (20db1fb41ec9...)
 - neard 0.16 -> 0.18
 - nettle 3.7.3 -> 3.8.1
 - nfs-utils 2.6.1 -> 2.6.2
@@ -415,11 +415,11 @@ Recipe Upgrades in 4.1
 - pciutils 3.7.0 -> 3.8.0
 - perl 5.34.1 -> 5.36.0
 - perlcross 1.3.7 -> 1.4
-- piglit 1.0+gitrX (2f80c7cc9c02=E2=80=A6) -> 1.0+gitrX (265896c86f90=E2=
=80=A6)
+- piglit 1.0+gitrX (2f80c7cc9c02...) -> 1.0+gitrX (265896c86f90...)
 - pkgconf 1.8.0 -> 1.9.3
 - psmisc 23.4 -> 23.5
 - pulseaudio 15.0 -> 16.1
-- puzzles 0.0+gitX (c43a34fbfe43=E2=80=A6) -> 0.0+gitX (8399cff6a3b9=E2=80=
=A6)
+- puzzles 0.0+gitX (c43a34fbfe43...) -> 0.0+gitX (8399cff6a3b9...)
 - python3 3.10.4 -> 3.10.6
 - python3-atomicwrites 1.4.0 -> 1.4.1
 - python3-attrs 21.4.0 -> 22.1.0
@@ -513,12 +513,12 @@ Recipe Upgrades in 4.1
 - vte 0.66.2 -> 0.68.0
 - vulkan-headers 1.3.204.1 -> 1.3.216.0
 - vulkan-loader 1.3.204.1 -> 1.3.216.0
-- vulkan-samples git (28ca2dad83ce=E2=80=A6) -> git (74d45aace02d=E2=80=A6=
)
+- vulkan-samples git (28ca2dad83ce...) -> git (74d45aace02d...)
 - vulkan-tools 1.3.204.1 -> 1.3.216.0
 - wayland 1.20.0 -> 1.21.0
 - wayland-protocols 1.25 -> 1.26
 - webkitgtk 2.36.5 -> 2.36.7
-- x264 r3039+gitX (5db6aa6cab1b=E2=80=A6) -> r3039+gitX (baee400fa9ce=E2=
=80=A6)
+- x264 r3039+gitX (5db6aa6cab1b...) -> r3039+gitX (baee400fa9ce...)
 - xauth 1.1.1 -> 1.1.2
 - xcb-proto 1.14.1 -> 1.15.2
 - xf86-video-cirrus 1.5.3 -> 1.6.0
diff --git a/documentation/migration-guides/release-notes-5.0.rst b/documen=
tation/migration-guides/release-notes-5.0.rst
index 61ea4aa5a..54f4d1cb8 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -426,7 +426,7 @@ Recipe Upgrades in 5.0
 -  cross-localedef-native 2.38+git -> 2.39+git
 -  cups 2.4.6 -> 2.4.7
 -  curl 8.4.0 -> 8.7.1
--  dbus-wait 0.1+git (6cc6077a36fe=E2=80=A6) -> 0.1+git (64bc7c8fae61=E2=
=80=A6)
+-  dbus-wait 0.1+git (6cc6077a36fe...) -> 0.1+git (64bc7c8fae61...)
 -  debianutils 5.13 -> 5.16
 -  desktop-file-utils 0.26 -> 0.27
 -  dhcpcd 10.0.2 -> 10.0.6
@@ -572,7 +572,7 @@ Recipe Upgrades in 5.0
 -  mesa-gl 23.2.1 -> 24.0.2
 -  meson 1.2.2 -> 1.3.1
 -  minicom 2.8 -> 2.9
--  mmc-utils 0.1+git (613495ecaca9=E2=80=A6) -> 0.1+git (b5ca140312d2=E2=
=80=A6)
+-  mmc-utils 0.1+git (613495ecaca9...) -> 0.1+git (b5ca140312d2...)
 -  mpg123 1.31.3 -> 1.32.5
 -  newlib 4.3.0+git -> 4.4.0+git
 -  nghttp2 1.57.0 -> 1.61.0
@@ -588,12 +588,12 @@ Recipe Upgrades in 5.0
 -  p11-kit 0.25.0 -> 0.25.3
 -  pango 1.51.0 -> 1.52.0
 -  pciutils 3.10.0 -> 3.11.1
--  piglit 1.0+gitr (71c21b1157c4=E2=80=A6) -> 1.0+gitr (22eaf6a91cfd=E2=80=
=A6)
+-  piglit 1.0+gitr (71c21b1157c4...) -> 1.0+gitr (22eaf6a91cfd...)
 -  pkgconf 2.0.3 -> 2.1.1
--  psplash 0.1+git (44afb7506d43=E2=80=A6) -> 0.1+git (ecc191375669=E2=80=
=A6)
+-  psplash 0.1+git (44afb7506d43...) -> 0.1+git (ecc191375669...)
 -  ptest-runner 2.4.2+git -> 2.4.3+git
 -  pulseaudio 16.1 -> 17.0
--  puzzles 0.0+git (2d9e414ee316=E2=80=A6) -> 0.0+git (80aac3104096=E2=80=
=A6)
+-  puzzles 0.0+git (2d9e414ee316...) -> 0.0+git (80aac3104096...)
 -  python3 3.11.5 -> 3.12.3
 -  python3-alabaster 0.7.13 -> 0.7.16
 -  python3-attrs 23.1.0 -> 23.2.0
@@ -693,7 +693,7 @@ Recipe Upgrades in 5.0
 -  ttyrun 2.29.0 -> 2.31.0
 -  u-boot 2023.10 -> 2024.01
 -  u-boot-tools 2023.10 -> 2024.01
--  update-rc.d 0.8 (8636cf478d42=E2=80=A6) -> 0.8 (b8f950105010=E2=80=A6)
+-  update-rc.d 0.8 (8636cf478d42...) -> 0.8 (b8f950105010...)
 -  usbutils 015 -> 017
 -  util-linux 2.39.2 -> 2.39.3
 -  util-linux-libuuid 2.39.2 -> 2.39.3
diff --git a/documentation/migration-guides/release-notes-5.1.rst b/documen=
tation/migration-guides/release-notes-5.1.rst
index dc770ebc3..5de2f662c 100644
--- a/documentation/migration-guides/release-notes-5.1.rst
+++ b/documentation/migration-guides/release-notes-5.1.rst
@@ -498,7 +498,7 @@ Recipe Upgrades in 5.1
 -  ``boost`` 1.84.0 -> 1.86.0
 -  ``boost-build-native`` 1.84.0 -> 1.86.0
 -  ``btrfs-tools`` 6.7.1 -> 6.10.1
--  ``build-appliance-image`` 15.0.0 (bf88a67b4523=E2=80=A6) -> 15.0.0 (7cc=
8bf7af794=E2=80=A6)
+-  ``build-appliance-image`` 15.0.0 (bf88a67b4523...) -> 15.0.0 (7cc8bf7af=
794...)
 -  ``ca-certificates`` 20211016 -> 20240203
 -  ``cairo`` 1.18.0 -> 1.18.2
 -  ``cargo`` 1.75.0 -> 1.79.0
@@ -560,7 +560,7 @@ Recipe Upgrades in 5.1
 -  ``gnu-efi`` 3.0.17 -> 3.0.18
 -  ``gnupg`` 2.4.4 -> 2.5.0
 -  ``gnutls`` 3.8.4 -> 3.8.6
--  ``go-helloworld`` 0.1 (d9923f6970e9=E2=80=A6) -> 0.1 (39e772fc2670=E2=
=80=A6)
+-  ``go-helloworld`` 0.1 (d9923f6970e9...) -> 0.1 (39e772fc2670...)
 -  ``gobject-introspection`` 1.78.1 -> 1.80.1
 -  ``gptfdisk`` 1.0.9 -> 1.0.10
 -  ``gsettings-desktop-schemas`` 46.0 -> 47.1
@@ -589,7 +589,7 @@ Recipe Upgrades in 5.1
 -  ``kea`` 2.4.1 -> 2.6.1
 -  ``kexec-tools`` 2.0.28 -> 2.0.29
 -  ``kmod`` 31 -> 33
--  ``kmscube`` 0.0.1+git (6ab022fdfcfe=E2=80=A6) -> 0.0.1+git (467e86c5cbe=
b=E2=80=A6)
+-  ``kmscube`` 0.0.1+git (6ab022fdfcfe...) -> 0.0.1+git (467e86c5cbeb...)
 -  ``less`` 643 -> 661
 -  ``libadwaita`` 1.5.2 -> 1.6.0
 -  ``libassuan`` 2.5.6 -> 3.0.1
@@ -669,7 +669,7 @@ Recipe Upgrades in 5.1
 -  ``mdadm`` 4.2 -> 4.3
 -  ``meson`` 1.3.1 -> 1.5.1
 -  ``mkfontscale`` 1.2.2 -> 1.2.3
--  ``mmc-utils`` 0.1+git (b5ca140312d2=E2=80=A6) -> 0.1+git (123fd8b2ac39=
=E2=80=A6)
+-  ``mmc-utils`` 0.1+git (b5ca140312d2...) -> 0.1+git (123fd8b2ac39...)
 -  ``mpg123`` 1.32.6 -> 1.32.7
 -  ``msmtp`` 1.8.25 -> 1.8.26
 -  ``mtd-utils`` 2.1.6 -> 2.2.0
@@ -695,12 +695,12 @@ Recipe Upgrades in 5.1
 -  ``pciutils`` 3.11.1 -> 3.13.0
 -  ``perl`` 5.38.2 -> 5.40.0
 -  ``perlcross`` 1.5.2 -> 1.6
--  ``piglit`` 1.0+gitr (22eaf6a91cfd=E2=80=A6) -> 1.0+gitr (c11c9374c144=
=E2=80=A6)
+-  ``piglit`` 1.0+gitr (22eaf6a91cfd...) -> 1.0+gitr (c11c9374c144...)
 -  ``pinentry`` 1.2.1 -> 1.3.1
 -  ``pkgconf`` 2.1.1 -> 2.3.0
 -  ``psmisc`` 23.6 -> 23.7
 -  ``ptest-runner`` 2.4.4+git -> 2.4.5+git
--  ``puzzles`` 0.0+git (80aac3104096=E2=80=A6) -> 0.0+git (1c1899ee1c4e=E2=
=80=A6)
+-  ``puzzles`` 0.0+git (80aac3104096...) -> 0.0+git (1c1899ee1c4e...)
 -  ``python3-alabaster`` 0.7.16 -> 1.0.0
 -  ``python3-attrs`` 23.2.0 -> 24.2.0
 -  ``python3-babel`` 2.14.0 -> 2.16.0
@@ -811,7 +811,7 @@ Recipe Upgrades in 5.1
 -  ``vte`` 0.74.2 -> 0.76.3
 -  ``vulkan-headers`` 1.3.275.0 -> 1.3.290.0
 -  ``vulkan-loader`` 1.3.275.0 -> 1.3.290.0
--  ``vulkan-samples`` git (2307c3eb5608=E2=80=A6) -> git (fdce530c0295=E2=
=80=A6)
+-  ``vulkan-samples`` git (2307c3eb5608...) -> git (fdce530c0295...)
 -  ``vulkan-tools`` 1.3.275.0 -> 1.3.290.0
 -  ``vulkan-utility-libraries`` 1.3.275.0 -> 1.3.290.0
 -  ``vulkan-validation-layers`` 1.3.275.0 -> 1.3.290.0
@@ -823,7 +823,7 @@ Recipe Upgrades in 5.1
 -  ``weston`` 13.0.1 -> 13.0.3
 -  ``wget`` 1.21.4 -> 1.24.5
 -  ``wpa-supplicant`` 2.10 -> 2.11
--  ``x264`` r3039+git (baee400fa9ce=E2=80=A6) -> r3039+git (31e19f92f00c=
=E2=80=A6)
+-  ``x264`` r3039+git (baee400fa9ce...) -> r3039+git (31e19f92f00c...)
 -  ``xauth`` 1.1.2 -> 1.1.3
 -  ``xcb-proto`` 1.16.0 -> 1.17.0
 -  ``xev`` 1.2.5 -> 1.2.6
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documen=
tation/migration-guides/release-notes-5.2.rst
index b5483c903..df56486ba 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -947,8 +947,8 @@ Recipe Upgrades in |yocto-ver|
      - 6.10.1
      - 6.13
    * - ``build-appliance-image``
-     - 15.0.0 (6a5ba188b79e=E2=80=A6)
-     - 15.0.0 (2fe7f46e1779=E2=80=A6)
+     - 15.0.0 (6a5ba188b79e...)
+     - 15.0.0 (2fe7f46e1779...)
    * - ``busybox``
      - 1.36.1
      - 1.37.0
@@ -1151,8 +1151,8 @@ Recipe Upgrades in |yocto-ver|
      - 1.22.12
      - 1.24.1
    * - ``go-helloworld``
-     - 0.1 (39e772fc2670=E2=80=A6)
-     - 0.1 (d7b0ac127859=E2=80=A6)
+     - 0.1 (39e772fc2670...)
+     - 0.1 (d7b0ac127859...)
    * - ``go-runtime``
      - 1.22.12
      - 1.24.1
@@ -1244,8 +1244,8 @@ Recipe Upgrades in |yocto-ver|
      - 2.6.4
      - 2.7.1
    * - ``kern-tools-native``
-     - 0.3+git (7160ebe8b865=E2=80=A6)
-     - 0.3+git (bfca22a52ec5=E2=80=A6)
+     - 0.3+git (7160ebe8b865...)
+     - 0.3+git (bfca22a52ec5...)
    * - ``kexec-tools``
      - 2.0.29
      - 2.0.30
@@ -1253,8 +1253,8 @@ Recipe Upgrades in |yocto-ver|
      - 33
      - 34.1
    * - ``kmscube``
-     - 0.0.1+git (b2f97f53e01e=E2=80=A6)
-     - 0.0.1+git (311eaaaa473d=E2=80=A6)
+     - 0.0.1+git (b2f97f53e01e...)
+     - 0.0.1+git (311eaaaa473d...)
    * - ``less``
      - 661
      - 668
@@ -1511,8 +1511,8 @@ Recipe Upgrades in |yocto-ver|
      - 2.9
      - 2.10
    * - ``mmc-utils``
-     - 0.1+git (123fd8b2ac39=E2=80=A6)
-     - 0.1+git (2aef4cd9a84d=E2=80=A6)
+     - 0.1+git (123fd8b2ac39...)
+     - 0.1+git (2aef4cd9a84d...)
    * - ``mpg123``
      - 1.32.7
      - 1.32.10
@@ -1526,8 +1526,8 @@ Recipe Upgrades in |yocto-ver|
      - 4.0.44
      - 4.0.48
    * - ``musl``
-     - 1.2.5+git (dd1e63c3638d=E2=80=A6)
-     - 1.2.5+git (c47ad25ea3b4=E2=80=A6)
+     - 1.2.5+git (dd1e63c3638d...)
+     - 1.2.5+git (c47ad25ea3b4...)
    * - ``nativesdk-libtool``
      - 2.5.2
      - 2.5.4
@@ -1571,8 +1571,8 @@ Recipe Upgrades in |yocto-ver|
      - 1.54.0
      - 1.56.2
    * - ``piglit``
-     - 1.0+gitr (c11c9374c144=E2=80=A6)
-     - 1.0+gitr (fc8179d31904=E2=80=A6)
+     - 1.0+gitr (c11c9374c144...)
+     - 1.0+gitr (fc8179d31904...)
    * - ``pixman``
      - 0.42.2
      - 0.44.2
@@ -1586,14 +1586,14 @@ Recipe Upgrades in |yocto-ver|
      - 4.0.4
      - 4.0.5
    * - ``psplash``
-     - 0.1+git (ecc191375669=E2=80=A6)
-     - 0.1+git (1f64c654129f=E2=80=A6)
+     - 0.1+git (ecc191375669...)
+     - 0.1+git (1f64c654129f...)
    * - ``ptest-runner``
      - 2.4.5+git
      - 2.4.5.1
    * - ``puzzles``
-     - 0.0+git (1c1899ee1c4e=E2=80=A6)
-     - 0.0+git (7da464122232=E2=80=A6)
+     - 0.0+git (1c1899ee1c4e...)
+     - 0.0+git (7da464122232...)
    * - ``python3``
      - 3.12.9
      - 3.13.2
@@ -1964,8 +1964,8 @@ Recipe Upgrades in |yocto-ver|
      - 1.3.290.0
      - 1.4.309.0
    * - ``vulkan-samples``
-     - git (fdce530c0295=E2=80=A6)
-     - git (8547ce1022a1=E2=80=A6)
+     - git (fdce530c0295...)
+     - git (8547ce1022a1...)
    * - ``vulkan-tools``
      - 1.3.290.0
      - 1.4.309.0
diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documen=
tation/migration-guides/release-notes-5.3.rst
index fdc092e51..bf34e3113 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -1169,7 +1169,7 @@ The following recipes have been upgraded:
      - 6.13
      - 6.17
    * - ``build-appliance-image``
-     - 15.0.0 (316baad50b45=E2=80=A6)
+     - 15.0.0 (316baad50b45...)
      - 15.0.0
    * - ``ca-certificates``
      - 20241223
@@ -1385,8 +1385,8 @@ The following recipes have been upgraded:
      - 1.24.6
      - 1.25.4
    * - ``go-helloworld``
-     - 0.1 (d7b0ac127859=E2=80=A6)
-     - 0.1 (8b405629c4a5=E2=80=A6)
+     - 0.1 (d7b0ac127859...)
+     - 0.1 (8b405629c4a5...)
    * - ``go-runtime``
      - 1.24.6
      - 1.25.4
@@ -1484,8 +1484,8 @@ The following recipes have been upgraded:
      - 2.6.3
      - 3.0.1
    * - ``kern-tools-native``
-     - 0.3+git (c8c1f17867d0=E2=80=A6)
-     - 0.3+git (f589e1df2325=E2=80=A6)
+     - 0.3+git (c8c1f17867d0...)
+     - 0.3+git (f589e1df2325...)
    * - ``kexec-tools``
      - 2.0.30
      - 2.0.31
@@ -1493,8 +1493,8 @@ The following recipes have been upgraded:
      - 34.1
      - 34.2
    * - ``kmscube``
-     - 0.0.1+git (311eaaaa473d=E2=80=A6)
-     - 0.0.1+git (f60e50e887d3=E2=80=A6)
+     - 0.0.1+git (311eaaaa473d...)
+     - 0.0.1+git (f60e50e887d3...)
    * - ``less``
      - 668
      - 685
@@ -1508,8 +1508,8 @@ The following recipes have been upgraded:
      - 7.8.2
      - 7.8.4
    * - ``libc-test``
-     - 0+git (18e28496adee=E2=80=A6)
-     - 0+git (f2bac7711bec=E2=80=A6)
+     - 0+git (18e28496adee...)
+     - 0+git (f2bac7711bec...)
    * - ``libcap``
      - 2.75
      - 2.77
@@ -1736,8 +1736,8 @@ The following recipes have been upgraded:
      - 1.8.28
      - 1.8.31
    * - ``musl``
-     - 1.2.5+git (c47ad25ea3b4=E2=80=A6)
-     - 1.2.5+git (0ccaf0572e9c=E2=80=A6)
+     - 1.2.5+git (c47ad25ea3b4...)
+     - 1.2.5+git (0ccaf0572e9c...)
    * - ``nettle``
      - 3.10.1
      - 3.10.2
@@ -1784,8 +1784,8 @@ The following recipes have been upgraded:
      - 3.13.0
      - 3.14.0
    * - ``piglit``
-     - 1.0+gitr (fc8179d31904=E2=80=A6)
-     - 1.0+gitr (a0a27e528f64=E2=80=A6)
+     - 1.0+gitr (fc8179d31904...)
+     - 1.0+gitr (a0a27e528f64...)
    * - ``pinentry``
      - 1.3.1
      - 1.3.2
@@ -1799,11 +1799,11 @@ The following recipes have been upgraded:
      - 1.9.0+git
      - 1.9.2+git
    * - ``psplash``
-     - 0.1+git (1f64c654129f=E2=80=A6)
-     - 0.1+git (53ae74a36bf1=E2=80=A6)
+     - 0.1+git (1f64c654129f...)
+     - 0.1+git (53ae74a36bf1...)
    * - ``puzzles``
-     - 0.0+git (7da464122232=E2=80=A6)
-     - 0.0+git (a7c7826bce5c=E2=80=A6)
+     - 0.0+git (7da464122232...)
+     - 0.0+git (a7c7826bce5c...)
    * - ``python3``
      - 3.13.4
      - 3.13.9
@@ -2036,8 +2036,8 @@ The following recipes have been upgraded:
      - 1.7.0
      - 1.9.0
    * - ``rpm-sequoia-crypto-policy``
-     - git (032b418a6db8=E2=80=A6)
-     - git (ae1df75b1155=E2=80=A6)
+     - git (032b418a6db8...)
+     - git (ae1df75b1155...)
    * - ``rt-tests``
      - 2.8
      - 2.9
@@ -2168,8 +2168,8 @@ The following recipes have been upgraded:
      - 1.4.309.0
      - 1.4.328.1
    * - ``vulkan-samples``
-     - git (8547ce1022a1=E2=80=A6)
-     - git (d27205d14d01=E2=80=A6)
+     - git (8547ce1022a1...)
+     - git (d27205d14d01...)
    * - ``vulkan-tools``
      - 1.4.309.0
      - 1.4.328.1
diff --git a/documentation/migration-guides/release-notes-6.0.rst b/documen=
tation/migration-guides/release-notes-6.0.rst
index 1ce7d5120..5395d8996 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -1019,14 +1019,14 @@ The following recipes have been upgraded:
      - 2.42+git
      - 2.43+git
    * - ``cryptodev-linux``
-     - 1.14 (135cbff90af2=E2=80=A6)
-     - 1.14 (08644db02d43=E2=80=A6)
+     - 1.14 (135cbff90af2...)
+     - 1.14 (08644db02d43...)
    * - ``cryptodev-module``
-     - 1.14 (135cbff90af2=E2=80=A6)
-     - 1.14 (08644db02d43=E2=80=A6)
+     - 1.14 (135cbff90af2...)
+     - 1.14 (08644db02d43...)
    * - ``cryptodev-tests``
-     - 1.14 (135cbff90af2=E2=80=A6)
-     - 1.14 (08644db02d43=E2=80=A6)
+     - 1.14 (135cbff90af2...)
+     - 1.14 (08644db02d43...)
    * - ``cups``
      - 2.4.15
      - 2.4.16
@@ -1154,8 +1154,8 @@ The following recipes have been upgraded:
      - 1.4.328.1
      - 1.4.341.0
    * - ``gn``
-     - 0+git (81b24e01531e=E2=80=A6)
-     - 0+git (9d19a7870add=E2=80=A6)
+     - 0+git (81b24e01531e...)
+     - 0+git (9d19a7870add...)
    * - ``gnu-efi``
      - 4.0.2
      - 4.0.4
@@ -1181,8 +1181,8 @@ The following recipes have been upgraded:
      - 1.25.9
      - 1.26.2
    * - ``go-helloworld``
-     - 0.1 (8b405629c4a5=E2=80=A6)
-     - 0.1 (7f05d217867b=E2=80=A6)
+     - 0.1 (8b405629c4a5...)
+     - 0.1 (7f05d217867b...)
    * - ``go-runtime``
      - 1.25.9
      - 1.26.2
@@ -1274,14 +1274,14 @@ The following recipes have been upgraded:
      - 3.0.1
      - 3.0.3
    * - ``kern-tools-native``
-     - 0.3+git (f589e1df2325=E2=80=A6)
-     - 0.3+git (a4a362d9f4f0=E2=80=A6)
+     - 0.3+git (f589e1df2325...)
+     - 0.3+git (a4a362d9f4f0...)
    * - ``kexec-tools``
      - 2.0.31
      - 2.0.32
    * - ``kmscube``
-     - 0.0.1+git (2c1f2646c5e5=E2=80=A6)
-     - 0.0.1+git (f60e50e887d3=E2=80=A6)
+     - 0.0.1+git (2c1f2646c5e5...)
+     - 0.0.1+git (f60e50e887d3...)
    * - ``less``
      - 679
      - 692
@@ -1613,8 +1613,8 @@ The following recipes have been upgraded:
      - 1.9.3+git
      - 1.9.5
    * - ``puzzles``
-     - 0.0+git (a7c7826bce5c=E2=80=A6)
-     - 0.0+git (ecb576fb2a0a=E2=80=A6)
+     - 0.0+git (a7c7826bce5c...)
+     - 0.0+git (ecb576fb2a0a...)
    * - ``python3``
      - 3.13.12
      - 3.14.4
@@ -1841,8 +1841,8 @@ The following recipes have been upgraded:
      - 1.9.0
      - 1.10.1
    * - ``rpm-sequoia-crypto-policy``
-     - git (ae1df75b1155=E2=80=A6)
-     - git (f3f5fa454345=E2=80=A6)
+     - git (ae1df75b1155...)
+     - git (f3f5fa454345...)
    * - ``rt-tests``
      - 2.9
      - 2.10
@@ -1970,8 +1970,8 @@ The following recipes have been upgraded:
      - 1.4.328.1
      - 1.4.341.0
    * - ``vulkan-samples``
-     - git (d27205d14d01=E2=80=A6)
-     - git (fa2cf45adde0=E2=80=A6)
+     - git (d27205d14d01...)
+     - git (fa2cf45adde0...)
    * - ``vulkan-tools``
      - 1.4.328.1
      - 1.4.341.0
@@ -2000,8 +2000,8 @@ The following recipes have been upgraded:
      - 1.16.0
      - 1.16.1
    * - ``x264``
-     - r3039+git (31e19f92f00c=E2=80=A6)
-     - r3039+git (0480cb05fa18=E2=80=A6)
+     - r3039+git (31e19f92f00c...)
+     - r3039+git (0480cb05fa18...)
    * - ``xauth``
      - 1.1.4
      - 1.1.5
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
diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-man=
ual/structure.rst
index 315a078f7..55c00712b 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -22,7 +22,7 @@ Directory` are organized as follows:
 .. code-block:: text
=20
    =E2=94=9C=E2=94=80=E2=94=80 build/
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 ...
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 ...
    =E2=94=94=E2=94=80=E2=94=80 layers/
        =E2=94=9C=E2=94=80=E2=94=80 bitbake/
        =E2=94=9C=E2=94=80=E2=94=80 meta-yocto/
@@ -385,13 +385,13 @@ makes the :ref:`structure-build-conf-site.conf` file =
a symbolic link to a common
 ``site.conf`` file::
=20
    =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-distro_poky-machine_qemux8=
6-64/
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 build/
-   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 conf/
-   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 site.conf -> ../../../site.conf
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 build/
+   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 conf/
+   =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 site.conf -> ../../../s=
ite.conf
    =E2=94=9C=E2=94=80=E2=94=80 poky-master-poky-with-sstate-distro_poky-ma=
chine_qemux86-64/
-   =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 build/
-   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 conf/
-   =E2=94=82=C2=A0=C2=A0  =C2=A0=C2=A0  =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=
=94=80 site.conf -> ../../../site.conf
+   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 build/
+   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 conf/
+   =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 site.conf -> ../../../s=
ite.conf
    =E2=94=94=E2=94=80=E2=94=80 site.conf
=20
 This way, site-specific settings can be shared for multiple build
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst
index b124e9c30..e42c0a57c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9913,7 +9913,7 @@ system and gives an overview of their function and co=
ntents.
=20
           meta-acme/recipes-core/psplash
           =E2=94=9C=E2=94=80=E2=94=80 files
-          =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 logo-acme.png
+          =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 logo-acme.png
           =E2=94=94=E2=94=80=E2=94=80 psplash_%.bbappend
=20
       And here are the contents of the ``psplash_%.bbappend`` file in
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


