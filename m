Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9DDC982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:53:56 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11636.1789739634708855761
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Yclnb+iI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D568D1A091E
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA38960649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FF5A10328E53;
	Fri, 18 Sep 2026 15:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q2Nt6bFGNokMrnAYnO8vH7kDhi+Zxkee9VfjECtOEtg=;
	b=Yclnb+iImFrVXU4MVO0BVbdhRLEGcm9hKioHBiFKnqdF5Va0l0HJ94b8++25w2C9R5SEpT
	jb9irQcus5RAlQWmdOGFPsHsTXJ5E3tEyMVj9mR58PARm65iqLR4GZKME1NforqdaXsEIF
	kt0mVfADduN+DuDRMvu97TQuKFhKpFOkGI3+GKFzWsq2Kbx9o0UYEJcqc4IRSYVM8nwGJ3
	nfR5ELyP4wmmz9pusPp8W5o29OCcaqc6btTE52dBSCByXhTAOdCgWqGPKNZ4H7UpTct5fG
	SWdXN8peauGRqnSUPQSExv9iQ+W51cshT+s56Qer45HnXyN23n9l3gT0o4GhWQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:31 +0200
Subject: [PATCH 01/20] ref-manual/fragments.rst: document
 core/yocto/monitor-disk-space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-releases-notes-6-1-v1-1-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+V/vnYpNhdRZhbmxXJtf7f3upivOg/jPuYq1OHAkYZ0=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJiPoa5Q46ZbtDXJ+3ccmRBrsxu6yIopUxOJ
 Hr1RBChSFKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CYgAKCRDRgEFAKaOo
 Nh09D/9PmMWxS437YaL4OKxu4IFKy3V8vX5/bovzGL1Y46ZQBKGps75ckYasEqfYMR7a6M6b06N
 qZ4zOxD7Wc82Hij77EY7Alt47Ti37/QEpNiU5jTHfyJzdAeCJTfcM6/aYKbatU4lxmTrfPjhS3J
 tLIGO2h5SnKsp3mwhnDgFm7AtsZUZ6BLoZ6XFJMSkdxRzElp+lrxb4FW4UtlQDqagimoFwzNMc0
 pHmf+9MACcm/nHhkUL6ZIUVSENvFpGUucVXKdc7nHWphLF69KbtTDNEq+aLaSXSYrWfHukqudFe
 A4PN6lwufgAGclWyc5oZanmW7kVe3InaFt8IiQOUuCmKekog6WrfbRjg2abrYfDV3GoaBAB2Bm8
 A81PfhRLof8IZoBRS4s7jFbxS4nXj24dbGR5I0ZbEPJPkiq8v7ybcw/Ha869JnKHvCK2Fj5wtA3
 Q7zBItLhCgT5sRadKrOnENLGpIySX0i9HQG5bFFTp5/pNaWnzXFqGVdOK5f+1hUWpKgM7/vmAbc
 ArkmQUaCY8W2vBrfkXcGn46oZM2DNUC7maE2lbRck4795lTZavJF8YnHNcbncfBfRqtGdi965vL
 o2JuCaSXFU6PZWF0MqoQjgsvp2dTdlUpnD86Hax7QRCIgg/w9J2QiXPj/+Z3fGBWALdho6lsKfs
 InZ61HUvFc94qtw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10533

Added by commit df3cc9f85f99
("meta/conf/fragments/yocto/monitor-disk-space.conf: add fragment") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/fragments.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/fragments.rst b/documentation/ref-manual/fragments.rst
index 3cd9af168..e5cd9fc43 100644
--- a/documentation/ref-manual/fragments.rst
+++ b/documentation/ref-manual/fragments.rst
@@ -224,6 +224,16 @@ This configuration fragment does multiple things:
 -  Includes the VEX statements to the input SPDX document using the
    :term:`SPDX_INCLUDE_VEX` variable.
 
+.. _ref-fragments-core-yocto-monitor-disk-space:
+
+``core/yocto/monitor-disk-space``
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``core/yocto/monitor-disk-space`` :term:`configuration fragment` can be used
+to produce warnings or errors when the disk currently in use during the build
+is out of space, by setting a sensible value for the :term:`BB_DISKMON_DIRS`
+variable. See the definition of :term:`BB_DISKMON_DIRS` for more information.
+
 Yocto Project Autobuilder Fragments
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.55.0


