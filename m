Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5434EC02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 09:01:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.38946.1737536476054861744
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 01:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZiRnA4ta;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67ACA1BF209;
	Wed, 22 Jan 2025 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737536474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6N4qUznEioWPPXjBQMOyeGAtPbOHalirQ/cCRx5wlE=;
	b=ZiRnA4tawOo7OsO/0X13A23BPxBZwpPOe8tcsOmHP2td2VpkBSbDz/c4B+ZXi8jcXHiuQ9
	mKbx4ZfErI8OIIrtiaK4l2tMCyroofGL+knB5GZPx69BDP4iAWISb0D6Cx2q2jR4sJ22bM
	Y9LbVuSkh0MZabPvP35tFlQySp7nnb0fHXwWTR40xX7scf2KFo8KK701pVwrBdweH6V/Uu
	K1PWeGFsRlareyYD26B/osTneRxQt7Cj30NI7bN/6+kKZrDSQT5dO4cuIVOAJxulw1+wHE
	9bZAzCtibueo4Qh7qDdnr2BxvvL1SJ6U7QvRm31iNhFfnk8yX+MGVCPW9OHdSA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v5] migration-guides: systemd.bbclass do not add Also services for 5.2
Date: Wed, 22 Jan 2025 10:00:07 +0100
Message-ID: <173753638985.2772552.586834647099189876.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0.dirty
In-Reply-To: <20250117161141.2194682-1-adrian.freihofer@siemens.com>
References: <20250117161141.2194682-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jan 2025 09:01:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6156


On Fri, 17 Jan 2025 17:11:41 +0100, Adrian Freihofer wrote:
> Covers the changes introduced by commit
> https://git.yoctoproject.org/poky/commit/?id=efa5f65c2214239ed7aaf7bd8998683e755c5660
> 
> 

Applied, thanks!

[1/1] migration-guides: systemd.bbclass do not add Also services for 5.2
      commit: 71acf03e02d1e21a4dbe081e75d1e4383ac2f3ac

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

