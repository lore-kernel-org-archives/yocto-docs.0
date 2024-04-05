Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B532CC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 10:04:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.7339.1712311454121801096
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 03:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DS2AvPSe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B77C0004;
	Fri,  5 Apr 2024 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712311452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVDwgu7r9HbioqPx0SK4U59cmm/UphmWBHbrHSKwS1g=;
	b=DS2AvPSeTD9m9q4aHRISLWpk4yhxohm12j5JPSfCexMPzryQ2xOtUZGuklR+H3x5CsCv+t
	Y5N4AMgX04VFUsux5/MeTKxb2NaKXsD8wRDSo5BhcjDxNB+3ts2yDuhJOGGLyxYWDx6VaA
	YIoQBgDG8uN0Bo0XZqU0UKl4AURs1i4whSvzmCm9lcUbMTdo5JMv2ZmlevV7Bd57PUIJfk
	59P2UDMuG01xUPuRVQcrGWrgjuiefumQFTzSzVhIAsMVvhN80k28bqnST0P+x6bms9aDLw
	n6wxF6xzK67WaVnRaae0fbFUoUqvrQscRZdJbzg+i7zvpAm7+vU0wvTMhFepGg==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 1/3] classes: document new go-vendor class
Date: Fri,  5 Apr 2024 12:03:52 +0200
Message-ID: <20240405100355.2268926-2-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
References: <20240405100355.2268926-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 10:04:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5069

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

A reference to this class in the release notes will be added in a
follow-up commit.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 8612128f7..272df0dfb 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -939,6 +939,19 @@ The :ref:`ref-classes-go-mod` class allows to use Go modules, and inherits the
 
 See the associated :term:`GO_WORKDIR` variable.
 
+.. _ref-classes-go-vendor:
+
+``go-vendor``
+=============
+
+The :ref:`ref-classes-go-vendor` class implements support to offline builds,
+also known as Go vendoring. In such scenario, the module dependencias are
+downloaded during fetch task rather than when modules are imported, thus being
+coherent with Yocto's concept of fetching every source beforehand.
+
+The dependencies are unpacked into the modules' ``vendor`` directory, where a
+manifest file is generated.
+
 .. _ref-classes-gobject-introspection:
 
 ``gobject-introspection``
-- 
2.43.0


