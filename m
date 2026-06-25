Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4255CDE00C
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7581.1782380033381518352
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2qS5anim;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B4FE74E408D2
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8439D5FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6C6E106F07AB;
	Thu, 25 Jun 2026 11:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OTaUs+19iG/1reL4z0HURLHHuCSUjxykzeJmRtMgq5g=;
	b=2qS5anim6CN8j9xlNArQA4/l5/N5vfFLbvKs7QI2K5yxy8K+eqnYjFdwh3UhF08nxcxQjQ
	ohh4KK0K3UVil3jEOVpYtDZBd08S4bnysrP43O3cGwpp9+XnkRo5RPyKTvVg0IP4Vqp9c6
	3xdVN11pdZUiL1NaHn3a7cKMmUih+Qi6T98CwaV2T2mNOD7+oGXcOiDaQAnYvaL7OvZTMR
	K4hi0W2fMR9Or5/lk0bcH2Bj6biI7K7j2BotsCkM2p5ImKV39CcUeLVd3z29lzDnzixCBR
	NmtkO1A10HrdFHKjz9FbNsiBv2dg7qrM7XRItVf63ssQlgT5PpwU+UwLe3qXkA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:38 +0200
Subject: [PATCH 11/11] ref-manual/kickstart.rst: document the include
 directive
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-11-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CXtVEHyizpujNEPuT4MXTGWXK0G76rtEHpP980OBYus=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX2uSBFaIEaAorYM0qJ/AeC05M/RFGvY3fid
 ZXoyCf9j7qJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19gAKCRDRgEFAKaOo
 NmHNEAC9qUJSLRCiR8NJarz2qOFsnA71UADOgky/0DABs+BpF9aHWJcVQ+5BYUfglZZUh4eVlOt
 VTOswCCvQKq8Eu6FlN5N1UfXwyCg7E8oN3tRIUexwQQ0KgaZbQV4Qv9f0WuwYJWSUGN00427tpy
 qDJquTlZgGCu2nw6nRz988p51UCFdEQamHtM61HXBe2mXT/acxffqb/o26Dnjs1Bfi58ffLTtSX
 BZKYxus5zwwtLYW2nmMaoBNcWCEx7OG48zUYQXtFdAnRXxeKvne7OrFQfmnszXJ/8ZkNCAlf63Q
 uvOJC2Y6pYSpnl9yTMXnQGuZ155TRamTnAhcewt00CzBaLdJ3RE9btu84aTfXzTzzsOzZHBQroo
 CwlN5wIagYQIU3wNzx4ioljBn/qSBtc9E7H7NMq1hOX7GWlQZr36oLsOSAhujFO5aWd/sNvIOht
 8n6aba7bKPLJisKsbNAxHnJ88eAeCCbIwZaxKs8jMFh7j9ZsvJYlD3tdyMgCa18KHFx1RELqlcn
 cx6CQR3nXH61KaCpHj7yz/YG08FqTwyXDjVU3ikotcZeST8XTnTKwemc8G1qa67+A0w+i7tBZBV
 EHlH8W+LgPFm5QaszSlKCaD5BE7iKvyVTYoyElwbQLRjQllUzV7ymwevEqDb22QJSy7Qx13QgzS
 9KQvGSHf4Qj6/CQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9894

Including WKS files into others can be useful to avoid duplicating code
for similar images. Add documentation for it.

The example was taken from the meta/files/wic/directdisk-bootloader-config.wks
file in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 692ee2de0..e7cba555a 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -232,3 +232,15 @@ supports the following options:
 -  ``--timeout``: Specifies the number of seconds before the
    bootloader times out and boots the default option.
 
+Directive: include
+==================
+
+The ``include`` directive can be used to include a WKS file into another. The
+only argument to this command is the path to the file to include, relative to
+the current file. For example:
+
+.. code-block:: shell
+
+   include common.wks.inc
+
+   bootloader --configfile="directdisk-bootloader-config.cfg"

-- 
2.54.0


