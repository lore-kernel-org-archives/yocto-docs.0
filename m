Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77239C87FD2
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:30:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.4702.1753788610702172864
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 04:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Zm5b42ss;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05A9F43881;
	Tue, 29 Jul 2025 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753788609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzE5Tb5+n3dPvU+pCvJG44TnQn+ZMMS0n9Ul8HHn9UY=;
	b=Zm5b42ssNnoROKs3jN8MW7HschfYulX+7k78XqUxCmxmlE54OqYEOqbMZP1lE5Rf/gCINr
	nZzKf5vxS+XOv9FU3S3qpRpxY15RqpYfDLGFCdS+Ap+6Ku9wXMwHLxyVzo23V/sYMmMjpo
	Ij9bW4CTG59LZUndJWeVASOrsqXCs+ZL5NAhvvVSkZlv0m50ns5xpXuvoMntuJ9Ri8UXzr
	cQF+M7+emUyIBomawjiwBQAIM4JT/gn0gSYKWEszI6AO48aMfrC/66fnOhRHX4NAwXLgjB
	RLA51MAaVXMuBU/+m1e50woomLzma7SzljiW5/d3Usr6UC07CxwCuTxbUV95lg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 29 Jul 2025 13:30:02 +0200
Subject: [PATCH 1/5] Add a script to validate documentation glossaries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-variables-checks-v1-1-5ad6ca9b9386@bootlin.com>
References: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
In-Reply-To: <20250729-variables-checks-v1-0-5ad6ca9b9386@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4970;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9Mmxe4nPtaFomWEcDbrRD7akpGTYtqsOhyymlEqcIMQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoiLC/AYSct8Y2kAx541RFPgJhFPXyaMaWUvTi/
 rQ/uOc4LyqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaIiwvwAKCRDRgEFAKaOo
 NtbFEACPRCRmWObTmn4Gx44W7NOd6qcblHQvD3Yi897PzlydlzPVsgHAygen055+vIJr295W6ub
 n+NZuLdCigQLhBnimI+YeXu5NUUrMmWO8PnzwiJvss8CPg07A9iMOtGjzLEc2DohoFDAHl1+/iL
 fwnaA6VHtXSZI6tKBpruzP8z0ufq4TajLmenyEzqr4vZsPVrbtrhZ2/8CrADCnX+LQYWPIGf5JI
 BsNlVdA/GVrsHakhxyk/0U2RXO8VwQ3gppAXCHGCqUV1j/NPJ4cCGxe3d6dKUe/ny4RT4StVg4k
 yajnEMP9JpvqDT6dGdXju755PcWiB7ee0AuCZbe71cUL/HppbhmnqzrnRTH38nKeu66XezPwJBt
 aWofN8K6/9oSbr6Gx9bOhtWe6cHXZBF0MX2csFLEmpGrDGmyN2RSYcjR8zKdUseCi/jfUx6ESXO
 OAgt5IltPLuQ7B+44Ns8oa9Ty4u44IzoPdiE82AjQowEZ//vBAQ+d13Z8DHj4pqcSdvQjpwjPcb
 BsgGXt2C9bdYxGzMThphrZO58qK01XJAgAGGMjEh0e5wqxcURdW683nljg/o/jCh4lCJ7xEKNay
 UrzTYi9KSfyJDBZTJDEQLy9zoAi1p/t3H5DcxjDa7bHHOPxErQNedeQkhPaRlwaO+bEuKws+86N
 yMiBvzIEpBxNPMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigeeuhfefgeehfffgueeiteehieelfeehjeektefgkeeuheeuleduvdelgffhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoo
 hhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Jul 2025 11:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7414

Instead of tracking the glossary manually, add a small script that
checks if it is properly sorted.

Add two comments between the start and end of the glossary for the
script to know where it's located.

The script also checks if the variables are properly sorted. It uses
difflib and returns the diff if there's a difference between the
unsorted and sorted list.

