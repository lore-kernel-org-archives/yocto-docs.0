Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42191.1793192120046677889
 for <docs@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 05:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a6MEPF0/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C9A601A1377
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 12:55:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A22060769
	for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 12:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF4D3103290B1;
	Wed, 28 Oct 2026 13:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793192113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=m75a1jnNyzUPdClBYj9TvcifHp0fuFD5l4CXaB6TA+w=;
	b=a6MEPF0/xNUZ9u+YYC4vMHUwB6JlTrQ+r+LFmh/8fD05S/4B9ktGd2fl/vTftrE/gVup7x
	Ijn5sO1A9ORtDn7ySqIDfIGcBcJAQiaAXGWQTtRqPTrRR9a41ddKHLiyiPWmVYuOM6lax+
	sGMkWGsP/kLd6GIyrxIWyVRcLVF/e/ckY7zUZi8oQq7Nzv7qH8YKRuNtm9mVmzUgc34+YZ
	S/JzOxpDN3vPpqFHbOadukk4RAn7nV+qCOmLwUVnIZf+VVnkIf9KD7mAwWWvrMwFai9LpF
	kZxMZ7KHvvv5iqNYgiLrG6JV1W1Q5CFthclGn/4KsXEPoR7sEmv/e04MzRGbgg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 Oct 2026 13:55:02 +0100
Subject: [PATCH v2] tools/obsolete-variables: add script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-missing-variables-v2-1-eb6c32c4a8fe@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2ppSeenK/zAsmDLCGGxNBxsN4
 d8FjDuXJzn33AmEApPAKZkgUGRh7xYwuwRs37iOFLcLg9Gm0JVJ1Z1F2HUqNoEbHEiULfIMS43
 Hos1g2T0CXfm1NS/1l+WJN7LjGlqNnmX04b2dxnT1fv3yTz+mSquSbIW5ydEc8IzejwO7vfV3q
 Od5/gAyCoGUxgAAAA==
X-Change-ID: 20260821-missing-variables-c654b70b96d4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5802;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=APh20NE+OCnoDQxbkexnQtPlzjznQD3FzXh0SdyAk1c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq4fCoP8rxwdjRFGkeRxkEPQjLmkGhyTleB1bNY
 KSMFSk8fk2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauHwqAAKCRDRgEFAKaOo
 Nh1cD/9JFv4pQpZce5dwfTmzcXVdGf/yhzInWTPcsZvr9njQbidVqp07QZEZ6qet1jAoELpd59S
 GIfhaMQ4BP4PgOyToGxUn/pDIi9RaklLDVZOZCvAMY75hzCAQZnnP8oVFDTpjCDEB/5+39yCn9I
 0QXHiDAfOpOMpHs3fv0TJnMALNcHz8HG4HkHz6g+oQT/+DpahLcgMiBg/NRilnV9KYImQfyynfR
 7/03Ptm6DE2tWVbk8xoQG9A+8+LGpuvkFb/GBMtY6SlQAFn0g1NxIN6ojV9c850fQ8mvaq7YjML
 7SSNYindWE0DcrfC+WLu+uw7AV4nGI/2fpVpL8dJYv00uFxGKmwvdofBst4GAVEu7tum9/2c4fC
 xYMHMRtpXLC+9kykXXU3sn9TitlXmpQwjdoZQNRSA4haqWhyOFn96zgI82uUJKjYOX+4JTiJhAQ
 FwmckbCuetif7MkkGgfsErm7WttcuySZY6rdiSvmplKzldJrAQbBD/R5oSOeco/HUXbmwawsVks
 ucTrEIxg3n0W54JNOXCKheUCCCW1K93MDSyHPjNA23SrbZ7zXZT5H4hhQZmsd+hd4ebl4Rzg+D9
 0GJtxt1r+9zJm4rZzbzSkt8srIL+7BNTxV0HlBcxvlvheT5vwxEgiOnza7ifN8y2EUIqSSC1HnJ
 bEwRostPmrBSdXw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 28 Oct 2026 12:55:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10737

Add a script that outputs missing variables from
OE-Core/meta-yocto/BitBake, i.e. for which grepping returned nothing.

There are a few exceptions, which are listed in VAR_EXCEPTIONS.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
First patch of this series proposes a new script that tries to detect
variables missing from OE-Core, meta-yocto, and bitbake. It is simple in
design as it just uses 'git grep' for that, plus a few exceptions.

The remaining patches remove variables that have been detected by the
script.
---
Changes in v2:
- Take suggestions from Quentin (thanks!)
- Only keep script in series as other patches were merged.
- Link to v1: https://patch.msgid.link/20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com
---
 documentation/tools/obsolete-variables | 135 +++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/documentation/tools/obsolete-variables b/documentation/tools/obsolete-variables
