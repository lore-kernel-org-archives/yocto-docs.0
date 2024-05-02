Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0440DC25B4F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:55:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.7642.1714632933416265921
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c7Nh3d3o;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7434C1BF203;
	Thu,  2 May 2024 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714632931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70jj3jr7Ikd2B5LRdYIPPnQ0DD37hgHgtKcDJxv4LKg=;
	b=c7Nh3d3o++RzXGVvzDoPs+zDw56JNdr8t8aFQyPER3RdrMFFd7evGVpXQtN6v87HFDR8ae
	M+2EKzTNqpZxTSu0WnT+Iy1DhRFWdV9Qv4+w7iQkd0YDrPY50TzXEpN2RgYMdSo+Bv8d0Q
	M7aIIggJzdEOY8tf3na70ucEKYLtKFuRMz80DOZxoGc09skWihWbcHKDO3pWWvm7dfAHzh
	KtyUsuKy3Liqb8k9MLrlvTvoTy4wP0RSNsqOcAfxgQyIBJCqBKB4FZ4TnD4gE0eDdSlvGF
	PFuGH7TbyB5ZqNA/JGL4Y1pYHPIIKtsvLGN/eDsHg1Hxb15FGEPc9YMmfYOQmg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/5] docs: add support for scarthgap 5.0 release
Date: Thu,  2 May 2024 08:55:24 +0200
Message-Id: <20240502065528.22559-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
References: <20240502065528.22559-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5188

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Michael Halstead <mhalstead@linuxfoundation.org>

Prepared for Scarthgap release. Add references to Styhead.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml.in    | 14 +++++++-------
 documentation/set_versions.py |  8 +++++---
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 7a686ac4e1..17cbe26e36 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,10 +1,10 @@
-DISTRO : "4.3"
-DISTRO_NAME_NO_CAP : "nanbield"
-DISTRO_NAME : "Nanbield"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "mickledore"
-DISTRO_NAME_NO_CAP_LTS : "kirkstone"
-YOCTO_DOC_VERSION : "4.3"
-DISTRO_REL_TAG : "yocto-4.3"
+DISTRO : "5.0"
+DISTRO_NAME_NO_CAP : "scarthgap"
+DISTRO_NAME : "Scarthgap"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "nanbield"
+DISTRO_NAME_NO_CAP_LTS : "scarthgap"
+YOCTO_DOC_VERSION : "5.0"
+DISTRO_REL_TAG : "yocto-5.0"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 90e08fc5e0..dec0780834 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,9 +26,9 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["nanbield", "kirkstone", "dunfell"]
-devbranch = "scarthgap"
-ltsseries = ["kirkstone", "dunfell"]
+activereleases = ["scarthgap", "nanbield", "kirkstone", "dunfell"]
+devbranch = "styhead"
+ltsseries = ["scarthgap", "kirkstone", "dunfell"]
 
 # used by run-docs-builds to get the default page
 if ourversion == "getlatest":
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["styhead"] = "5.1"
 release_series["scarthgap"] = "5.0"
 release_series["nanbield"] = "4.3"
 release_series["mickledore"] = "4.2"
@@ -68,6 +69,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "styhead" : "2.10",
     "scarthgap" : "2.8",
     "nanbield" : "2.6",
     "mickledore" : "2.4",
-- 
2.34.1


