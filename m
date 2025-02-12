Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338DDC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:11:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10892.1739351482137748908
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 01:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Tocv71Gw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D75A4427A;
	Wed, 12 Feb 2025 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739351480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwJU+qlaZhX0kcrzgo54POcnTBVnPks7sAOyVtAtr7k=;
	b=Tocv71Gwnk+YMIIQwUtTIzKp1K1Pf0J21/ddzeAE87U723VM4g60JWEyOGHAihgYCHsUCO
	cL8bJD4KIWiZp1rW3jlLeR6QFDzJ8BHbZhuvqaTQFa9zILKFF+GeuMaiKw1Sapu9c/AcMx
	G+Z9P6oTxrjBiWSTxbr0DaurlYbDQglX0761hVyOPAkQt/oVvMuUNYANeLrk3DTFMvnsA7
	t8hQLJxMb5orT8OwF5rpoXSBhb64qBzySaAkZfKzo+EFZg3m6uzy4x0B/UO3M2XP1f9rJC
	wjuKfLiUnymSf44mbBeaIz36HbjWxEZbQkidyWRupbkXpRgs24szzwKuN2UASQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Simon A. Eugster" <simon.eu@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] documentation: Fix typo in standards.md
Date: Wed, 12 Feb 2025 10:09:15 +0100
Message-ID: <173935134322.2046854.7005437354843655766.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250128113735.52229-1-simon.eu@gmail.com>
References: <20250128113735.52229-1-simon.eu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfeeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekffeuhfdtjeetheettedthfeijedtgfejhfelueevhedtvdelhfetieehteelnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehtrghhohhmrgdrhhhomhgvpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehsihhmohhnrdgvuhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Feb 2025 09:11:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6351


Applied, thanks!

[1/1] documentation: Fix typo in standards.md
      commit: 9007d7eb63b296aae832028924d89f83dc159992

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

