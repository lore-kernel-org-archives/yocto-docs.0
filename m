Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9FBCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 09:48:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.161742.1712742488216205554
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 02:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pnT31olf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FBE41BF20A;
	Wed, 10 Apr 2024 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712742486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KiUkMQ81lXZIA5A9bJQ52R50GHohIsQq1EGIH4T/W9U=;
	b=pnT31olfBTJXGjAAh7AzC5f8y13m+N73BKRlKDEIJsvnqH56xNr0+W5gXilf7nKZoQwWAW
	QvzUtHoHeaLxD8fDofPuURzI+Kw7yS9j355P7NFirxDFKuMdnqE3Q/osPwTRyjdnXY8Z0+
	3OQ5p2OiOQeyGxGQN3cj7Zbfu9Sl30xywtvbcTwq6UCfC+D61poH95oigVdm0gwWmkjxak
	mWZknFYAAbvlmLb/tZbxhsM66xcEeE9hLiZTveiui1/DnBPuc/Rihwt4+ziaCuy7NTUkU8
	mRlLlPefKUn9XDOS8FGuWD/eKMgsEpq1dPN+gPOo/GWwT9SzL6o3xipPkTqvaw==
From: joaomarcos.costa@bootlin.com
To: docs@lists.yoctoproject.org
Cc: thomas.petazzoni@bootlin.com,
	michael.opdenacker@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/2] Add updates to release-notes-5.0
Date: Wed, 10 Apr 2024 11:47:44 +0200
Message-ID: <20240410094746.2978238-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Apr 2024 09:48:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5103

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

Hello,

The following patches add most of the missing sections between 'New Features /
Enhancements' and 'Known Issues', with the exception of 'Proeminent
documentation updates'. I also updated the variables glossary to include the new
terms mentioned in the release notes.

Best regards,

Changes in v2:
- fixed core-image-initramfs-boot description

Joao Marcos Costa (2):
  release-notes: add updates for 5.0
  ref-manual/variables: add new variables for v5.0

 .../migration-guides/release-notes-5.0.rst    | 123 +++++++++++++++++-
 documentation/ref-manual/variables.rst        |  16 +++
 2 files changed, 138 insertions(+), 1 deletion(-)

-- 
2.43.0


