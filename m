Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66ACE7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:06:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15911.1736330788952605769
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 02:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cCR9Pkt6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1900B24000C;
	Wed,  8 Jan 2025 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736330787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+uPbHVh5lJoTC+yco4UUhTT7F9198B7OxYp7TPkFzEU=;
	b=cCR9Pkt6nNrvIFARoHVgXjLAuK3vc+qp/RftRk9xEcB5LT6yZHtA6WHGQ2stCAoh8t1S++
	ALiNc5u0HFrUY5rcNyxzg/62NQ8751djDlZpn9mprir1H6plGEC1mVxRkvKWM/MvZ3+DH5
	aWmK+shyZAJkW12spkNdpwOgdI2zlq6m5n28kzBZ3uZIHTgCGucM22yuhr8CBARPLPCHDN
	KHNUNaWJBIO0RLFkwp/qRsBfW3pMJrGQ6aJLwZTLv1oncM7H6XQeD1MdlP0YsEj/RVMNKn
	+pwkmVTQavTV8K8JZd5iHytgjLgKAftKJEZ9nXyJYPKCOZL9KIP8IY9rD/eXag==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Gamblin <tgamblin@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs][PATCH v2] reproducible-builds.rst: show how to build a single package
Date: Wed,  8 Jan 2025 11:05:11 +0100
Message-ID: <173633070041.1489607.7107289023182379369.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219145225.3367912-1-tgamblin@baylibre.com>
References: <20241219145225.3367912-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 10:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6064


On Thu, 19 Dec 2024 09:52:25 -0500, Trevor Gamblin wrote:
> Add a bit to the "Can we prove the project is reproducible?" section to
> show how OEQA_REPRODUCIBLE_TEST_TARGET can be used to test a single
> package (rather than the world build), as this may be useful for
> maintainers.
> 
> [YOCTO #15619]
> 
> [...]

Applied, thanks!

[1/1] reproducible-builds.rst: show how to build a single package
      commit: c4bc09f61621938086be377653121d6b4e62b570

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

