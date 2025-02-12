Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEFDC0219E
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:11:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10894.1739351482743192042
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 01:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VEmS9ftk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1352844281;
	Wed, 12 Feb 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739351481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XB73kC2jea+izh1TOY3ABB2PgZeCGzaor4HQX+4JyRc=;
	b=VEmS9ftkaeAcbOy1FDJzDPor51w2cI6TTc+ytxGl9pUy/ilcB9fUeYrwBL6OqHG5+EvP0O
	DU/4oo6Q3uKVJDSpFCBN6JNj4pa7q4nNDzbjIpshqtnvQl4TOt76BdSRXA6HJHv8jElXeS
	xR+y57KVUBu6yV0/zjUQf8Amy104QW5dtVg3X+rzKk89DVbgbVmb3jFSs9X7eyKmVvhLK7
	EIUx8PhoNfG6hhUbc63ZkTOw1Aym7jh5SQPC07uiJ6FdOCSFxFC4MNM+lT79CZDE5hNSRg
	gd2Mi9YCkX51p9GcLQT46bhD8WC6/71UtQbZHqiv/DggoYsDEsUz0MyUdA6Tew==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v2] dev-manual/packages: add information about signing changes
Date: Wed, 12 Feb 2025 10:09:17 +0100
Message-ID: <173935134321.2046854.16925452427038439144.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250130090403.2471098-1-zboszor@gmail.com>
References: <D7EOLBIP4NGZ.2873VJSZNHBXI@bootlin.com> <20250130090403.2471098-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeiisghoshiiohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmp
 dhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 09:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6354


Applied, thanks!

[1/1] dev-manual/packages: add information about signing changes
      commit: 6c1a77e5db7ae9910d24deb023619b9391c8b4ad

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

