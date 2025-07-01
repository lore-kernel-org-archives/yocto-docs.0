Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D60C83F05
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5731.1751359517845937993
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WFRwWV4j;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 356CA431D7;
	Tue,  1 Jul 2025 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8RNqQcX7iWUyHghhnKJN5FvTSWxWyXZShx3HdussuQ=;
	b=WFRwWV4jMeDcPPbcX8OZLsqbzuiR7+UIg5ujmRS7Jgmi4Q0l/rGrCAiVOaUrfX7TaYno2y
	IRMEmM7Kefaa11gyuuqkZNLM8syeAHKYwVvT1Kr3cwDpyGsWO/C9s/+VZP/HKMC2T+uFG/
	MLnsQjGiF4aldnKMHUKutdPfkUN1gmDu9ln+FoRwQqm1c64o7ql3UDmU/4gM11CEFYH6vx
	7r0nqdX/LsnzYc4EKaioyznL6RNGSE5nzAOPyU3fkcdeejVeH8SOguqwqnZyrYNkEERbZC
	84IfGlpIV9s/+I5w3sxKTZ7fEUwWJmR5RN9Q8Kdba1S6+TAxn1yBq5Y8/sdsrA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Anibal Limon <anibal@limonsoftware.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	erik.schumacher@iris-sensing.com,
	yoann.congal@smile.fr
Subject: Re: [PATCHv5] test-manual/ptest: Add info about fail state of ptest-runner/ptests
Date: Tue,  1 Jul 2025 10:37:21 +0200
Message-ID: <175135901843.368044.1533740747871414144.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619161315.201350-1-anibal@limonsoftware.com>
References: <20250619161315.201350-1-anibal@limonsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeuiedtgeekledvtdduueffgfdttedtudegteevgfeuhfduudfhhfevgeeiieelnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghlohepthgrhhhomhgrrdhhohhmvgdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnihgsrghlsehlihhmohhnshhofhhtfigrrhgvrdgtohhmpdhrtghpt
 hhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepvghrihhkrdhstghhuhhmrggthhgvrhesihhrihhsqdhsvghnshhinhhgrdgtohhmpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7239


On Thu, 19 Jun 2025 16:13:15 +0000, Anibal Limon wrote:
> On the ML was pointed about no specific information about
> ptest-runner/ptests so improve docs around.
> 
> https://lists.yoctoproject.org/g/yocto-patches/message/1622
> 
> [YOCTO #15832]
> 
> [...]

Applied, thanks!

[1/1] test-manual/ptest: Add info about fail state of ptest-runner/ptests
      commit: 0d1fd79019883f366d796b58a01679297d7a5508

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

