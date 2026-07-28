Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618B9C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:08:13 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7659.1785229682736024990
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Li9gyF/E;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.90, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j//bDGkq77tHdJKQeb0W6AWf+ZxjGXsiUtKvdjzM14C3Sbky4ivGY+Fi+X11IjlS//VKraNzEoK4cBoIJyrNIQbaMp01UZyVtv9v/jy+pOTVpuEmaM0sndJ+5mQqCf8hc0NR4/XC01LkMO4C3uaKDIdoh1iiH6R2btUdLUzcDkXCiYg+hznp4hmJKzkA/oGxZ6OU0GR7xFPFnB184DwdoklAhJvar7eKg35MFnDeI/i6KLWNW2PvX3O6o0RewhNCiITbAmissOgdbl+C5sIgyW4TJTx52FdPrvDZTWTHQAPhwSSez7kl8S9YdHIOcL3XuuxUgGDwaoKRsZSOmx5wew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjGFSD1+peqZJTgjFWE671fFqF820bA7xZskh8EBQ8A=;
 b=oEqkUU6ctIhf4URsmMVqcR4shQO2PbEcrJcVyDBkkKGmfS/KXvR4yA2sQJ9RKLRxXz3o7NvrrEXgXQ+9DIC0HrIkY3dwTi857TVMKsecavAoPDEZkZxhvKaugyrLBu/aftAKtgrEx93uK5sqSZVvBgahHTFU2ZDebUQcnY/iuUAUO7Z+oXIaQwyQxCBVXNjmaNsdZuVbNi4b68hBFqoEDQE+Dnr3QvM6dbLN61x5Sru+CfaOr02ZQNppi4IJGWJGeFQEm78w22qOpJF4BS0GFe6y6PcyvcTnlgEl+NxDo+gBx46b4bVJSWbgU16eI1uu1C/2hOnTVEbdNCu+O5cRjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjGFSD1+peqZJTgjFWE671fFqF820bA7xZskh8EBQ8A=;
 b=Li9gyF/E2zhIguvW9W6Qp7JhzK9rIiLwSvEf7KbLOAzelZNZZvmtIXURvQtsi+lFiKeYZik10joGpBjYQB14lFPQrnY5xC1wKX9k+/gwGOh51oQrJsQqMWmoPUOHTWNxErpgtykRCwT6newoW/RM6EVUuJ8QUthwRKouBrxQ1e9jXxyREX/ozgpDfA/8NnLtwRUgUbX0DUpCWzlh7K3CE/t+RGMRN+pUC2lfwrrAy+a35t0roj82ETn1o0chZivu4H8/pF8u9Yt1A9c7R4V3yNi+awbKCNkUR7d3JvrQKz+B3VlVnhjRkWnvpBpR8tjpg4aVcYSBbms5AESsEPlFHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA1PR06MB9700.eurprd06.prod.outlook.com (2603:10a6:102:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 09:07:57 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 09:07:57 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 0/5] documentation: minor fixes, plus a confusables check
