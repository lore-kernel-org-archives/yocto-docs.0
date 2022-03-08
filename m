Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5008FC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 17:58:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.11089.1646762287846237042
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 09:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y22JpObu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0E84E0003;
	Tue,  8 Mar 2022 17:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646762285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zZMWh5VW1NMBkQ3ZnWSoMdLmE5y91HDKeYddoVaTXF4=;
	b=Y22JpObuBgm31WcbhH+TD/N1U1csoTjjUUtpallPIKss/riFSYSQn5cWjRETvY1lZEips6
	GkFMfKI6H2tTxofTSOjGhiQo/L8tR8RFHpdAXrFUwt7VAjd4KyiS1NY4hdW2kD3SQayTvq
	AGvmcdHCCutHDpHb6C1IkavZAguB1C2T9SVqN0oCvr8LKH62B3vqMM2oy1SCSJ6Cfnlfa8
	+G6EjODH5EfG7rdOG770Dg0Oa0X4nPlvKa7r/8DVJd+JNDG+7WNTGJCZ1WI4E0XPkZ5FN6
	ISNaYSKT0pkDyJpy9mmyeNyitPLfgD0Fs5Wa+C/FOLHh+/aTJvH0F/2X4dYbBw==
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] docs: ref-system-requirements.rst: update list of supported
 distros
Date: Tue,  8 Mar 2022 18:58:04 +0100
Message-Id: <20220308175804.589606-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Mar 2022 17:58:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2550

Add AlmaLinux 8.5, Fedora 35, and OpenSUSE Leap 15.3

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Steve Sakoman <steve@sakoman.com>
---
 documentation/ref-manual/system-requirements.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 30294cb27a..1529ae6db8 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -45,10 +45,14 @@ distributions:
 
 -  Fedora 34
 
+-  Fedora 35
+
 -  CentOS 7.x
 
 -  CentOS 8.x
 
+-  AlmaLinux 8.5
+
 -  Debian GNU/Linux 8.x (Jessie)
 
 -  Debian GNU/Linux 9.x (Stretch)
@@ -61,6 +65,8 @@ distributions:
 
 -  OpenSUSE Leap 15.2
 
+-  OpenSUSE Leap 15.3
+
 .. note::
 
    -  While the Yocto Project Team attempts to ensure all Yocto Project
-- 
2.25.1


