Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D678C5516F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 03:49:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.101])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35978.1785728935688471806
 for <docs@lists.yoctoproject.org>;
 Sun, 02 Aug 2026 20:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AcgmITRK;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.65.101, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sMoasma6gMX3XKtuVlXLW7XlXDjr3CBSwqCiwxJmOnAXrMNTzEpj5l4hNB+1hxOv+/HUZ58LadChyoj2JxVe+Bn7HQei6ueh/T72o9QJ+QXEmzm2GQGFdfx9mg3rjIik6XCJE6hTGjzlV4Fl4fi+Ze0u5l859hPoRZsMM8W9a6wn7sh6/LCWUIt+zOoQsk+m6iMjdJd/MMlXsxJUZHYR8OM0nNYKMZpwgpQQ7l3R/sSWcYLL7cXA7QcsfAoT0rW4WigqUTDakzf8Q0yIlrO6pZanWNM6cFPtcR1qjmy/Gu8ByHHrWIYbb7PnkCcUL8L0PVunVoPbJRXXyvsrri9r1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NQWyjgZvHNcrROuxPPYOHv/48EefDy7Escoq4rHGmI=;
 b=zIVWITcwN2yxCgPZ1AjAxix6VdiI/HyrHmUIcHw/p2jPPa7m25f5oyHsdrhoGq4JQyCW1nQw761nPk+QDUL/AIJgDFmKTDNaES+nwNdQJQSgS1Ctu5mDsdx6i8TelOZQiN150pGqS5MgmEg0olxzEeCwKNywFg+7SF87GI41ed75EyzmxwBBxr6GUNyDzMOgg9eUvBolrc5i27CuAhOjzUUrMCucaFzaaTnR7hNjSnqIYzfJRNle5vukPQruXi2xYqh7Q7b3IQOUZvK06WaClEq8iMwgxlLOtpBPDMact8L/DdpLz/UuxNmpa6c2hewKZvrmssQkMxl00VKXZagKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NQWyjgZvHNcrROuxPPYOHv/48EefDy7Escoq4rHGmI=;
 b=AcgmITRKMLbkWJ+XDup8H77T6VsAjicNrsD70csFDlol90oUBPUaQEx7f8JLfhFJ2BCexVEwwfBuF+VAxCIBu30HN7kMYxa2YEDOgvBDX76vMjhxmV2cWbJDDgeWMMhgPvNcshr6J0zj8ybeRt1TvWfRVRo4Xiw0Q92KyqTBT2awbr6B16oW4oW7ccf6VVIgQwr+/Uz8bRllMp8ef0ej/9FXcqp854ua2qfhJvlm39oF1QAKWg0jTJkbti3YZyPn3RXSL8laiT3Qc3csrdjaHgvxDNRIVzBb082nW3niGJrlW1v3+T3I4QJgmQEU1bVVWzzAkYcJzFoRsXxRvh8eFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM9PR06MB8209.eurprd06.prod.outlook.com (2603:10a6:20b:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 03:48:49 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 03:48:49 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v5 0/2] documentation: remove non-ASCII confusables, add a check
