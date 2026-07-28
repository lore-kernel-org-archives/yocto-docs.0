Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D47EC54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:08:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7661.1785229689386398720
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 02:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=IiDxv4Zb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.70.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugJAbPeHV7X9MOte742vnFi5Ior7TBma2T7MvNC2ziyXhxm89bN/Hvmd103jnFvAJJgjqlvDa6FYC6EehQ/vmCBr94bE27dSmZ8TS9nlPbJX18gQolCrBogwquOEerb5KlpFhJLdLzjEA9SDDsX5FglHESFaYHR5s1+gvwU+nd7uwj4hNxxDd8opGBWMuK+GkfBtvWTm49Pk+ncxGrZbWlxyem8zhFKV7NNKR+Ezjg8bOs0WB5lwiAOtgc/6lBg8/wAz+U+IybiL32wDNnSL27iz4evkylgBdT9p5bUZyAb7gd1DQCzwaOAe2YpEn5f90UzEA40qtWJjXcBFPuLcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSSls5ixT3b1L36YqCOyz15CIIco/rMG6tQqwlo2+AQ=;
 b=Hcr8TkrW+/Mq2xvDMa7jBSewU5m/PGaKVQojYuCu6wZ5VZ2x3VgQfKzA1wHLw8sLUeDGy0gPxjUbeYPemlKIisRX9i5PMjrG9RtJnaSl1QIDpQNvwEtDxVqICoht3YPqQNGnXl5I0hq8yqbkdf9QtEwJmuq0GqSN8oaLjIHbg6ZWavnder/AyXqF+sNZOgpJxtZ0KEriS9wkheNJahENM0bfbBqYhP2is7xJYGgXvbqYrZfAzymNxD6fVRqnzq1H7SNjdEzNOVtQlXn7S2PccLVohY3Poxw9f8iEPNYpUbPGeE4oxNEKm5VxoAnwIVY97WA1wiiXSO8Gg1urh5ME3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSSls5ixT3b1L36YqCOyz15CIIco/rMG6tQqwlo2+AQ=;
 b=IiDxv4ZboNtLdhqqC5szYa7NKQ5L5NxjJcUzPHY/2eKqMZYUom6JqBBKS0ySDjP42A+u13S07cKRoL0IOu9oOk80GHePQDSPIuyQj2s1ufl7uhoCcCappZ4u16e4izJIn1XCdhQr6ojI3dRC+o+UpACi78IC2B/BmlAODUc4o8rN7n9zAOenjCguWwtWHW96NBdeqeC5ctCZ3sm0YBV7BmRPekcYWjzJH1Yihy4S7MuI/29NBbyohWJ68QRkvX86OqdJZxx+LY41b1z0MIx+GXBjDN85iaKmzPsUHm/a94Pab9WUWBQyEAilhSuAjPJtDRh+LvqjDe1Fj5kGbHarFw==
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
Subject: [PATCH v3 5/5] tools: Add check-confusables pre-commit hook
Date: Tue, 28 Jul 2026 12:07:38 +0300
Message-ID: <20260728090746.27793-6-niko.mauno@vaisala.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae3f171a-e665-47c1-0315-08deec87ba4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|6133799003|56012099006|6123799006|5023799004|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	6nQUgEqzvBGhcf3WRPSp9ZlNZWrMomzx9FpEJgDFCvuwuuf6Oa45F0CFHTZ9Y66qIw4aWi78G9RhJ6JFI+GM3FXAKI/H44SkHwd1Ny4aeUfm+GCQlPyHy6pgNKlQA4eXZYFzJv8C1rv02YrnFdGxiuHXPLF2pGPFAtht/g91gpgc+Ri0wmNuJGIozUi0AJQt8xjfQGgqFU5N3Syrek/4f4DgBQ0W1BjhvGTF/iISRc/WhKBfFAlZULtlfmLZrg9ay62gNpSMLEeCjkXvws8TBeNpdWpea7U3+osO8RFUskjBcU1ZRzhxZToKW96FrBSHdT6KX0BPX2CpTeXqFrmy92HDcTFCIlpbn36wjhxKSzxmbR4yG0DMsfyIwpiE2gjFoCTf/8aTRBCcJgnU2zxxa5y9K++7g+2PPsr4FKIc+1EQw4m0RbDZaAhtAckdTyJ6ZUGDZNplXbJaaS4ATEKEuZeRMNMUcbmHpU7cNwYo3CO4GsF7meRfMmMQ1swI+GFgVKhmXyYSu0k79DcIPK/7syGjNRIGH6RV8o10QYor0LyZAT2TLNjEMeKnPGHEQfe6kI4caHQiHlAOmjG1OaeU4Y38PEZAQT9RBObKiSUtjE3Z+u+Qr/4xeujOQ1B1jx0tLTqHDy3gYzTDYn/tH00XHgvZIuddqrNd9FSp6tsBxU8ZH41LoxoffuHIKdiJhTCVMJ09ftySG2s8CH/JBMi6WN+TNum7SlApwGTdBx7mbBA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(6133799003)(56012099006)(6123799006)(5023799004)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?15Z1xfGXZlLVXzb6lXGmnF4qIaw4XeQn6pTvdyBeNdFU3kK9uLDpu5BglIR8?=
 =?us-ascii?Q?M3FqmZtqJ95xzw2ngSSyA3INaYS64Gl3PCnM13SueZG4a6+92JxCfDNUcpHB?=
 =?us-ascii?Q?2SHnz2z8u1X3nCqKJVBYTQdQ3aV487FTwJXcIIGk7yeAKKl/CLdoCtKdFYen?=
 =?us-ascii?Q?z+WIzL/mB9oRSN0Z63ybe8+6ih3vdiW6WX1juXOqwLElzIfPNriZXzKueMHC?=
 =?us-ascii?Q?ovFFb83O4hBjQa2ePpHKQ48AoctSNAVLbEBnSDJd64p/XPV94zpo/t67WRZ4?=
 =?us-ascii?Q?JrBfuF+fhSSsPZNEUbZkgEoNccZaDTX4YbeQ1atQDoK1u1x2Ccdzlii8k2Mb?=
 =?us-ascii?Q?HXUtxqT7Y73a+iqNaxsM3I4kSXGM1QqjhUybhzZJP3INqdwGdJnc1hU/NUZ4?=
 =?us-ascii?Q?1txS9hRowluG8rESHl07WaXUucwe0M9hzmat9vkGKPe2qHfBu2bBZ0uN9/Xt?=
 =?us-ascii?Q?PmWXTLxqjjt4/Ik05ovCXXsobjV4cN/kaAYPm++fHhr7JSxMGHBiDTpPe7dh?=
 =?us-ascii?Q?D2Io3iXGfJIStb2PNUCXpGKSPPxumTIwVzAHj6gdrm5rToAfmQqkABlzMlRK?=
 =?us-ascii?Q?UjM9xy2kenT57sZrYg6dyrfazw0yzdcVMCKesfLU04JVtxbBU3ipJmM/P9Ry?=
 =?us-ascii?Q?8sNfEhfPld4SYi8leqjXfWMeN2Bay/I0HAQu3VqzxSFN4yOxZMD+kpTujAb1?=
 =?us-ascii?Q?+jt65saqhgx/upenpeOBtE0xtLo3+UFUwAG5f5CUlUmcJXMo0r7Vizrtmwu7?=
 =?us-ascii?Q?o2GQmUkcEa10RORORMB6H6pW1bwVTMexLwDY4JXHfYv+F9sWyBpKYI0jlEfG?=
 =?us-ascii?Q?Lo1QvWCPJuoYu+pn1VqRuw/4Js6CfU8aJ542Xd7u2Nn5872rXNpaAsQAHv0Q?=
 =?us-ascii?Q?ZdptUPAcONjv95RSmIqxO4NJ0zBJ0FYRDgD2CqvP6CIYTJPEoqFNezpOVltv?=
 =?us-ascii?Q?wYFteW6ORHxSPfLpkci4z6M/Bd2IyFDgTsZd/tcUq/jA2nL8ivz0WH92QFHc?=
 =?us-ascii?Q?/dbL23jy3+PShfgXfMSHue2h043qU4cHxPKEvVzkOWKApxsyMbVaSSifB6Ae?=
 =?us-ascii?Q?WIbeqbYET6Rbjm++3UNx/FAwOYqUtdySGZIZ/OnVb/MxmXLBPxzW/r6SleOH?=
 =?us-ascii?Q?afg2c5FiQW1C6Qzr6vR3RWWocG/ehia6iNTucuhPrU0apxIkt5IJ/hSVXFIR?=
 =?us-ascii?Q?aBNAneCsgadBVmzJC371MzuBfzne3xtmqrW2s9HKCSkkfOXEaE/q6Ek8mG63?=
 =?us-ascii?Q?VPono4Z2P8npGGFJFGs4+E47qGBKgvtky6w5zG/j4MTKXeoA47+JhUQO8daa?=
 =?us-ascii?Q?tBGgNM4bI3Br/4WxFjvHeav8wv3jV0M14i//l8DV/IJohzDg1qT3hjaPe76H?=
 =?us-ascii?Q?/CuxOYT18GqxXcGwVOJakl2jqdpN9Lh9PGT5tLH/GIJ3kalMtpeybcjcWIFp?=
 =?us-ascii?Q?fTweMjvJ086Jq5Ojxe/dmelMT8bBsuREA1hcCBNIgqTMne6gNwwoWVQ2gmgO?=
 =?us-ascii?Q?U7jVA3N+DxtziIi1Gk9z68dAvpndL4KN3GU0hZZ4CUCALICEQZyyILT7pOat?=
 =?us-ascii?Q?m4yyrYA4jwZEVVf3KmjXR6osK5po+s5TsdwjUY7jTOv9wU/KhiDFT0Vnleyi?=
 =?us-ascii?Q?plxS+v8KZSENfBBlI979+x0yOy80sgtJ+9W8RCfIsjtfYt7ZDKu780lIDcUK?=
 =?us-ascii?Q?NefrP9UE/a1Rva0ykcSEjCX+qAaHwlmHjFOXEBTDKM8Emj59f6P8HEsjIcHl?=
 =?us-ascii?Q?TcCa4shfrOWerd96iwJd2oQagJy4swo=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3f171a-e665-47c1-0315-08deec87ba4c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:08:02.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weetvqnDD5IBBZsWkbWm3I9e4QWBAuExpWl+WuoBF6CjmzoAVxZdr11VdY1snBxRtQLUIEe8m0pBDHk4J45BOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9700
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 09:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10169

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

