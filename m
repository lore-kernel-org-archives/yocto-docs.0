Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B92CC53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.121])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6565.1785223453529974003
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=1IDfHyEH;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqQ8CBQ9JuZbedspss3mmroUKxcOBivw7XswpgWsUC1R98k5M2+aOnjz5ttfQWLlA/431kvGG8iwLzqPDSzFraBEFd0GUVzPwOvXK4tU5O8MSbICL47kQCK/WTMWHAn2eEeA3TOaosTHzq2n1UJ/LF6eiVAjiV+BuXWEJDlwoIgxuslwH+T+muAQHC4Z2WIrKIaZGmYI8y0759OrNZh1OpoOgLByCmJn0XrgQUcfYTbyOIGUyDhIB6vYvoDiUnxPUBtBUuvTdjnu6EMTO4/0oguuHCUllyLv5lEMiZXscsW2dEUxqpExCGh5V+IoSMGdAwCGVrNV+m9HsvI/GVS1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfOeU5F+kyGDSw78OpT/BCOj2he/mW0wfjia6abuWhE=;
 b=GPqID2Mln60oyUOlqX5shDrqZYvzF4vsq1W46/KSAaW7Pp8mSz3QYvkI+RMLGZx+VOzo9WsszKYJS/bdm3AlKjAoywPmLfrfsUS0yAfSQlUPMFl1XydvhgANubCeCWz377Z2SCVlwrt5w7WmCRf3Jkrir+H/5kWWn/HDDYummzlvZCjMhm3wFsCW+FgC0g+y/TDjzRH17X9WMfCmKlCLat5VGBvGoyZ9eSl11TEM6iF9MSAssmcg67Eev48/yDzWcCYveG5MPhjOHyzopYjsvwx8tcC79h3hBXfEEBpC8Rro78/4tBOqK7qLJZSJvmI1PyjbN9m4fLDy+Z2jAJTbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfOeU5F+kyGDSw78OpT/BCOj2he/mW0wfjia6abuWhE=;
 b=1IDfHyEHmPv+bgmijT6jgulUkC558Yu6TDnGM/9IhO/3g2lnOYMK5QSsWVTE7+Fe4td+glSc0tUDEci/65EeqkZGL/uXNO1re2e4daJqswRUYl1iigixmVxcd4wJn4dxxE3tuO3wSQUpqv/yrDp/DRnLv/le2pUzHwN08B2oZhnGGamdhS1bqT/h4Zm6lskYK5h9+6toIdV6GpsldUivJeweKNroV/8MAwWHTPxm6S8A9tkNbvv/NkmVT6Xo8pPL+/imUB6MKmJH/2mlWxM9qFLMQcGnpQDveIUaTQyM3SKZQiaIqJgCcSb1V2FwM1/5doSXMsNK8XQcUxpGrEJkJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AS8PR06MB7559.eurprd06.prod.outlook.com (2603:10a6:20b:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:24:08 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:24:08 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 0/5] documentation: minor fixes, plus a confusables check
