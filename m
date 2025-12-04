Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97344D20697
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:36:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43887.1764855409658767174
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 05:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ytMf73Rn;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C6356C1785B
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33FA96068C
	for <docs@lists.yoctoproject.org>; Thu,  4 Dec 2025 13:36:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61ABD11922628;
	Thu,  4 Dec 2025 14:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764855407; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G0unTuIA1avpJCiiQCBMuze6F6wMJV0a6brrRcsxDDc=;
	b=ytMf73Rn/o32BZdUwRIHMvUihLFD62Z5LjrxI9m/IHORXQJb46l/0iGxtTpJF/5ItlsrLM
	2gyEVEyuQmdJkKnWrwrn1P4kHFSQa4PNcbyMRNJgoMOJ+s56JO1qvUKrgJOUZsYqpnsbkz
	P6Mo+5QiWI1EztasHEc4iNwnLnu/S4/KidvIeppGayFjVFOl8L2g4SQ0+A2DD6DIfsGgis
	jVapzWj/54p1ZAm7kC/21VTF9RREveoFF6cgNkxq5QImdO6zGWU99IG7xGO8kRuUhQeSVj
	CXrEkMVPhnXJgRm9BX0iV2O+Jc0hYiIshA2TL1g5LdA7dAtKggUqqPJLx0EvHA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 04 Dec 2025 14:36:41 +0100
Subject: [PATCH v2 4/4] poky.yaml.in: split automatic and manually replaced
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-release-updates-v2-4-04ca6c26ddd5@bootlin.com>
References: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
In-Reply-To: <20251204-release-updates-v2-0-04ca6c26ddd5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1ffxQj60ck5oquKYk+2ItR6dwR1N+mN+o2uXQ+uPdPE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMY5rCXMrdntMbegaHFMj8Ty355skNhPgptF/P
 /ayrFDD9IaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTGOawAKCRDRgEFAKaOo
 NnG7EACmpYoyVShJUqKhNMqxaOP4RKFSC+Kr91/cAP0os9vJx+lRgDajjOZrYUFzznM15OBQ+BG
 CaNx6BkBcXlREvkm02oE+hGtpp3ruc5MBjY4En+/iNP56F0ITpYvNX7Kq6N2NPSNXv8FF1Nauk2
 K6kSm+MUWYhDLBSwegq1uar1KIbPUEZhG7F/dFBLSK2QABqmQhWD8yhsEqkNpeYhSE6TcSMJQ+K
 taHXZJBG5EChET60G88K222DmaV5CdtKo4NrIU2KFYT70oWFcCyM92HIlxuZ1+yo5kGZG6lkwwq
 wBLZErZ1WLIkgeOBpRq720A2/yWVmOvlNlrXIzWln779tiGQT0GPsxv5ThYa7UCFeXmAKdKrzGr
 mMTr5zE9taYIbZBbLqH7bxnJaxQc3nQaNdKILmgCLaFZcaVOvLuc22qLMH/0K77umeE9GqtKFae
 fDpK10QuaUmk2CeWpJPFYrQOzW204dbngTReqwQ+++recXaZ5SbEIDTBZOvKm8Go/mZXbQVkyQl
 E+cjRw//4RKMuDTcU7GW9j0IMT2V4bHU0I0EuYHXMP6HCQ/RQvgqJ//88Hb04OQOo4lSQWS53ky
 V305PcxnXfwCx8T4NfAj446rnv7YcECMuqDzhDgOyv1j93cys1tWVFwFARvzg2LmOZw08TuMhjh
 dBZXNfBU5q/mhog==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Dec 2025 13:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8220

Instead of thinking some of these macros should be replaced when a new
release is out, split the variable that should be manually maintained
and the ones that are automatically computed in set_versions.py.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 810efd4d5..56123495a 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -2,6 +2,12 @@
 # Macros used in the documentation
 #
 
+#
+# Automatically replaced by set_versions.py, no manual update required
+# Values below are placeholders to give an idea on how to use them in the
+# documentation.
+#
+
 # The DISTRO variable represents the current docs version. It should be used
 # when referring to the current docs version. See also DISTRO_LATEST_TAG.
 DISTRO : "5.2"
@@ -18,10 +24,15 @@ DISTRO_NAME : "Walnascar"
 DISTRO_NAME_NO_CAP_MINUS_ONE : "styhead"
 DISTRO_NAME_NO_CAP_LTS : "scarthgap"
 YOCTO_DOC_VERSION : "5.2"
-DISTRO_REL_TAG : "yocto-$DISTRO;"
-DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
+
+#
+# Not automatically replaced, manual updates required
+#
+
+DISTRO_REL_TAG : "yocto-$DISTRO;"
+DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.9.0"

-- 
2.51.0


