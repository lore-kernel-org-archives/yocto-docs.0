Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119EAC282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 09:32:14 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.49376.1740994328546707305
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 01:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PRHzpjwB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD1A241CFB;
	Mon,  3 Mar 2025 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740994327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss8rQCLdlc3g39dKeHmkrDNOCEdsEr52NZRIIl1o8fY=;
	b=PRHzpjwBx9XH7nYhTR0yp2AqP8gSVq5/74VklFQPR2ltlb3CmMAuiHbcwEIm1ZMkDkXy+3
	2IbSzhyjgtIQNsqVkGp6RqFnImuzIOuPG5S7Y1m+dGR2mphI9OM7PG5Sg6/gWj4eJTrhUD
	OUD/6DuNwbcznqqU7ikmf5ZFDBBwZDR9mQAkgeukEfQQKqA2dXZaBh4VdV/U4TndzCuvaM
	T76FZMAF3qJKW4sywV3BBLR3+TiPibMhnvS4Ky9Lk5DyTJT+8Hq+k0ivpejs00l16KF5S3
	oKM4WvG2bw+oTq4gVqTVLOEgr8uExXsKMR9vI8XBGVzextlOak/0N0GmBQfIhQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Marta Rybczynska <rybczynska@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: Re: [PATCH] vulnerabilities/classes: remove references to cve-check text format
Date: Mon,  3 Mar 2025 10:31:31 +0100
Message-ID: <174099426453.179139.4765590974530315784.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250218155529.60917-1-marta.rybczynska@ygreky.com>
References: <20250218155529.60917-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrhigstgiihihnshhkrgesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrt
 ghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghrthgrrdhrhigstgiihihnshhkrgeshihgrhgvkhihrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 09:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6472


On Tue, 18 Feb 2025 16:55:29 +0100, Marta Rybczynska wrote:
> The text format has been removed, so also remove references and examples
> using this format. Replace with examples with the JSON format.
> 
> 

Applied, thanks!

[1/1] vulnerabilities/classes: remove references to cve-check text format
      commit: a52cd7bcadccc53e982f90d6e170d00798322597

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