Date: Tue, 28 Jul 2026 10:23:14 +0300
Message-ID: <20260728072328.11926-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000239FF.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2b7) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AS8PR06MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f03d2b-9ee9-4441-b0ab-08deec7935b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3V9Ccw8vcCW478AkAB342WpZpdkB/fFqFUWwB1epUuE77NyBtGQvMn5zJA4a1XtwtS+ZCz0/+YA3rf/hBQSFGHXmGJFJ2w8d6/vtILu6n7CJTiBdGdN0meckcpXWoj3OxeX7KYFDE0TSR9dv5E8/9cg/sBlvhq5BLcCuo/nKZfMP8jP8jId/tEYrbvVzgeqXNuR0DpMaXi90Cc2gze8x47MvtJ7cuHg7pDB2hZPBPxUN6OCosjpoyRHTEj75bSt+AGR+EPx2Hggrgf0354VhJn0eh+Cao1Z23CwoEfhS7WmotMO8oDgeD7c51PjPgfSuH/Uah/SfjEMvivxj7YeacxHE36Sw0FOIM567LnkWFMW/H1bYme9GR6HMQzT+R4Z7JzMJE9aFstDqQJ1CO0PPGupoSXZubca2/G0XnQEloQCfSYg1p63NrersMYd5UTUPr39NcuCcJJMNpjG0KNs0Wd6PqD2u0EyfU9FHem0zWhjjAhpZz0FvCjhcQxfALitENgeFFQCc/+1plx4jYPLJi3HFdd0YA6sK9RQnylKi4zLePveZUXvx4aBlSDN3JynwVFzlZOLA7GOk9qCyDMbF15GQbYE6t+ouKeRkE15LBzF/ilGTs5YlQFUB3HRyz6ZJOcCx1qR32rmH17ItdhFWxuYCtjVyMH2zU9aH34QnzRZhOUPf1gG8vLKe0a9VsqnF4+D8TlcFIv5Jar6wYY/NL+wlNdKqdQnwjRQGqibdU98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6iWqoJDEvEKF9dYDfMcXeDdvRBsy5tQDSB/43AL6QKUl3CucpQLRdnMLmz0q?=
 =?us-ascii?Q?fnt7WEph9Syep5pSa9Ya4N2jgjtDvQjVpJX+FTisbcKnY/mR5yCO29YoOGLl?=
 =?us-ascii?Q?R2jH7wEme3HV8XE/qA7fSPhAEptB54HEEwtI67e1Br1T6hluIwcpEsbwnNsw?=
 =?us-ascii?Q?pcbwpRN1fmFo11oPPRjvaPe3g2+csmawv/mlLjPIFJjJjqPFYjYpo+aiStfY?=
 =?us-ascii?Q?HZt6t8W7xdjCA28XZWrgM+vlMgmXXNEGW/sLg7RDPlFutu4K6n0FYFHa7FFm?=
 =?us-ascii?Q?XtWbsJBPXUKfWyYn8N0W+qAhkfKqG7gY+DfrZZHIkG/f/u4quUOiGrmBdTxl?=
 =?us-ascii?Q?sR9h6QDeT4lQvwfiHwD2xTRcY5f5RskBtMZg1+p7hDj8v+3aRo+lJUM35/g5?=
 =?us-ascii?Q?6DCLdimoOiO8qGaaDhlMjLI2ctOomWKgw5emEM++ybm6HEAhc+qi0q+HWmUg?=
 =?us-ascii?Q?45vIhFkyoSBItrN9fY0bUDlV23bKesAxaShGs4mezD+qWdOsRpRWHOpN+JLh?=
 =?us-ascii?Q?NYgJMuivHPamcO2ky2ropDL8dh5vQkulJPydHYny5C0UMPuumFgYXpT06R34?=
 =?us-ascii?Q?jmfCdcIxJxLPYVlLDQQoL4dF06GhJgmnP3I9lLvzqvcwL99sn9/KvFEAxozj?=
 =?us-ascii?Q?uH8Z8r/lu7XfqcmQw4GK+qHET3JRbcdhGf+wvtuTPQi5wATKhEFGkUDO55up?=
 =?us-ascii?Q?mzeIi36Q/eD3fBTOmCGFcyLTDCyvqnaEYrC6AGLGdkovHxmb8+PtATBw9Ktv?=
 =?us-ascii?Q?wxFNB5VGpsfEoXAZA0jSNS4nllafXAYoAB+c3eGq73CU1KcqfkfRE+ZL2Asb?=
 =?us-ascii?Q?xpN/Jdy933tFS9Pl9dOCddb14DDKbLq0VCPtoJMi6me+ydMhBXEXBnUHg31n?=
 =?us-ascii?Q?SV1WAyqpthhrLDQIF7lXz+AQKvRSZnipyN3EZza36udMCtikOQFAt0a0EzmH?=
 =?us-ascii?Q?sCfBJAQHOOAgXShXSOHuBF1PpR4V0XrkDt7Kfvo5YuICEPTN3oC+11YopeKe?=
 =?us-ascii?Q?lzq6eZPx+06nVop5oiGAGXubu0uHjZnZt1RdekIU5F0QWJiwaVyz9RpJQ081?=
 =?us-ascii?Q?TMpokVpKttGBw5Uczu7jLARWI4fn1nVI6ZoG+dIs5FyHSrBl/ZEimdNuegSG?=
 =?us-ascii?Q?r1/Z/XeuCQTvIzNDr1Jb32eaJIXRS11xkzaox9kbYi90EVRTWib/pqczPUWO?=
 =?us-ascii?Q?uO+XET+D/ct+zONzex+ee5lCG3TSyaVYB+dAnssdStZaPlNXIccEzqUyLVao?=
 =?us-ascii?Q?2GJagxS0oirij/5+I8pDAX3sOAMLvnb1TQTT2NQwpmij2uc7MhZpjUE0Rnam?=
 =?us-ascii?Q?ESPFXsVxnLdMnmSx6Whzj+/FkdwFQWRUqzkqAhd9jglMcTWd2vPVHYWio/Ko?=
 =?us-ascii?Q?qVXunDNs+trdDCYFFfSpMLIHGRWSylVKHEEYg6w+e847vgcIvr3/m/EW1l5b?=
 =?us-ascii?Q?8ymnRSFzWYpP3UZxxAyvgzJnRi+S8LIRHVD3Lbh9R7wq9aY6AcQuhPsecUYd?=
 =?us-ascii?Q?7pkU3ZLS9gEPelWgr8C+wYk1ZRAsVvHXuhIAzfnWVsVGp19ytX/H1+xAPCCu?=
 =?us-ascii?Q?Dr/JHtdry+8yi1euz+96yKRr+5W4M25Pi5uAMhhe406eQXr+KnLS7HIxV61K?=
 =?us-ascii?Q?OjEvqstapAl1Bwu7ekkPY5Gf97B7DAv8gkYYDekJRaSa4bqDlw9U0Gf9K78R?=
 =?us-ascii?Q?uzUGkrU6n1z0Qx3rkPfn4/bMdNZc5PjNww0MHftaQp7K0H6/DxEeFlIpDAli?=
 =?us-ascii?Q?p1xh1b7paQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f03d2b-9ee9-4441-b0ab-08deec7935b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:24:08.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w05xlooi3xbwA6pVIxT6bxzAITBlw2BJjmZyKCIWiKPGjODdKR3HbMDPfK2xLGgPCJKEZ4KGPneaNeBVKUmlsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7559
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10154

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
    dashes, ellipsis, non-breaking and zero-width spaces) with ASCII;
    e.g. a curly quote copied into a recipe causes a bitbake
    ParseError. Legitimate non-ASCII (box-drawing in directory trees,
    accented contributor names, CJK) is left untouched.
  * tools: add the check-confusables script and wire it up as a
    pre-commit hook and in the Makefile "checks" target, in the same
    fashion as check-glossaries, to guard against regressions.

