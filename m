Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8888.1793611418374412614
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 01:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ycp0NaKc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3B25C8F447;
	Mon,  2 Nov 2026 09:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEE0C60750;
	Mon,  2 Nov 2026 09:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3D121032911D;
	Mon,  2 Nov 2026 10:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793611415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qLzn2GhoxwDfAtv+aLdK6fFNsbUUkurqs7N/fR7Tn30=;
	b=ycp0NaKcMJKwb/kbuuJtcVRzqZOC4wLZMd2RuyTVSWI0phHWfiU88a+qu7LC9NMIS/QC9j
	f0rxM/WOXRmKNVEX0GGVw6f4bBK/zbk22bsG2khxph/yRbXIQvMD6SzTa/s6BAbGRS7L78
	Dly0RRTs/l/eF9kUgogOo3aj6E28WnjKGIwDQO1h/2sGFjRMrcgPsSTPwRhvA+hFxYLWKi
	gusglz5oLcaxc6/lQ7j3gCXoIjFtHA78pyAk0Lk5tdemlHU480Jsc58LfiSO0KJU97BO/6
	9ZOz0hF0ICsmpnWotfzACmr3PWltrYPlpUuLcK8k6CAnJyqTxAPkSm3V0Bv1hg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 02 Nov 2026 10:22:58 +0100
Subject: [PATCH 1/3] ref-manual/kickstart.rst: add a section for commands
 and directives
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-wks-in-v1-1-fbb797a3d5cb@bootlin.com>
References: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
In-Reply-To: <20261102-wks-in-v1-0-fbb797a3d5cb@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Trevor Woerner <twoerner@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qSakfsUVkNnziimGlo6O/cICOnITDlLImXXeFiB6iLo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq6FZ0ULsSPOBd+sb2AoDzdSb3ebKRzBhe0D0yL
 FtEa/w0dIKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCauhWdAAKCRDRgEFAKaOo
 NhtcEACwXKhIQFdX0vzj/GTln0kY9SfPfXRNheXYjQhXdcLoxIJT4/BYWScTuFr6sHQKIC9Jog2
 sH9bQmb94IHVZ/GgdAvYKtHd90FOKMWSw/DC7U4OBQk3kYO+/DU0ao8VCbWPm8JKGYgnHUTuoDW
 Gc0On3xMcWYnpuspCZl7+TZiEOGNJAlPH4iCunTzzGk4sFcur9xTZC3EmrTtb7uI52mhqL+4dOd
 h/JEcrZHFR9hieMg70uS8ndNVzS5v5GOt7AWpOMYnmpfyelSwlU89iqt7R0sXWaPHP2edR9Rpck
 NJdMIRICLT3NxCuKBo8rXmaRjLePf+80vSFYnSsp2iLDNlYsNYXAVK41G6YqV+I1YKXVXWGHNM1
 wGdS3pi/e41u9pEJgAKl407vQMTfH40r2/ycEbbsIu65EnJnAE/2wfWskh1wTBc96QCjDe3CafC
 wIDrqHzNOfngov4t5hdUjx8FP1SmQoCr33Xbr2hc530QdDOJbdkT9u8h5jIdeGPLRQK+z1xBFlD
 JVYkpMUCX2V2fLaHPUOzL79fYYAHXez97Fu+/y+mUvjXk1Davx73HKhswQFMcuVicARB7l5wn0z
 7ZREeWXGvj6zy6hgmahUpu/kLl9RjPOSZPRk8cnsawrAKDY013MTUe9X8aTZ+aZ+AvxNaIcmRG3
 lqegj20jcyI77vw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 09:23:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10755

In preparation for the next commits, add a new section for commands and
directives so we can then create additional ones that cover other topics.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/kickstart.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 14aff6025..1144f1a12 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -16,8 +16,11 @@ modifications to reflect Wic capabilities. You can see the original
 documentation for those commands at the following link:
 https://pykickstart.readthedocs.io/en/latest/kickstart-docs.html
 
+Kickstart Commands And Directives
+=================================
+
 Command: part
-=============
+-------------
 
 This command creates a partition on the system and uses the
 following syntax::
@@ -202,7 +205,7 @@ the ``part`` command:
    ``wic help kickstart``).
 
 Command: bootloader
-===================
+-------------------
 
 This command specifies how the bootloader should be configured and
 supports the following options:
@@ -232,7 +235,7 @@ supports the following options:
    bootloader times out and boots the default option.
 
 Directive: include
-==================
+------------------
 
 The ``include`` directive can be used to include a WKS file into another. The
 only argument to this command is the path to the file to include, relative to

-- 
2.55.0

