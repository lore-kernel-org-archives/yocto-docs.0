Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04DEC55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 03:49:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.101])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35978.1785728935688471806
 for <docs@lists.yoctoproject.org>;
 Sun, 02 Aug 2026 20:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=a58fWk7l;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.65.101, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwWQt6qO5f1G1Vd6sMGbwNfW3T7prbElaRohLWqKuHJCDvB6KXHL0/PJklxolPOmU2wd576a4C5+FfxIhorESSQud4+xFHdIY+KzRrF1dWfQ4XHgojrQG2jq9zJAAGZu3uM2IRiNoHMgfOgVdnErp1NyMBkdYfOzCp1lSqImp3m+aWsvelooDK99bVQtchJCVX4ulbpZ5Jj7+kMYVrkVch226Wcq76hMmNjzfIUoQNdlWh2yjVRCSo13l4PIk76u1otUhkxsZd19LjSsgse46WITMPUlbJbt1lfvkYC6SNfkgWpY11NlOvMXxwkGG/41o5D7EvAw3xag7rkeD4TFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPo9tc0j1zeXDL3vOUW8L5RRUFmOJXNS9FbnKvy8BeA=;
 b=ZRX60UzHm5kdZwE0+z1JwxEekD/AnmwlCvIiPpK66vbrgPn5qZ1yrjWw6CVsxIzJgsTGH93DEuTKCeE8TwNAAf+th6A3FmAtwbnrEOL8GhErhfNF5OUj0TXPMk5poctAUI8sZmQsKz9OwR1nBwmsCMg0jTpa+M3UrWOO6wa4CboKA11kWdnmxzpV4XbRn3CSVMpSD+c2gOENFfJU3tmqXbLfr6hAdO8V6Jdnz9e40AI9FsBhC5p2lnV1WOn0F3BWW2HF9R3KLxWx8Xzju3GR51YWPu/h87jU85E9rUw+5MDW3Ow6ug6WOD/G7Axye3F2lXqcBXYH3VVwn+DKrmpepA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPo9tc0j1zeXDL3vOUW8L5RRUFmOJXNS9FbnKvy8BeA=;
 b=a58fWk7lw9eZouHcXJA3HAkMCTmxpQ8gkf5FE0hSTudrmhmKsmb5uogPA+U4uEYibKo0+uooskVmtQ/79sdVgIZhvUU/7vvZth8kIKNvriRdsMC84sEG3lXw+eCfIsvl2ECcy6O3YvJCnzWQGMBGQPqPF5XqSHTIC8ATmxELkHqtESaY6WQxoDPaAOG7iJ3W7MaEytY1IfscdxC7BWbl3U6CoKTcFBlTOdXGkbtFOD8AIpNcP+yaeMB/+b1DYlrg2Xm1apACOEDprH1I7ciUrCRe50hQt07OIiwTbr3HXKVk4wTWupQ9Lq7g+wpsC7rjs4jOaJshGIze9eNNihk5mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM9PR06MB8209.eurprd06.prod.outlook.com (2603:10a6:20b:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 03:48:51 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 03:48:51 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v5 2/2] tools: Add check-confusables pre-commit hook
