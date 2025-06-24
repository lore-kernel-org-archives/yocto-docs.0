Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B86C7EE33
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:36 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.2920.1750749815961108399
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c+gpsToo;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47A6144A3F;
	Tue, 24 Jun 2025 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5FiwnzabFmc52oX3IihEl1ry4y8604mhpPYjgYFgHjs=;
	b=c+gpsToo51+t8xsWmvpzdB+1Yg9Zpw2IdNSA8UBHgraoqXcSC4uXP4ARaLGeAcogKqhX9x
	XIn0NoG/1wIlCR8yA5b3nzqH7UtQX5koPr6t/TN7Sfn49opc1vx+dclGNF0uSxQZRxKTiX
	vgqH2cGT4UQq5iJkfaJ2F//hI7oSK6lGZqbY35doaz6TI3kkuAgfaykoLG4AdvdP+HbM1P
	NDTP7pUr7PeItymCHvlEmMSQkbvrZnhkGLpX80AbZz99Z8AfjCe1QZYsBPy5lY5p7znbWJ
	ktZEy+HZhI/8MtdN/nsT1u9+ZFiG4+Vi2QvHuWW/xVUVUEUbozwgXbTXTqwVuA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] bsp-guide: update all of section 1.8.2 to reflect current beaglebone conf file
Date: Tue, 24 Jun 2025 09:22:53 +0200
Message-ID: <175074974637.298373.5334269320385968503.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <de29a1ee-8b61-87cc-ddb5-950d143c2942@crashcourse.ca>
References: <de29a1ee-8b61-87cc-ddb5-950d143c2942@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7179


Applied, thanks!

[1/1] bsp-guide: update all of section 1.8.2 to reflect current beaglebone conf file
      commit: 5fc7794e9ae326eead16552726d74ea801fe535b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

