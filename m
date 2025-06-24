Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A63C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:23:46 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.2921.1750749816717164765
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gId1OdV3;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 384BD44A43;
	Tue, 24 Jun 2025 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750749815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2JrNro9/9M+BgVx/Ntxm+Q4h629ggTUUG6fO9NHr8U=;
	b=gId1OdV32Ziv1BEMhOQ0EzCbClFHV+KwLLrT3pfQCxgkiiR8Ju+GOiozsn4xEYVwb+W0hb
	1HUTkkPrzIcdsG9m6M7E48cx6HZ6Ktf+pI2Z3S2vn+kcEx28GuL1ZbYEloIK0W/+fYpX2/
	sV7VwrUl9KfOd5CRzZcOaC2M3o5cuyg2XxMyJUsYg0NluONNDdBm5VXEffNHoKT5Pzduqx
	4183WSJflEGkOZ+E4Qr4UReafqTRbx0tEpQ4QTU2pd9n6JYOvKTM0rKfhh+2Da8KpTEPAe
	ME9C4iGCsuHXJ/WO55fiQ/n+6dXOPAc2KYJ04YsGNmta2N2EyWV9Kqnnuc4b8A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: small number of pedantic cleanups
Date: Tue, 24 Jun 2025 09:22:56 +0200
Message-ID: <175074974634.298373.16730168044574468793.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <008123f0-0e2a-98b6-ea68-934a857ffd44@crashcourse.ca>
References: <008123f0-0e2a-98b6-ea68-934a857ffd44@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:23:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7182


On Thu, 12 Jun 2025 10:17:23 -0400, Robert P. J. Day wrote:
> In Sections 4.3.1 and 4.3.2 of the Overview Manual, a bit of tidying
> including:
> 
>   - provide full list of packaging options
>   - add monospaced rendering where appropriate
>   - fix broken "ref"
>   - make capitalization consistent
> 
> [...]

Applied, thanks!

[1/1] overview-manual: small number of pedantic cleanups
      commit: 1cf769e3c8a8442cd05449dc97e91ad482d635f3

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

