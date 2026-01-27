Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3285CCA6C81
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5815.1769501985495239392
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CZEDfM95;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F013A4E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0A11606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C3990119A8699;
	Tue, 27 Jan 2026 09:19:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jajIpWDZlGUclhlvh/EgAOBX40JyBzYYZtTybiL3Cs0=;
	b=CZEDfM95EKEMHMI2LvU13K6cNmL4zvVIWIOvL71AZAjF/bIadkawvikpZ/eMUb6CQoUvE+
	DtWVT+wfdVTkSZtlpXBTmhRP/ESzO1piewdUTPVU4xM9bpPDyt3mBz2mqiDQMTqaPOnRtr
	ZTBQS9NDDGkmuQ4ghjoyvP5l7TT864fbJb3TRKgde0WFvuwxFjUlEsP+B4zbfBaBGL2NLt
	8gZGL6n7AGu6DkjZso5LqylAoPA0nm8XXiE03ODkHcqjwaZG9imzK10GC/tmu3fC1yBDld
	SQTOI+MjKINXY6kXS23x7cq0xrqDJFMhegyVfeAP1zCyKNIyxDiiDQpilzl+5A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:27 +0100
Subject: [PATCH v2 32/56] README: remove obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-32-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5KdFo2gcbmMdcCsInhNNVrp6JPxyeDLGGtC7b/dEX6s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUDRqWpFYyi4uSN4xGdzaa891nO93Cq+V+iV
 Z1iPKTXH/SJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 NuY3D/9V5PA2onJoaajP7mOsV+NnjOlYE1B3Y+YyyB5t2+lq+sNYGGQsjDZmpEcU4O11dhVOnUx
 zUzhOAiE6ApelXQYcBpFAzWQ3XIjdkGFSdl8QQ3FLqKtqV1EwHq72gFsRIbN8VEEfzi+f93QDC3
 ZhzIck4W2HPYNoV6nkn31/XkWp+qXAaliNlKNaIShRy0t4xYJc8lAJYBdiV3NZLZUux/cmzMtki
 4q6jfELHCm9OkSp/lVH6JD4N44yPOwXys7SViHEmU8r+GKKcmvl12cPt7mqOEGYjFdpkBJ2gum2
 HKZuloc+6UzCeHnayoT6V38iUlJyNi2SPXpVN4h+jUZeS7H9qWKOFWF+RtvwdFHYRAePdNaRG4x
 d/hm393LMFGIakbNxXxT+HtYm18GzlXTIGFU0FzPc+h8U4kxNcOB5e06KR7eNlD6FbEuBP2iMLK
 XsX6hE7LXod5csbaUP/kbla+zQgLUs5JD9Y5txIBVhhI6Y8FQ3H8iJBssJB7TvDiIwwK2wKfok1
 smsCZpUbLsdLmXQ7lqVInE58erWAgXfroEyuy6qGIgNEdMe0rSa+XY3P2cthgCGw/DZfHmin4Zz
 6hn35lXbCdhU7WfVJKKnGwoFX4jM47l1KWJ8IwjkEjRaupT9gJ+vB8vaYWlZsUyDjptpGQlA2so
 zGpsGCl2oPWabig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8693

Refresh the document now that the Poky repository is obsolete.

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


