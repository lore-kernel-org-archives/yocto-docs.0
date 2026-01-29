Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C23AE63C8C
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17106.1769700267338992601
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NH22+QbT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C715D4E42322;
	Thu, 29 Jan 2026 15:24:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F643606FD;
	Thu, 29 Jan 2026 15:24:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBE28119A8874;
	Thu, 29 Jan 2026 16:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j857tcLTZc6siJgypydhpXa5LtI35vwCsiBiU3//hp4=;
	b=NH22+QbTP/OSjfGvwGpXXQ2/jhaZ6r43A49nob0oGn4vCrVJ1r8SRHnTl68/tOz4Ua63M1
	5XenUK64Jcswgk7kAK74GaPNy59A1tPeX1efQOuYK14MnrZdHsI++DBrvYE19UGLm48DxE
	qIup1M+PO/NtcsHaJsbmCJBOntKLZWJeqdrkh4NfgLwnKgZ8FENKwrpHavkrl3mD6pbPcc
	3tnXUjF+S4xqMoCSSdsKRJhlgdrhUHHUbRGSQBUEmCnHh7hArFvwzcnmy3PfeI5GUj7Pi9
	oklVFw/E9Msd07uiWQPLwk8Ot/Qzfn7NXo9oUMsZX1n3aY4EWJeef3LTuiOtLg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:23 +0100
Subject: [PATCH v3 32/57] README: remove obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-32-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3087;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=909HxdaXT2V2+jX4ONFms7vGwlPWFwf0ai4DHMrdhN4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uOux84w9zzg9VitckIeQnKik7Y39AbdEJlU
 RdfvMLN8AGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 NthDEACWbEES8WmZLto+uoLUYhN33xmpwG1Xljy1VzneRGj6jwBzmEe92rMsPycZLKFNKm5cptE
 JUINeGtvnhj9bQ2iOW3SRS9+M4DlzMz+YL6ECXRut/ll3Y7bha2qE12m3Ay0pVtwCJ9qssXDdJ5
 hR3hKxaxi7PfPxLLAuBtNr0NSnLtJLVnGnVwrpwpUMMIpCnHYrYJz01QNXyGsND2HDKoXvAo9dh
 rsN7zLnBuH5mzr9x3N0EyO3Nbof9SUXKSAjkVo2qof/4HO5dvhh81SU28stXZMnK8gEMJsvw/xr
 gyS8I+rt6dS8Iz5jkC+E6bn7Qm6U2wUMWMZYukj1Z01Tsd1bAivlUhjXl/ULnYJwlFxo9cx9nZI
 xrFSoy5bMv+Up9vFxCFF3ZR5Aw8vzCmhEp/sTfTSTNJArjaypCZcGxYnzg8NR7CEPZn30Fqwguf
 LFReG7YFd1WWKYvVXsQO5iQueDTN1qjyO7eL/YbOXD5p3k6Zfn9r9/35tyzNZJFYyHsD8zsvfBy
 EGbF7jujf04BLB468dxwU1TvWtfszNcGegqLpmM+5+YZgMtd7Wj5asasBX417PV7ZA+2fG3/BHJ
 6TkjAN5WdKNQVICRRg2I4/80Ibxc/VHq0yQcGJEmcoW4tq3SEMRq6QIac6cKHw2lWzTZF9Vm+be
 M5atr3tRjfevfCQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8818

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/README | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/documentation/README b/documentation/README
index 56eac7ca1..5516d71a6 100644
--- a/documentation/README
+++ b/documentation/README
@@ -1,33 +1,14 @@
 documentation
 =============
 
-This is the directory that contains the Yocto Project documentation.  The Yocto
-Project source repositories at https://git.yoctoproject.org/cgit.cgi have two
-instances of the "documentation" directory.  You should understand each of
-these instances.
-
-  poky/documentation - The directory within the poky Git repository containing
-                       the set of Yocto Project manuals.  When you clone the
-                       poky Git repository, the documentation directory
-                       contains the manuals.  The state of the manuals in this
-                       directory is guaranteed to reflect the latest Yocto
-                       Project release.  The manuals at the tip of this
-                       directory will also likely contain most manual
-                       development changes.
-
-  yocto-docs/documentation - The Git repository for the Yocto Project manuals.
-                             This repository is where manual development
-                             occurs.  If you plan on contributing back to the
-                             Yocto Project documentation, you should set up
-                             a local Git repository based on this upstream
-                             repository as follows:
-
-                               git clone git://git.yoctoproject.org/yocto-docs
-
-                             Changes and patches are first pushed to the
-                             yocto-docs Git repository.  Later, they make it
-                             into the poky Git repository found at
-                             git://git.yoctoproject.org/poky.
+This is the directory that contains the Yocto Project documentation. The Yocto
+Project documentation is hosted at https://git.yoctoproject.org/yocto-docs:
+
+This repository is where manual development occurs. If you plan on contributing
+back to the Yocto Project documentation, you should set up a local Git
+repository based on this upstream repository as follows:
+
+  git clone git://git.yoctoproject.org/yocto-docs
 
 Manual Organization
 ===================
@@ -261,9 +242,9 @@ For example, the following .rst content will produce the 'expected'
 content:
 
   .. code-block::
-      $ mkdir poky-&DISTRO;
+      $ mkdir bitbake-builds-&DISTRO;
       or
-      $ git clone &YOCTO_GIT_URL;/git/poky -b &DISTRO_NAME_NO_CAP;
+      $ git clone &YOCTO_GIT_URL;/git/yocto-docs -b &DISTRO_NAME_NO_CAP;
 
 Variables can be nested, like it was the case for DocBook:
 

-- 
2.52.0