Changes since v1:
  * Squashed the two confusable cleanups (recipe-style-guide and
    identify-component) into a single documentation-wide patch and
    extended it to all remaining occurrences (24 files, not 2).
  * Added the check-confusables tool, pre-commit hook and Makefile
    integration.
  * The three whitespace/operator fixes are unchanged from v1.

Niko Mauno (5):
  ref-manual: Fix occurrences of omitted space with :prepend
  ref-manual: Prune superfluous space with :append
  dev-manual: Fix missing whitespace around '=3D' operator
  documentation: Replace non-ASCII confusable characters with ASCII
  tools: Add check-confusables pre-commit hook

 .pre-commit-config.yaml                       |  5 ++
 documentation/Makefile                        |  1 +
 .../contributor-guide/identify-component.rst  |  4 +-
 documentation/contributor-guide/index.rst     |  4 +-
 .../contributor-guide/recipe-style-guide.rst  |  8 +-
 .../contributor-guide/submit-changes.rst      |  4 +-
 documentation/dev-manual/build-quality.rst    |  2 +-
 .../dev-manual/creating-fragments.rst         | 18 ++---
 documentation/dev-manual/debugging.rst        | 14 ++--
 documentation/dev-manual/layers.rst           |  2 +-
 documentation/dev-manual/new-recipe.rst       |  4 +-
 .../dev-manual/prebuilt-libraries.rst         | 28 +++----
 documentation/kernel-dev/common.rst           | 10 +--
 .../migration-guides/release-notes-4.1.rst    | 22 +++---
 .../migration-guides/release-notes-5.0.rst    | 12 +--
 .../migration-guides/release-notes-5.1.rst    | 16 ++--
 .../migration-guides/release-notes-5.2.rst    | 40 +++++-----
 .../migration-guides/release-notes-5.3.rst    | 42 +++++-----
 .../migration-guides/release-notes-6.0.rst    | 44 +++++------
 documentation/ref-manual/classes.rst          |  4 +-
 .../ref-manual/devtool-reference.rst          |  4 +-
 documentation/ref-manual/faq.rst              |  6 +-
 documentation/ref-manual/qa-checks.rst        |  2 +-
 documentation/ref-manual/structure.rst        | 14 ++--
 documentation/ref-manual/variables.rst        |  7 +-
 .../yocto-project-supported-features.rst      | 10 +--
 .../test-manual/yocto-project-compatible.rst  |  2 +-
 documentation/tools/check-confusables         | 77 +++++++++++++++++++
 .../transitioning-to-a-custom-environment.rst |  2 +-
 documentation/what-i-wish-id-known.rst        | 14 ++--
 30 files changed, 254 insertions(+), 168 deletions(-)
 create mode 100755 documentation/tools/check-confusables


base-commit: 358519ca6406a89fee42c45dcaf63a37a374f33c
--=20
2.47.3


