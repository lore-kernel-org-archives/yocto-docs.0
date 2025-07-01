Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DF2C8303E
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.5585.1751359519684673198
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jq1GYk5Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 250ED43221;
	Tue,  1 Jul 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZOy0sJMPo5i7Ro3rb/V9TIitFBzDqr4lWWL8BuigfE=;
	b=Jq1GYk5QrmYTicGMA+lFLxfcg6FiIbFR14FILF+0rh2PFpqyxNR6k9XiGZVFy0LETCcq44
	/SHD6L3N5DRmgW0sQNNpsOwyCCLtI4KOb+M205oqAeOoeVHeYxvo30d1EbVoI4foqx/1ww
	j/jA+ea+ZSKaK8Xt32YHB3SCN7YbdFiPC2BbhtWO6NhxjB40oJEJPznpqnnPeUXnjsG1nF
	7t2QPX6x74gRbxnebubYgAGpz5Kye3SavemLclJFUxeJXR66xAzw5jbRIDUNFwUNiy2uZD
	LmjCIKP6BbfqihdD0kYo+9D/haQRj1IO+B1TrWzVj627ExwBP4cJv6AUojC72g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: fix broken rendering of bullet point
Date: Tue,  1 Jul 2025 10:37:26 +0200
Message-ID: <175135901847.368044.9544179395365887489.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <5bd4e038-fd6c-5ec4-cc6d-c1b1726f6e6e@crashcourse.ca>
References: <5bd4e038-fd6c-5ec4-cc6d-c1b1726f6e6e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7244


On Mon, 23 Jun 2025 12:27:40 -0400, Robert P. J. Day wrote:
> Tweak the formatting of the bullet point title so that it renders both
> the term and the bolding properly.
> 
> 

Applied, thanks!

[1/1] dev-manual: fix broken rendering of bullet point
      commit: 68068c5ab4f4c46c57bc055bd663f8e66096dd20

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

