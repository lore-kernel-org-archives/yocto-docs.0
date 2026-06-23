Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB4ACD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 07:44:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15948.1782200659793945227
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 00:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fyPyRufB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 15473C6B386
	for <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 07:44:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7302F601C5;
	Tue, 23 Jun 2026 07:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4243D106C88A6;
	Tue, 23 Jun 2026 09:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782200656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4MjCnV1b+b2e+Z1FFAEK91wrcx/C5s0eD4RssXRd74g=;
	b=fyPyRufBfcX2i7ovc+otroOxcwRWJf9YIIAEEjwSIUl/9fQqWqIka34E503BSlT3NW6hoI
	PhB/+1yKljd8TjgWGk72aaaRwbw+Zi8APKWFWFAa82JYJf1fpTUwMXUSK80rYPuqtBZKBL
	SkozryJejkMIZ2B9H+Az3/uCTZ/amzX+CRpnpBu5Bet2MPIHjVLak5DrWUWaeYttaUE8db
	FdFDWBfi1NfrTao0tN3W8J+c9gLrl+T0jp43/WVzPxkvWtf3UNOscQoQrUCJw+cApxZXIz
	lBZkMTyLlDBCviz7oEzb7Hy7gootFIFRspxIsseOwz4MLSUbEQQVfNKw3G6EKw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 23 Jun 2026 09:43:41 +0200
Subject: [PATCH] tools/build-docs-container: add debian 11
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-add-debian-11-container-v1-1-8cfcf8572ee9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdOEFTOjr2I4dFvReihmA2JCe
 HcnHL/D/29QJKsUuDcbZFm16GQVrm0gvtiegpqqgTrynaceOSVMEpQNncM42cxqkpEvnm50HQP
 5Hmr9yTLq9zg/htNlCW+J838H+/4D4QlnbXsAAAA=
X-Change-ID: 20260623-add-debian-11-container-a462927fb263
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iRyyQYmQQGaLN5odhBtfqNgm5XSg9CzGiJ6rKekh1VA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqOjlO7JaMMBo7pskDGFEBbVnHzWBXUVKdRvrCV
 nEwDPwl316JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajo5TgAKCRDRgEFAKaOo
 NlrIEADCSdZ8iPDg+EvGQgBnEJeaopRkny3MYM4kcZb01kkL0P6OV/pYwhd71biTrp62C8ofdGf
 DPdJmV+ozRojDc11y8HG5yAtBewUQJ3JyRKzeZBEXUXW9Pcb3TMXEARm4qxN11v7KEDCS+0AxP5
 SykJB09yYxLIq9gUs/2B1N2mGruJkQ926HvRLKNFgIeNHsP1Ymt4y5YUSYgf3i8twpkyXZbZ0Ce
 GbQCEyLBKm6f3erv6SgrmsCnFElYe7TQyTsKMQnvBR8K53KzU5dBlt2fmgFt4JocvFov5NvENCT
 /yq4L+iXObaHGg60CPRB1485z8g2SEckoalckq/k2Y2dWCdRzqAarq3zeTKShFNCSTvEJRSgX/3
 KSdhdnI6Ab5K0u4D1T3u/BNrGtpEXOPREcet1cmZBdYGH6O6TOSQy3mLEDzXceAafrdYCeENiNp
 HGnsGOnCqmydAa1aZOTCN8AX5XtSVNKto9F6yPVEDIFq1s34Q+uqfUdw0RGSSEf0PyB7mhS2id3
 3j1vB2Wi32n+WejzwCKSLeXIpxnCRSqT9xXdIhNqiw8lEGJn1zYyaeoA4li8AcAUv913ybKyChZ
 7YsoMQw6Xn96tjuiRhnIRS4Pi9k68B19bxu2zUHh7rmjFo2+sTKdSPwPh3Epc/yOtqzQR7lf280
 HacxElNFlY8rOIA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9837

We removed the python3-saneyaml host dependency which was the blocker
for building the docs with Debian 11 here. Add Debian 11 to this list.

Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 459daa6de..acce3b3e0 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -37,6 +37,7 @@ $0 OCI_IMAGE [make arguments...]
      - almalinux:9
      - centos:stream9
      - centos:stream10
+     - debian:11
      - debian:12
      - debian:13
      - fedora:42
@@ -108,7 +109,7 @@ main ()
       pip3=pip3_docs.sh
       repo=quay.io/centos
       ;;
-    # "debian:11"*|\
+    "debian:11"*|\
     "debian:12"*|\
     "debian:13"*)
       containerfile=Containerfile.debian

---
base-commit: 47f0f69651280151a52f41fd6b425d55427401e9
change-id: 20260623-add-debian-11-container-a462927fb263


