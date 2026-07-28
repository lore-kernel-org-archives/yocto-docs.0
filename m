Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF8BC54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:22 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.120])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6566.1785223459189868689
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 00:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=NgqQsNwz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.69.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRidLoM4cUYd8Cg76VVukls2TDrYjpfjQ6N3WKqOP7ENH8lnTEXaHBDL9g5i49tUnqb40B+7YDHBq+GfHqAFHvRkGGg0g6tEZev+MpwOUavE6BUys2j7Gfh2MuFTDeiKVKRPy7FTPz6G01P9nZCoPOWginHRFL588wm9zeWeMgRO9D2OPoRBoik+H/CorcAjPQwwhYU06kEOrcFhvkWTlTbSQSkjXdxuRarer6CJmIAn2tKMUfsdv/imzkf6Oye/CpUxu35Ab3aUD+vrUTeclhXm5vfci1n2h5V+5ZY5LC4UqU+hb+rnG6kBLcfKxUaZqKyiIWMSZvngj3+CfqVobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIQ9Jlaa7EVVoM+TuywR8Xia7ZtDvxC19SMkmZcoeoM=;
 b=tj2Y5MxdrvKYFmjVsG0yA5F+XSqecuZ6uGqVui5nHpY4vvnclYPDHj2HxomLb13MfCWNOYhqz7B0l2HBVSLINDVELKJN/hYn2hlMn0mQrD91F5Iz368UXZE+wM/u5PyZK34F3KzseXle0xqLTC5HYn9zygJp7ihlFcR1mIozlUtKm78zvRF++2fkx5LUJfAycxd5vfdqKFvpkoJ1hcjsfZ7dYkmQ3sP91R1EqxxLoJAO6Cfw21Dk2ESVqN/DAJFqxE3ckERX5dXEtbogyrqUy1EDvKHbSQPx/oZe1AdDjZxtJ/MLq5AxLB7lQwIS/RjToGUTzOuN8hQlqTEpD4NnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIQ9Jlaa7EVVoM+TuywR8Xia7ZtDvxC19SMkmZcoeoM=;
 b=NgqQsNwzSsX4C2THMUL6rmFTGr+Fax2BQ9t2iFtpdMC/dh9zvaV/y+O0h/YHBxqd7ow5YtjDmEgxeogoDDs61okQ8TPNo7jqnx0ZoTX7xj1H7jM11X0/skC3+1CzX72Mlw1yyragXHAr4QOIjHlPAqrbvoxq5l7cZhlNrhEKs6dZwz7ofd4e5zT5U6cqKxt8yYs37L+1I3sCkhHNBZZxfnfOnmoefuTWd7oWm53eI2LOH6/2szMmRU329dHYgatKDzCrTKEhYof8bTHBXqAMaLvWovzhXqAlvGJHue0Uw/asA5Jbof0ON304Lc2lt/GNgZOv06l6yhnATOH5YwC9/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by AM0PR06MB6580.eurprd06.prod.outlook.com (2603:10a6:208:19d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:24:14 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:24:14 +0000
From: niko.mauno@vaisala.com
To: docs@lists.yoctoproject.org
CC: quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [PATCH v2 5/5] tools: Add check-confusables pre-commit hook
Date: Tue, 28 Jul 2026 10:23:19 +0300
Message-ID: <20260728072328.11926-6-niko.mauno@vaisala.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|AM0PR06MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: efa090a5-9d72-4ff8-c145-08deec7939e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|23010399003|1800799024|56012099006|6123799006|10067099003|6133799003|11063799006|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xgkIJLJ4RursXS+TS/AOmODrpb9UEsJ97S2pyypbBJT897v5v0tfEQNbKCpbrS+fi1St+C2ZUfugWYkKt7zipRHuadhRRDW645GxdGjtlNGV0PaSVRENc6u+v/1fAgz8PnXgBmMsDT7NYnhY2Xl1xWw/XuZh+8eABc0Wcjkga4TS5qMVPEB3L4Vh3WnLcgqU7XHkyDsZRsmDc2g0V4hY3AP41JY09FIkOYsn/PWhrWvxH/gJ+hRG2kSRJR7RLY49+N1z2IJ4O1g2pGRORVI26+DZkOMGXM8Tfmz/ABGzE2jr0Hzv+5I12GqWfxYh9K0R2WnGsaMwa7S4RX5YeuLsk/3u+9mUEDyQPkci67Y8PTLbsY3+IQAikSw+Q42VvUKCiSwDU4Q6aokWAkJvOsaJhHYIAxlT/5wKqQ/zC2fUIUJ1AJp6txZjsgvYUdtY5U8ep4o/K4REqX3sVKMk+7GyQm17mJMfiHbKuAUMaYxgMatxxwf+oUcWmbaOImZyTq//pwBK3hL+m5RKhMXSXUnsHX5N/602P4Iv2OJOwfqubp3Q4B6DxZqu3u/BD6Y6EbLIYpIJpsGVdvyAYP8zi77tBZwVIgi2XV7OSVF4YM061yamQ26b0N4o5oqL2mkjiBfe7eh1UBtllsNi2VXIoE4lZk3vpRcxxO8+sgyJ4anN6VSROXFeupTDUIPkjkcF7YJI4WRnM2pC3oTq/+Bho4YyCqO9XxT1y8RruBaQwzbVk+U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(23010399003)(1800799024)(56012099006)(6123799006)(10067099003)(6133799003)(11063799006)(22082099003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hhQ0mMFe9ZG0DxnVZv34Aec9XKxD3TlVW/wk330fUvc2cuUmKqMUfUoKkJic?=
 =?us-ascii?Q?nPxzAYoPDVFllGTsuDX9GK6SeMzIo/oTqxkmRXCJXX3iNLUrhCHBRSQhOvFU?=
 =?us-ascii?Q?lkluMocd8NgaVxlANUUXY39xIy7zHzbhWDy3mGQU7cVJQQGWDX3+dw4SF8wN?=
 =?us-ascii?Q?pYsgpGDR7Jgzm1YOXZwPQ+juTI3GfAUpwFFXY4rEtbtJ2eXWZwxDUBjoPmZo?=
 =?us-ascii?Q?h/18HleGXaZJRo7fHnueuiTPxF1pYdqlmfoK7S64AVF0jvgjF7+kZq79Of4I?=
 =?us-ascii?Q?NGMgcXLq/8lPEbICJ6HgCbLRUai1JEXCZrxFYd8qY9I0RsVBmeKVlubvlZMT?=
 =?us-ascii?Q?oHIQHfmNt2LMjnzGapu8LhZ6OktKVdT7fogeGAfEZK1z82zfU+Z/2Rtui1e+?=
 =?us-ascii?Q?2zPoGUtNymeGAvMB6v5awwjsKWiU73w01xRj9lzZkoco4dEvXDaUPVDBshyV?=
 =?us-ascii?Q?ZxdcL6CgLhVxt8mUOZK9IBY3HicyURWmB/oaR/evCDGvH+hfi4m1tSZndtAj?=
 =?us-ascii?Q?i8e9GyPbFIPdhtQyt2+zpeanP9Jsb4uRnPTP8ckfQfHE8WhAdl9jqn0Ku7+7?=
 =?us-ascii?Q?p1nRQRk0Qh5JWNfIKH4aVW99XagNm4gwek2ZSw4c8/ShlDnLqmMDsUL5r95C?=
 =?us-ascii?Q?Igi4c7UMY2SGQ3gO25TBX/JhjcISbXlpSPcE4LARR3HWjbLuwaNqbvRsv2ZU?=
 =?us-ascii?Q?JZnGJidPyd/OimcIoM8eF5KqXYm1F3hdg/j3lu/om6tnHFCfJCBYKOS1vrst?=
 =?us-ascii?Q?GrLOERchrFxf5AOApquWsM4Ut2y0mYLyG1lIYPFv+nVkqvff73vJcNfD8eKr?=
 =?us-ascii?Q?J0i24+ltKZaKhPPop4X0CBEicB4AOsI8hhjQW9MbKTp6UlhgzMtox8pdGk+u?=
 =?us-ascii?Q?s7svCKFbFNfJ5Y3robHB3LyH0VgAczv3MbMIh2jtwNWnO/N1lNiff5Csn5Wo?=
 =?us-ascii?Q?6aAnZciyXYRln0qYGWXmFiwKhSe7HkahM1oGIPaNd6rJIzyCJpfBelgXCE9w?=
 =?us-ascii?Q?ZtSptze/CKatlA+AnL7qWnQCU//+SrF6ud9+Gb5wGVVU/e6lbJXPxZceNKiI?=
 =?us-ascii?Q?KDoBmLfW8adQ1KEpe34jXS2fBrNo6zFFEtC/wN9rGoUNHs8sVDQQV8fjNy7S?=
 =?us-ascii?Q?meHzSz+5VViriyJCqYe5/um460FX2hJND4+VB8ApJNkHT23k+VdAncddBRPh?=
 =?us-ascii?Q?tamNfchwOfWpNY3yyozGZi3hXWCBvqV1sumXfwi1WHGkXj5hUPevd+W0BCvO?=
 =?us-ascii?Q?Th/+rENKDKcyu26kYZ7QDKe0X9mLek3C739ZwqQ6TuoUXyJzYLbtzM/zMuzY?=
 =?us-ascii?Q?wOYRh8l+bq355uUMnlZ1RracYNTp2qPj3Nl6HeKS4dfaJSlwEPYHx9SImTaD?=
 =?us-ascii?Q?/Tp8FX1CMLfRL1vAUa2H8AtwPJ4Jb9Qiy4kFupU/WkB4d1iR4d0g9oUjnp+0?=
 =?us-ascii?Q?T0TF8WAmm/4GvBMajLOL8L20ncVbaQ6yJpxiHjtYoj9zcRhTJFnxbZNVg9Vt?=
 =?us-ascii?Q?FtQwk0t2JmD8/9kBVrYy9KENgsCNxKkwx9w9rCuQHQUX850N2sqQK3WNo5IA?=
 =?us-ascii?Q?Ix6MipE5pfXni6g+XyE4b9L/jzaqDxB9Jcf5OhT/uJ/+AHoEXwWPorP9Opui?=
 =?us-ascii?Q?9Q435tK397ggXwX8vzI6qBm3M8TlohgD8I7s5RkophHIXF2VImdTHkIHOJ8k?=
 =?us-ascii?Q?Lbew6vPt7fBwkHWaJsPX0+OIwfDCjBUzD70e2LLzuKjkc3/21jY9b9+YiY76?=
 =?us-ascii?Q?WeCFe7YepehmQy5vl5kSr45hy02D6d8=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa090a5-9d72-4ff8-c145-08deec7939e4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:24:14.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ov9v2DJgtTNwaqxSPzJ0tWCisNtrSiatV7zaDjvig+32k6io4YHyxxk7t/1FFCXecjmCt8UD/6yZVrp+AvqZ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6580
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jul 2026 07:24:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10159

From: Niko Mauno <niko.mauno@vaisala.com>

Add a check-confusables script, in the same fashion as
check-glossaries, that scans the documentation .rst sources for
non-ASCII "confusable" characters (curly quotes, en/em dashes,
horizontal ellipsis, non-breaking and zero-width spaces, etc.) and
reports each occurrence with its location and suggested ASCII
replacement, exiting non-zero if any are found. This guards against
the class of breakage fixed in the preceding commit, e.g. curly quotes
causing recipe ParseErrors.

Legitimate non-ASCII such as box-drawing characters used in directory
trees, accented letters in contributor names and CJK characters are
intentionally left untouched.

Wire it up both as a local pre-commit hook and in the Makefile "checks"
target, alongside check-glossaries.

Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .pre-commit-config.yaml               |  5 ++
 documentation/Makefile                |  1 +
 documentation/tools/check-confusables | 77 +++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100755 documentation/tools/check-confusables

diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
index f2b73a481..d6008b609 100644
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
+        pass_filenames: false
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
index 000000000..f79ee046c
--- /dev/null
+++ b/documentation/tools/check-confusables
@@ -0,0 +1,77 @@
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
+#   ERROR: ParseError ...: unparsed line: 'RDEPENDS:${PN} =3D "foo"'
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
+    "=E2=80=A6": "...",    # HORIZONTAL ELLIPSIS
+    "=C2=A0": " ",      # NO-BREAK SPACE
+    "=E2=80=AF": " ",      # NARROW NO-BREAK SPACE
+    "=E2=80=8B": "",       # ZERO WIDTH SPACE
+    "=EF=BB=BF": "",       # ZERO WIDTH NO-BREAK SPACE / BOM
+    "=C2=AD": "",       # SOFT HYPHEN
+}
+
+
+def main():
+
+    args =3D parse_arguments()
+    exit_code =3D 0
+
+    for rst_path in sorted(Path(args.docs_dir).rglob("*.rst")):
+        rel =3D rst_path.relative_to(args.docs_dir)
+
+        with open(rst_path, "r", encoding=3D"utf-8") as f:
+            for lineno, line in enumerate(f, start=3D1):
+                for col, char in enumerate(line, start=3D1):
+                    if char in confusables:
+                        replacement =3D confusables[char]
+                        hint =3D (f"'{replacement}'" if replacement
+                                else "(remove)")
+                        print(f"WARNING: {rel}:{lineno}:{col}: non-ASCII "
+                              f"character U+{ord(char):04X} should be "
+                              f"replaced with {hint}")
+                        exit_code =3D 1
+
+    sys.exit(exit_code)
+
+
+if __name__ =3D=3D "__main__":
+    main()
--=20
2.47.3