Date: Mon,  3 Aug 2026 06:48:15 +0300
Message-ID: <20260803034827.26904-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803034827.26904-1-niko.mauno@vaisala.com>
References: <20260803034827.26904-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVZP280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::12) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM9PR06MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 680fc837-40a4-4f0a-9ddb-08def112219b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|6133799003|56012099006|5023799004|6123799006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Vyc4Qdg1Llnm3ypj9riRJskS7LhwLYM2TmiBhyAen1cViF5Xef0Tqzg1Ko7T6igP+GKY3aT7vbS2A+fuu6d+P7gfahQ4E6PgviyPxgTvHEF72rv7B++5p+InfD0TvkQDrPsnnWLtTZBV4dNT2jFkzR2fu78e++gQDX5VD31pDiYyJw6rq4fRAAPS/8E2EhW2xXsy1pdZTy3kdycX+lGNZrUb6LmozZepZj1BpVGN6Hu8i/unC/gczUkFVwAP9oMchBFxtpiGPwvvGkkEDOQs+H/zfoaEYiV85/u8dh18i9jqcsFHgSEGNvrXRGTQh1FhVFHIEvzQE7lFqC7CGSQ//+0c9tTVak6Lkbfq7jOItoaN6nguPS07k/93wPE27Vme/CqBC9LzeXxdeoBf4115uwH51gbk5bRoZxjWVX2kcK7GpTIc4oYeJctuyYjajktwhHqVXgUV4GNYqzaNLYMzRpae8dg4JSrPz2Ycj6frEvkOKfngCqdu/CXNn/8dPNTTkAjRxu8tFlp02MVx2r+PiqzXVyvlrqlX+53qaPrPQ/QzgLuqtq/qsDCCdd2e1gObzSA9omYRpF6NYLVUIK3tPWc1/EuX1EqdmunD/Fj5ePckU6Q5Fyo+UDoTLDiQsBTECR9qoDMRRKTjQoDYlF1csDyAYiJ+pClRUq8u4PpKN+yQ7ARyS/vY4vzY1l2RXSLUQtfrM2ukqklV1dwRf4O1LHDItk5HvtBYxawD+wVsIOo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(5023799004)(6123799006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fWj7WTWBVlcr11/HorFOrmv4tUGjRVtoG/PuslgIBPhEWqs67vsXC4DsFuz1?=
 =?us-ascii?Q?+NyFjdrgafBAhwfZGIdxVmrF/JfsLX42g+xwudDror7EAaPepTxFH55dEGFU?=
 =?us-ascii?Q?2/jei3ZYrqRvKTF/49MSG8fDAi8Jd/v6XktWXulETTc+fgfp0O/Trd4QnNtD?=
 =?us-ascii?Q?TuOu3IDlheMmysXXVEBLUzg66o1CzD3Z1MDSyPI3L2tDdsJGdCXdt9htBJA0?=
 =?us-ascii?Q?TgQN8pj7tY4XyJUnuCYb+ZUqY6viaJuHRn7ANQUHjpSOSw3vJcEAxx9eyzQI?=
 =?us-ascii?Q?ugmmIxZ8EEAn8fIJ6YV5tVleT4vhcyvbxLeHcBCuf0z0m1UvzR2+7JZ6Oicq?=
 =?us-ascii?Q?aWd2iFddhaQG4y/7adWO8ZZjqXqgLOdSsJD4waq/X2nnYLVFxVnI3QZbDC7B?=
 =?us-ascii?Q?4NuJ9Kix3fFZ3n9ZbiTF5BLZR9ws5jT2hTs1wdIRT2ZtIpJvPqy9O55gqtPl?=
 =?us-ascii?Q?cT2UKjYXmnhCPKJ7Vo4hbjk4TO2FEbFXFyXGQIg42Z1BCVOtkHdzZn95jp88?=
 =?us-ascii?Q?Wo2RFBSBuf/7u3nrpd3QPju3foZJI4PK7tP1yvkM2OgEX1FYAQSOVF9K5Ctm?=
 =?us-ascii?Q?3tzjz8zV7i+yiAM3VwWruaNqCbuGO58qmRJgsidH5MWNgGjBm3QAZP0cM/zh?=
 =?us-ascii?Q?sh4xPOp+lwRsBNSmwGqy0d1/5bpGHsMaex8uhCDTAD+ywjn+L8oHlrFbh5AS?=
 =?us-ascii?Q?pHisA6RYGwWF49Atvhr8MOEK2MOxuLplbOT0h++vU1rRIosDWcvCUdKsm/kb?=
 =?us-ascii?Q?hyrUD2WgwQPxjgFo5MPVk5wIsP06hZtdSeoTrkTtr1g9cWIjZPeowyTxatkw?=
 =?us-ascii?Q?We25srNKwdhk0/XUCt9llbyHoeHBVce7hX5gjbDZc0AytoQxAu5v8jcORGqB?=
 =?us-ascii?Q?P1jbVTZA1U6Hi9eqmCv8EfDiE8OK6VRtRbgCKJdJIGFX6D7L6329hLjAE6DX?=
 =?us-ascii?Q?EgtpbOttt4rgLJUeXTcl/5aMZEir+dcrFshrXFnARx+MbQY8rJ/a9cVuON+I?=
 =?us-ascii?Q?DE22tNY9DJg1O6e9m3MwcSKxgqumGoMybv3ntW5A5nFn/p/oc5ZOCxRaH9BO?=
 =?us-ascii?Q?mh7EgS5wCeIeTPRUB7rq1Kui+hsSi1dxzYm/IKVUScl2VdYg2iR4045P0TQE?=
 =?us-ascii?Q?q+axQEl71qfYmY0GeuWYlQeslw1JKcf5BDkoKJGl/lcl5ZtRbg1VF43WJduW?=
 =?us-ascii?Q?7hd0exHjgtMQ/V4kWwT/jSCga5ywOOVSfOMvaqxQyPRPn0uBoNrntvevzSSf?=
 =?us-ascii?Q?cpqu4i1xFsxzGkbcF9rYUBI19pdGhEObDvRAlBfYjPOY7KYQ4pSh0wEjMsDj?=
 =?us-ascii?Q?PcYTi57MdoHOdCxmRhSYN1T34VlhU50Qf8c/vBi8FQ4naBSZzdEblRNV+7tF?=
 =?us-ascii?Q?bF4wVA05HcHnwTlVSdtUjqdq5bXfp/2dU4Hf7G0ls9NIglYwm/j7raIykbZa?=
 =?us-ascii?Q?4PAx/U29FtQu4HEn/b9+YquBkKTsFKcO5BJYBXNuNXJ8vIb1M8HTwyMo1szB?=
 =?us-ascii?Q?zvI1++B47liavoZSAOsG1AzTBo3xWGKpe9FXO1FJ8keg/pzDdeubNBLgZ0B7?=
 =?us-ascii?Q?AaeiHUGgY4cpmNr3wI6lXa0vvKUj7LN8AmXJMSGkequQabjp6IIq7n2CEKHq?=
 =?us-ascii?Q?P28QMyKHYTyQpQKvUm/kVLud/4mz/+BWblv5BE/CEMW7SDXH7E2P1a17PN54?=
 =?us-ascii?Q?2dLvt89i5Bb1hV9QExw4XO5DCRuyBEFICLHgl2DeAnLaRYcYRBDjLaolR1Wt?=
 =?us-ascii?Q?eBQwCneS7A=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 680fc837-40a4-4f0a-9ddb-08def112219b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 03:48:50.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+PJ18e2P/0hn/gB1Ax00YOU14ynCPScWDHRuiJCuLXcnNlbk4Z+fGwdykNl5aFeZr+e6JO0k2oSybW+ER62Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8209
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Aug 2026 03:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10225