Date: Mon,  3 Aug 2026 06:48:13 +0300
Message-ID: <20260803034827.26904-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::12) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM9PR06MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d75d5d-bc17-4b4e-d74f-08def11220cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Iv/PWOsMzSg11jMpA1esnlQQ/5RGs2dszL0bZE9+ZJz9xXbFB1sZ9wfWcgKbRRYXcuSE7AM0vdcWSh/CmytjrUOPSBQVBKoCKcr57vrNSO1LBUuIKkHbJB3hFEICxi0n7i+FXAbl+CMy2FEuqF08l/sDGRcuUX4xG4Ea0GfswWwoMIHUPS4rLmQgck1J8F+VfE4ckrE9y+MLdpKOS82Fdnu/BykadKK0IQ8QtIIMu2PavioqRmQJhlVaZrm5xWtvR8VEXNRFJffqlEAtVEfvGCOTo9F+iBfjq3ZTeHbzt+RaDKXPAIDi0FFbt3WAg3+gqt8vXW1+ttd9gP0KR/dXwrNXQu5H0DlRzTWHPOTCD9hzEqUCfkVDAYn+bjPM7zM87BvMFsXRptcu6aUo57+JW06WVUY5BW4SB6hhtSaimq30mqD95Mpj8tjp1wWe6qfj3hASTTLMlWu/ENMJXhmFS1jGkxwwSDLI3SqUFas8bbXAl7aQqUCLrmW+3pJFuuO0CFzEVNWMslofvH7Q49hN2sD7EpkXSrNEYCuTQ9mIqcIRIuoYuHNRTJdKF4hwmq3ad61AIdUNC7UHdEZkzGtUZZjeolAsKUgNmNL75ek7H9r5sq1lKnUenKGx0dIficeU9xdQ+kqGbfSaLFIFA3h0km45op4y2KYKrfqBh4dmRLgJeVN/EYUwd0sfcdYzXOvo8gjt4askAeE6k+spVPrAFxNhSPTrDUK80/V1TbZmE4w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/KD7bN7+1Rg/mdDWU1DZ3Kw9jRVzS96+eQpu5soWZ8s9GgprFuEDRcVJS1PX?=
 =?us-ascii?Q?TiAB27kgqu4RuhlzAC2i9WIR7nRxw4ME/nBkQ+KfhgXwv/NdB43ScxYTZz1u?=
 =?us-ascii?Q?Cikn3mgB4FZ41D2peHEQo1BjKKJ/WJzLmB3TVWoG4oGkSVGJDdQZU7QD5pNz?=
 =?us-ascii?Q?DyyZTL0dmlhVMYD2PdKLvjo83t+MhMnSijygw5uf9paLyXI3rCwam3P+iATD?=
 =?us-ascii?Q?XmZYItT+BX90xq3gEZfykt1/j6tbe28K8DTErgLWFPsMyCMhw0gFwcA0BaFn?=
 =?us-ascii?Q?NmqHqX8ldx6H9YHktBZCXpSiWLsSaFcYIvMKstBze08AxeubDvbV4EjA6mzM?=
 =?us-ascii?Q?9y62xziZ5otp6nfbA2CKHFhUc11P/Vj21H5QsrH8LA0YyAp4ZjFQaKODoh3S?=
 =?us-ascii?Q?kynOlxrXqtGMJm0glFElzw1rncC1kZOlzL+KevzaHaJ2IjF+r+i7JQ8tK/p5?=
 =?us-ascii?Q?WksMDokgF5qdAQf0bUPfBb08hPNxegyg7HkX84XTYQ4Tj01R49WHV4kJxWIH?=
 =?us-ascii?Q?lHpHfUeEvyfIEDvfQ2tiG1W/pkTBeKt1WEhd50jelqAlwRciEp+HoOhgvK0u?=
 =?us-ascii?Q?QYSSZRR4IQLcMISqKKhZNxaXCyh3WCXdmWuFVlqX78UlMSMLvUV9u3fnxaGd?=
 =?us-ascii?Q?JAcV4HWp2r6pRDSv968VgrAbgEfLapanZyXpOJQ+Ok6bHOPFJnbQuBrFZFha?=
 =?us-ascii?Q?u5v1IbNRYC8fMRkLaLwOX5ztHB2WklfObjbIRXrex9ipLKAA0MIzU74jlKjr?=
 =?us-ascii?Q?rfhidhQCf4IULB9LklCt6WBXVYge2wg5/UzJDpNIq5XuxsIwOyNzKe9Q0DCT?=
 =?us-ascii?Q?e0zTwN4xCLKLzx95MVHXWsyfGPSR0WP0v1PH7vx5abi0YAds4iad047Ybp/r?=
 =?us-ascii?Q?+qQ3000RbQc/Qv+ul4tvvXzwpuFOp8FlO4OAcJeCmEdWHit/833Tiz48iBco?=
 =?us-ascii?Q?q6rCDyNajMZaS8kPO8UOgtEFbuAcWhZmnMhBz9Jj8dpGKBomuFgPXdCiduiP?=
 =?us-ascii?Q?x1TmfRQ2EJzKC+s4IQdDwg1ARbgNoomCQL9A4IENvDIdr6bEwbM3yE8EVGgE?=
 =?us-ascii?Q?aItSpAPGf49dAAYVLCXqijNele2vFZxbZU8EJaY5yvlflzNmVoRvB0EcyTWM?=
 =?us-ascii?Q?9QpGxoIWgcN4Dnr+35wiqU28MxYa0M6FRnlQED+tbcwX5tLbrxYGzQq4cqpp?=
 =?us-ascii?Q?TqV1EyqHMRdo1fc/nFQUapAR0rvICGxvMNIX5AkJPoSWfaUYVYfB+XhXmV7b?=
 =?us-ascii?Q?HcAYSSl3uZk8X4287erfLzlRu3QCSGY6kDpDiRzABClgXBFCm8J96gjOfVzz?=
 =?us-ascii?Q?j8JV+ZWJ9YeT7GeP7lpXlfKPXQY6nMvcByFtSPuuQQHhy/ty7fPo0+RDEb53?=
 =?us-ascii?Q?AE/1b5KlI4OUk6cOZ/ASpgnvmm4chfHOEua3k1khcgC8GV1yGw94deXD6NWs?=
 =?us-ascii?Q?T+uzFQNh3Iw5FLEeWCJtbK+VWR0lsWzvN5s3ugbRXjUwSfGfQWC6zXLf3vnH?=
 =?us-ascii?Q?1GU30joiSboShSz6j30Cfn7nBS0xcawbns/bSHhW+8rOuW2KpXeFMH5e2gj7?=
 =?us-ascii?Q?bNResy0SmmLDbaHi3KPdCGInqXhYmZsD30Ai8IZ44XWAJfysf7YY2QvF6y8o?=
 =?us-ascii?Q?lLhS4NrZvt40RIFLkVPMlQt5msMbOUhq/jOunUDN2mOrO+ZCQk9zIPsDQNkk?=
 =?us-ascii?Q?TngwpCaj11Cv1TVn5JfnZgtr+kYk2+wXCk3HARujJDqlH45SF/GjbNEaSXuo?=
 =?us-ascii?Q?rvSuEm4kAw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d75d5d-bc17-4b4e-d74f-08def11220cf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 03:48:49.6467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00LVBrsyzGl0YpYA727ZzBobFHWZbRTmXNsLyWzAbX3tfG4HWtjWK4yQ+Cii87CgOltC9OG9tuWsjOGFNRcdFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8209
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 03:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10227

