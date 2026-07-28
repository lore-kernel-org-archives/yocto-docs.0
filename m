Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4160C54F55
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 16:38:56 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.109])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.628.1785256731064151526
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 09:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=BLLdkej0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.162.109, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6bQJJ/kk8lMS6TnRMv9hbZzk35PXT2BP06wddo1FcAWIrerRUyeJ+9VPXzmdDeK4DY0sMP+L3zIYHACJhEQ9TRexeiZeEQ+ho9nzRWukKLwvzHBzunMwu05yks5WZ04m7LG1loXoyfT2O2JYPoWZ+A1wKB4n34hrbFopvVqC5EBLDDHNMwdkiwO946tR8YKzIp/UplEHgOVoxAYfTI0wbl1e4RkqoqAaGyZttiUYI5PpZyDonKeJ6w9bTfrxAQdBBFTJ+cHb8y9UyPyrfTtlgwLbhBxAW+gZRRT8mpuUmp9VmxGxSC80HiAVZyKEazBzzyTY4WhjkBQmadmFWBskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPo9tc0j1zeXDL3vOUW8L5RRUFmOJXNS9FbnKvy8BeA=;
 b=PF9Mha8xnEGB2Vi4X5T3I9mYK1DvKep72qFBepWWu8fQqrBwClsar8O1aCipuyMwx+MkSmChvEu30ZkkXkWrFR5KRrxqKY2wStAbZuNqujMHFOzMMzFdoHCMoGAReZ0kfa7EvRkVy1ldDQAXTBu+YIxLETjVy0LoLt2bPxQG6qH7J3jXQcg78Cbx9XMB8YHgiz5TOTrUX3nknKuRSSym13CiyD34MVzSsaSLgxBUw5bDyyhb7NiewWsTRUoIPlE52Oh2oVp1yDv7UZGiWbm2FzAIOarq9scj/oPBzjzdawlT9Ur5YEVb8oFVXKc9mFwqkLF0oIo9WBhUaZ2xk8pzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPo9tc0j1zeXDL3vOUW8L5RRUFmOJXNS9FbnKvy8BeA=;
 b=BLLdkej0tEIp9O8LmCYD2Z6apDecJVqu4J+Ro6BmhM+OyA2QCvB+8Lxq97gMGgalcyZOBJDcMqIYf8wLPV0wIqNHwZZtOxVpH3fUHhzWajJTaeZbTizDg4IYR4sLR3KG1rarK+SaJvQuysyNNNj2M90WThg958hMFbQuWo6CykwPbq8QJXQSxM2+8JSCQLrykp+QN5KZftJS936njEBFs87BHSYOyO5nHcFlwmuQpf/KdnqQmRLCu7flLrk/F51bTEepN94q6aoFbH4K4QVqJMQP6gENd2D8gULqfKAmGjAEQ+5Cj/9nrJMTwEkbQZa+E+QNtJOf4PIhIfpQkfVL4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM9PR06MB8067.eurprd06.prod.outlook.com (2603:10a6:20b:3ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 16:38:46 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 16:38:46 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: paul@pbarker.dev,
	antonin.godard@bootlin.com,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v4 5/5] tools: Add check-confusables pre-commit hook