From: Niko Mauno <niko.mauno@vaisala.com>

Add a check-confusables script, in the same fashion as
check-glossaries, that scans the documentation .rst sources for
non-ASCII "confusable" characters (curly quotes, en/em dashes,
non-breaking and zero-width spaces, etc.) and reports each occurrence
with its location and suggested ASCII replacement, exiting non-zero if
any are found. This guards against the class of breakage fixed in the
preceding commit, e.g. curly quotes causing recipe ParseErrors.

Legitimate non-ASCII such as box-drawing characters used in directory
trees, accented letters in contributor names and CJK characters are
intentionally left untouched. No-break spaces are likewise tolerated
on lines containing box-drawing characters, since the tree command
emits them as indentation in directory listings.

The set of flagged characters is intentionally small and curated
rather than exhaustive. A general-purpose dependency such as the
confusables PyPI package targets Unicode homoglyph detection against
the full confusables table; it would also flag the accented names, CJK
and box-drawing characters we deliberately keep, so we would still need
our own allow-list and replacement policy on top of it. A short,
dependency-free table kept in-tree matches check-glossaries and is
trivial to extend if a new problematic character shows up.

Wire it up both as a local pre-commit hook, which checks the changed
files, and in the Makefile "checks" target, which scans the whole
tree, alongside check-glossaries.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .pre-commit-config.yaml               |   5 ++
 documentation/Makefile                |   1 +
 documentation/tools/check-confusables | 123 ++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100755 documentation/tools/check-confusables

diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
index f2b73a481..876546f9a 100644
--- a/.pre-commit-config.yaml
+++ b/.pre-commit-config.yaml
@@ -6,3 +6,8 @@ repos:
         entry: ./documentation/tools/check-glossaries
         language: python
         pass_filenames: false
+      - id: check-confusables
+        name: Check for non-ASCII confusable characters
+        entry: ./documentation/tools/check-confusables
+        language: python
+        files: \.rst$
diff --git a/documentation/Makefile b/documentation/Makefile
index fe0574537..87a6f8a8b 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -37,6 +37,7 @@ clean:
=20
 checks:
 	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
+	$(SOURCEDIR)/tools/check-confusables --docs-dir $(SOURCEDIR)
=20
 stylecheck:
 	vale sync
