Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4142D11711
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:14:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1090.1764692063981924606
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 08:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Gjo5KYUd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2EEFCC15D7B
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:13:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C8CF606D6
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 16:14:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C861811919D0B;
	Tue,  2 Dec 2025 17:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764692062; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RfXQJXMXr+QDgG21SbqPp/WVL1yWdBin0o/4oyFihEI=;
	b=Gjo5KYUdyBuFoo3kfSfOJJuIIje9R0W41GF9TmNlD9PdL+k9vC3tXYuTfOq+f4zJRfrxbl
	CJQubb5Fqz++QpjpWKOZnVDgBjjKZfby5mpu63xm0d4XdammI9ouy9atvrxQHA5WyzUyYB
	pdk838IXpIRixesvWX6+F8Al504C4NHg9300H7GHXyuko3P0tpyB2mBK7mxUxOjkiiWu64
	lvMDrFJ+NPq25wmTpkAbjTFAdo1w7a3wldgGJsalE5zBafly7/+z3wmrx3kFMzaiwv/Dk+
	u9Ha1aj0q27XusS1kWwRSe4TMa3YPI0uEKGOxMMg8et9Zbm9BioWmuD3pWVk7A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 02 Dec 2025 17:14:16 +0100
Subject: [PATCH 4/4] poky.yaml.in: split automatic and manually replaced
 macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-release-updates-v1-4-889513ccc384@bootlin.com>
References: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
In-Reply-To: <20251202-release-updates-v1-0-889513ccc384@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1343;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IEZaJwMOl0W6MN/oXqQmQhrREQmQFg0iBMIdKaqHsfE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLxBaa+SPO8F+w2BphpPLoAg8DtGa+V4wIztSm
 1JyMYrDZwuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS8QWgAKCRDRgEFAKaOo
 NlOrD/99Ohf/o1Kf4F9zgXQkk2MaO4WEgGmHxswf3aduKagymw4Fv+SmrhUA81mGAtbJ6S3KUhw
 wxumBjPTKOWi3HJ91QEW3oLxkg64aSicM+eYzsIv6p/bxn6EVXUEKl3OeeW3kbe7UnmXDxqtg1d
 JufUSa6AOaAXQrGDUZaDzTk1Psx6DUDmtPz01WNPadEe5IEdvIbolmZVLDYjEUQmvwB93i7FLyU
 GWnrwYlKtvR3r5qQS58U0REnabmJdzkaNCJgGTqp9RRJWsnJ2HDWp0g0Do5LVEWcHbwnwp4g8mq
 Bs6FXH6/iDg8w0pjNRmzRLVrpODg2seSRszl51WimK61RcQCFcG72wqJdQ2MY2m926yQI0iEJfa
 ofFsosiVZZ3kDFJESHm3OgK1v0vQ2zw4Tg5D9IKN4ze/cQ/Ov503+1AQnhjAcBQtx7gH0LzxWFy
 mhdxPtHXjasi2G4e7/RDJLDeLpgiDXHbZDCPtgj6UqJwCOfzy0ApBQ/4rN755OWmh5UpuDRiQP1
 hnOjXxbugdDPyiB/KPAGOi79tsp7yTtcOqFfdMXMw0KYXaWxOv2WmAoVz1bMUGMst77EbM+wckr
 nO0wmisImZXUyEPZghsPlkMwCG1wchW1WvBwulkdzM+2pfB+KSZHa+UCT29h324PvYajFeg5oMj
 BipnZJ0r5yCiMOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Dec 2025 16:14:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8189

Instead of thinking some of these macros should be replaced when a new
release is out, split the variable that should be manually maintained
and the ones that are automatically computed in set_versions.py.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 810efd4d5..f6d6ea9fc 100644
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
@@ -22,6 +28,11 @@ DISTRO_REL_TAG : "yocto-$DISTRO;"
 DISTRO_REL_LATEST_TAG : "yocto-&DISTRO_LATEST_TAG;"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
+
+#
+# Not automatically replaced, manual updates required
+#
+
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.9.0"

-- 
2.51.0


