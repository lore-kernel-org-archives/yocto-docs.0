Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEA8C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:51 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.12661.1709042501884276513
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UIdgZqhZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 713EEE000C;
	Tue, 27 Feb 2024 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6JK5gb1jES9Jb+UBxHrUr85C47ntva/MEU0jRsARWPg=;
	b=UIdgZqhZwBEl6zhx/ymdAXKIrVrFbf1iwstSsqaNsrmBm9xuiDE0EwAj9vszWxMF3s7EuI
	UdoCHVmCdwBDZeS2aYJsokFrxShBGBLXQ5xlEk5xbvTpQ/Lm4mCeLu0z5jiJnfN0yH2Ufe
	G4+MII+5i4T3rd4ZZFYj30dvDD6PNgUDGCcp2m8ZauNkJElq3FuqtJr8YqUbKHG2Gynabh
	VubbFgKtcJcFnVAMmpUdSaxoVSM31dheWck9LtRi7mWOGZ+MC19E5JLfcy2/lnAVQmLf1V
	MenNj1BbLNJ+a4PD3gH9Q+qlCqqRADLmd6ur5MaX5ojtb9HsO3UDitfK9JeURA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [kirkstone][PATCH 11/16] ref-manual/system-requirements.rst: recommend buildtools for not supported distros
Date: Tue, 27 Feb 2024 15:01:23 +0100
Message-Id: <20240227140128.481522-12-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4901

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Also minor correction to supported distribution notes

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>

---

Changes in V2:
- Add reference to the section explaining how to get buildtools
---
 documentation/ref-manual/system-requirements.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 159f16fb8d..79c40046b4 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -118,7 +118,13 @@ tested on former revisions of "&DISTRO_NAME;", but no longer are:
       has no plans to support rolling-releases or development
       distributions due to their constantly changing nature. We welcome
       patches and bug reports, but keep in mind that our priority is on
-      the supported platforms listed below.
+      the supported platforms listed above.
+
+   -  If your Linux distribution is not in the above list, we recommend to
+      get the :term:`buildtools` or :term:`buildtools-extended` tarballs
+      containing the host tools required by your Yocto Project release,
+      typically by running ``scripts/install-buildtools`` as explained in
+      the ":ref:`system-requirements-buildtools`" section.
 
    -  You may use Windows Subsystem For Linux v2 to set up a build host
       using Windows 10, but validation is not performed against build
-- 
2.34.1


