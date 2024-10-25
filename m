Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69467D0C614
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 14:07:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12841.1729865261362176177
 for <docs@lists.yoctoproject.org>;
 Fri, 25 Oct 2024 07:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GMNHBBQa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 392871C000B;
	Fri, 25 Oct 2024 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729865259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CklAodQaCMwplOwtIpSEx2WhkHbd+k+dUsHd3FL0xZQ=;
	b=GMNHBBQad4l4r9fT+canwLIjcMGoBmbnTlQM/4SQJmUTcfd5gzW7jaI0ZCgJAALmwdZrJG
	gz3tcD6tD/BIDF4RxgxAPe14GKQjIRC1DLEQ338iWKgzoRPtDi2Fzp3UG8522NCrablfbO
	JTKfio+4m+orFWbohtuohDc13LIQXsenC94kMLj2twdJNKN4BdzyX+n8hLpLjFhEO1ksNQ
	B3a+9gC8uCmkH3mtLj4DvGHpGjvl7iOvGeRV8hJxhmeaICNcSScHBGzwegMz0ifpdU6x/2
	naAShbYPSzq+hy8F5I7Gk79NlhGgnI8AsopHRVtoxxRh6sU/qsyN3sfejSVwvA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 25 Oct 2024 16:07:33 +0200
Subject: [PATCH v2] docs: update current releases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-update-switchers-v2-1-290a6c777a68@bootlin.com>
X-B4-Tracking: v=1; b=H4sIACSmG2cC/32NSw7CIBRFt9K8sRggpVVH7sN0wOcpL9HSAKKmY
 e9iF+DwnOSeu0LCSJjg1K0QsVCiMDeQuw6s1/MNGbnGILnsBZeKPRenM7L0omw9xsQGN0rrpNb
 ODNBmS8QrvbfkZWrsKeUQP9tDET/7J1YEE0yh6jlqdxiP5mxCyHea9zY8YKq1fgEXcTQDsgAAA
 A==
X-Change-ID: 20241025-update-switchers-6d72cd2aadb6
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Iao5PuzVimdvNUleyC5iT+0r8egzo2S5xeU/UQ6Qkfw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnG6YrrfR4OyB9gTAXqMLPTo+v4BJ6i+HlR7nhX
 y7SX0BM3HWJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZxumKwAKCRDRgEFAKaOo
 NpdMD/97IiYcTcJMJhh2YrKJQ96vRYFJccctLrd+eQjwMf4bs4aS+MbPx66/P1DSRT3P71f6bW6
 Lbsa9uXaVXIbDqotXy9nd7Hov8qVvkuE6K/35o4YaCc9iEJcEzezFy0eiAxLSAYA1fieuZpKkfx
 r3QfaIordve/aiP6II06z9imrt++NnMON5Lvf1Hn03iSN6HdNHurDCjcQ9lTPKPzntNx+mdizxv
 XBo2iTN9oit1Jfj0OfD7UkBv6KsfttXV+ovJPWy7wQtEox3SnvEczhnZORSMnzFs5wCXIX++DnI
 h8CGtZtST9rxpTH7ggqy5iCPwMkPs/RJl650ctSwCB6CYthQXQlt9YS/ADESz/Etp0ut4E8Yg7I
 mlBwzqGYFCMR9ErYee9kbYwiDSFvkwi3lGa9r3EH8s4+MFk9zs5gpHkj0OzfEi1HNkVSTpvB+lY
 jG0dd0s8Q6/+gMBBJORsbSps9QEuamcUVZJDNvOwu0GtIYwWxzV85t9yNnl/BlBGkmT4NGaPRGz
 KAz0Cz7cwbiy/GD+ygpT0wyZy+zgC1U0DSkoSM+8TRATk6DT5OlFh+xpxLxaxbQx/6WUehm9l1C
 IEHYjEn9lCXviiDx45STfqfYiP0xkaGyiK1+yyPDo3rEV/OW0vRpiJ7j7yQr3HBbK5oOo8k2QMw
 ILbe+3qfyc0ZqfA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 25 Oct 2024 14:07:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5592

Remove dunfell and nanbield which are not supported anymore.
Add styhead as an active release.
Set walnascar as the dev branch.

The switcher menu now contains:
- Unstable (dev)
- Styhead (5.1)
- Scarthgap (5.0.4)
- Kirkstone (4.0.22)

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
@Quentin: adding Walnascar as the devbranch does the trick and adds
Styhead to the switchers menu. And indeed, walnascar _is_ the current
dev branch, not styhead.
---
Changes in v2:
- Add Walnascar as the devbranch, which adds Styhead to the switchers
  menu.
- Update poky.yaml.in.
- Link to v1: https://lore.kernel.org/r/20241025-update-switchers-v1-1-5e540ead879b@bootlin.com
---
 documentation/poky.yaml.in    | 12 ++++++------
 documentation/set_versions.py |  8 +++++---
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 0c04b615eae07e722982ad8808b8d4ff228b5cb5..c770318f2be76cca3ea23a25d819ace46d157b4c 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,10 +1,10 @@
-DISTRO : "5.0"
-DISTRO_NAME_NO_CAP : "scarthgap"
-DISTRO_NAME : "Scarthgap"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "nanbield"
+DISTRO : "5.1"
+DISTRO_NAME_NO_CAP : "styhead"
+DISTRO_NAME : "Styhead"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "scarthgap"
 DISTRO_NAME_NO_CAP_LTS : "scarthgap"
-YOCTO_DOC_VERSION : "5.0"
-DISTRO_REL_TAG : "yocto-5.0"
+YOCTO_DOC_VERSION : "5.1"
+DISTRO_REL_TAG : "yocto-5.1"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index dec078083441263cb1350532b2749f5ee222d555..376337e7b544829e7f65cb5dcacda635980ee28d 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,9 +26,9 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["scarthgap", "nanbield", "kirkstone", "dunfell"]
-devbranch = "styhead"
-ltsseries = ["scarthgap", "kirkstone", "dunfell"]
+activereleases = ["styhead", "scarthgap", "kirkstone"]
+devbranch = "walnascar"
+ltsseries = ["scarthgap", "kirkstone"]
 
 # used by run-docs-builds to get the default page
 if ourversion == "getlatest":
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["walnascar"] = "5.2"
 release_series["styhead"] = "5.1"
 release_series["scarthgap"] = "5.0"
 release_series["nanbield"] = "4.3"
@@ -69,6 +70,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "walnascar" : "2.12",
     "styhead" : "2.10",
     "scarthgap" : "2.8",
     "nanbield" : "2.6",

---
base-commit: afeded9939777d88bf4cb9ebf7a61aadd476642d
change-id: 20241025-update-switchers-6d72cd2aadb6

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


