Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A8CEB7EB0
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 08:39:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13798.1772613580474967551
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 00:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wXLlybEV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FD41C40FBD
	for <docs@lists.yoctoproject.org>; Wed,  4 Mar 2026 08:39:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 393675FF5C
	for <docs@lists.yoctoproject.org>; Wed,  4 Mar 2026 08:39:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A87A103695DA;
	Wed,  4 Mar 2026 09:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772613577; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=0uVQRmIQrKEdXOAWB1sEQbyiDbA6fCLjIid1QpIIyhM=;
	b=wXLlybEVkzGHB5pZ87r7AkI79ftvnv3satwlxU6dQtZFGp/J+3Hb7gWvLCDoN0VhOWgExp
	7s0dbnWY3kSzyrTZYF8/u42l+/Ju62g7mpG12uBbxjUvfmp4QtztqajFRkenhfXNJhGElu
	dsjnvmcyalskTA3Q6/mTVb7PBd3p2JAHhhaAoXmqzeiODYBOUg8ED7FquZWcNFhWe2jrY4
	QHC/WijHsyYPkTbq7ksx1rCz9Yzu5NloDZA+xjkqR4I1wrLcPxB5xUx0tFv3fVuKYXqPxp
	s359KBoMx6KEu4700jIbblWWEOJfTVI9GDXyHA2APhGsef6lpFxE45XzxTon1Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Mar 2026 09:39:22 +0100
Subject: [PATCH v3] set_versions.py: build with versions from releases.json
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-releases-json-v3-1-fdde0b9ba93b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw7CIBQFf6VhLYZHH+LK/zAuoFwsTS0GKtE0/
 XehxkS7nOTMnBkF8BYCOhYz8hBtsG5MwHcFajs5XgFbnRgxwmrCGMceBpABAu6DG7HgptKHUmv
 BJUrO3YOxz7V3vnw4PFQP7ZQjedHZMDn/Wg8jzbtvu9q0I8UEGwBuCFWCiuaknJsGO+5bd0O5H
 tmvX299lvxayVJyxRvFyn9/WZY3b1sZy/4AAAA=
X-Change-ID: 20260223-releases-json-93f5d84dd93a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6194;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=DMQiNrVea2LcCW2RJBCkTYDEVSsYXldoyGB4Q/Mmatw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpp+/Iaph2zkG9zxCPV9oK2PA5INQGic7ew9ZiM
 wvVET7w9CyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaafvyAAKCRDRgEFAKaOo
 NgtKD/0SSTYDT92Mxr4DUkPRTDwSU/Z0j3Hg/Qf8gi73IIzrQrmnqOt3+GneDSJZbP/bUk5Gd83
 gLLPame7QLfQcqpjV/nuIJu2x9BnHsBasST1dOWl08OZsSymfXSYO7MkvsW8XK4H5Vuuo5QIpQ9
 VWyhARIY31GGsiZ+Bxpu0lGyAFYr1WrmJnfqUJo/RnPG3urBVrAtNyNYzS2CQ2A0ewkl6whZol6
 FKZDNczNCMgL18eaUv+NsTS39OZyeuCOB5CH1yVljTAHGcFUXx3iVCveGv0oUOd0gB8ls+842X8
 GIdK7edpMzmI6jmNTzGVPxCtDbY1VRIsmNatWI34+5brP7r3+kfLSoEzzLV/1upuScM55zCtc7K
 NDKkWbTmRguNH0oavaDUqjSj/pPGu63Thve1oT0hSd7V54dPGABra7kFPTukarD4yRbLh438pl9
 eHVUc1CqgeS+AFd8XqULBH4NGnSEWqSDO8UjbiyrnV3dqHJvval6+ChkAUf4XUQ/1KLyubzdcZB
 JQ8VxrGKBY0+IetLZ7WjbbmOIYlSxzJlBuhAZiOhiXof8t/DOR7IJ2dx2NTDtzsOt6yxqVvExM2
 KXqEfcoTMCK38HQ+MVI7fl7w+RutngCUlknIghk9m+MKkthmCLPCprxY01xuxTh5Sb+T3z0LYz9
 yH0QRGpQwWq1Wcw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Mar 2026 08:39:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9056

Build using the releases.json file obtained from
https://dashboard.yoctoproject.org/releases.json. If this file is
already downloaded, don't fetch it again.

If we fail fetching the file, use default values (and print a warning).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v3:
- Reduce series to a single patch. We now download the releases.json
  file on the first build of the documentation, and re-use it for the
  following builds.
- Fallback on default values in case we failed to fetch and no
  releases.json is present.
- The Makefile clean target also removes the releases.json file.
- Link to v2: https://patch.msgid.link/20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com

Changes in v2:
- add a python script to fetch and format the releases.json file
- instead of a make target, make it possible to use a different
  releases.json file using an environment variable
- Link to v1: https://patch.msgid.link/20260225-releases-json-v1-0-fee3f01b9197@bootlin.com
---
 documentation/.gitignore      |  1 +
 documentation/Makefile        |  2 +-
 documentation/set_versions.py | 88 +++++++++++++++++++++++++------------------
 3 files changed, 54 insertions(+), 37 deletions(-)

