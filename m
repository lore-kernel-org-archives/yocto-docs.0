Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CD9CDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:17:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38426.1782116218888581024
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fbgADHV5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AD6D24E405EA
	for <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:16:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82B37601BB;
	Mon, 22 Jun 2026 08:16:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A96D106C895B;
	Mon, 22 Jun 2026 10:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782116216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ZkhOwMl4xyI3gx4uWrsZTX6feyPcO2hUt3w5DrJccVo=;
	b=fbgADHV5H2+XKNZp+5cgu5+J85oYZ03dmsajaF2DUKBQ3zER0a6CCKJwx6BmtgEW8iQOz5
	8YoG6NXymrEW2cDbL2YyES2s9WYgfp42n53eMSHu3gOya3GK300S+oSV2urZ1VLv4yMPGH
	o4xEoS//mlrodfz+FV25Jh+w3WtrJ4E3HeNhoIHv5jZHRR1Px3yNDAmG2nlygdGR/V9USu
	RrC8PIv4LCvMjnKphw+CR0unqVfwmmZ4gLBF5VIfFil21aDUeqBIJB6GmTzp8SZkdqS0Jr
	XWGnrbpkKWFxuhisdRazZTvN6MytSIq4Z8OLWh2ImVSySJymA3osNl26rXUzzw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 22 Jun 2026 10:16:39 +0200
Subject: [PATCH] host_packages_scripts/ubuntu_docs.sh: remove
 python3-saneyaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-remove-saneyaml-dependency-v1-1-5ff9f1f37db0@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTsJtlATr2Jc1PajNTKQjhIJ4
 e4UXb7NW0iRE5TO1UIZU9I0SMHxUFF4eLmDUywmUxtXO2M4ox8msHrB7PsXR4yQCAkzW5waZ9G
 0re2oBGNGl76//HL9Wz+3J8J7H2ldN8qRXpN+AAAA
X-Change-ID: 20260622-remove-saneyaml-dependency-3e7463e4553f
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=zBQ5d84F8Ua9yOH167yMZRabMt3qd783dDh2PnEStKg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqOO92FlwvfwhbgFEqRiwI3DXMWQCEc1z/lBxT2
 7dWgNCuZ/+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajjvdgAKCRDRgEFAKaOo
 NiWUEACV6GGJlVNTgTvDty4OV4Zvr4YtRBe7z2dKfMXboTDV+YGOJZq+rw+JE/8D4Br6yxdKNPy
 iKTpfBVMZcxTMORu0mOJzfgwfAUGGWLMJgarcdow0ia4FfU+jfSX+3RctPF0GGNOPBelkJb3fcx
 26dXw5ppzSEOEfAPz/C7xE3AgXphH1fVqYCfP0aFttSwUQB6RHwi2Gb1bKURpUGzk0Ppk4VPvvG
 MbnQtKTvx3EsEyAR5T2lKtZMEqJRcpSlt8x/v83RQ3GAA+zxP82BqjS732dPJhLHo2sWrSrVSiv
 PfTHx/JTbELFFA2KNAUF9wEk7V96wEOQuqtQM68buhH735nOfcEFTMBD+j+36mgvpHEXB7c6jNj
 psourr6Rn6kfmJeT+/vFfgdc4DvVmz0dMxXvWEJPMSl3ec7RPWdYkvkVkbnGyD+ucaXA2QFVXM4
 smjYjkda0FBIZ9gh1vDPL0h5teFuIUlueZpIj+p5lpCHdSn9Q3+7kYdxp8T2SmKcWwVBHqGBMxF
 ozq5F65VTUJGNUp/MVjNB0r5Hg6QGTgXMkrSAyHT0IUdpszD+zuG2/nxg0ZGrqJiQ0bNjxx+1Yf
 1unuc6n/jTgXxnIeOKs+0L6HAz9uwKYQHCaQhN7pYii81g3OWd3HcO69JPaRV2GpSP/HoV0Dqyy
 faZrIlUkR2PmTLQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:17:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9819

This Python module is not used anywhere in our codebase, remove it.

Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container                 | 1 -
 documentation/tools/host_packages_scripts/ubuntu_docs.sh | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 37d3d2bb6..459daa6de 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -108,7 +108,6 @@ main ()
       pip3=pip3_docs.sh
       repo=quay.io/centos
       ;;
-    # Missing python3-saneyaml
     # "debian:11"*|\
     "debian:12"*|\
     "debian:13"*)
diff --git a/documentation/tools/host_packages_scripts/ubuntu_docs.sh b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
index db0743021..8522bb206 100644
--- a/documentation/tools/host_packages_scripts/ubuntu_docs.sh
+++ b/documentation/tools/host_packages_scripts/ubuntu_docs.sh
@@ -1 +1 @@
-sudo apt install git librsvg2-bin locales make python3-saneyaml python3-pip python3-venv
+sudo apt install git librsvg2-bin locales make python3-pip python3-venv

---
base-commit: 97e949dd2ed6ec7af05e355e755723687ad57c09
change-id: 20260622-remove-saneyaml-dependency-3e7463e4553f


