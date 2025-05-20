Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9DDC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 11:58:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.18897.1747742290732266332
 for <docs@lists.yoctoproject.org>;
 Tue, 20 May 2025 04:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UverI3PL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D3E743AEA;
	Tue, 20 May 2025 11:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747742288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uUxeMoKiVL1JprGTzfBgOaBe1+eTvTTZKUbhwT/cIjc=;
	b=UverI3PLk6ZUSdocjX0TVOV2z2obmACHl91Z1YUjW7P/sRai4oW0KfarW7WaLnM8KQo7v4
	CYkEV71VeyKiVSP3SOO0IoRJ+oFkudYrYzqCa7GVmHdhHRNkUHiYdr7nje6A2/WzliM/Gt
	mdHMdInKqwztoD9Qve+ibSPupsyOqw1f2hoqQYqG4DRi1a9nXXSF+a9vectoLw0Xu7EFnX
	kB1xXX7MVYY3saXKNXnSYyGIQ2MvZB+OB+yS68K6pWSZgcMV2kzX1UWGZ2zvnh8hj+4Lsr
	Grq1OsJl2e5V8MLyYzH6pgaPl7nOl23qqjR0vENElCkGWhC0AajH1w9XPTBPfA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 May 2025 13:58:08 +0200
Message-Id: <DA0YXN0ZBOLO.3A7DT5I4O2IX5@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <gavrosc@yahoo.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v5] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
References: <29559.1747740151983207404@lists.yoctoproject.org>
 <7615.1747740352301108544@lists.yoctoproject.org>
In-Reply-To: <7615.1747740352301108544@lists.yoctoproject.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvufhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdevgfevkeegteefieekfeeuiedvieeikeelueekffetieefgeevfeefleelheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghgrvhhrohhstgeshigrhhhoohdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 May 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6854

On Tue May 20, 2025 at 1:25 PM CEST, Christos Gavros via lists.yoctoproject=
.org wrote:
> here it is: https://lists.yoctoproject.org/g/docs/topic/patch/113161969
> :)

Indeed, sorry! I did not understand it was this one, I was expecting a
series of patches.

I'll have a look, thanks!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


