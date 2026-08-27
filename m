Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D1CC61DC7
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:47:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31339.1787816844455840944
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 00:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0JFosjvc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CE1AE1A185C
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9B98B602B8
	for <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1016911C78273;
	Thu, 27 Aug 2026 09:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787816838; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ihEWUovt1LW599tBNl0UWD9ID7cjw3K39Gd2B3n5raE=;
	b=0JFosjvcy7YTO0/hkJGJpDCd2c0t8LpyX+8dMIbGMcTBpUWcN2DHe4ag1fq0hSyNQU04zj
	E1teGFfQvazkkA8+luVE57UuRtwa1NjocmYtIk1eHie9ccKQljjB2mQ73xg7uMjcHhI2+o
	w66r5Hywl2yZjRRIhI+uo4g+H1ASYlHkdMiF/qEKu9jOlrBiTIOW6MaolfLr+kQ5MEyq3E
	bqD6sQS/3pe/8Of4RBtpnQnuSzR0FkJsuVcIVsiQFa8flsvMDAhWHgqo+QIrE0FWZo0IDM
	fLVvHaoOwphEqi1MzT7eX7Ho9Ms6/x3CxxZKNK/TAwCFDEDTHoLH33HcKOwMRA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 27 Aug 2026 09:46:57 +0200
Subject: [PATCH 1/4] tools/obsolete-variables: add script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-missing-variables-v1-1-7ec8b525b23b@bootlin.com>
References: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
In-Reply-To: <20260827-missing-variables-v1-0-7ec8b525b23b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5511;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=mnr2ANZlzQuTeWwOfsyjyf4y4RFYr1HOTmDQemP7SEg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqj+t/fZyqCXuc2eBJQCSDx78rNRvNmirYPQ0Cd
 fkNudgm566JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao/rfwAKCRDRgEFAKaOo
 NmrtEACkf/fa+N6ZLo/fgEadCpwL+pffmAskgP53cqph/nPtdhbtla9baDPZsHhgtoxkFYRMFdw
 hTpazixH4Gda6ROsTEfQq/+TLvJ+NfboVLWobPvaQ0RNQxd5Ciem5XPi0KNnOS7bnm0u0C4YaWx
 Cn0u7Oqv++NQY43SnOt2tzgSBkSnY+lHlxQYp/EtXA0wuOCIWuL6QQWLNkjuwbJ2j2kngRpk9dx
 RGKvxSqylDuY0apCHjnR5dUQCzX6Q5qJwLxkctY/laRNqUtALCDzStS18pSu3qFi0g3PP54+Bi3
 DltjIKiYUDBmvWe94k6WAjdaDkuywcnvkrD7lmfncMdUHlNvQXyeJOJt/HKNIk/eX+vR8Mz1TK+
 M/0AZUVsNltzxf/pDjPRZHJF6Zrm/LF1HolTrcIKuZuKKAz9y/UizVJupcTyMdw0eQs2rH7ZiVV
 argfFOY3Fqx2ayTuXMYlsHB5R1dN0Gf95/OvkYYhMZHSMliDRHQtZb8ZYKxGgJaSMNYslIMLHV0
 xR3Qg6jcNhN2iEVjoJtgp9wPPRF73kPGPS5b5r/Aw97tD/4OXie5VHCdb7zr7hlkATK9TNTCEgt
 PAOFk9X2wLFSZRNNNk0iUxBYmlUiFvwTEwb8jwr+wotXhxXdO2iC8rVkQxDBtu5zHU9egj+CFty
 YdDXER8+xMc1DVw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Aug 2026 07:47:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10373

Add a script that outputs missing variables from
OE-Core/meta-yocto/BitBake, i.e. for which grepping returned nothing.

There are a few exceptions, which are listed in VAR_EXCEPTIONS.

The script currently returns:

  ERROR: Variable CVSDIR not found anywhere
  ERROR: Variable FIT_KERNEL_COMP_ALG_EXTENSION not found anywhere
  ERROR: Variable USERMOD_PARAMS not found anywhere

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/obsolete-variables | 142 +++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/documentation/tools/obsolete-variables b/documentation/tools/obsolete-variables
new file mode 100755
index 000000000..bc97cbb71
--- /dev/null
+++ b/documentation/tools/obsolete-variables
@@ -0,0 +1,142 @@
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
+ERR_MSG = "Variable %s not found in OE-Core, meta-yocto, or BitBake"
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
+        "git", "-C", gitdir, "grep", "--extended-regexp", fr"\<{var}\>",
+    ]
+    _out = ""
+    try:
+        _out = subprocess.check_output(cmd, encoding="utf-8")
+    except subprocess.CalledProcessError:
+        pass
+
+    out = ""
+    for line in _out.splitlines():
+        if not line.startswith(f"BB_RENAMED_VARIABLES[{var}]"):
+            out += f"{line}\n"
+
+    if out:
+        logging.debug(f"{var} found in {gitdir.name}:\n{out}")
+        return True
+
+    return False
+
+
+def var_exists(var: str, repos: List[Path]):
+    return any(var_exists_in(var, d) for d in repos)
+
+
+def check_inventory(inv_p: Path, uri: str, repos: List[Path]) -> int:
+    exit_code = 0
+    inv = InventoryFile.loads(inv_p.read_bytes(), uri="")
+    for entry, inv_item in sorted(inv.data["std:term"].items()):
+        if inv_item.uri.startswith(uri) \
+                and entry not in VAR_EXCEPTIONS \
+                and not var_exists(entry, repos):
+            exit_code = 1
+            logging.error(ERR_MSG % entry)
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

-- 
2.55.0


