Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5302DC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 09:01:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.38951.1737536484884185464
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 01:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dqJHwv04;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5878D1BF207;
	Wed, 22 Jan 2025 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737536483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9p96E58jloNfx8uHOQWd3tXmhV68p+MJj4dXihTDms=;
	b=dqJHwv04e8GoWPocDg18bt4W74BkJm4xfSPmBTJBqKcu422yBPNrB2lWYwmREB1jin76BT
	R/vRzhU5pF2ZMLZO0Vqie1JwUFa96nEV2bGfT2H6GrB2XQoxYyIhUbzJFyWtIrooE9Ezyj
	t6q/STUDpPN4avCQ1YbxGecXDXIDqngMegghGrtsRxgjqRvjdU/hHB7f1sP1M/5LwHbiQf
	FcvvrJ7JbG36MXfw4rLiB++ydMwvgxVPnofJuMzKtF4QHuzzVaEDcDU5bPBEVzJCA27brp
	MjHHDdLIN+AqA18T5QE4ACk81Nurd/+j+JqigGlmFbhh0Rvpzhml12RMQMTHmQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 5.0.6
Date: Wed, 22 Jan 2025 10:00:09 +0100
Message-ID: <173753638980.2772552.11032763238104620032.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0.dirty
In-Reply-To: <20250115072834.3563904-1-chee.yang.lee@intel.com>
References: <20250115072834.3563904-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jan 2025 09:01:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6157

Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.6
      commit: a4e242463fee5b4e0194e32ba2ca3c1747af2b60

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

