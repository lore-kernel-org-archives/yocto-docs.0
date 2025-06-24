Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F47C7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 07:47:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3317.1750751243264378593
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 00:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aeJ2DptH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E117A4441E;
	Tue, 24 Jun 2025 07:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750751242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SgBhGY0+VQBe2wJ2vdl5waX36jGEaqIZh+QJTWQhDIU=;
	b=aeJ2DptHms8nw9xrQKNsM2CZqihiQniZiPkNW7kKbZGofKqPQ/jCXV2AV/a9SX6oI4bsPo
	MmojJHNRCtkMx/9hCWwP4Du+ZPK+t8kwZ6CXkuTu+j9k2Y7XsxxzhdjoPa3lqiU310jPGF
	gQ/9hYVvaKdsSY24L7HGI1cYDnZ/Mor5IzJsx5xVxTVXo1q5UKpmfZNkhSmE+v0Y4KOrow
	PPqjONXYPPRlsW9LEMnJTvqSyNGfL/ToYUp+HWkPsEE8a6UDiqempeeRIwcAQEkVW/nJuI
	BntRBAQ19evR5TucIbJpfqFwYY0sD7zgjQYBmxCSep60L/O3/oPA8jy9NtRw2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 09:47:21 +0200
Message-Id: <DAULIP34CY9R.QQ612GXE94MA@bootlin.com>
Subject: Re: [docs] [PATCH] dev-manual: correct statement that source is
 always tarballs
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <9c2b4c83-b40a-4f21-1680-e95a9e238a82@crashcourse.ca>
In-Reply-To: <9c2b4c83-b40a-4f21-1680-e95a9e238a82@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefgteekueeihfffueegjeeuuddttdevuefgjefhtdeivdeuvdehgeffkeevteefnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 07:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7185

On Sun Jun 22, 2025 at 4:50 PM CEST, Robert P. J. Day wrote:
>
> It's misleading to suggest that source is always fetched as tarballs.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/dev-manual/efficiently-fetching-sources.rst b/=
documentation/dev-manual/efficiently-fetching-sources.rst
> index a15f0a92c..2f8a68e20 100644
> --- a/documentation/dev-manual/efficiently-fetching-sources.rst
> +++ b/documentation/dev-manual/efficiently-fetching-sources.rst
> @@ -6,7 +6,7 @@ Efficiently Fetching Source Files During a Build
>  The OpenEmbedded build system works with source files located through
>  the :term:`SRC_URI` variable. When
>  you build something using BitBake, a big part of the operation is
> -locating and downloading all the source tarballs. For images,
> +locating and downloading all of the source. For images,

This is also present slightly below, in the same document. Can you replace =
that
occurence too?

Also I would suggest "all of the source code" instead of "all of the source=
".

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


