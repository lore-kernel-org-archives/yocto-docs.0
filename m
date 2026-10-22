Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23034.1792676305700632983
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 06:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AmvbniWT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D11FC4E412B4
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A072760360
	for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E08B410328ECF;
	Thu, 22 Oct 2026 15:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792676303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t92+4VUTHREXVOYSg3iD6XT1dreRoNys9P+omL4U40A=;
	b=AmvbniWTjoVGVhqqg3HfhiUZz8m3b7/wE7yEEutyLHGZdpLa5AQqT2zXFSgGsbaDJ9TLq1
	pQsUea+Az1G7Wz4tHHTdXR7zD9tTckEOuSkZoyasF2R93hAFFOIzO6oZuVF3sP5pRa7TB/
	FBXRijrdWnbmjvlQQOP9gjFDJ7QE71B80R77WaRhJ7Ut2kI0Zcb0oFXB6DQJmlbVo9UM2F
	BJFcPLvmxRHLQZbaPz+EHfz6pE0iSZ4qS+BsdZ9lpfQb4YmaENoOtZdzdaldsb2+eSgoVx
	SoDV/D7+IzKJN4+/y8y7pJYJXgy0h7n39Xv5nJn6miPYEZe4jhn6TNkkRe5zvg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 22 Oct 2026 15:37:51 +0200
Subject: [PATCH 1/3] tools/gen-releases-svg: add script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-mermaid-release-diagram-v1-1-3351b5799dd9@bootlin.com>
References: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
In-Reply-To: <20261022-mermaid-release-diagram-v1-0-3351b5799dd9@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4158;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=3HsGs/pAJ+M8zAS5UckLZieeCDHXehki91rfUa6e1kU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq2hHKGdUkrXTbty9R7LZv4yfYDnFz8beXrIGE5
 qmyBvOjL4eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCatoRygAKCRDRgEFAKaOo
 NlRvD/9MWctQxznL5bNUb6oAURK03sWh/6AB21/gRD/le2gnIXQa4UsVfDWh04ogLTy7gYFIJBF
 abNrvNdIGXxpW4omjmxJ0NDUAtZmeI6C1rWQQZpprM03F+XL5S8fQizb6I+GHdfviREEZfc6bWF
 HOtyJ4HjM/lfWV0KluHLr8cZbuwEydEd4z+QsbokwKehFGOCqUfoJnmTsm24Dst9CEBLYGisI1i
 WF2zWTeVcY0le9cIHSngvbCSFAFNpveb9o53pP+5yMkORr2iIRMkZKzKnrlB4iX5i2GjEy/2yY4
 32UM0/sTFMvCWYWASZ0PLGWZ7NP7yB6PfBbN701gzZm4zr81ezVPf57JBtfxND620WMqHwhwKH/
 tIeuHbmFNSdS2C/zL8cvg1W2k5k4lrjXqhhT2VQ7iDbTRL/j0KQr8nYhuTxV4QokyTqLeWusazl
 TdZJXkaUnFc8UjTcx7jHrPO7Qhgb0zFUpn3bTzfB0Ia5M6ruy2HabUQWoBPGv4fQveLyGz9UlcO
 crez5qBtL0wlPvxuhb3QxKduL6Hc+Luu/HZ9d0zOXIon+X946FfnjOvHvJB3zWpFKEWlq1Eiu1y
 s01Bm5QcAAJg1GYDDg4CcuKisTguZ1dQ38rOrdQEe+mKa/uQzXQ7MCzj2cyRkD01gc61YsCXLkZ
 31ZBsR9Ox4T3ZNA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 22 Oct 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10713

Add a script that can be used to generate the releases.svg diagram by
parsing the releases.json file available at
https://dashboard.yoctoproject.org/releases.json.

This should be done periodically when new releases come out.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/gen-releases-svg | 95 ++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/documentation/tools/gen-releases-svg b/documentation/tools/gen-releases-svg
new file mode 100755
index 000000000..e091c02de
--- /dev/null
+++ b/documentation/tools/gen-releases-svg
@@ -0,0 +1,95 @@
+#!/usr/bin/env python3
+#
+# Parse releases.json (from https://dashboard.yoctoproject.org/releases.json)
+# and output a Gantt diagram that shows the state of releases.
+#
+# Copyright (c) Antonin Godard
+#
+# SPDX-License-Identifier: MIT
+#
+
+import argparse
+import datetime
+import json
+import shutil
+import subprocess
+import sys
+import tempfile
+
+from pathlib import Path
+
+parser = argparse.ArgumentParser(
+    description="Parse releases.json and output a releases.svg file"
+)
+parser.add_argument("-i", help="Path to the releases.json file", dest="releases_json_path",
+                    default=Path(__file__).resolve().parent.parent / "releases.json")
+parser.add_argument("-o", help="Path to the output SVG", dest="output",
+                    default=Path(__file__).resolve().parent.parent / "ref-manual/svg/releases.svg")
+args = parser.parse_args()
+
+if not shutil.which("mmdc"):
+    sys.exit("mermaid-cli is required for this script to run")
+
+MMD_HEADER = """---
+config:
+  fontFamily: '"Nimbus Sans", Helvetica, Arial, sans-serif'
+  gantt:
+    leftPadding: 5
+    useWidth: 1600
+    useMaxWidth: false
+  themeVariables:
+      activeTaskBkgColor: '#edf5f9'
+      activeTaskBorderColor: '#00557d'
+      sectionBkgColor: '#eff6f9'
+      sectionBkgColor2: '#eff6f9'
+---
+%% Generated with documentation/tools/gen-releases-mmd
+gantt
+    dateFormat YYYY-MM-DD
+    axisFormat %b %Y
+    tickInterval 6month
+    todayMarker off
+"""
+
+with open(args.releases_json_path, "r") as f:
+    releases_from_json = json.load(f)
+
+with tempfile.TemporaryDirectory() as tmpdir:
+    mmdpath = Path(tmpdir) / "diagram.mmd"
+    with open(mmdpath, "w", encoding="utf-8") as mmd:
+        mmd.write(MMD_HEADER)
+
+        first_active_rel_found = False
+        for release in releases_from_json:
+            codename = release["release_codename"]
+            series_version = release["series_version"]
+            if release["status"] == "Active Development":
+                mmd.write(f"    {codename} {series_version} :done, after current_rel, 6M\n")
+                continue
+            if not release["original_release_date"]:
+                continue
+            original_release_date = datetime.datetime.strptime(release["original_release_date"], "%Y-%m-%dT%H:%M:%S%z")
+            if original_release_date < datetime.datetime(2022, 4, 1, tzinfo=datetime.timezone.utc):
+                continue
+            original_release_date = original_release_date.date().isoformat()
+            end_date = datetime.datetime.strptime(release["latest_release_date"], "%Y-%m-%dT%H:%M:%S%z")
+            end_date = end_date.date().isoformat()
+            lts = False
+            if "LTS until" in release["status"]:
+                lts = True
+            status = "done"
+            if release["series"] == "current":
+                status = "active"
+                if not first_active_rel_found:
+                    status += ", current_rel"
+                    first_active_rel_found = True
+                end_date = "6M"
+                if lts:
+                    end_date = "4y"
+            mmd.write(f"    {codename} {series_version}{" (LTS)" if lts else ""}"
+                      f" :{status}, {original_release_date}, {end_date}\n")
+
+    result = subprocess.run(
+        ["mmdc", "--input", mmdpath, "--output", args.output],
+        check=True,
+    )

-- 
2.55.0

