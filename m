Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EDEC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 14:12:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.19946.1669126352598652069
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Nov 2022 06:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QV9TwmGj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C9D360012;
	Tue, 22 Nov 2022 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669126350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpwdFg3PsqY5f9HB5febJQFiqQwPy2tPt+5XUS6QmY4=;
	b=QV9TwmGjr6mHp3RA00zTO95A5keIq9wm9KYMhsXe8oyEl/AOkhtP3/aee+tSIVPqyCqGDr
	O074xEf8FXahPSIte3E0iA/XtMVdb2GXF5mBdo0zZ6o0GgdUabOleiXInLr3NxPqEthEmu
	D9OU7baUwYm9BEixH+TUEp1U4g/n0I3jakDoO5yrgrYl1LAPC3gJrS+UsTAoBs3IvLKSd2
	Uhc/PQfEqttycCaenyBhYUFijYl/mNWQP+3Cz5696OfFLaLSUWWtZBpKQBeAqKqZeNzR21
	Lm8LTddvclNK+PNCv21fXTAVyKrYmC0cjUYKoVQ0tE/HOkXemMqcnQpFHn7MjQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] ref-manual/classes.rst: remove reference to sip.bbclass
Date: Tue, 22 Nov 2022 15:12:17 +0100
Message-Id: <20221122141217.97681-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122141217.97681-1-michael.opdenacker@bootlin.com>
References: <20221122141217.97681-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Nov 2022 14:12:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3498

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Removed in version 2.2

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 3aab8290a0..aeab72a1e4 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2591,14 +2591,6 @@ in the :ref:`setuptools3 <ref-classes-setuptools3>` class and inherit this class
 
 The :ref:`sign_rpm <ref-classes-sign_rpm>` class supports generating signed RPM packages.
 
-.. _ref-classes-sip:
-
-``sip.bbclass``
-===============
-
-The :ref:`sip <ref-classes-sip>` class supports recipes that build or package SIP-based
-Python bindings.
-
 .. _ref-classes-siteconfig:
 
 ``siteconfig.bbclass``
-- 
2.34.1


