Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ECDC54F4D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:56 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.576.1785256727391528194
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=brb0coTh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.142, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4VZYYQBRC3eTjeiCXVz7vicNSTzXRHU/J+bZFkuYFo5ql5Hcn/Ks8u54Om8AMolVHhhAsskEwBxDdaZw8jJA9S8JWxtEqh3Hz9dB++x6WQeZ8pX9+8bJWunRwlQa/YHE68zqS1GU2H4fJklLpxvjr6yjhDNMjCwb1naF0U4xgu79OmOXDP73dcSGpnVEwPc6jf1c4SxpSPrLXa9CRXXGYr3vHp7+/TWbBJazjVJ20Ot1yJzieQviw3B8EK5cVzBsoZOOqgfki7z6GTptJyjUB6/Fn/QBfFHqfUeLhPjzdKcc3b3nEwRrdg76/X8HvThQW9RIZoAaaHxEIVE53kKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maUfVJFF+AlAvGHtF6bDTxluFhmeFZDM2irTWInropQ=;
 b=jG6U87Jjz1BqZ7a9AxINeLR1esgBbCrzgJzmBQPKQZ53FuZ90tKGhuTzrNpcWrTJLFxkYkrgtP/uM7DRVxbAfzAxj7vMA1JBZpjNF3FvrY3/P8MbDQUiXF0nUWpC1glpvu9vRsrIfDDpAeRbGOcrOK5ia7KXFmH/ktXgBtfmUPyGTEJuiOluomh2m0IOykthJKDWNhFA8T08lIRJfOV1LSLUkfbavrpJLTZvC+cLreYAQV61m/IX1DdF0I9ieOLCJnGtUjxJP/fHN/TU/dzp/SfKY5stsk3UTdSTiAQGYU5SOYRzZNK/cS9vUfNcQvEvgLCCFksFoYyetTh74fCT1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maUfVJFF+AlAvGHtF6bDTxluFhmeFZDM2irTWInropQ=;
 b=brb0coTh00NU/j8/SFx65VezgYhDwDGefBR67WYxIlhF2aJ0m6JhojEggPeayxCGZmcIERowjUxJJivyc6xLC19W4TKvtA64IubMrQTzLr0W1vDg2frUL0222zWjd0OOG17CTaadXFZoOkjhU6X3JKqN5lYaa60gUm990xziJMRuQecGr7RZUWL3xXl391d5YQl+UrFRIVo1ucpE5JsrPHs4haV3YTP+lQtGWpnrzLT21yHJI1aZJouJOERz87CpUu4opurlUaai1tEorHIWFgnLzgglNWo+qRBrBeCDmmONgiGNIROqrq7Kp3ZBZFOinHR0rPDw3LUAexE7nGIFog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AMBPR06MB10211.eurprd06.prod.outlook.com (2603:10a6:20b:6f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:38:45 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:38:45 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v4 4/5] documentation: Replace non-ASCII confusable characters with ASCII
