Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC27BC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:44:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.81775.1749545060065437283
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rm8GmhIG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07F4D4328D;
	Tue, 10 Jun 2025 08:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z98zxOtQNXQ0BkDLlXkhxrypxsXhMJRqSJtIUaE1x1U=;
	b=Rm8GmhIGQK9TO3bjyB3L35Z/JA9cjMcISNxbT+EjLkN/GmAm7bcdxY1x/6tdePJKKdgYFz
	30NFQ1Gv21vBAYZr6G5lvFAeRWa6u16mNimISRswn8XdC/81F+xzGjeYVWtIFUqswaLJaM
	PY8HaafEGyv0HDk227ihJS/k5DQ7sMirI5lf329tW+TD8tJAouqj4O7AEnbXMvWEcHrFu4
	dkZbDEYa+4/QLjA/FZfxXXEQ4mhBuusoGMhkfsMNXQNgagxeNHmVuvPXOdsQOM78LBV5ct
	AMKnrSmmGxsLpVrUFn2CRx7H2S7agOR9HAS/G+vrCFMjZJEVHjcuWGeP6478cA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guides: add release notes for 5.2.1
Date: Tue, 10 Jun 2025 10:43:47 +0200
Message-ID: <174954493840.20869.3373854414829185812.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250605052905.2343826-1-chee.yang.lee@intel.com>
References: <20250605052905.2343826-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopegthhgvvgdrhigrnhhgrdhlvggvsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhli
 hhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:44:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7038


Applied, thanks!

[1/2] migration-guides: add release notes for 5.2.1
      commit: 0624495c4584fafffaedcdef21d65686043f45b0
[2/2] migration-guides: add release notes for 4.0.27
      commit: 612f8c6f99297c1c3a7347be93fe713dccabeffb

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