diff --git a/documentation/tools/check-confusables b/documentation/tools/ch=
eck-confusables
new file mode 100755
index 000000000..359386e7c
--- /dev/null
+++ b/documentation/tools/check-confusables
@@ -0,0 +1,123 @@
+#!/usr/bin/env python3
+#
+# Check documentation sources for non-ASCII typographic characters that
+# should be plain ASCII.
+#
+# Copyright (c) Vaisala Oyj. All rights reserved.
+#
+# SPDX-License-Identifier: MIT
+#
+
+import argparse
+import sys
+
+from pathlib import Path
+
+
+def parse_arguments() -> argparse.Namespace:
+    parser =3D argparse.ArgumentParser(
+        description=3D"Check documentation sources for non-ASCII typograph=
ic "
+                    "characters that should be plain ASCII")
+
+    parser.add_argument("files",
+                        nargs=3D"*",
+                        type=3DPath,
+                        help=3D"Specific files to check; if none are given=
, "
+                             "all *.rst files under --docs-dir are scanned=
")
+
+    parser.add_argument("-d", "--docs-dir",
+                        type=3DPath,
+                        default=3DPath(__file__).resolve().parent.parent,
+                        help=3D"Path to documentation/ directory in yocto-=
docs")
+
+    return parser.parse_args()
+
+
+# Map of "confusable" characters that are frequently introduced by editors=
,
+# word processors or copy-pasting, to their plain ASCII replacement. These
+# look almost identical to regular ASCII but break tooling, e.g. a curly
+# quote in a recipe example causes:
+#
+#   ERROR: ParseError ...: unparsed line: 'RDEPENDS:${PN} =3D =E2=80=9Cfoo=
=E2=80=9D'
+#
+# Only these characters are flagged; legitimate non-ASCII such as box-draw=
ing
+# characters used in directory trees, accented letters in contributor name=
s
+# and CJK characters are intentionally left alone.
+confusables =3D {
+    "\u2018": "'",      # LEFT SINGLE QUOTATION MARK
+    "\u2019": "'",      # RIGHT SINGLE QUOTATION MARK
+    "\u201c": '"',      # LEFT DOUBLE QUOTATION MARK
+    "\u201d": '"',      # RIGHT DOUBLE QUOTATION MARK
+    "\u2032": "'",      # PRIME
+    "\u2033": '"',      # DOUBLE PRIME
+    "\u2013": "-",      # EN DASH
+    "\u2014": "--",     # EM DASH
+    "\u2010": "-",      # HYPHEN
+    "\u2011": "-",      # NON-BREAKING HYPHEN
+    "\u2212": "-",      # MINUS SIGN
+    "\u00a0": " ",      # NO-BREAK SPACE
+    "\u202f": " ",      # NARROW NO-BREAK SPACE
+    "\u200b": "",       # ZERO WIDTH SPACE
+    "\ufeff": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
+    "\u00ad": "",       # SOFT HYPHEN
+}
+
+NO_BREAK_SPACE =3D "\u00a0"
+
+
+def is_box_drawing(char: str) -> bool:
+    # Box Drawing Unicode block (U+2500..U+257F), used for the directory
+    # trees rendered in the manuals.
+    return "\u2500" <=3D char <=3D "\u257f"
+
+
+def check_file(path: Path, display: str) -> bool:
+    found =3D False
+
+    with open(path, "r", encoding=3D"utf-8") as f:
+        for lineno, line in enumerate(f, start=3D1):
+            # The tree(1) command indents its directory listings with
+            # no-break spaces; such listings are embedded verbatim in the
+            # manuals. A no-break space is therefore tolerated on any line
+            # that also contains box-drawing characters (i.e. inside a
+            # rendered directory tree), but still flagged elsewhere.
+            in_tree =3D any(is_box_drawing(c) for c in line)
+            for col, char in enumerate(line, start=3D1):
+                if char not in confusables:
+                    continue
+                if char =3D=3D NO_BREAK_SPACE and in_tree:
+                    continue
+                replacement =3D confusables[char]
+                hint =3D f"'{replacement}'" if replacement else "(remove)"
+                print(f"WARNING: {display}:{lineno}:{col}: non-ASCII "
+                      f"character U+{ord(char):04X} should be "
+                      f"replaced with {hint}")
+                found =3D True
+
+    return found
+
+
+def main():
+
+    args =3D parse_arguments()
+
+    # When invoked with explicit files (e.g. by pre-commit, which passes t=
he
+    # staged filenames) only those are checked; otherwise the whole tree o=
f
+    # *.rst files under --docs-dir is scanned (e.g. by "make checks").
+    if args.files:
+        targets =3D [(path, str(path)) for path in args.files]
+    else:
+        docs_dir =3D Path(args.docs_dir)
+        targets =3D [(path, str(path.relative_to(docs_dir)))
+                   for path in sorted(docs_dir.rglob("*.rst"))]
+
+    exit_code =3D 0
+    for path, display in targets:
+        if check_file(path, display):
+            exit_code =3D 1
+
+    sys.exit(exit_code)
+
+
+if __name__ =3D=3D "__main__":
+    main()
--=20
2.47.3