Date: Tue, 28 Jul 2026 19:38:05 +0300
Message-ID: <20260728163816.17230-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728163816.17230-1-niko.mauno@vaisala.com>
References: <20260728163816.17230-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF000167FB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::675) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AMBPR06MB10211:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b0d8ba-fa8e-4a8e-3df1-08deecc6b106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|6123799006|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	RZmHUoDDCucviLnm5zahouJVq3TDSwGF/T97dQCcSpbdIU5mejEABbpBeVTbSFQ2SH61eCbG/V43Ju7RsvlHHETNaF/wZuVHCqL7z9A6SvXbjzN/iJlesv6zR8ZSsvDNd1gN3/J9xAxIdmzmRRdBS/ERAdI+hes7VYFltFzlA4QmDETXdBvzCS2W2Sq/XMlgdI0wu2BANW3b9gkNQh10HlvHNh/fBQMhhM3NcH+1Mo3Lucr/RivSbuOht4kqaOaYUChfXFPBX34E28LScrXPekxTHbdSn367Eht00T0qEa3lo9Rsy4njEjTpMWSju3BbctbmFh5S/UNWxXWnSs2rzlyiOHTheB79C8rRayUDfIKygQzsQuHTWvY8RGhQ348HQQfmBO0VMtpqtea9mmjqRZOVVfIDuCEdlN5aahVsJ5BwR6g+D68g/ffIWVUSXeNa4Yj7r0H/+93Di5d1umjih8paNC+w3BxumOb75jEosBQL86lnlU+0v7hHcQwI5FDub1NJbvUMPc27BtFBgrowlzOlN9UeWLx0Zc6nOuVYEq217qU0vNeNb9IHyqvAuSWzwlJg7bXiKEV2wwqZmFyh6lbWBK3mecEgBM5sNj/W7op+7gUlcCgO4yYjSvSkG8hQd1Jnw8KCuS0+OPRLz7VeulmAgs/aN/bideq7DHZuJAE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(6123799006)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RLFG+Ijqo3l06SX5dnCjNPJhOrRP+h08xtYtiLhE5WqgM5J5f2i1fOfDaKYy?=
 =?us-ascii?Q?ExEq4H214kACnviSEZf4R25GmBTyirKffqxUTKqWaHV0mmoijWrAAHlUvDIW?=
 =?us-ascii?Q?3UXnv710sCa6HcU2RMUTw/FJv1FPMeX8iFC+vmOMD6u/ZBy1RLcdozhclr96?=
 =?us-ascii?Q?0QTDJAl6zKBNY+8lUgFCY8y5a8H9chlGk34qK9DWLSWPgo0GLLEwRZKVz0TV?=
 =?us-ascii?Q?Q7yOwWqW1L7Q8eqj8HbTg6qAr8kDAqhPxrHr+tlShXCGpDlwYkyW/xI/3hK5?=
 =?us-ascii?Q?memGQc7oE2//gPcIZ+l3djuz+hsFtIWuhftK3t49ImYce6NCsqRkbbapS9/e?=
 =?us-ascii?Q?/Mxxm/Xc+Z7pfOYd3n/Iy2nBMSkXBWfZNBfvm92o4RLmbw5nHnMogSC7VzWG?=
 =?us-ascii?Q?kBv/i0iulRXi6RqcO6rr21vVu+xkTYy6hEhiozgshXvwImgUsEG5CZsQT3t8?=
 =?us-ascii?Q?hKQpAqrT53J6ap+nQDfqySCgm6RYcFWxJk1btGg941tygtwKHhqjdKxoioed?=
 =?us-ascii?Q?b18H3tRJ7nID4ROViFEQsdFpJSUZZCnCo8H1kLgMVcZ0PKaeNT6tQyRfinzz?=
 =?us-ascii?Q?4dEGQyf7GlHylXL2BK2m63mU3u495cXL2/0mUktywnWYiHdI0yNQbVrT43UB?=
 =?us-ascii?Q?sCpuyXMOfrGaJhLkhan2v4YM2D0UAQCpxVgZGnT1sw4cEB/1DXJuFlGHK7Sc?=
 =?us-ascii?Q?xsii2aAWxJmn0NTfNi45L5fxIRR731sbSnpzWcnWTsQj+ro/1TvNKeKwuV13?=
 =?us-ascii?Q?oEgt/othJ0ZtdDbJ1OXm9fxDaO7E4KfoYJ8EdCz1bpVBiySdg5LDcbnASWd+?=
 =?us-ascii?Q?b2cv3JMvlx573mSZZns35Ki1Spw2+YoxbcMuw1iTJt0cIEWH52Ij+4+wJT8Z?=
 =?us-ascii?Q?ThAjObNcusYgi8aOJw5oTZScpVU2wZLNNIveAqTI0fHTb/SGxSWj7GGH/X7b?=
 =?us-ascii?Q?QLGfBFLeZOMfSBE+G4DXH74PobYYruOfQCrONzOCU81bP6cdpOYo2OmcOCAG?=
 =?us-ascii?Q?ayowy6UOhih6AntVgKZPXpFoTTFrxWS6YgRqkbzCpTfNToEys6oZM/RqOi5I?=
 =?us-ascii?Q?lgVOFpCzqnioA5BmzoFcBfQ1pAIjJAs5DSs4x61r1qij5/02IbGrgNEJGUcI?=
 =?us-ascii?Q?soAR8T7fDQuT4f2vjYxgThbMuyulqxk76Q0Hlxd3oyC2b7QHBAnve58D+TmR?=
 =?us-ascii?Q?F2PWoLjz7fNEzaycGQzdHqGZQydyQvB9ph4gowI+gLUD2z8J2AyNAgJZ5H2D?=
 =?us-ascii?Q?FQmw0qvTVG5UzvRLBHKEdS7pigY4j0Z/bAcFyEvFTelP/pjTXtIYJjeMJ9Wb?=
 =?us-ascii?Q?EXBGNn+0p/nAXEpapAq3itw/xxdR5bxYj9vuHRWweCH4Ebfux93sEdK086U0?=
 =?us-ascii?Q?3Z6Eeo9RDemCXBLe3b9KJMz/VYz7MktpgImZyLd231J06Rddtrzx1OqOLrvh?=
 =?us-ascii?Q?8sheB8wJ1UGy/kaB6PIUWjk2rni0sR9ku0Q8De/V0NaD1ygIZmZBEVT9e/S5?=
 =?us-ascii?Q?W7u/JV73mGOCJcHP06FCFKX8iQCpjCpIcZGL8cwvwaDFgsi1pdB4+fpqPe/G?=
 =?us-ascii?Q?vPRAs3qzWBMciqVez52Qq2MLfkYtO1sO1cuWwoulQUjs77JzpE0ZkJfO0qPg?=
 =?us-ascii?Q?uyAQlHBZA16Pal4igbSRpflrXHjksOoQ5DuBjTqVt0meK+U4kNPaK2LWUsM1?=
 =?us-ascii?Q?pCCRSYqm6f4ekAKso/0tL/g4QGuk8v5KmVTGnlfymqL/OTrC0OxtY9exd00R?=
 =?us-ascii?Q?aaxYE0Gj94RBDo/dxuhVC/GuhWR809E=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b0d8ba-fa8e-4a8e-3df1-08deecc6b106
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:38:45.3575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BimO8W5UPEjzt5/jsLg8kD8+sl2Pir9jjYmovcTIUMh2LtM8nhRN0TZpyRAITpmycEA5XhssGXJlA62ZQB1axg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10211
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10179

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


