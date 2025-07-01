Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FAFC83F02
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5734.1751359520542443093
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d05Rc8AP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0759D43224;
	Tue,  1 Jul 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scZJGtCjtlUFDbywaHb5e3S3b00hfe69UlIF3sr3we0=;
	b=d05Rc8APaquNaX2UZgArMIHNUG8D0uJ8bSB8/tzvTcfegvYoaH98OV0SmwX68E6xtjd01B
	fasWyTU4kbx+wi9HqNHCHLcVzrSKA+BwDmZDcmQyRsPZjYCizLBD7ZxyzUMpwhBeSE4vdy
	NlOl30G+2ISupKX0ZPEeps/O+ZW0bpdvgkM/z47gvCz/F2+BIE4cxLmFSpEFJPLSWSoeQj
	T/p/gtAW1kZsmBLZFRfqhJjQrhtcXPEk8RTkCDUFR3eVohDUl71NaSIAKdmdLMX9akjRvB
	Qm2jeQUS/UtS5qboAyqgtuUGXo8HxreY4HiJXlFwIgtg78NZgiXQ1i8uTYPBOw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: replace "on the contrary" with "by contrast"
Date: Tue,  1 Jul 2025 10:37:29 +0200
Message-ID: <175135901846.368044.5563047484960461204.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <4214b475-52f5-bbe6-04a7-0dded5906f2f@crashcourse.ca>
References: <4214b475-52f5-bbe6-04a7-0dded5906f2f@crashcourse.ca>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7247


On Mon, 23 Jun 2025 11:27:39 -0400, Robert P. J. Day wrote:
> The qualifier "By contrast" is more appropriate here, since that
> phrase is used to introduce a point that is strikingly different from
> what was just discussed, that being the substantial systemd.
> 
> 

Applied, thanks!

[1/1] dev-manual: replace "on the contrary" with "by contrast"
      commit: 3e73c7985dceb865e648f86ccd82aa0e7fc6668e

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

