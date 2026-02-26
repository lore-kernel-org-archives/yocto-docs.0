Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EC6FCE08A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 14:01:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70362.1772114470679139481
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 06:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=liorhytR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 73845C40694
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 050C05FDEB
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83027103693AA;
	Thu, 26 Feb 2026 15:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772114467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KEAY5EzldBIFhP0P4jlqu9YKVciFYv3uiNRwJ40QVUE=;
	b=liorhytR4IQ8uKoegtwuOb70VYZGLqEgGKFMYcLsECeBqCEXIRRdurb8QiZOiqQf0zIEFD
	mHD3qsFzED0J+Go+/sv7aCe5O/k5Yzbjc6B2fBs7gAroA0HeB8SJ4O0ur1dvgSFfRa1lLC
	eV6BjK8aw1qF8Jp95+b+cWh6ofSL+OgG6+fFo0V6pCAlhzgzdtqzSZW7+JB0w6XkXL1YeC
	RhE098BR6l5Ygz3S6FeHrp2r+BAEMFflFGZzcdpngLiaqDYVxsw1AiDSYRbfLwceJe0JF7
	S3E4fBRE79huHeob71HTLCyIFLTHDGgAhwFUEaRhZcgEg7l2YQBzcboiksPMNw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Feb 2026 15:00:47 +0100
Subject: [PATCH v2 3/3] set_versions.py: make it possible to use a
 different releases.json file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-releases-json-v2-3-6ba4a3b37b24@bootlin.com>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
In-Reply-To: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=RMElbRKuPVZ6ww60lsAwv/LepED3qUeQDDjWxPHDUDI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpoFIVxEiFYp+VMb97Lr7hnxIzEiOM13M0oto2Z
 Kr+72mY7NaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaBSFQAKCRDRgEFAKaOo
 NuTlD/47tybjRkYFe+E4+kAuriyhSTPRMkGngvQTTIvtIZovvS9OfT1YBhScr2oiIrXxhMOfEaK
 bO/IpB7olg6/JxQ4uD7UJEkuiweWmw4uUYwdis1VAGwzETXXZeb2ENThhwAYIzy4I2JzyrHHXoC
 QLYjTCf8hsjalxEC107kPiER2mu7oGck6j7KbZ/uQcFXgzpFuY/e1bJZDPkwUQuZYeKshQD9Gh6
 6vKw6bfXOqK1mAo0TNHSyoR3zuv5MtdoN6IZjuQc07R1OcdAnzo2bu1b1HtDMGXaK7FhZDTpyWf
 RLEOqiQJsU/DG68miFUKx9r6koW2NCx4R/XpEhJRYaL2bswbYdqjrSo6PCZ8CLL1CejiEBC6+GM
 LK3mieew2nNDH4odhFGBVtY0f1ijfclGEkRTPu2sVIHAAbrlsw5UgqRuZu7BSJZwZpBLwsgbaMW
 kq3mQW+ps6HUaoSYVgWykjgChJanf3NhEUms7fg6Zn93BqTauD9cHLu96Jhtu/3WIoxZl1WKszP
 6cpIudIcOvvmottxmPfDc5bl8bWbtZvsmE+FwdSxSz89iSEWOgcMkDQXWTXvtXJ9Fz0H/SaVprB
 5fBL4hmZ7D5mxYNg6WgvfPQQX3axZZvjcgN4zBCfYNXAGQpLr6+aBbCTePgiKxJBWRrBZ3GXN02
 jUGR5ZxGCpgf9Qw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 14:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8998

Make it possible to use an external releases.json file through the
EXTERNAL_RELEASES_JSON environment variable. This will be used on the
Autobuilder to fetch the latest releases from
https://dashboard.yoctoproject.org/releases.json. Print a warning in
case the external ones has a different list of active releases, and show
how to update this file in the yocto-docs repository.

Having this done through an environment variable makes it much easier to
make this apply to all builds of the documentation (even older tags).

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index aa7c57062..6fc318695 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -57,6 +57,25 @@ with open(os.path.join(os.path.dirname(os.path.realpath(__file__)), "releases.js
 
 activereleases, devbranch, ltsseries, release_series = get_releases(releases)
 
+external_releases_json = os.getenv("EXTERNAL_RELEASES_JSON", None)
+if external_releases_json is not None:
+    print(f"Using external {external_releases_json}")
+    with open(external_releases_json, "r") as f:
+        releases = json.load(f)
+
+    activereleases_e, devbranch, ltsseries, release_series = get_releases(releases)
+
+    if activereleases != activereleases_e:
+        print("WARNING: The external releases.json file has different active releases: "
+              f"local {activereleases} != external {activereleases_e}")
+        print("WARNING: Update of this file at"
+              " https://git.yoctoproject.org/yocto-docs/tree/documentation/releases.json"
+              " may be needed")
+        print("WARNING: Update using './documentation/tools/fetch-releases-json"
+              " documentation/releases.json' in yocto-docs")
+
+    activereleases = activereleases_e
+
 # used by run-docs-builds to get the default page
 if len(sys.argv) > 1 and sys.argv[1] == "getlatest":
     print(activereleases[0])

-- 
2.52.0