diff --git a/documentation/.gitignore b/documentation/.gitignore
index b23d59805..d6d020efb 100644
--- a/documentation/.gitignore
+++ b/documentation/.gitignore
@@ -9,3 +9,4 @@ releases.rst
 */svg/*.pdf
 styles/*
 !styles/config
+releases.json
diff --git a/documentation/Makefile b/documentation/Makefile
index d9964822d..fe0574537 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -33,7 +33,7 @@ publish: Makefile checks epub latexpdf html singlehtml
 	sed -i -e 's@index.html#@singleindex.html#@g' $(BUILDDIR)/$(DESTDIR)/singleindex.html
 
 clean:
-	@rm -rf $(BUILDDIR) poky.yaml sphinx-static/switchers.js releases.rst
+	@rm -rf $(BUILDDIR) poky.yaml sphinx-static/switchers.js releases.rst releases.json
 
 checks:
 	$(SOURCEDIR)/tools/check-glossaries --docs-dir $(SOURCEDIR)
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 96903e14c..08be8c665 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -11,57 +11,73 @@
 #
 
 
+import json
 import subprocess
 import collections
 import sys
 import os
 import itertools
 
-# Order matters: most recent to least recent
+from urllib.request import urlopen, URLError
+
+# NOTE: these variables contain default values in case we are not able to fetch
+# the releases.json file from https://dashboard.yoctoproject.org/releases.json
 activereleases = ["whinlatter", "scarthgap", "kirkstone"]
 devbranch = "wrynose"
 ltsseries = ["wrynose", "scarthgap", "kirkstone"]
+release_series = collections.OrderedDict({
+    "wrynose": "6.0",
+    "whinlatter": "5.3",
+    "scarthgap": "5.0",
+    "kirkstone": "4.0",
+})
+
+releases_from_json = {}
+
+# Use the local releases.json file if found, fetch it from the dashboard otherwise
+releases_json_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "releases.json")
+try:
+    with open(releases_json_path, "r") as f:
+        releases_from_json = json.load(f)
+except FileNotFoundError:
+    print("Fetching releases.json from https://dashboard.yoctoproject.org/releases.json...",
+          file=sys.stderr)
+    try:
+        with urlopen("https://dashboard.yoctoproject.org/releases.json") as r, \
+                open(releases_json_path, "w") as f:
+            releases_from_json = json.load(r)
+            json.dump(releases_from_json, f)
+    except URLError:
+        print("WARNING: tried to fetch https://dashboard.yoctoproject.org/releases.json "
+              "but failed, using default values for active releases", file=sys.stderr)
+        pass
+
+if releases_from_json:
+    release_series = collections.OrderedDict()
+    activereleases = []
+    devbranch = ""
+    ltsseries = []
+
+    for release in releases_from_json:
+        codename = release["release_codename"].lower()
+        release_series[codename] = release["series_version"]
+        if release["status"] == "Active Development":
+            devbranch = codename
+        if release["series"] == "current":
+            activereleases.append(codename)
+        if "LTS until" in release["status"]:
+            ltsseries.append(codename)
+
+    activereleases.remove(devbranch)
 
 # used by run-docs-builds to get the default page
 if len(sys.argv) > 1 and sys.argv[1] == "getlatest":
     print(activereleases[0])
     sys.exit(0)
 
-release_series = collections.OrderedDict()
-release_series["wrynose"] = "6.0"
-release_series["whinlatter"] = "5.3"
-release_series["walnascar"] = "5.2"
-release_series["styhead"] = "5.1"
-release_series["scarthgap"] = "5.0"
-release_series["nanbield"] = "4.3"
-release_series["mickledore"] = "4.2"
-release_series["langdale"] = "4.1"
-release_series["kirkstone"] = "4.0"
-release_series["honister"] = "3.4"
-release_series["hardknott"] = "3.3"
-release_series["gatesgarth"] = "3.2"
-release_series["dunfell"] = "3.1"
-release_series["zeus"] = "3.0"
-release_series["warrior"] = "2.7"
-release_series["thud"] = "2.6"
-release_series["sumo"] = "2.5"
-release_series["rocko"] = "2.4"
-release_series["pyro"] = "2.3"
-release_series["morty"] = "2.2"
-release_series["krogoth"] = "2.1"
-release_series["jethro"] = "2.0"
-release_series["jethro-pre"] = "1.9"
-release_series["fido"] = "1.8"
-release_series["dizzy"] = "1.7"
-release_series["daisy"] = "1.6"
-release_series["dora"] = "1.5"
-release_series["dylan"] = "1.4"
-release_series["danny"] = "1.3"
-release_series["denzil"] = "1.2"
-release_series["edison"] = "1.1"
-release_series["bernard"] = "1.0"
-release_series["laverne"] = "0.9"
-
+print(f"activereleases calculated to be {activereleases}")
+print(f"devbranch calculated to be {devbranch}")
+print(f"ltsseries calculated to be {ltsseries}")
 
 bitbake_mapping = {
     "wrynose" : "2.18",

---
base-commit: d97cfeaa55ed42722998d3313c1857aa377f6881
change-id: 20260223-releases-json-93f5d84dd93a


