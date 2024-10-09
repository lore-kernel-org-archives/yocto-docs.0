Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559DACED622
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 07:41:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.10721.1728459696227287348
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 00:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pYLcOw2z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BECFE1BF209;
	Wed,  9 Oct 2024 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728459694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UG+Qfs5Qa/fbskkR5Hqf9wS0lq01TUqILKL8xBl+6lc=;
	b=pYLcOw2zkTsw/jGRN/hXwmZUh3I1z6qKTgKmUehSvcdukHWWRfD5aU9V75ycaELKMGEL1S
	gMflvXfNQUVKfuqxOnNHGYnpnaa+AZCpxGTLf3J5Uk1mWv4xDqXR+I3pwcsf5V+4eAWhTz
	5HEDRn1XoeejjYvBtUaVma8S/gE3vuiNAyS8qDlx3+gRXtwaIasjZ8Pt7lRP7c8wSbVIdj
	+Kp+vtIHYypBYESIE89wpEzcVWstDr/m+vJa0xYCL/Vcrp8ylzklxXk47X1m8jBGWnIzZ0
	MSrRwcKlNTbmjtBzoDA4G4e4nK0YkpqGZaOEwaCFHgnQCNBqd44CmQ/6G4456Q==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org
Cc: ross.burton@arm.com,
	paul.eggleton@microsoft.com,
	thomas.petazonni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 12/16] ref-manual: add missing variable PRSERVER_UPSTREAM
Date: Wed,  9 Oct 2024 09:41:10 +0200
Message-ID: <20241009074120.866786-13-antonin.godard@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009074120.866786-1-antonin.godard@bootlin.com>
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 07:41:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5419

From: Antonin Godard <antonin.godard@bootlin.com>

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 72781d93b..985fec5d6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6878,6 +6878,11 @@ system and gives an overview of their function and contents.
       service <dev-manual/packages:working with a pr service>`. You can
       set :term:`PRSERV_HOST` to other values to use a remote PR service.
 
+   :term:`PRSERVER_UPSTREAM`
+      This variable can be used to specify an upstream PR server for the local
+      PR server to connect to, in the form of ``host:port``.
+
+      This makes it possible to implement local fixes to an upstream package.
 
    :term:`PSEUDO_IGNORE_PATHS`
       A comma-separated (without spaces) list of path prefixes that should be ignored
-- 
2.46.0