new file mode 100755
index 000000000..d38ecbb6c
--- /dev/null
+++ b/documentation/tools/obsolete-variables
@@ -0,0 +1,135 @@
+#!/usr/bin/env python3
+#
+# SPDX-License-Identifier: MIT
+#
+# Author: Antonin Godard <antonin.godard@bootlin.com>
+#
+# Copyright (C) 2026 Bootlin
+#
+
+import argparse
+import logging
+import subprocess
+import sys
+
+from pathlib import Path
+from sphinx.util.inventory import InventoryFile
+from typing import List
+
+
+DOCS_DIR = Path(__file__).parent.parent
+# False positives:
+# - variables we know exist but have a specific syntax
+# - we keep documentation for it here, already saying it is obsolete
+VAR_EXCEPTIONS = (
+    "CONFLICT_IMAGE_FEATURES",
+    "CONFLICT_TUNE_FEATURES",
+    "FEATURE_PACKAGES",
+    "LAYERRECOMMENDS",
+    "REQUIRED_IMAGE_FEATURES",
+    "VIRTUAL-RUNTIME",
+    "module_autoload",
+    "module_conf",
+)
+
+
+def parse_arguments() -> argparse.Namespace:
+    parser = argparse.ArgumentParser(description="Use the Sphinx's inventory to "
+                                     "check for variables not present in "
+                                     "OE-Core/meta-yocto/BitBake")
+
+    parser.add_argument("--debug",
+                        action="store_true",
+                        help="Print debug messages")
+
+    parser.add_argument("--yocto-docs-inv",
+                        type=Path,
+                        default=DOCS_DIR / "_build/html/objects.inv",
+                        help="Input yocto-docs inventory file")
+
+    parser.add_argument("--bitbake-inv",
+                        type=Path,
+                        default=DOCS_DIR / "_build/doctrees/__intersphinx_cache__/bitbake_objects.inv",
+                        help="Input bitbake inventory file")
+
+    parser.add_argument("oecore_dir",
+                        type=Path,
+                        help="Path to openembedded-core")
+
+    parser.add_argument("meta_yocto_dir",
+                        type=Path,
+                        help="Path to meta-yocto")
+
+    parser.add_argument("bitbake_dir",
+                        type=Path,
+                        help="Path to bitbake")
+
+    return parser.parse_args()
+
+
+def var_exists_in(var: str, gitdir: Path) -> bool:
+    """
+    In gitdir, check if a grepping for "<var>" return something (then return
+    True, False otherwise).
+
+    Special case where in OE-Core we can have:
+        BB_RENAMED_VARIABLES[<var>] = "..."
+    Then exclude that.
+    """
+    cmd = [
+        "git", "-C", gitdir, "grep", "--extended-regexp",
+        "--max-count=1", "--quiet",
+        "-e", fr"\<{var}\>", "--and", "--not",
+        "-e", fr"BB_RENAMED_VARIABLES\[{var}\]"
+    ]
+    try:
+        subprocess.run(cmd, check=True)
+    except subprocess.CalledProcessError:
+        return False
+
+    logging.debug(f"{var} found in {gitdir.name}")
+    return True
+
+
+def var_exists(var: str, repos: List[Path]):
+    return any(var_exists_in(var, d) for d in repos)
+
+
+def check_inventory(inv_path: Path, uri: str, repos: List[Path]) -> int:
+    exit_code = 0
+    inv = InventoryFile.loads(inv_path.read_bytes(), uri="")
+    for entry, inv_item in sorted(inv.data["std:term"].items()):
+        if inv_item.uri.startswith(uri) \
+                and entry not in VAR_EXCEPTIONS \
+                and not var_exists(entry, repos):
+            exit_code = 1
+            logging.error("Variable %s not found in OE-Core, meta-yocto, or BitBake" % entry)
+    return exit_code
+
+
+def main():
+    exit_code = 0
+    args = parse_arguments()
+
+    if args.debug:
+        logging.basicConfig(format="%(levelname)s: %(message)s", level=logging.DEBUG)
+    else:
+        logging.basicConfig(format="%(levelname)s: %(message)s")
+
+    if not (args.yocto_docs_inv.exists() and args.bitbake_inv.exists()):
+        logging.error(f"yocto-docs and bitbake inventories not found at {args.yocto_docs_inv}/"
+                      f"{args.bitbake_inv}. Build the documentation or use the "
+                      "--yocto-docs-inv/--bitbake-inv options")
+        sys.exit(1)
+
+    exit_code = check_inventory(args.yocto_docs_inv, "ref-manual/variables.html#term-",
+                                (args.oecore_dir, args.meta_yocto_dir, args.bitbake_dir))
+
+    exit_code = check_inventory(args.bitbake_inv, "bitbake-user-manual/bitbake-user-manual-ref-variables.html#term-",
+                                (args.oecore_dir, args.meta_yocto_dir, args.bitbake_dir))
+
+    sys.exit(exit_code)
+
+
+if __name__ == "__main__":
+    main()

---
base-commit: 7b54854d12f3f2c909727702d39066a3d22a4a40
change-id: 20260821-missing-variables-c654b70b96d4

