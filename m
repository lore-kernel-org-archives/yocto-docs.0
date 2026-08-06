Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42706C55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:27:07 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.135])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13909.1785997619226936060
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 23:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kc8EzshV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct875uTYdgJgpRg6Rf7iSB5RyfbEBxR/uMA7yl1Er+NzZqPxwQedJEKQPNdnZGhWpfEZUi735OTSFGvvO/e6tV1GaHlelPgf4he4456eNzdSjegIFmadXIkdLXT8UjxxJrGnTJCMTiVkqV1SVcDBgKXWb9gAmhiltBR+f/B0nqqFU2n/cL8cpo8DF9LDcF2QoxLJ2zbIBx1tEjibs7ZswrfONAt4oG54fV5cKeS2DUJ1ihyWtNkMGPwa48jt1B6+ASbIaOnoEaKz8YDzjlihKKpE9/dLMEJdHqxip6LQwOZxI/4GaWKLdRAXcZ6QQqHnqc6JyxdiyhnqRHW6D9WXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WksuV6TThw5ex8QeJts81K22ZUUukOlMPxz0IG91itU=;
 b=cs9Q2+79Pu4fAtuJMlXY/zM1sSCP/6kPhKby+O8hckALuzzI4vilRiKgPweDALTfoKLsGs1xE8yOF1N4nuRlW2KgPtBm1BOlSWkQOXc7/f11ODyAGfYy6W/C3b97mprA9vjts9ty8j1iGb+LKWvtrU0cJMIMztBJHg+pLUnk3zXARsFc/832vW49gxHWvLigXnXiKWcWAtBE32qPmmS17QB3cRH/BJ7AV4RymgbDg+eaNK8yjTk0UbYLzJ5p/LpCYp6UPHmoShzTthNd2DeVgw87r4ZiVF/EgkF7vxicn6AdtqfdFZ4MAketvuziCMLybYqX4asGERrVLMeKhwELyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WksuV6TThw5ex8QeJts81K22ZUUukOlMPxz0IG91itU=;
 b=kc8EzshVnMq7OY5l/Y4gBNX9ZEpyWkjSwoVxhxFhuqCWYXVxbHFX7EKsfFkn9vXVUK7/ScfBcVXFox/LlkwVT9vsNlylkL/XRFBjr1sQEDu0dxizWqlKO3hUQEad5Yxbd7nI1xmBmcMEgWrcgkToSAeXxOqBN0qI5slaQ3jBfDEpun8BVjnDbYVPLoTdAmcMI3EuJhA3TUnOn56gky2BMfG1bWhkTU/0va5XUUbIbB/hhjpH9tnsKVZVLy/EBJjn87jyabRRwrYlXvs3bCLc8jxJAqy7giwYQve4mJVxY0XsXPoNL29v3ssbFHZABK7cYIOVWyMrO91/WBLa0lZuSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by VI2PR06MB9402.eurprd06.prod.outlook.com (2603:10a6:800:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 06:26:53 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 06:26:52 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v6] tools: Add check-confusables pre-commit hook
