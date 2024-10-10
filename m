Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFBDCF11E6
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 12:11:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.41792.1728562260489847812
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 05:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nwqIg8Lh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04637FF812;
	Thu, 10 Oct 2024 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728562259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5dSyM4P29WaqKrU16lnD7vl83QRx9xBFHR+axy5iUQ=;
	b=nwqIg8LhNopYhwATDFZOOQdDmzkCS2c6hIK3eOsfCf1c2MFLiO5t9BPuvt/7p7bBiGZRJv
	9Lcbw+07LzRJsPuK5NOQjlIUsEfZiXIaPjbb0MhN5bYTk2WnxeYtDXyp2V9lDVUb/twljj
	zvhYNtGe21FlADp26/6QlIX6EALeJyL5ovyfuFMH49hRYc0tqIKpN6/co4anowhfCBafw2
	qUqqs7uwHd75i+I9uajrQAXKLNG5y0LCGM/8NgXP7biRbGYjlN4dGZG+GDa41Sw5/cYzza
	kno/MVuzZXtDs6LGKUGQ5I9Z3YSOfN7wv5lKO0gAHP90sDMTOlbK6WWMN7XAxw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 10 Oct 2024 14:10:36 +0200
Subject: [PATCH v3 11/16] ref-manual: add missing OPKGBUILDCMD variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-release-note-5-1-v3-11-2cef1a58f1ab@bootlin.com>
References: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
In-Reply-To: <20241010-release-note-5-1-v3-0-2cef1a58f1ab@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=g7ugOkmNQnHAwE5WmcttExmCURxR7IE0IzakG7obh1w=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnB8ROWoI5d8N+fiy/SOQBqpcWwza9DT/LN/CpD
 kNqnDwgO0GJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwfETgAKCRDRgEFAKaOo
 NsMZD/9sAVRxGYJ1JbP7N3eSLqTIHTD/kdzrgBCc4o+uNdleOvks9YkXlRjrTr4sphLP/T9qzUh
 1fBVwJnZHjOYTUGACmFmPhHB4Z6tV+i7eKBJN25DP09ePNe6rL5SNAzGiYtADT1ujDhkwsizNyJ
 HThkqqEdWjhea2Gua4KsC2M8ZN3O3L8eSQyE92zpv7/MrAZPcjjFyBY1JqPdT0IUPoOF3ypvVoO
 igJ+wF6VW6BopQgM7kwkQx4zv49v/len1LGmPV8yza6bhMgCRYngdfjMTDPXxmkiGcEBEjttJXy
 m9pGHsUTZ0K+nvYHx50TFzRqOPmPnIft+/0nPp68IkH/CSLBdbyBA3EFLPDaZIYS1JpNaSCIg9C
 xIJeRvNPZ5+eG6SuwgKz+UgIcoxjVRtbpdVqRwDIL20SpPIePLTOtJs/5dVbv+SkP1NDURXD9ri
 g29r0cKNQCmZ0LNqhWt9Zf7iiBhQLfrhSdhsA5Esj0weyAovDumKDmDg/UXz8z59UvWS9pvecnM
 VUYQ+QKC0ZfEBNY99MLT4e0Xjg2yKPC5X+FyDQWsjrpC3snr+zferS8rEEPyyR3PtVOKD7KxAEk
 hJeo9XNPg+1qlXGmJZru8z0nE7R30JPMLqITyMRcttGQx1kOT3/ClCchjFX5OYPzKV/9YTcOtjF
 tRRBV1wh5RhLxlw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:11:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5463

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 5f4ef0251..cb082cbdb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5761,6 +5761,13 @@ system and gives an overview of their function and contents.
    :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
       Specifies extra parameters for the ``opkg-make-index`` command.
 
+   :term:`OPKGBUILDCMD`
+      The variable :term:`OPKGBUILDCMD` specifies the command used to build opkg
+      packages when using the :ref:`ref-classes-package_ipk` class. It is
+      defined in :ref:`ref-classes-package_ipk` as::
+
+          OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
+
    :term:`OVERLAYFS_ETC_DEVICE`
       When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the device to be mounted for the read/write

-- 
2.46.0