Date: Tue, 28 Jul 2026 12:07:33 +0300
Message-ID: <20260728090746.27793-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0039.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA1PR06MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: f91f8b02-5e10-4ca6-1534-08deec87b779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1r2ShKHrRp3EfoWjfYBBBcsmyc4YyRH/4JFkt4O1Ek2MDZ6DwCnafQwdkuOS1nTk3xaos5W3zdLFIBuJAqnbNM16qGZykJgMfry5NjTERiDbhETJ0SsvJ8R10jDQXMFgABfVDuv2R+oVlsnf1O98TdTI/D9tTYDAAOo8kA+d0935bcGm2hvjgWHJsEfojAAk1p69dwuIYx7Ga3xnIKpITFwKvC+hvEVQcPzp6h/zKyswZPlt9aU/tj8/CFnv4WGh06QnwZh0eSe+BD/0xL7pCeVc9ceTVxvg8WByUtOsjnleEhEQG6jplRhx+/dvfiXY8NTo1GwjaPTiTn7v+3xeynpAhlELp1FsVJTYdd7MG4cOBzRQlzeFxhG/damMdlRTwBy8LpXmOh/KBM1Y0vt9Os0QX6k+5XZvQBf7n0H+aLxMLyNpZ7whw5XFupH/mOvLmJIZXp5Peukdkmq5PUlHSEJfRP06LsFOnzBR/Zuw+AJnft13T/kdpaEQafkKdw4O3n3m/kByZaDc2j2HcDOPlMSSxp/GGDWNycsKKO5sP2pIS+aPKzt8Qv+9VeZ24YpYq+LeB3Mi0pSXdI10JycWzPqYBi8NBsjo4mbKEhM4UJNkH3SE+XuGE6+XNfIozgP7FNnnWLawLSNV6eIkMA9xy6lgGZAkxWVwDMF1Xt4HGrB8YBrGZ12DbY8R3op9hXi6KzATXCU8n5yOZWosJbUshNKtMnszNKp37WNEGQRiWd8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Rh5d2q6r/qbcyPoAKCHv2JojSMg3oOkSrg7r4TTXLsDEE3S8aKprBHf2JPeb?=
 =?us-ascii?Q?DczvqPYxdHsOzFF2wbwKOtzs8oTCYhRrzWSfo2/VtNEsbhI4aGipNz2zhwaf?=
 =?us-ascii?Q?Q0lRDyP2cB1VIf274O5bAdeoC17nkirmSfiKnNaExbPRFMvFbt6dFMVoNbzr?=
 =?us-ascii?Q?rGqRkEgVvA2BtGwqWvGFmlTbrNhCsfkyUM64gdHg66MLd/Hg6cSn9nG3GCXD?=
 =?us-ascii?Q?FGCu2rdQNy28/vX/o3jgQhsjZm7+d9Y9gAUWrTw2u8ZozcEoJKqHjDvFyeWj?=
 =?us-ascii?Q?/NJ99LvI0jw7jj9Ql8Q5+m/HO4GalZcrc3XQ9KoL1Yv00QOcZ7NT22KziJll?=
 =?us-ascii?Q?GoxXiI+wxXuxjN1WpwOnVa8Gvt9u5Asewodkd28vWk+R9+oEXETqY6fS2uV5?=
 =?us-ascii?Q?HKBCae+/WNKqnxQEJc3EgB7vNU20002Ztqzuoq6QgXVhE0w4E6xixMqjH8kJ?=
 =?us-ascii?Q?vycf5ze8E+QsPbZ5/Y7J8HrG2586lwAY1wC2AW6aVgNzItGxthq19j5SgNHt?=
 =?us-ascii?Q?PzrDpqDyTCimROquIjbMqt2eBi7UQJobYOFq9Zno1sirR7X4AWcPrJmboLNH?=
 =?us-ascii?Q?XnzPlSsYE8SUXX4hElTDuY1qBOslYbl231GESCgDZJPEHLc1MrBGymwupWdl?=
 =?us-ascii?Q?xG+9dMCGnuBG3MDciMVRkK0Zl5vVdkcQr+b9SlZJYgeCpnfLYrARgFq0h0BK?=
 =?us-ascii?Q?wkCIvcY3sRmZaE8BvnwS4unt2Ji7JbIV6/emgInshuRk3lR5BDnb38rG7KCf?=
 =?us-ascii?Q?peHrLvV2o2q1vrhsb711A94HY2Jt1s2UXxGdhZDFeDoMs3NFoif6fJH7iQ1a?=
 =?us-ascii?Q?uVJPG6ioaHGJqOTl/fvaAYN6+v7bUXJ32i862iAp/KM4VpB5vRdVhs9zJoCg?=
 =?us-ascii?Q?IbnnKT0Ny4ArBT+c1UkIKV0S+EuSkkbfWrYcIHXcOPeT1f/QuZ4UXgeh5tKB?=
 =?us-ascii?Q?N07Ri5NfHmQXujkQA/ZJQBB5olDsQt6mVTJcPEZMnVfJDJwmFS6n2zkqfxbw?=
 =?us-ascii?Q?egukGBb0epmBgtdu4WHNMkFSxRYWQ+T/rSfJNyefy0OlQLC7gT8G6WRCby+c?=
 =?us-ascii?Q?9vjXuXlWsi4yRzJqrnb50W6TGune9tPUIfVXEQaaF0uRw6fVOYDaQ7/3tQUO?=
 =?us-ascii?Q?KLxC6tOkXvxWx+FH/4+mN6ILJtfekdA/Lrb9u59HLC1nkwFB8w86hrmEn7/A?=
 =?us-ascii?Q?Py99PHnjBd1EzZGOcDiVAeAoqCz77C9ucddFfLcDxAhhimhEmPkXLdWCKQqS?=
 =?us-ascii?Q?y7bQ5zpbFnm6FzMMDDVb8QOuF1/22Zf/k5lNCPz41rtFy1E3XgqIxdBAY8xs?=
 =?us-ascii?Q?K8LQLQP/TvxYDqR9Msth8GTnIv7j/zZFhxGY01ih1VHqTdb2dXnkCXanzpF/?=
 =?us-ascii?Q?ilJFGhZ004gyv0kSxeokf50CEKMW1P3pw1P4l32epoe5zsowHx/OQAAjfyCF?=
 =?us-ascii?Q?fkXmSO9eazPniWly+cayirmkK0sQknW6Xj1YNiQpdojDC2PsglgwIAJLIWtU?=
 =?us-ascii?Q?tAJMlrbdZForQ/4sM2g+a1TnyFunNn6I7pwEhs3Q3my1rU295G2eR/c/6YsQ?=
 =?us-ascii?Q?v69Fwg9KAHQBypJRGZ/c2ok/929EEcMJHrVnn9+f4oDakC0zEGekA0vWJCjD?=
 =?us-ascii?Q?O20zBTS6JjdJEySHnh4k5bLbcJsTUIRusIwyJ+uacDkFVOBbOVvLWRMjS/Cj?=
 =?us-ascii?Q?JoqV6WG/9/nhJLYyInTpsToYuJo3BlIxRwPymfZVmpucWLCPn+1nx5fCBAmY?=
 =?us-ascii?Q?NfwuOGOmyeZ0+vM9gfaiY1/Bx4Tl5Xk=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91f8b02-5e10-4ca6-1534-08deec87b779
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:07:57.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjhHduTGQ/WCjZABcQxX9E2McQrww49bGQINokEF43tmlJrE3IlXXVFnN9vxKfB0Ucb3r5x+r1Zk1X69vokxMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9700
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10165

