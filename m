Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5105ED116FA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18707.1764344116659811000
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LJYrp28e;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BD6D1A1E0B
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 033B060706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B56910B02066;
	Fri, 28 Nov 2025 16:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q+JuhemBn4dvgm6C/l7x8bEukf0xTFSniGB2H1uD64U=;
	b=LJYrp28ePgFqb1A+OXx+4q4DHVWgshaMpImfYncvZ/26wTwkybOm/bwsAJR3mEjm7HNPr6
	Bn/N4iqe2XtffZKo0EXt4J+0KocMp/IKx83PTv6NgZeN9bXlE4VutwTWRPgx891ibuV/2j
	neVtA1e+vWK0GGDCm0DToBq2N92IycUJTFQms2xgRQhs/9qRjd/a8VokCMcyrcJXeZbBsm
	iumVo7c4ihxsR2OcxhO1kWyPju91Fo41bup0BqxIvXuoQX+5GFio2KUWdHPePGLF1TONv6
	mne4+ikvoqQVceyymxZLLn6bngFTTE17MCDu6/PEhx/z7/UAWU8shOG+DzTzog==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:01 +0100
Subject: [PATCH 4/9] tools: add gen-cve-release-notes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-release-note-5-3-updates-v1-4-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2968;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6YdHBN73JjYxj+qkXKWbn4Q9uCWolqWiJIMyVOoLcSE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEuG70GniQwW1OUK6qE9T08WAzkWJb9MKi56
 gZcPg55wN+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLgAKCRDRgEFAKaOo
 NiPuEACSpMt05pSdzmAggmWB97LRoJwkdq3OeWeaYFt84KDXwLrubcLeaU4h0uiWVWMB/TxSky1
 usTYTZ/R+CJthNvzsYKDMEBmUE2xuSZgeBcGhTiLpx8AxaNUnGu4v+QGYvh6/73O7gGM9y651kr
 K8L3rmvhxP23WgzbBLor8uKMWxsO5rlQD/5aSoOaP3oONUNOcs9xDPV4aOGHC+fqK+QVgiIxeXn
 4qV1OKiTecKAEeMPVV/OWhjEi/urAXB4U20hINnee+bjIsDJ9jq0MssfOpfYgQuZkSJBbwTqJ8f
 ImUndFg2AZ6WkeOU2nDi5hyTqoAKjwAt57l+d4zZUGp2dvVNsaryVVsGci8dd8vmhA5SAlWQs3m
 LzpBbVN0VnHGY+KQainwr+6XfqYvclopwCPLig2g/J/g6HIKKyigbfTg7BRf+DkPN9hKLre1Ust
 wdI6UMJG+nUU+JfWG+AAqlbVTlq66s4g0S/klDa+b6++jhh7plH7s7TogRPaCCeRfjXSlTwIfCp
 N7QCVgjQJ3I0RMCklMcuB3NjfTpuWICpNcu0ihTxJiFwDXw3DYLufvEMQLltLAnxzuT81S8zU9H
 XHLq5ruii1sRaxcVpLYN0o+6EBVXKpJ/JiZsWOpI3GNf/6klQg0PJMLhcNOLCbJ4CdTr9wRJVoB
 nQ/Vh0rbqFnZxMw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8166

The gen-cve-release-notes can be used to compare two cve-check reports
and generate a list of "patched" CVEs, and output that in a rST table
format.

By "patched", it means that it meets one of the following condition:
- the CVE status changes from Unpatched to Patched in the new report.
- the Unpatched CVE is unlisted in the new report.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-cve-release-notes | 67 +++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/documentation/tools/gen-cve-release-notes b/documentation/tools/gen-cve-release-notes
new file mode 100755
index 000000000..71d8fe502
--- /dev/null
+++ b/documentation/tools/gen-cve-release-notes
@@ -0,0 +1,67 @@
+#!/usr/bin/env python3
+#
+# Compare two CVE reports and output a formatted rST CVE array (for release
+# notes).
+#
+# We consider that a CVE is "fixed" if either:
+# - the CVE status changes from Unpatched to Patched in the new report.
+# - the Unpatched CVE is unlisted in the new report.
+#
+# Reports can be found here: https://valkyrie.yocto.io/pub/non-release/?type=metrics
+
+import sys
+import json
+
+json_prev_path = sys.argv[1]
+json_next_path = sys.argv[2]
+
+data_prev, data_next = None, None
+
+with open(json_prev_path, 'r') as fd_prev, open(json_prev_path, 'r') as fd_next:
+    data_prev = json.load(fd_prev)["package"]
+    data_next = json.load(fd_next)["package"]
+
+patched_cves = {}
+
+for pkg_prev in data_prev:
+    pkg_name = pkg_prev["name"]
+
+    pkg_next = None
+    for p in data_next:
+        if p["name"] == pkg_name:
+            pkg_next = p
+            break
+
+    if pkg_next is not None:
+        prev_unpatched = [cve["id"] for cve in pkg_prev["issue"] if cve["status"] == "Unpatched"]
+        # next_patched = set([cve["id"] for cve in pkg_next["issue"] if cve["status"] == "Patched"])
+        pkg_patched_cves = []
+        for cve in prev_unpatched:
+            if cve in pkg_next["issue"] and pkg_next["issue"][cve]["status"] == "Patched":
+                pkg_patched_cves.append(cve)
+            if cve not in pkg_next["issue"]:
+                pkg_patched_cves.append(cve)
+
+        if pkg_patched_cves:
+            patched_cves[pkg_name] = sorted(pkg_patched_cves, key=lambda cve: (int(cve.split('-')[1]), int(cve.split('-')[2])))
+
+if not patched_cves:
+    print("No patched CVEs found")
+    exit(0)
+
+# Remove -native duplicates
+for pkg in list(patched_cves):
+    if pkg.endswith("-native") and pkg[:-len("-native")] in patched_cves:
+        patched_cves.pop(pkg)
+
+print(""".. list-table::
+   :widths: 30 70
+   :header-rows: 1
+
+   * - Recipe
+     - CVE IDs""")
+
+for pkg in sorted(patched_cves.keys()):
+    cves_rst = ", ".join([f":cve_nist:`{c[4:]}`" for c in patched_cves[pkg]])
+    print(f"   * - ``{pkg}``")
+    print(f"     - {cves_rst}")

-- 
2.51.0


