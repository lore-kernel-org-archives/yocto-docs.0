Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2868BC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:00:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.34563.1753081244316782421
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 00:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ewdF9wKw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D66A4433C;
	Mon, 21 Jul 2025 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753081242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0hjbvO2h6T+M29MWRK8hDw38A0ztMkHacpQLbITEUM=;
	b=ewdF9wKwFJW9WITa1ktJaQE/uLAXni91rVmcoDOslrmAmOf6Z2qyIo/qdslZaoEhGYJmiY
	OiMlJGHkLy8SAP2v8QTRXz3f1gF7PO4uEoFvMRAetJ/WVHqCSrhcrDDeMOcejVC+xFau0j
	mpkGfhj1I11Iu7EmXyoTmVih54O/5DPWMN+0G/W6w9i7C+4S8iUlwYparUJlr5MaPZuqDv
	uZlsIUvOJH9yLP3H+H6UlsFYXnLdjhcRmjipY6NXySJeN3YWZUXaNTS+G47J7gU1sCJyrM
	DP/qbbkoqVf1SkZ1ms9R4uKAi5X6BbUEloxUPLAbASAy88p82XLp/KioAjrSMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 09:00:41 +0200
Message-Id: <DBHJFODNAHX2.1F1Y9FOOE7AF0@bootlin.com>
Subject: Re: [docs] [PATCH] start.rst: added missing command in Optimize
 your VHDX file using DiskPart
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Marco Cavallini" <m.cavallini@koansoftware.com>,
 <docs@lists.yoctoproject.org>
References: <20250719160642.15601-1-m.cavallini@koansoftware.com>
In-Reply-To: <20250719160642.15601-1-m.cavallini@koansoftware.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejudegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefgteekueeihfffueegjeeuuddttdevuefgjefhtdeivdeuvdehgeffkeevteefnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhdrtggrvhgrlhhlihhniheskhhorghnshhofhhtfigrrhgvrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Jul 2025 07:00:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7356

Hi Marco,

Thanks for the patch. Could you describe the issue you had in the commit
message? It's hard for anyone to understand the context here, and having a
commit message would help understand why this change is required.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


