Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C154BC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:44:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.82276.1749545061548513491
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 01:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J55DsHTS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEF0043967;
	Tue, 10 Jun 2025 08:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749545060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ht9yxWIBDJcmO8sjH7Um1V+zPn+p2yg7nU/EbvdrtYg=;
	b=J55DsHTSgLkSRh6BES0LAfOMXnyOtxAHbSPlQARlC+w5ETPEGZsYHrgEg34cF8l5Q2rUNf
	9DgMt2Mw/9anwaqfVMlOJctIZ/7oe9zUhhK8MCr8M9xHJRXpxMNwmMOHRH0Cigj8vAyn6q
	iu1zv0EtBq86Tub/wC1rmOT0FbHAJ+baCoYHdeEuUSVnA1zNbQfCJTDMnHE8FTqL0MvpsM
	2arvLvWnhSAVBccEOj6siaH6vy695MGq6rM1c+PcMEWfOw7+mjG58iWfOmUJ2iVBZaid0b
	fzPy1giLWRsiog0CnIaaLvpcZql+v68+w0VZOvaiI5X3HwIzHM2n4RL4/kG76g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs][PATCH v2] Clean up explanation of minimum required version numbers
Date: Tue, 10 Jun 2025 10:43:52 +0200
Message-ID: <174954493839.20869.4896416852168179736.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <77073870-67eb-b7ba-80c7-a88ed13a2ff2@crashcourse.ca>
References: <77073870-67eb-b7ba-80c7-a88ed13a2ff2@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 08:44:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7043


On Mon, 26 May 2025 05:43:54 -0400, Robert P. J. Day wrote:
> Some simple rendering and grammar fixes.
> 
> 

Applied, thanks!

[1/1] Clean up explanation of minimum required version numbers
      commit: 9a9624bfc4c523a6edf6f3f0c336e663cc939e75

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