From: Niko Mauno <niko.mauno@vaisala.com>

A small collection of documentation fixes. Several correct example
snippets that misbehave when copied verbatim; the last two remove
non-ASCII "confusable" characters and add a check to keep them out.

  * ref-manual: add the trailing space missing from :prepend examples,
    so readers don't risk inadvertent string concatenation.
  * ref-manual: drop superfluous spaces from :append examples.
  * dev-manual: add the whitespace around '=3D' that the Whinlatter
    (5.3) recipe parser now warns about.
  * documentation: replace non-ASCII confusables (curly quotes, en/em
    dashes, zero-width spaces, and no-break spaces outside tree output)
    with ASCII; e.g. a curly quote copied into a recipe causes a
    bitbake ParseError. Legitimate non-ASCII (box-drawing in directory
    trees, the no-break spaces the tree command emits there, accented
    contributor names, CJK) is left untouched.
  * tools: add the check-confusables script and wire it up as a
    pre-commit hook and in the Makefile "checks" target, in the same
    fashion as check-glossaries, to guard against regressions.

Changes since v2:
  * Keep the no-break spaces that the tree command emits in directory
    listings, and make the check tolerate them on lines containing
    box-drawing characters (per review feedback). No-break spaces in
    prose and command examples are still converted.
  * Make the pre-commit hook pass filenames and check only the changed
    files (per review feedback); the Makefile "checks" target still
    scans the whole tree.
  * Stop treating the horizontal ellipsis as a confusable; the
    truncated git hashes in the release notes are left as-is, as it is
    a cosmetic character rather than a tooling hazard.
  * Add Quentin's Reviewed-by to the three whitespace/operator fixes
    that are unchanged since v1.

Changes since v1:
  * Squashed the two confusable cleanups (recipe-style-guide and
    identify-component) into a single documentation-wide patch and
    extended it to all remaining occurrences.
  * Added the check-confusables tool, pre-commit hook and Makefile
    integration.
  * The three whitespace/operator fixes are unchanged.

Niko Mauno (5):
  ref-manual: Fix occurrences of omitted space with :prepend
  ref-manual: Prune superfluous space with :append
  dev-manual: Fix missing whitespace around '=3D' operator
  documentation: Replace non-ASCII confusable characters with ASCII
  tools: Add check-confusables pre-commit hook

 .pre-commit-config.yaml                       |   5 +
 documentation/Makefile                        |   1 +
 .../contributor-guide/identify-component.rst  |   4 +-
 documentation/contributor-guide/index.rst     |   4 +-
 .../contributor-guide/recipe-style-guide.rst  |   8 +-
 .../contributor-guide/submit-changes.rst      |   4 +-
 documentation/dev-manual/build-quality.rst    |   2 +-
 documentation/dev-manual/debugging.rst        |  14 +--
 documentation/dev-manual/layers.rst           |   2 +-
 documentation/dev-manual/new-recipe.rst       |   4 +-
 documentation/kernel-dev/common.rst           |  10 +-
 .../migration-guides/release-notes-4.1.rst    |   2 +-
 documentation/ref-manual/classes.rst          |   4 +-
 .../ref-manual/devtool-reference.rst          |   4 +-
 documentation/ref-manual/faq.rst              |   6 +-
 documentation/ref-manual/qa-checks.rst        |   2 +-
 documentation/ref-manual/variables.rst        |   5 +-
 .../yocto-project-supported-features.rst      |  10 +-
 .../test-manual/yocto-project-compatible.rst  |   2 +-
 documentation/tools/check-confusables         | 115 ++++++++++++++++++
 .../transitioning-to-a-custom-environment.rst |   2 +-
 documentation/what-i-wish-id-known.rst        |  14 +--
 22 files changed, 174 insertions(+), 50 deletions(-)
 create mode 100755 documentation/tools/check-confusables


base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
--=20
2.47.3