Date: Tue, 28 Jul 2026 19:38:06 +0300
Message-ID: <20260728163816.17230-6-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM9PR06MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: ad13ad91-855b-407b-3835-08deecc6b19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|23010399003|376014|6123799006|10067099003|6133799003|56012099006|5023799004|11063799006|22082099003|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	XvChK8l1FwGm7eEFW2v5ucy/cTiYO6Ikhba0F+iPzHpqZ/T1k0Jx9tQDYhOmXLntc0qUaGb4uMb2TbG6YNKFpDiFeUCoT0UR+KjgWXZTkLu/5SUkyZmWBq+M/PLSbVfMpCGIceyCNFMPCe9Zw6yOyP06/hZxZOr5e1eCjBx6pXLGBNyXp8rQNCnWsyEz+xOxEXdJhrlOo4I88J9XIjrrovSBjRoB76ik+EQ3PilBpcanv1/43WtTPyIarBba9PT7mH6quKT1fTstpQ+8PeJEOCoL8r6ISz2Iv3luTsRm+L8WMr5F7qMjiy2ulqY/OGg+UzwN2I4uOVTS73nzHA9GqV9xqUuQ0RKvuh5YfjaNCHpWZJ7Z05VGG6ko1Z9Nh41crNl4zDw5IzsaFE+9vImzaiqebjTMh9g2MhNR7LC51X3PnaUtn+tFg+B75+ZdLivN29MMEov4gd2+g8G/Wy4djCv1NfZbgZR5tZmNPUgkrxeYgqjH/+4DN13ukIna5XiAsiXlippPzi+w6G3uViIEv4qvSZ/mmIXSb5GA0V3C6WXxbabimW+a7cOajMDYcjljbZ7PFfyxUC/gelL5kSeUbuxdN6NE0FP7Aqlpwgf5aU5je9fS6j855+ragyI2zYOkYBQCEm59SDK+jO7jjXXIw3iij6yquGuXCT8SsIx8vW+wJeYABTMSoLlXTe2Yfr66qscBrtwQHT1kKgurK03JaX9jC6UIPuUI9O4hGhqsDo8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(23010399003)(376014)(6123799006)(10067099003)(6133799003)(56012099006)(5023799004)(11063799006)(22082099003)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l8A5iomktA1uU1hvrhIvGmJ+W7c8ibqEh2JTpyn+udMD5Bj5Ynx9YWScGAoz?=
 =?us-ascii?Q?PXFfSWknu8/DeeE0uU5jLUj2PQi+YOeRgMWoT9Elw0ydtxPwBjsW9mKW+MXp?=
 =?us-ascii?Q?YycWD+G8x9Gg2YTb/1ENGS9j5hqw7x1A4/rFYo4d+721UeF0Duswxp4eoGCC?=
 =?us-ascii?Q?xTBBqsro9MCPGG6AzVg17sKVTiSJbLOakQm2lxQPJ5pec0+s6pTH845cjCQg?=
 =?us-ascii?Q?gaA8ah7H8RrFRsLIN6f8yU7nTLVs7E9oa5tA2FiUbrYZuTDuIZJvm7NtTi6e?=
 =?us-ascii?Q?iaxlrrJpW7Ms1u1fCsIhWsZlMewORG8ruNgEv17RCJCpADOd5giMTJHaUNYc?=
 =?us-ascii?Q?7hgjX0VZczlxnyFJ6F8ZrvLPqF1vHM8TAIK7+Q6w/yVLcq7neq6W69tx88WG?=
 =?us-ascii?Q?IIYdiWJ3BH4dFGrWy9bUocodvpDK6KkRQqihdT67zkw00CB3nFIfr2YkvJmI?=
 =?us-ascii?Q?jTco2e+RliKbO9A67cWwcPmWSsATVjfQBIecJKsMf1vlB6xt/ku9AAwQbQzI?=
 =?us-ascii?Q?bVhH4blHo9dK8qQuN90eS1Xx1XV38jJ/KDyHZB6XSLQV/vrXUCCrvBsTtY+K?=
 =?us-ascii?Q?f3ZLn/1xF+0R1XHOOLpxIQJOFUk1/lDiWvt8CyGgB9jmwfEty9rIA0/o4KtK?=
 =?us-ascii?Q?+1e+hosF7htRmUZ6B7K03hahqCiVyb1e8vH1pDqfZ9UzgxYhUVG1CVje04w6?=
 =?us-ascii?Q?QFR1nDMXJ5ixqakVaQxWnqNEbN9OVll/ozb2kiIVeXYT6Tfyg3hZmkJfkFyK?=
 =?us-ascii?Q?1b35qCEUL4nzKug7hyouTwoEcHxZ51whnzN0zNa+33h45S315XMbczTjQXsr?=
 =?us-ascii?Q?KMP08wg3Aof9nFJkDlKC4CTGU/TZAZ85pCEd8nxjoFU0ZVWIcove8IlDGUl0?=
 =?us-ascii?Q?nvFC62sbFJVR/Xiy8FxvLB5HvL9oZRr91feGUfDeSOZ4SyfVqrodWGs7+e/y?=
 =?us-ascii?Q?yVIHVWNLJJMNiMMVqrnJwNqv1KiaYJXo7GJHm6HX12NCvfRzlvB9SeqHycwr?=
 =?us-ascii?Q?PLBl9UKuArp/exgB/NpJ+6sJBI79yvzu8kKlYrSgcHamJOTEjANbwx9T56B8?=
 =?us-ascii?Q?O5Bh2/138s4skYqvS+dwczCd2y4bsdFWGaTv2Ss7yweqxsnBWZVhJ/QrN2NL?=
 =?us-ascii?Q?IjS0mis8dXiJbleuRx4joksOy8sOECZaU6tLO/DxxTayUznGpxtRONWno6OS?=
 =?us-ascii?Q?rrMHCHjnajT+6nvHGRyCeW6PlScKySa48yqQcnsHQGHvNHiYyRTMPGDMx4hy?=
 =?us-ascii?Q?CS3DT9Qaccox0tXM9BkO22Svf9qR0ydURKG9HIipFOozBoI1M+Q/AP5sks18?=
 =?us-ascii?Q?zwUmg6MUyeUpddw2cKcXYtBKibcromNsGWPHIMnb0uU2rM7b1itg/pMQ+3Xr?=
 =?us-ascii?Q?e4PE1QIhBdKLlK3ESd+cqRpkfyAG4bm73iRfd9BdjaTsy6MhmVweXKjndCtU?=
 =?us-ascii?Q?KjV1rxzBE7ONGUl/PX4wTSlcneqLcRQ+AxFHWG8tvtEm/1AC4E4EyurscdZo?=
 =?us-ascii?Q?JcAlxc/XLDorDTjA/2e1Xb6Y0awoS+n2TkcniSVAS8JJXwIrvcLwTp7TBshN?=
 =?us-ascii?Q?TYPfwuze5zICG62f/U94+IyA1TbMY8js0uyAnwIjkVWb9GiHQ0PvjxTdKHVR?=
 =?us-ascii?Q?LjWbGqkxmIOiuwDhwi+RoDH+VgAQFC0jEnTznLXWpKa9sx9J8XtfdAPN6kyO?=
 =?us-ascii?Q?wkURw1YIOGdowuAW8rfp9i3OccR0oBs+f4kwnnXPhMn1bqHUOe2QpU+/erYx?=
 =?us-ascii?Q?HC8go/rg56ixY4Xc4lIoMON3CuqLbfo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad13ad91-855b-407b-3835-08deecc6b19c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:38:46.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PP16UPoFdmze7SDsZd7F+oRvxeunLRmVPqo3UBeMRsc+WKd+MeHFIp7hM/sqYq2MxD7oxUXZFg/pGbOxoIpHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8067
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 16:38:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10177

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


