Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09C3CEF176
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:48:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.9585.1728395296530168126
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 06:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xd5fTvrQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9995E1C0002;
	Tue,  8 Oct 2024 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728395294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nK625pDiXomAFYFT7WpqyhL9O2LNBdVHzSl++JTDQb4=;
	b=Xd5fTvrQPFwUYOgjKWSdDKHCJOMbJN3zxyaN471cjArpob8e7hyTSgEBdQ7njrXMQTKMO5
	PN4QoXIDuK8VzuJ/n2Z3cKyscxnCKpP6PJytMPI7Hx4ADuufd97aaL58UY+YyfsesHEaiM
	UxAdJxnkSWyLiHrV3k9N+erNNNeOFnCyN7Yr727sihRitIj9d6vx/1u71RoeYO+zXJLHSL
	L3CBFv8gBR+F7UBjpJbqdLl85YupXg6Gb7+4qIXjpX7nSrZ8QWhXq4cEAA2y+2TRcurfzj
	Yl+8lhKC3tkuhFJVzhPBlV2aYChA0KAU5CHLxS73E2FStw4u2zTI+Nu5kPAkDg==
Date: Tue, 8 Oct 2024 15:48:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [scarthgap] Pull request
Message-ID: <20241008134814c85d90e3@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Oct 2024 13:48:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5405

The following changes since commit d71081dd14a9d75ace4d1c62472374f37b4a888d:

  doc/features: describe distribution feature pni-name (2024-09-03 10:36:35 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/scarthgap-next

for you to fetch changes up to a854b398db797394677ac8e15b5459373c1c3cd3:

  migration-guide: add release notes for 4.0.21 (2024-09-25 17:24:23 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guide: add release notes for 4.0.21

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.21.rst      | 166 +++++++++++++++++++++
 2 files changed, 167 insertions(+)
 create mode 100644 documentation/migration-guides/release-notes-4.0.21.rst

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

