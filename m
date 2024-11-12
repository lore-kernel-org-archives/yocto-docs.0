Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AF0D32D8F
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 10:57:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.83927.1731409042775864648
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 02:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=if9mkJea;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF23540002;
	Tue, 12 Nov 2024 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731409041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6piSGgTb7tHwSXgPRdwJGmnnVOrpxNQ97zbxHd2xHmE=;
	b=if9mkJeaYcXBsVHm/wX1426mlHsRWjv//7K1toX6xiLDBIrZDaFqGHjEBWUbhSsAgCoIqo
	K1GvYIx4WUjSMPVskDhJhaLcEieNH6QenmsqVQebmXRCB3dz76SEueycI3A9IofDs1WzbN
	8PSvLTU55PPQ4LYqi9cYDHV9owQfgaOxZr1noCUFeImc4axbX0fPrnMNCit3H2FnzZn1qS
	L6y2WpoBY8OWzx0Z65n8McKjSe0CE39sIxNqju+w9Qi3MpWHhIoNZYjnxDjt90yTZr1mYj
	a9BMtSGP2BDZBuMXLeaey3/6VqIMpEeblkJInQ3BSq0jfBDROe4xkIKaKQ8Mpg==
From: antonin.godard@bootlin.com
To: docs@lists.yoctoproject.org,
	Talel BELHAJSALEM <bhstalel@gmail.com>
Cc: thomas.petazzoni@bootlin.com,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs][PATCH] contributor-guide: Remove duplicated words
Date: Tue, 12 Nov 2024 11:56:58 +0100
Message-ID: <173140896548.1188876.13533633461285601227.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241110105742.567048-1-bhstalel@gmail.com>
References: <20241110105742.567048-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 10:57:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5713

From: Antonin Godard <antonin.godard@bootlin.com>


On Sun, 10 Nov 2024 11:57:42 +0100, Talel BELHAJSALEM wrote:
> Remove "and then" as it is duplicated.
> 
> 

Applied, thanks!

[1/1] contributor-guide: Remove duplicated words
      commit: 90666b8c85fe6afaf102034ebcd5d25d8391e697

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

