Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903BBC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 14:32:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.13905.1699972369631814496
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 06:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qxwo6/Fv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C35B2000E;
	Tue, 14 Nov 2023 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699972367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bx8PyR3t0FMA1g+00LMaLOmvZsgtHR9I7PNNWw0rsVY=;
	b=Qxwo6/FvJ7msdmekIUlWK8wnOwRNFZjl9R/z7NelKNDoVOhWAgEKcnu8f4KYAOAaIk14Jh
	y6+X/3lMdLZlCTLyS6o89OOxjzOzZy4oajjeMzo6J3ky9tK0Mh4NqXWz94OG2+qPocat7U
	kPjMGwNQWtZw7cqugx6B7Sv/rps8lruzRNOhV7GXDnBQExw/EE1T6tpVdwmnWdWGIglG8k
	2BpeC2ihOrv0Jux0BYQUWSe1pWlGA2wh6SkZn1i+Sf7UGQbIruAbbumToUhuL68IjzZ5m6
	kkHXifRyTLGEez8yzg6FlsU1GQYdWxwK9piNVf68aMtPAprJKIqw4cMk5/A+5A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [nanbield][PATCH 1/2] docs: add support for nanbield (4.3) release
Date: Tue, 14 Nov 2023 15:32:37 +0100
Message-Id: <20231114143238.116960-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114143238.116960-1-michael.opdenacker@bootlin.com>
References: <20231114143238.116960-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 14:32:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4618

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Michael Halstead <mhalstead@linuxfoundation.org>

This adds support for the Nanbield (4.3) release and update the
current dev branch to Scarthgap.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml.in    | 12 ++++++------
 documentation/set_versions.py |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 2922214bc9..7a686ac4e1 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,10 +1,10 @@
-DISTRO : "4.2"
-DISTRO_NAME_NO_CAP : "mickledore"
-DISTRO_NAME : "Mickledore"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "langdale"
+DISTRO : "4.3"
+DISTRO_NAME_NO_CAP : "nanbield"
+DISTRO_NAME : "Nanbield"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "mickledore"
 DISTRO_NAME_NO_CAP_LTS : "kirkstone"
-YOCTO_DOC_VERSION : "4.2"
-DISTRO_REL_TAG : "yocto-4.2"
+YOCTO_DOC_VERSION : "4.3"
+DISTRO_REL_TAG : "yocto-4.3"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 354dabe618..a7c4d5af0b 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,8 +26,8 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["mickledore", "kirkstone", "dunfell"]
-devbranch = "nanbield"
+activereleases = ["nanbield", "mickledore", "kirkstone", "dunfell"]
+devbranch = "scarthgap"
 ltsseries = ["kirkstone", "dunfell"]
 
 # used by run-docs-builds to get the default page
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["scarthgap"] = "5.0"
 release_series["nanbield"] = "4.3"
 release_series["mickledore"] = "4.2"
 release_series["langdale"] = "4.1"
@@ -67,6 +68,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "scarthgap" : "2.8",
     "nanbield" : "2.6",
     "mickledore" : "2.4",
     "langdale" : "2.2",
-- 
2.34.1


