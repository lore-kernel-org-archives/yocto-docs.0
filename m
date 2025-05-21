Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942BBC54FC6
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 16:45:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3908.1747845900151415694
 for <docs@lists.yoctoproject.org>;
 Wed, 21 May 2025 09:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O91hJeDz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8468F43A45;
	Wed, 21 May 2025 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747845898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdVS3z/hAPurtjOrrtQVyxDh670V2MMKjBefNvMQ/QU=;
	b=O91hJeDzgzD1lo2IOtWURrszgcyU0TKyzjT8JnOJYm9JcWLlWTVabgX9c+U6aX3yxuCyzg
	TBo8PiQDumo3KGtoyOTMv6UdUEOaHzqShIWEGs0UbKaxa5GguPIorjXyqYO4u9fYnxHL++
	HyTQnbh3GlwIT7CfibyBZpL52HSnOZL7ChdXUGd0e5E1xB+gk0ZzZ5H4NBYFjkq1PFtuWD
	LfwDDxLP+Erw7BNdt59Fpt74/HjD4foUXMUDpTXRkSa6gjmrOipRywMVRcSJbkEX8LlXJR
	c0mC/pE3qMq0ETZxzqNer2e72zIIgr8QXZ+1ZpiQdTLxb/MHjCRuHrxFjqqjKA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	yocto@pengutronix.de
Subject: Re: [PATCH] ref-manual/variables.rst: update ROOT_HOME documentation
Date: Wed, 21 May 2025 18:42:26 +0200
Message-ID: <174784571489.218104.68739783560338748.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429181255.2858778-1-ejo@pengutronix.de>
References: <20250429181255.2858778-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedukeffuefhtdejteehteettdfhieejtdfgjefhleeuveehtddvlefhteeiheetleenucfkphepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemudgsuddumegrtddtudemtgdtfhehmeefsgefmegstdegvgemuddujedupdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepvghjohesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepthhhohhmrghsr
 dhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohephihotghtohesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 21 May 2025 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6866


On Tue, 29 Apr 2025 20:12:55 +0200, Enrico Jörns wrote:
> * Since scarthgap [1], the default will be overridden when using
>   'systemd' as INIT_MANAGER. Reflect this in the documentation.
> * The distro configuration is probably the better place for
>   customization, thus at least mention this together with the
>   local.conf.
> * While at it, drop the probably redundant description on how to
>   override weak default variables.
>   The example on how to set "/root" is still given indirectly, anyway.
> 
> [...]

Applied, thanks!

[1/1] ref-manual/variables.rst: update ROOT_HOME documentation
      commit: 50e92009d309fc4ae406174feb8f6578142748cc

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

