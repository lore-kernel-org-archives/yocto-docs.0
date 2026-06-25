Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3822CDE00F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7328.1782380026159100368
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 02:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=JU4c6tga;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D7D74E408D1
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 544505FF03
	for <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D866106F07A9;
	Thu, 25 Jun 2026 11:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782380023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ycXBoAkBWqpJTdh4xYYUKmBP3P9k7O3orRF2JNyCrgg=;
	b=JU4c6tgaOZUuo5q+aFsK7/IbggYqSN+lefzTWVWyvCldnF0g2OC+VdOIaFg14bp9eDDze2
	rpcg6NmQZqfmgWd4Y2tCXGYfilnQ0OWsekwj4mFDZQ/kQSf4kdNis/eBmSnQT7CSjB6RvK
	hgokZypPWGP04uLN1Uz0THxXoz9Jqe5cYIShiAO9q3qlSCe7YPP99CyKewcIco923MduRx
	c1H1EYVMr5kV4ru3RpS0BYe1JbYD+pfJfria/Ck0lY6hK1DbifeEJZtxjgXnx8I495Wk7D
	XnFQ4hUtHJGb3W7d1j+SVg1zH/adeF7hbJ/psziKrGZheABkbZSPi7hD/hnwKg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 25 Jun 2026 11:33:28 +0200
Subject: [PATCH 01/11] dev-manual/wic.rst: replace deprecated wks
 directories
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-wic-migration-v1-1-fef8d481aecc@bootlin.com>
References: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
In-Reply-To: <20260625-wic-migration-v1-0-fef8d481aecc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3361;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tHQQtJdhH2De3dvzAM9CR0vGK+K+ldSfTB8QVIc5wlo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqPPX0sEvRkvoCPIMgVSyQpz6Z7VRB4/ZhMkXt6
 bnyaLDQ1BCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCajz19AAKCRDRgEFAKaOo
 NoQHD/9SYt+8OcUp9T6mz2PTtHSLwv+/OiuVYtmPJnliVAcAw4y5CQRjvqY81BejbOmC8K9w+eb
 sK90z2SlBZ+jeV73AmL67lWzBRPB4Mf6qtvHS56SB9kY+4VNLnbEQ/dEUFjOf8Mpw0FZ+2kkbFA
 EMwOj/TyH/gsfh4RQnC2HYBE4QFXb6moINOwWFgySdT0c7nzJHwoNWzq1ne+rADA4ka6HQmfaf8
 YoH0zdaVGmG1sK2P04rwLNLVg5TBuNKPTqN6hv3SxlpMkvgk6AVG3gC7baIsDsjETWdos53TCBA
 /Wl80PG0p6ILOAumPFO5h8h/27+UVSBV21W3KKWL6UScIcD8RcpeNvrZVN7lOoc0BzuL8drK1dL
 NVuMazPiFUOMV8oCDNGp1reZdQxZKjarKBQ+DyxDcnkW+JV7AijLbUhJh3QHqDHOZ25orRAJ5qy
 daRifXwkmMSVukaYspwauXWf0HdWWSdHfOqJMK/GZm9cieM576MoxHfn+BEk0yO5wdVQAxOy9tY
 AsUx07QEOS+o4570cNiTJHTUFboNKxhVbL6KqtlK4AIsWXlEyT2pYuJtqaqNWniKDVRKlF7BbEv
 ncGQNe6a7uVhZSe7JwedoRA6EcorvzpEIkQNaeRcfLvsDQ/4gSn02dLbi7iDOdOVhdR6hsnmmcU
 sM48RetD8YABxJg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Jun 2026 09:33:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9884

Since Yocto 6.0, wks and wks.in files must be placed under files/wic/
inside a layer. Update the examples to use this path.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/wic.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/wic.rst
index 60b08f834..ffe1d878c 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -276,8 +276,8 @@ existing file provided by the Wic installation. As shipped, kickstart
 files can be found in the :ref:`overview-manual/development-environment:yocto project source repositories` in the
 following two locations::
 
-   meta-yocto/meta-yocto-bsp/wic
-   openembedded-core/scripts/lib/wic/canned-wks
+   meta-yocto/meta-yocto-bsp/files/wic
+   openembedded-core/files/wic
 
 Use the following command to list the available kickstart files::
 
@@ -482,7 +482,7 @@ file::
      NATIVE_SYSROOT:               /home/stephano/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
-     /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/mkefidisk.wks
+     /home/stephano/yocto/openembedded-core/files/wic/mkefidisk.wks
 
 The previous example shows the easiest way to create an image by running
 in cooked mode and supplying a kickstart file and the "-e" option to
@@ -527,7 +527,7 @@ This next example demonstrates that through modification of the
 As mentioned earlier, you can use the command ``wic list images`` to
 show the list of existing kickstart files. The directory in which the
 ``directdisk-gpt.wks`` file resides is
-``scripts/lib/image/canned-wks/``, which is located in
+``files/wic``, which is located in
 :term:`OpenEmbedded-Core (OE-Core)`.
 Because available files reside in this directory, you can create and add
 your own custom files to the directory. Subsequent use of the
@@ -542,8 +542,8 @@ The example begins by making a copy of the ``directdisk-gpt.wks`` file
 in the ``scripts/lib/image/canned-wks`` directory and then by changing
 the lines that specify the target disk from which to boot::
 
-   $ cp /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/directdisk-gpt.wks \
-        /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
+   $ cp /home/stephano/yocto/openembedded-core/files/wic/directdisk-gpt.wks \
+        /home/stephano/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
 
 Next, the example modifies the ``directdisksdb-gpt.wks`` file and
 changes all instances of "``--ondisk sda``" to "``--ondisk sdb``". The
@@ -580,7 +580,7 @@ Computing (nuc) :term:`MACHINE` the
      NATIVE_SYSROOT:               /home/stephano/yocto/build/tmp-glibc/work/i586-oe-linux/wic-tools/1.0-r0/recipe-sysroot-native
 
    INFO: The image(s) were created using OE kickstart file:
-     /home/stephano/yocto/openembedded-core/scripts/lib/wic/canned-wks/directdisksdb-gpt.wks
+     /home/stephano/yocto/openembedded-core/files/wic/directdisksdb-gpt.wks
 
 Continuing with the example, you can now directly ``dd`` the image to a
 USB stick, or whatever media for which you built your image, and boot

-- 
2.54.0


