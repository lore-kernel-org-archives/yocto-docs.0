Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF77CE9D5D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:30:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92386.1767713407388341143
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jaons94l;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51F641A2691
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:30:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 234CF60739
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:30:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 106B4103C8393;
	Tue,  6 Jan 2026 16:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767713404; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=JUWdoVZd4Bs5V5KdIfeTRoSDDWHfCv+RRsLLZrMzhx0=;
	b=jaons94lSqDVQhxZvEpZwmr6YiF+vjWqiSkawIv50P4m5ldQ/CRfJsJ/V03irBfsI/JHFM
	V5vJZ/rSqJqw2NCZDe+juP1lQ0s06GHKSHfNmxRpbRDXUFfEYMG0bOypmTc51C3Ox/1aft
	cl4TNSCkm6wcAqOrzO7jpjto7Tekim5PKGV7ulG6zqNuM/FS3tXHoxKAaIdWPOYOaaDcJy
	dy03BTmthgNZIBiU3seH2vFoRVSa7hg7M8qgT4Kqgx5l1CKE8yy4TCFQv5fEehh4Io3Wk2
	b6iyWUhTXpj8QpnErT43BHvPxCnBcFsnvavjv/1Ttz2ElyXPKfaueBU7KHeCTA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 06 Jan 2026 16:30:00 +0100
Subject: [PATCH] contributor-guide/recipe-style-guide.rst: explain
 difference between layer and recipe license(s)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-layer-license-clarification-v1-1-99c69ec1a878@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHcqXWkC/yXMwQrCMAyA4VcZORtIK3Tgq4iHLks1UqokU5Sxd
 7fq8Tv8/woupuJwGFYwearrrXWE3QB8ye0sqHM3RIqJAiWs+S2GVVmaC3LNpkU5L73DkaaZ4j6
 FMiboh7tJ0dfvfjz97Y/pKrx8l7BtH9ordhh/AAAA
X-Change-ID: 20260106-layer-license-clarification-70bd02361f76
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1921;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=D4Ek7Oc9IwBobehTOL8bk833pVuhjbFO49hqE5Le56E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpXSp7CzQS2qWolAp7H3MHNmH4O8AIj0er7BHKG
 kuGyDZiExGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV0qewAKCRDRgEFAKaOo
 NmaLEACnufuj01kHqBvQrOHpGgdz7gIkI22Q2S5NM9Foavjbq88/TFW1XJqMryNn8Kup6QTCbg7
 /rzzv3Y8H70D0Am9uhXPlBZW5CJy4z13i3VjNbH97zkrGkLxn9nuLJzg0nauBVVgIU95cJ90I4T
 nQGcgysw2v7ZcpzYplNQhTYkdbSeLFtkMuKuespcfKdZl3X+ATJeisibRGHYGlvtIP3KtKLY1kN
 Z1Ir2YX4/2/b53FfDBqzFMqjW4jIbwjSpHKdFbUe94LhhHdCUP+zCrLXICswV3ixwxnAKkYtgHq
 OAwdJHQqHomqYJvHWV2Rys1wIf44i+t46WsX1hwBZL1svMja1mr+8yAMihbVJSM1CiOP49r+QBx
 3OCHQUi0kNjLc27Bxu9Szm/FMLKtFUI3Qriv86RhLZ25b3zDBKT3zHlapJ2puwEVBbjIhuKq+66
 aR6QTd9292tfuz4R9FZ6t/a8n0hJ+XkeFJJiCzhRMrVkNIJhBXTkAYP9Nk0lfblyaMUMRg8oBuv
 dfNL9yWPD4nN35pnoN9L6Cb4BH+Ai9z8pa4NnuF70Xb8pwHgXbIozP+xsv+VN2UKSsBm1nvYGDA
 1LKHcQTYeCzzukk5Uz0l3VueJiBilp9kdyvMrSv0Q+NnaUKiMYOv6fatgrnh2GomPWNfeJ1xQAi
 7xUNu/vfgOIMqRw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8396

Explain that the LICENSE set in a recipe does not apply to the recipe
file itself, but to the underlying software. The license of the recipe
file is the license provided in the layer itself. Give OpenEmbedded-Core
as an example for this.

Fixes [YOCTO #14410]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/recipe-style-guide.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index 806bf2384..6a3e9043c 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -221,6 +221,18 @@ Recipes need to define both the :term:`LICENSE` and
    ``meta/files/common-licenses/`` or the :term:`SPDXLICENSEMAP` flag names
    defined in ``meta/conf/licenses.conf``.
 
+   .. note::
+
+      Setting a :term:`LICENSE` in a recipe does not apply to the recipe file
+      itself. The license of recipes, configuration files or scripts is
+      specified by the license found in the :term:`layer` that holds these
+      files. These license files are usually found at the root of the layer.
+      Exceptions should be clearly stated in the layer README of LICENSE file.
+
+      For example, the :term:`OpenEmbedded-Core (OE-Core)` layer provides both
+      the GPL-2.0-only and MIT license files, and a "LICENSE" file to explain
+      how these two licenses are attributed to files found in the layer.
+
 -  :term:`LIC_FILES_CHKSUM`: The OpenEmbedded build system uses this
    variable to make sure the license text has not changed. If it has,
    the build produces an error and it affords you the chance to figure

---
base-commit: f9042e1da554017fe46460c1fd2bdf8c74b3fa18
change-id: 20260106-layer-license-clarification-70bd02361f76


