Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB63C04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 08:32:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.4704.1666686729639933100
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 01:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.199, mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id AD730FF804;
	Tue, 25 Oct 2022 08:32:06 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: 
Cc: docs@lists.yoctoproject.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [RFC] [PATCH] docs: add support for langdale (4.1) release
Date: Tue, 25 Oct 2022 10:31:50 +0200
Message-Id: <20221025-langdale-v1-0-f953d47d02c9@theobroma-systems.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Oct 2022 08:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3398

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

This adds support for the Langdale (4.1) release and update the current
dev branch to Mickledore.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

RFC because not tested

---
 documentation/poky.yaml.in    | 14 +++++++-------
 documentation/set_versions.py |  6 ++++--
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 6b942f095..5639f3ca7 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,10 +1,10 @@
-DISTRO : "4.0"
-DISTRO_NAME_NO_CAP : "kirkstone"
-DISTRO_NAME : "Kirkstone"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "honister"
-DISTRO_NAME_NO_CAP_LTS : "dunfell"
-YOCTO_DOC_VERSION : "4.0"
-DISTRO_REL_TAG : "yocto-4.0"
+DISTRO : "4.1"
+DISTRO_NAME_NO_CAP : "langdale"
+DISTRO_NAME : "Langdale"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "kirkstone"
+DISTRO_NAME_NO_CAP_LTS : "kirkstone"
+YOCTO_DOC_VERSION : "4.1"
+DISTRO_REL_TAG : "yocto-4.1"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index ddf70851c..efaebe43b 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,8 +26,8 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["kirkstone", "dunfell"]
-devbranch = "langdale"
+activereleases = ["langdale", "kirkstone", "dunfell"]
+devbranch = "mickledore"
 ltsseries = ["kirkstone", "dunfell"]
 
 # used by run-docs-builds to get the default page
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["mickledore"] = "4.2"
 release_series["langdale"] = "4.1"
 release_series["kirkstone"] = "4.0"
 release_series["honister"] = "3.4"
@@ -65,6 +66,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "mickledore" : "2.4",
     "langdale" : "2.2",
     "kirkstone" : "2.0",
     "honister" : "1.52",

---
base-commit: 0f088df1027b38a47f4161fe0910150ff42c1861
change-id: 20221025-langdale-91e387889ed0

Best regards,
-- 
Quentin Schulz <quentin.schulz@theobroma-systems.com>

