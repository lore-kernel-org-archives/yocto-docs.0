Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC80C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 09:38:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.15957.1738316319083652369
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jan 2025 01:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j5K9XBBx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65487432FB;
	Fri, 31 Jan 2025 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738316317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=neaJPMylggqeLCjYqYYni3cPQf37SOggSBx0zFPM6mE=;
	b=j5K9XBBxssQVRl2etjjAzHgNcRgupk7vCHESg0ex9MHAnSDVJooH2pTnJO9n2UibsK4MjM
	Sp3I9pjt2x+0GoRa7XUgp7QS2ytmAlfWEoM7TiMhUyML+0QNKD11l4cgJqsU+guuvSxZcq
	IWN0gtp6jGCZKDWZP4qaAV0CBZrG99jYV4tTAFTZVPfBLn0DVqRrOKiXkbzzEqvu7Plrs/
	nEQHQXyeUwTQu9/HMLfBKvsdiw/m577rxS43Q45Vt6LePEpVxh95crf3HIKCBBWlJzU34U
	sj96g/Q+BYR1ZwHw0CJgfafLZfd2u28VC25vKL9Vy8u3u+v5qcwXFV06ieGi1Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	yocto@pengutronix.de
Subject: Re: [PATCH v3] ref-manual: add documentation for the barebox class
Date: Fri, 31 Jan 2025 10:38:20 +0100
Message-ID: <173831621367.33004.16596490430200121817.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0.dirty
In-Reply-To: <20250119221005.1586540-1-ejo@pengutronix.de>
References: <20250119221005.1586540-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepvghjohesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohephihotghtohesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jan 2025 09:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6218


On Sun, 19 Jan 2025 23:10:05 +0100, Enrico Jörns wrote:
> This adds the initial documentation for the newly added barebox.bbclass
> to the Reference Manual's class list.
> It also adds the two most notable variables to the variable list.
> 
> 

Applied, thanks!

[1/1] ref-manual: add documentation for the barebox class
      commit: cc8179122441cdc26ff62511dcd97f7bf9bf7e3d

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

