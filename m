Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933EBC83000
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:36 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web11.3076.1750749816115569104
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d1h88Y6J;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97E8144A42;
	Tue, 24 Jun 2025 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnN91/yq9qA17pwS+pJXqBmw4y9Ges8u+FlpNJLJeV8=;
	b=d1h88Y6JXRJ0GZ9gYPtHktkv8D+jWgxjsSNd5zX+SZ52MmfHsOVewWN+1CNZViFASAdM40
	1DFZp4cwjIJq0RVX5r2dnZttmEaTH56xVHIdu0V+3ZWqJV0tAnyi31TiMI+pjBC16IWgTd
	EO34ArjK6FCLgcxvlMvZ8Zgg95W9k1xqmK3I90/v3+oQZGWRJT1v6DFVc6GkwDMlHdfEX0
	oB81rQP9elSGk8h9oM+h4JNHQ+3G6zFS5e/GXSUeJrcVft6dOlEBi3aXu1VadV/eMW7AhJ
	7AG6sXCKZKzjWa5TFDSfBPlzb8dpiTl0C0VS2V+WFAI14dYJBJnGDYrouMJc2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] bsp guide: update kernel version example to 6.12
Date: Tue, 24 Jun 2025 09:22:54 +0200
Message-ID: <175074974636.298373.18250186295212760038.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <dc8e4016-70d0-d090-6d8f-3996212563fc@crashcourse.ca>
References: <dc8e4016-70d0-d090-6d8f-3996212563fc@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7180


On Wed, 18 Jun 2025 06:33:57 -0400, Robert P. J. Day wrote:
> Change the sample kernel version being used from 4.4 to a more modern
> 6.12.
> 
> 

Applied, thanks!

[1/1] bsp guide: update kernel version example to 6.12
      commit: 1bad12b6ccfe1c0d26918926176a0c743568de26

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