Wire it up both as a local pre-commit hook, which checks the changed
files, and in the Makefile "checks" target, which scans the whole
tree, alongside check-glossaries.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .pre-commit-config.yaml               |   5 ++
 documentation/Makefile                |   1 +
 documentation/tools/check-confusables | 115 ++++++++++++++++++++++++++
 3 files changed, 121 insertions(+)
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
index 000000000..d9f27b337
--- /dev/null
+++ b/documentation/tools/check-confusables
@@ -0,0 +1,115 @@
+#!/usr/bin/env python3
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
+    "=E2=80=98": "'",      # LEFT SINGLE QUOTATION MARK
+    "=E2=80=99": "'",      # RIGHT SINGLE QUOTATION MARK
+    "=E2=80=9C": '"',      # LEFT DOUBLE QUOTATION MARK
+    "=E2=80=9D": '"',      # RIGHT DOUBLE QUOTATION MARK
+    "=E2=80=B2": "'",      # PRIME
+    "=E2=80=B3": '"',      # DOUBLE PRIME
+    "=E2=80=93": "-",      # EN DASH
+    "=E2=80=94": "--",     # EM DASH
+    "=E2=80=90": "-",      # HYPHEN
+    "=E2=80=91": "-",      # NON-BREAKING HYPHEN
+    "=E2=88=92": "-",      # MINUS SIGN
+    "=C2=A0": " ",      # NO-BREAK SPACE
+    "=E2=80=AF": " ",      # NARROW NO-BREAK SPACE
+    "=E2=80=8B": "",       # ZERO WIDTH SPACE
+    "=EF=BB=BF": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
+    "=C2=AD": "",       # SOFT HYPHEN
+}
+
+NO_BREAK_SPACE =3D "=C2=A0"
+
+
+def is_box_drawing(char: str) -> bool:
+    # Box Drawing Unicode block (U+2500..U+257F), used for the directory
+    # trees rendered in the manuals.
+    return "=E2=94=80" <=3D char <=3D "=E2=95=BF"
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


