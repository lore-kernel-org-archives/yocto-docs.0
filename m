Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D732C44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:46:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93799.1782744382667862142
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 07:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z3Sj/445;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AF351A0D26
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39765FF96
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAF4B106F18B2;
	Mon, 29 Jun 2026 16:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782744380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0CUZhIKb9UXuDpcyq3aRQ60cIHqCWR7LzzfNBO548K0=;
	b=z3Sj/445vGVXfz//VZzTx41YzrMIUk2nGz7HAnJc8RR78f2tww8XtMQ2hpW0Gv3/WXdawM
	w4mkCIjr2N+y+IYkty1qIgcX3hbxdOeIaJUAdbdScQ3wBubaBhHQfVfVH600Z+zsdmaBrx
	WiCdW3tnnf36FX4MUr1IxyMOnIZOIw1tdVOknoJ0538oY46Bz5/NwzFgrD4TmanK+x5B/R
	s+a72iBkiHQnoGbt7ZXurp/0q/U5O1KlBBUVQKmdrLMs1+KybWljyaHPp6BqKFFbcT0pZ0
	sy++bTWRBRkP9shpyY8VvaZ6adh+Qr87c47VFTzXZtl+OSaRikKyTxzZ3ISRbQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 29 Jun 2026 16:46:12 +0200
Subject: [PATCH 3/7] ref-manual/variables.rst: add deprecation note for
 GROUPMEMS_PARAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-master-updates-1-v1-3-ad9b047f9ff0@bootlin.com>
References: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
In-Reply-To: <20260629-master-updates-1-v1-0-ad9b047f9ff0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bN3/D0gcu32eqnXa0WldoFdZjNF5bN8FIc+MFKFpINk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqQoU4dwyWigRYh4GSuIFfxhTAr5Ez+JYVRX5aE
 gYCVQAOyICJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCakKFOAAKCRDRgEFAKaOo
 NnzED/0VZatR2MsXOoqGNz7zy2DA/5gYyZ7ve499UBJZlScdgoiQUOpdxCS5uqrHf7bM8xkg7Sq
 /BZH21xdwp9NwpCii7d9OzFmnI2tq7wSE1BaXsj+hPUFlWTvochNBGqs6qzhJ25CYjkeN+Nz6H9
 G7wmydLKuq1/TSrBveZNzxD4luQnyIQUdQJvRqLDAJDtDccByOnMJe6dFWhRphxK6JoQM6HmRxo
 KaTVYx60xjyhXHncBmFYzN/CCq+ngsH8FQMW/IK2VklMUy4mt0RStbK6/u1BJ4uTJrNcoI1c+I+
 ncf1LC1whDADlU19RYcNKYxo3S0BV8GZRT7ufJNlIt7XdLxE5pq24Yz7QGUjQCzncla3uoWftsF
 Xix8f0ZdhcjlhK1k7Y5XHg8XfaNVXUX4hAsXqYrtw5LJB66hnF0U5Lsj2fYEeB+xjhIo7dnJgQI
 U715Tx8IahwoshmNnPeyPYYM3EKtwBp+w+OyCv1TUkjMchVD+z2ximdABumBWxlAZ3jsuEVNGsq
 vUDDc5tdpdeVNzt/S8F/GfHoUZQADtAmhDTtpMLBtnyl60UYGvi2WZvBJOUFMwQmTlXomIy0RoD
 0Y6HEr6gg0elM3lk29SAndXn1F2niR3J/srx8UWfsFwk0LYpzLQuACYU048uqMFxlwvKU0f/ecu
 9VSvbpWPtxqROQg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 14:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9976

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5713da32e..6044283c4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3904,13 +3904,8 @@ system and gives an overview of their function and contents.
       ``groupadd``, see https://linux.die.net/man/8/groupadd.
 
    :term:`GROUPMEMS_PARAM`
-      When inheriting the :ref:`ref-classes-useradd` class,
-      this variable specifies for a package what parameters should be
-      passed to the ``groupmems`` command if you wish to modify the members
-      of a group when the package is installed.
-
-      For information on the standard Linux shell command ``groupmems``,
-      see https://linux.die.net/man/8/groupmems.
+      Deprecated in favor of :term:`USERMOD_PARAMS`. See
+      :ref:`ref-migration-6-1-groupmems` for more information.
 
    :term:`GRUB_GFXSERIAL`
       Configures the GNU GRand Unified Bootloader (GRUB) to have graphics

-- 
2.54.0