Date: Thu,  6 Aug 2026 09:25:55 +0300
Message-ID: <20260806062556.19569-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DKF62NG8K680.7XCFNJPQIKZJ@bootlin.com>
References: <DKF62NG8K680.7XCFNJPQIKZJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DBFA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::30c) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|VI2PR06MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: eac48491-1215-49fb-bd0d-08def383b3eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|22082099003|18002099003|56012099006|5023799004|11063799006|6123799006|3023799007|6133799003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Vad3A5FkcfAbyajQow6rH7PcjlEr5r4DqbN2KF72rYwXtTfd0/Au8zU5ygxPamjlD1d28tX05ot5/dfvMa3S5ykMX4ybPn2QBp0p7MXuK2fH1oOUV9WwbWhZgWRUM1Kl8Xkoqt2SIDtGyrOD9ySB23nqUjU/NCniE+hdJBZQ1rw45UcDetue2vLTIPtxgiCnZo+tslrmUQLsuRKbKlZttsr/s8n22fYBnGDsKBAkqJT+ttjRzml0+NYXAXcVzz/IDRLkncgttxjxb3nmGLfuGNRD6dyfgfs9fF/Y3oBPHDibRRm4fsQCSlVJc0A1CVYAYqueutGVOjP8mKo8ECApKTzkCYf7H4C3wPBnZGARFsclz0Vvk4oQlQSzChnWWMFeW+N/NhkOX5SGtJYVjPDTxgdkVC6xQgdHS9/VTzR8a6ZmgXZwaLxhUlef55to10tr+kdlxr5IpYFq+7HLrvvv1ZaL6f1abjyB9VCcAOAMKYtnGl2sBQ2q8ybQlvZ03p3VJGhVhv6OCEfyLeNod2aPvk7CINxAKBlgksmoOhdzPoGWiU0GWfrJ/X3REHrLmZZwnq1cz0/B8DIF+B1/JEg2cMnwppe3izmC9wHgSAO+E+27jqafQsBPDLVMLwJPtIhEhfUrZIUvYsqw5iuD+I/JElFhTf9kliLbQNSCaKUWL2QcrivfgaaXgNscyu4Sy6V0ckt90dkGu/kFZnOdy/Kry5GVnVWYcDbQUuW/Q8fn14g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(6123799006)(3023799007)(6133799003)(10067099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4w2Rb4T80bYwTGXPSB7+DkocMiBISRKsJNa2W5tARSCBM5eBQNE21M1Q8tHF?=
 =?us-ascii?Q?8yzOoYC+BZr/jYdA1gCZf0JaFKXxx1CAEl11hu0NTCyXfZZ2RrD4KIndPq97?=
 =?us-ascii?Q?88eXrHhejb2Cy6fz3sR1JZa3NdkdBnVUIded/wj3cg8l+7Mr0EzYBR0bfjAo?=
 =?us-ascii?Q?NfbvDSHcBSuGl/YM55KVrXAXBByqWP6Lw3or9xRis++HTMuY8hJwQ+MAeu7S?=
 =?us-ascii?Q?8dpsjs9Oo7tuQoWs/AMCVEcrHp5p1tniEAqxjBQyH+9FoTGkyhbz8GX8fz9N?=
 =?us-ascii?Q?sFG72UOjqvB67lqnvo9MVoqKF22kOOeNDuj9OFyqX+ftcGio32nYTnO5rrCA?=
 =?us-ascii?Q?Ff8N/7zqZUwLMUM/Bpa9EUZhWWLJZlX26CIjgG4IqyWkYcmwA+L6szc7tI6m?=
 =?us-ascii?Q?xKk+w/h3ypxaBSgPpfRqzt9Lb/zqgogOrWxd2yU29d7ltGyOF/6fz5Vr0zPl?=
 =?us-ascii?Q?kyUOU+iNbStboY4hPqnzT/rR4BPG0aB/GDfE3Qo1lLb4UczZ0UXsY1g3i4Nw?=
 =?us-ascii?Q?S8/oRhH2l2IeLUEIvmgUVHgnhIzoBVWD9DOV6yWb4O61hvXs6VPaCv6UsG4n?=
 =?us-ascii?Q?ufMNbFQPrDLYTGbTtJYhDAczW0TUYaIc5MVJAjaM0LW9BxEV3Zh3slXUMlZX?=
 =?us-ascii?Q?ICu/UiLZsuzrUrGsI4kQAjHtxEg64dQL9Aw486VfHxCVowh8xYtGowIruS51?=
 =?us-ascii?Q?g1BUVb0VX5hJEhOJe2eKWq2aliH4Gmnm0+LSebZ5CDGn/59sllCt3ewgvmb0?=
 =?us-ascii?Q?VDyL/5I3Q+X83mrAfQgH+7emh4gyBU9ayzWzn61GfyyyEEkHOiNk1PPwy6tv?=
 =?us-ascii?Q?4Sir4b5MkZ031Vp7R3608YD1jHq2eF9Q5FFGwrx40zZh1vthha2wdNmr2i/3?=
 =?us-ascii?Q?oGHgaiD3AZOXOvJpsJj06QyLJ12kcUb6IHs/9gfuY5PsnUC8cKfRH1F+Ax87?=
 =?us-ascii?Q?d66vdl2JY2Z7uYspVBtSQr/BwnBV591dKCOnozGPyCEuZqiAxfHfTqKIVQ4k?=
 =?us-ascii?Q?RvmfFw+cYEBiYgAn+3HtGwnDZegq5RS3PcIvQS84wfdQr+vVxF8b/bcE+7CX?=
 =?us-ascii?Q?GkbmVDxilvkmIiFUh0tr2phuif8heLUOpYOcaS7cTkIPbD7F+xQumLHoJwQ4?=
 =?us-ascii?Q?h4ZPkAT0t7Da9CxwixmUKPv/jlEttkhpo8dCIZSfFyTg0GuN9rtWzBmowiiH?=
 =?us-ascii?Q?tu5aHgprSb09ir2OhV6+y1+aTGdTuaznTLjoJ+ymOL/n+nZ7iHpf/iVjULvC?=
 =?us-ascii?Q?/xAtFsMJVads7UI68UdxATZduuYFBrBYVVgTeBHc9zgfPC5DRhonuF5XSpw6?=
 =?us-ascii?Q?vIjhCAqXU918NfCNKmhu+465sZQKAVS91Z7GY7Gblrsbl3gEQ368x2rsym1I?=
 =?us-ascii?Q?hnwXGHdCnCrPEk2ye0SXS5Fg9thqqUaUD8IVtxSdUlx+0+KzPl7HoHr7nXZo?=
 =?us-ascii?Q?xd7QHsYv07uPg5tqsDn8fF2QRu8TZrJrz7rD/5EcfBxwtkLgQCSZqDw7+aJ+?=
 =?us-ascii?Q?N3Idbw6SRWvrW+stVpv74a6ZwXzA0q+A7FpSQViNYprt2F4u6gLzTdVoPoxg?=
 =?us-ascii?Q?KWR1+ToEYT3EG+CX8rgptIpGT1HAEJWb8ixi4ppqYhdtK9MUvuoyOccEX8Ql?=
 =?us-ascii?Q?8EcVEMdTCzQlNUyMAGW+QotXleqPKQRUNg3co02E1zUXOWMOnNgVLSxU+nHV?=
 =?us-ascii?Q?fDyH4PXKIc1lQj+ducNrBIJm6qisj6iloyPQOoa9bgv0QemYsXUuhCJCM6Vu?=
 =?us-ascii?Q?22Po9JatUQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac48491-1215-49fb-bd0d-08def383b3eb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 06:26:52.4060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv2+ZQ6gJSDmyxNa1Wtp7b31TQdPjso30MlQN+2YhW4ffDZ5+7OjsNfxFpAqBqf9LjCBh3+yY/ruRjDIqkI96g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9402
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Aug 2026 06:27:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10236

From: Niko Mauno <niko.mauno@vaisala.com>

Add a check-confusables script, in the same fashion as
check-glossaries, that scans the documentation .rst sources for
non-ASCII "confusable" characters (curly quotes, en/em dashes,
non-breaking and zero-width spaces, etc.) and reports each occurrence
with its location and suggested ASCII replacement, exiting non-zero if
any are found. This guards against the class of breakage fixed by the
preceding "documentation: Replace non-ASCII confusable characters
with ASCII" commit, e.g. curly quotes causing recipe ParseErrors.

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
This applies on top of master-next, which already carries the preceding
"documentation: Replace non-ASCII confusable characters with ASCII"
patch from v5.

Changes since v5:
  * Uppercase the CONFUSABLES map, so that both module-level globals
    follow the same convention (per review feedback).
  * Define NO_BREAK_SPACE ahead of the map and reuse it as the key for
    U+00A0 (per review feedback).
  * Pass the Path objects to check_file() directly and print them as
    such, dropping the separate display strings (per review feedback).
  * Realign the inline comments in the map, as one key is now a name.
  * Kept flagging the other confusables on box-drawing lines rather
    than skipping such lines wholesale: the no-break space is the only
    character the tree command is known to emit there, so a wider
    exemption would only create a blind spot.
  * Reword the commit message reference to the preceding patch, which
    is no longer part of this series.

 .pre-commit-config.yaml               |   5 ++
 documentation/Makefile                |   1 +
 documentation/tools/check-confusables | 121 ++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)
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
index 000000000..36e8b22da
--- /dev/null
+++ b/documentation/tools/check-confusables
@@ -0,0 +1,121 @@
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
+NO_BREAK_SPACE =3D "\u00a0"
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
+CONFUSABLES =3D {
+    "\u2018": "'",        # LEFT SINGLE QUOTATION MARK
+    "\u2019": "'",        # RIGHT SINGLE QUOTATION MARK
+    "\u201c": '"',        # LEFT DOUBLE QUOTATION MARK
+    "\u201d": '"',        # RIGHT DOUBLE QUOTATION MARK
+    "\u2032": "'",        # PRIME
+    "\u2033": '"',        # DOUBLE PRIME
+    "\u2013": "-",        # EN DASH
+    "\u2014": "--",       # EM DASH
+    "\u2010": "-",        # HYPHEN
+    "\u2011": "-",        # NON-BREAKING HYPHEN
+    "\u2212": "-",        # MINUS SIGN
+    NO_BREAK_SPACE: " ",  # NO-BREAK SPACE
+    "\u202f": " ",        # NARROW NO-BREAK SPACE
+    "\u200b": "",         # ZERO WIDTH SPACE
+    "\ufeff": "",         # ZERO WIDTH NO-BREAK SPACE / BOM
+    "\u00ad": "",         # SOFT HYPHEN
+}
+
+
+def is_box_drawing(char: str) -> bool:
+    # Box Drawing Unicode block (U+2500..U+257F), used for the directory
+    # trees rendered in the manuals.
+    return "\u2500" <=3D char <=3D "\u257f"
+
+
+def check_file(path: Path) -> bool:
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
+                if char not in CONFUSABLES:
+                    continue
+                if char =3D=3D NO_BREAK_SPACE and in_tree:
+                    continue
+                replacement =3D CONFUSABLES[char]
+                hint =3D f"'{replacement}'" if replacement else "(remove)"
+                print(f"WARNING: {path}:{lineno}:{col}: non-ASCII "
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
+        targets =3D args.files
+    else:
+        targets =3D sorted(args.docs_dir.rglob("*.rst"))
+
+    exit_code =3D 0
+    for path in targets:
+        if check_file(path):
+            exit_code =3D 1
+
+    sys.exit(exit_code)
+
+
+if __name__ =3D=3D "__main__":
+    main()

base-commit: ce9e3b121a258933c65397160fc5889e0436397c
--=20
2.47.3


