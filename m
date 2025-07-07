Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB83C83F07
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 08:14:06 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mx.groups.io with SMTP id smtpd.web10.54806.1751876044720197009
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Jul 2025 01:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H4NyajrC;
 spf=pass (domain: bootlin.com, ip: 217.70.178.236, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E443F438D0;
	Mon,  7 Jul 2025 08:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751876043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1kyADJ5/o4w3gfseUpXVFC3pbJsdXLt5hitnaz1sAyk=;
	b=H4NyajrCs1TyAbd6T2hwb8vwD2rbTO/nBH2kcViXD6H7QQViHQFFckbYgSGWQnxvFc4dyq
	JFnQeKOFNwa8b2y79VSbYNx7WGtZSJLBdYQ90jFBdj8PIJy0fyUCGdmnAI4OvtoRsgKah8
	I+CFJ0Ky4TLAqm95Uh5NKzCJx1o2RjY9srnLRFgfeKERC5lTuCOELy56fRsqvMmsDPmlll
	mGu/osb6FcFOu2Dm/wTKSBcc3/NLEOZZPYbEO2ssBU9qGZjvBp6RxANRPJo/TIMqd9VkUq
	Y33mcGOaZ0VgwcIvT9i73ehf7aWlAopesKU7QKtIeKn7/cZiNlEPO74YQYWs2w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual/yocto-project-supported-features: update contact for meta-intel
Date: Mon,  7 Jul 2025 10:13:36 +0200
Message-ID: <175187600748.33933.5913983014005931324.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702140450.3251232-1-chee.yang.lee@intel.com>
References: <20250702140450.3251232-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefuddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegthhgvvgdrhigrnhhgrdhlvggvsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Jul 2025 08:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7266


On Wed, 02 Jul 2025 22:04:50 +0800, chee.yang.lee@intel.com wrote:
> 


Applied, thanks!

[1/1] ref-manual/yocto-project-supported-features: update contact for meta-intel
      commit: 083f4c60128d16756c78f61c4cade49e11764034

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

