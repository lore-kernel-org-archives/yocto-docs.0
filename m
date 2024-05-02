Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EABC3DA40
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 06:57:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7639.1714633045481444612
 for <docs@lists.yoctoproject.org>;
 Wed, 01 May 2024 23:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CCPBVzUC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2184E000A;
	Thu,  2 May 2024 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714633043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+tzHbJ0xEDsk0FTdvkNS2jptikkMX6WqJK+kNFd/hc=;
	b=CCPBVzUCWoTjM/f39nWahN9AEyZh9uqcsfgSKe7BKdSmrqZjA3yVWePAPTlSIfkbtyJxSl
	uV39C5dIsiD98DRZ/V2QQjZ/KmHmidtyWsYxcjwk3uqTmkpFpDixlNjLz0Zj8KAIj+yMFF
	RaCcomTD0+72WRVsXFqeijixWEB0RAnCtrJft4Gh/R9lNfO5HyP/bdMOhaLxhCtyTwzCA+
	EfXeayQD1y06opDbAvOfXvFvuGK5Za2X8lwl1GSws+05dQQVzaJZWDN/Ky4+9SLpidXnbo
	nmELa3KoUrF0vAltlJG5en0nkFc5syolRNxQSuQ4Vno5+NV04cr9pLPx7ankmw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [kirkstone][PATCH 1/6] ref-manual: variables: Update default INHERIT_DISTRO value
Date: Thu,  2 May 2024 08:57:16 +0200
Message-Id: <20240502065721.22607-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
References: <20240502065721.22607-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 06:57:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5193

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Geoff Parker <geoffrey.parker@arthrex.com>

Add remove-libtool to INHERIT_DISTRO defaults per
meta/conf/distro/defaultsetup.conf

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c2a6566341..42e9d4d964 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3768,7 +3768,7 @@ system and gives an overview of their function and contents.
       The default value of the variable is set as follows in the
       ``meta/conf/distro/defaultsetup.conf`` file::
 
-         INHERIT_DISTRO ?= "debian devshell sstate license"
+         INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
 
    :term:`INHIBIT_DEFAULT_DEPS`
       Prevents the default dependencies, namely the C compiler and standard
-- 
2.34.1