Messages beginning with "WARNING:" are reported by the Autobuilder,
which is the reason for this format.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst |  6 +++
 documentation/tools/check-glossaries   | 90 ++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e4d5a9c97..6c2344950 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7,6 +7,9 @@ Variables Glossary
 This chapter lists common variables used in the OpenEmbedded build
 system and gives an overview of their function and contents.
 
+..
+   check_glossary_begin
+
 :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
 :term:`D` :term:`E <EFI_PROVIDER>` :term:`F <FAKEROOT>`
 :term:`G <GCCPIE>` :term:`H <HGDIR>` :term:`I <IMAGE_BASENAME>`
@@ -16,6 +19,9 @@ system and gives an overview of their function and contents.
 :term:`U <UBOOT_BINARY>` :term:`V <VIRTUAL-RUNTIME>`
 :term:`W <WARN_QA>` :term:`X <XSERVER>` :term:`Z <ZSTD_THREADS>`
 
+..
+   check_glossary_end
+
 .. glossary::
    :sorted:
 
diff --git a/documentation/tools/check-glossaries b/documentation/tools/check-glossaries
new file mode 100755
index 000000000..b5dfe834e
--- /dev/null
+++ b/documentation/tools/check-glossaries
@@ -0,0 +1,90 @@
+#!/usr/bin/env python3
+
+import argparse
+import difflib
+import os
+import re
+
+from pathlib import Path
+
+
+def parse_arguments() -> argparse.Namespace:
+    parser = argparse.ArgumentParser(description="Print supported distributions")
+
+    parser.add_argument("-d", "--docs-dir",
+                        type=Path,
+                        default=Path(os.path.dirname(os.path.realpath(__file__))) / "documentation",
+                        help="Path to documentation/ directory in yocto-docs")
+
+    return parser.parse_args()
+
+
+glossaries = (
+    'ref-manual/variables.rst',
+    'ref-manual/terms.rst',
+)
+
+
+def main():
+
+    args = parse_arguments()
+    in_glossary = False
+    # Pattern to match:
+    # :term:`A <ABIEXTENSION>` :term:`B` :term:`C <CACHE>`
+    glossary_re = re.compile(r":term:`(?P<letter>[A-Z]{1})( <(?P<varname>[A-Z_]+)>)?`")
+    entry_re = re.compile(r"^   :term:`(?P<entry>.+)`\s*$")
+
+    for rst in glossaries:
+
+        glossary = {}
+        rst_path = Path(args.docs_dir) / rst
+
+        with open(rst_path, "r") as f:
+            for line in f.readlines():
+                if "check_glossary_begin" in line:
+                    in_glossary = True
+                    continue
+                if in_glossary:
+                    for m in re.finditer(glossary_re, line.strip()):
+                        letter = m.group("letter")
+                        varname = m.group("varname")
+                        if varname is None:
+                            varname = letter
+                        glossary[letter] = varname
+                if "check_glossary_end" in line:
+                    in_glossary = False
+                    break
+
+        entries = []
+
+        with open(rst_path, "r") as f:
+            for line in f.readlines():
+                m = re.match(entry_re, line)
+                if m:
+                    entries.append(m.group("entry"))
+
+        # We lower here because underscore (_) come before lowercase letters
+        # (the natural way) but after uppercase letters (which is not natural)
+        sorted_entries = sorted(entries, key=lambda t: t.lower())
+        diffs = list(difflib.unified_diff(entries,
+                                          sorted_entries,
+                                          fromfile="original_list",
+                                          tofile="sorted_list"))
+
+        if diffs:
+            print(f"WARNING: {rst}: entries are not properly sorted:")
+            print('\n'.join(diffs))
+
+        for letter in glossary:
+            try:
+                index = entries.index(glossary[letter])
+            except ValueError:
+                print(f"WARNING: {rst}: variable "
+                      f"{glossary[letter]} in glossary does not exist")
+            if index > 0 and entries[index - 1].startswith(letter[0]):
+                print(f"WARNING: {rst}: The variable {glossary[letter]} shouldn't be in "
+                     "the glossary.")
+
+
+if __name__ == "__main__":
+    main()

-- 
2.50.1


