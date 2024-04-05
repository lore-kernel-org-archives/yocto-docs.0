Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BB8CD1284
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.13789.1712327713761994489
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 07:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oIOrHWAD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43FCCC0005;
	Fri,  5 Apr 2024 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712327712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vxYvp6YShAkiPa1Egum7I4isxuywKvyYKCK5Tnyxoo=;
	b=oIOrHWAD7wOojtoa0IWRh1IR/hAKSPlIDTJk8qGf/G1ZuvTZtQxC7KBl1eUN7og4jTcHhp
	pNseg+zQz3BTLSGVB6FZ/GdZj/WSROswYrcm7OvsVPv7kYrnSgpmk6oxcPRNpieRCGliVy
	sxyBE52Kff8lQIA1URjgAUUnHVDcoK6vAT78Edah4eYOo4eBDqp57WC2GMsSK8mwNc8OSQ
	+sXwO8H/bJ+Kw0CVzb/vK/xz3XeQ6+6r+6qKjMpJvwGK7tQzC7G9SGK9dyHgD9Tk6dRY5+
	oBtiYGPHY5FlSIxgakxZHpt7rvpT64Ut30Y6RioGpZXdRK/SebIJ0hv8OLmZbw==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 5/6] migration: add a second space after the items
Date: Fri,  5 Apr 2024 16:34:52 +0200
Message-ID: <20240405143453.2281900-6-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
References: <20240405143453.2281900-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 14:35:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5080

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

One space was missing between the dash and the backward tick.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 documentation/migration-guides/migration-5.0.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-5.0.rst b/documentation/migration-guides/migration-5.0.rst
index b03b7ec8c..301b7a3d2 100644
--- a/documentation/migration-guides/migration-5.0.rst
+++ b/documentation/migration-guides/migration-5.0.rst
@@ -104,10 +104,10 @@ Removed recipes
 
 The following recipes have been removed in this release:
 
-- ``libcroco``: deprecated and archived by the Gnome Project.
-- ``linux-yocto``: version 6.1 (version 6.6 provided instead).
-- ``zvariant``: fails to build with newer Rust.
-- ``systemtap-uprobes``: obsolete.
+-  ``libcroco``: deprecated and archived by the Gnome Project.
+-  ``linux-yocto``: version 6.1 (version 6.6 provided instead).
+-  ``zvariant``: fails to build with newer Rust.
+-  ``systemtap-uprobes``: obsolete.
 
 .. _migration-5.0-removed-classes:
 
-- 
2.43.0


