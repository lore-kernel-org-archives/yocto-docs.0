Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F05C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:34:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10664.1749022458420711511
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 00:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mxOlDapi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D89F0430B7;
	Wed,  4 Jun 2025 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749022456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmSUs+ENltAoo1vukIWAgMLZm7xdahih8qSIHBESOyw=;
	b=mxOlDapikaPs6l4uSdPx08MOk2zmgoFDgRbLkjaGktFTJcm+MnFm7XZl2um2CTib8Aroh1
	7FCICL+GliwLx91wZlaxuTigSVEJwPDtcY+hZVDMU/3RbV4Asn0xZyg0g0+bWeu8UGhnfz
	5bapLoHHW72GXEhvV/bwn+ISYtjEy+EzQh7iziZCzLft6hTAzFMEYmktDZoKvFQC7lWelc
	rQrCu506/28qS6HK9Djt7pvERwlUdsLpjhIXgiUhdt4ZjSvEtv4yYU/IMhAoHBJendgeUQ
	7mE/9gr1j8Iq3IrHI9D1RfKXt4X5HCeQrOOWL3fuT3bDo9wNpJ9Z12fNYT8S7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 09:34:14 +0200
Message-Id: <DADKPRAZICS9.UPRP8FSQYDQ2@bootlin.com>
Subject: Re: [docs] [PATCH] clarify how bbappend files work with an
 unversioned BitBake recipe
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <562c3a8a-2cfd-a4cc-7dc8-0126b5b02a86@crashcourse.ca>
In-Reply-To: <562c3a8a-2cfd-a4cc-7dc8-0126b5b02a86@crashcourse.ca>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgfetkeeuiefhffeugeejuedutddtveeugfejhfdtiedvuedvheegffekveetfeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrphhjuggrhiestghrrghshhgtohhurhhsvgdrtggrpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Jun 2025 07:34:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6995

On Mon Jun 2, 2025 at 3:28 PM CEST, Robert P. J. Day wrote:
>
> Add a short note to the BitBake intro manual chapter to clarify that,
> given an unversioned .bb recipe file, the matching .bbappend must also
> be unversioned.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst b/doc/=
bitbake-user-manual/bitbake-user-manual-intro.rst
> index 539bb62d8..1c3faff0e 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-intro.rst
> @@ -272,6 +272,12 @@ append name would not match. However, if you named t=
he append file
>  In the most general case, you could name the append file something as
>  simple as ``busybox_%.bbappend`` to be entirely version independent.
>
> +.. note::
> +
> +   In the infrequent case of an unversioned BitBake recipe (such as
> +   ``linux-yocto-dev.bb``), the corresponding append file must be simila=
rly
> +   unversioned; that is, ``linux-yocto-dev.bbappend``.
> +
>  Obtaining BitBake
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This needs to be sent to the bitbake-devel@lists.openembedded.org mailing l=
ist,
with this list in copy.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


