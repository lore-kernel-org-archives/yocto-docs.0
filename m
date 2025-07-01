Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FADC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:45:32 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.5736.1751359521854736632
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 01:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U9CUXUks;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E06743904;
	Tue,  1 Jul 2025 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751359520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXgGcLhxe3AdDJTNj5GootMshhW2EdKL1Qe498YLmSw=;
	b=U9CUXUksQETqZ0KcCFJkoV0fcbx1o3Pr3BAXs2UfS8ZGKJeZ1I1RcdAtYEcGDuExSsvWDI
	qXo9mQmZeTZDHj9OQBiWWcyGTQWxvGwekzXeN84TE2N5ZM4qqDRyplNuYSnttDK63tNCsT
	jY/nm0sNljrZhueq+amyOB1fZ5O9/oiDexCXIZAFiAx3dZut2GBu7OknxgXJiCrFsJHdUV
	YxSHml2Qq1+qWdf8aRDqhpbOHo2wGmdGxe5C2i/qcNUZZfa/FC/PE/T7to4piZuV6toK5I
	YfTeUm2i677rw0y5D10L5qjKssf9gNoowi5sRRTciQm+KPiEVY0wAWP1d3auTw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: update list of recipe files showing version numbers
Date: Tue,  1 Jul 2025 10:37:33 +0200
Message-ID: <175135901851.368044.13737204581022973907.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <043d203c-8d28-1f3d-7082-70e69919423e@crashcourse.ca>
References: <043d203c-8d28-1f3d-7082-70e69919423e@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 08:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7251


On Wed, 25 Jun 2025 05:05:33 -0400, Robert P. J. Day wrote:
> Update the short list of recipe files showing examples of proper
> naming, and replace obsolete "irssi" example with example using "_git"
> as a version.
> 
> 

Applied, thanks!

[1/1] dev-manual: update list of recipe files showing version numbers
      commit: 95691fa4e7d30ee27cb1280df20751bf449538a4

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