From: Niko Mauno <niko.mauno@vaisala.com>

The three whitespace/operator fixes from the earlier revisions of this
series have been merged. The two remaining patches are rebased
on the current master tip: they remove the non-ASCII "confusable"
characters from the documentation sources and add a check to keep them
out.

  * documentation: replace non-ASCII confusables (curly quotes, en/em
    dashes, zero-width spaces, and no-break spaces outside tree output)
    with ASCII; e.g. a curly quote copied into a recipe causes a
    bitbake ParseError. Legitimate non-ASCII (box-drawing in directory
    trees, the no-break spaces the tree command emits there, accented
    contributor names, CJK) is left untouched.
  * tools: add the check-confusables script and wire it up as a
    pre-commit hook and in the Makefile "checks" target, in the same
    fashion as check-glossaries, to guard against regressions.

Changes since v4:
  * Rebased on current master; the three whitespace/operator fixes are
    dropped from the series, as they have been merged.
  * Five files that the confusables patch used to touch are no longer
    part of it, as master has since gained equivalent fixes for them
    (contributor-guide/identify-component.rst, dev-manual/layers.rst,
    ref-manual/faq.rst, ref-manual/qa-checks.rst and
    ref-manual/variables.rst).
  * Re-ran the check across the whole tree on the new base; the
    documentation added to master in the meantime is clean.
  * Rewrapped a ragged paragraph in the first commit message; no
    content changes to either patch otherwise.

Changes since v3:
  * Add a copyright and license (MIT) header to the check-confusables
    script (per review feedback).
  * Spell the confusable characters in the map, and the related
    constants, as \u escape sequences rather than literal glyphs, so
    the source itself is unambiguous ASCII (per review feedback).
  * Explain in the commit message why the script carries a short
    curated table of its own instead of depending on a general-purpose
    confusables package: such a package targets the full Unicode
    homoglyph table and would flag the accented names, CJK and
    box-drawing characters we deliberately keep, so an allow-list and
    replacement policy of our own would be needed regardless.

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

Changes since v1:
  * Squashed the two confusable cleanups (recipe-style-guide and
    identify-component) into a single documentation-wide patch and
    extended it to all remaining occurrences.
  * Added the check-confusables tool, pre-commit hook and Makefile
    integration.

Niko Mauno (2):
  documentation: Replace non-ASCII confusable characters with ASCII
  tools: Add check-confusables pre-commit hook

 .pre-commit-config.yaml                       |   5 +
 documentation/Makefile                        |   1 +
 documentation/contributor-guide/index.rst     |   4 +-
 .../contributor-guide/recipe-style-guide.rst  |   8 +-
 .../contributor-guide/submit-changes.rst      |   4 +-
 documentation/dev-manual/build-quality.rst    |   2 +-
 documentation/dev-manual/debugging.rst        |  14 +-
 documentation/dev-manual/new-recipe.rst       |   4 +-
 documentation/kernel-dev/common.rst           |  10 +-
 .../migration-guides/release-notes-4.1.rst    |   2 +-
 documentation/ref-manual/classes.rst          |   4 +-
 .../ref-manual/devtool-reference.rst          |   4 +-
 .../yocto-project-supported-features.rst      |  10 +-
 .../test-manual/yocto-project-compatible.rst  |   2 +-
 documentation/tools/check-confusables         | 123 ++++++++++++++++++
 .../transitioning-to-a-custom-environment.rst |   2 +-
 documentation/what-i-wish-id-known.rst        |  14 +-
 17 files changed, 171 insertions(+), 42 deletions(-)
 create mode 100755 documentation/tools/check-confusables


base-commit: 41dae3c3da3ada1745fc60228ff6269c64ee2361
--=20
2.47.3


