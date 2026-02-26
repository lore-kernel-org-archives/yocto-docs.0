Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280DBFCE08C
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:01:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70542.1772114469453103809
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 06:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zoQ6N+LO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17F54C40693
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F6D65FDEB
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A15A10369332;
	Thu, 26 Feb 2026 15:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772114463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Upv7KXTvIDBzYWXkhYlzpenVFmQY0RxX12qoLRz25aU=;
	b=zoQ6N+LOIrPwhQ5IAq76ry6By+lDBWfjJuVCt5RBTPwmuhC3V5+in5FUJSdVQ4ij0tRW8L
	hbspODn3cnuvnADh6LN/s6NJy9/PVusYkgs39wESwpaoSF9URUedBYNutyTfK2ZNYKbajm
	YL1dgtyCdr04YR+fJhmZFz0Vt+iFL7EMiF7w2OXkifkhDVrQzZLbKfnlWrXTmCBXbYXX1S
	FqUbHy7TkNT1kXrDL4tbzmFAbhQ5n00O2ajlvCzadBjQ1ndsjbfDK+mo0Epg/h0wjX+IXj
	l27hPJi1Gj0fhT2SLIYjbMdGVCSWk5NxHW4lI5HKgYUXQd9t6TCkMIiknHGldQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Feb 2026 15:00:46 +0100
Subject: [PATCH v2 2/3] set_versions.py: build with versions from
 releases.json
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-releases-json-v2-2-6ba4a3b37b24@bootlin.com>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
In-Reply-To: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6ox9eWG6zqfPZDnpjCPZdy7e/W4f84g86B5K+oudSTg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpoFIUyh5Njef9yHpEf3ZenTfS4BYvt+tCqQfta
 RgoJX9PRI2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaBSFAAKCRDRgEFAKaOo
 NpggD/9N3MOtclsd5d2JRXAmgKS4BJgBupeXiHA8xM3JvxNAmsfdJvaMWXnSKiMFSLiuQM2lMKc
 QJ+L1KSybZhC2B/nuxzLd0bIJB9S+9CDSxDmSxsInbVE+VAJlXUAJjcg+NarK+uE2K/rCkRHtJo
 5bpzBRK+cjBvr+GRDamHSSb5Wg4NkycgDIdl9/y9l/27WQEx+Mx0VhQSlta2VoohaPg5x+l6X/d
 2jYMDJgfIlot1fJZk9pfsJGNoax5kiHsiFOGpMpAyMYaev+VX3zX1G6IWHFu3EBF7WGW3Qg4IKB
 CTlj/ySnzgzHJ1YzaTdMWo71bs7FfS7Oc6dNpc/SqDhy07B8y/CZshUb8gb79y6X5/6TlsBTx96
 z/wMCOSD52OJcu8fD9dMf93OH5vEdPoNVka1/GDtmyHmc76crO8DZHD9FSGDSHusPz1euqyYBqn
 bRAVjUfcSNDwTFKsZg2uEv9OZteO807lcL+HiiGMc0WyjEU3rJuvEXXvSEhMraZAmiOFMDsILIQ
 8EkpMh4FRb8OBjXRFl4Htt8I6G6WroBGTQMa93kiuLFj1uRu072waiHEBHVYKlTwgYeCuuBlUx7
 bUq6zfLm8zFyFWAy6/0L9UNEK8hb78jFuWT0pOZb+23vqnnHIy5AyH7LpSvOe29f+vQnLEmSog4
 WwvXOxjxeGGlQZw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8997

Build using the releases.json file obtained with
./documentation/tools/fetch-releases-json. This file needs to be
updated each time a new release is out.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 81 ++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 96903e14c..aa7c57062 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -11,57 +11,60 @@
 #
 
 
+import json
 import subprocess
 import collections
 import sys
 import os
 import itertools
 
-# Order matters: most recent to least recent
-activereleases = ["whinlatter", "scarthgap", "kirkstone"]
-devbranch = "wrynose"
-ltsseries = ["wrynose", "scarthgap", "kirkstone"]
+from typing import Any, List, Dict, Tuple
+
+def get_releases(releases: Dict[str, Any]) -> Tuple[List[str], str, List[str],
+                                                    collections.OrderedDict]:
+    """
+    Go through a releases which is the opened releases.json file as
+    a dict, and return a tuple containing:
+    - the activereleases list: list of active release codenames
+    - the current dev branch
+    - the list of LTS releases (codenames)
+    - a dictionary mapping codename to point release series (e.g. "whinlatter": "5.3")
+    """
+
+    release_series = collections.OrderedDict()
+    activereleases = []
+    devbranch = ""
+    ltsseries = []
+
+    for release in releases:
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
+
+    return activereleases, devbranch, ltsseries, release_series
+
+releases = {}
+
+with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "releases.json"), "r") as f:
+    releases = json.load(f)
+
+activereleases, devbranch, ltsseries, release_series = get_releases(releases)
 
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

-- 
2.52.0


