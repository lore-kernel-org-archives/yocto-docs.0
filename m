Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D95C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 13:26:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.105.1750426002067008786
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 06:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lyvc9VjF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F236C439F7;
	Fri, 20 Jun 2025 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750426000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UgZUGFZqGmImEyI5vobbjEWk6K//BBaGH1QCQyyxh/Y=;
	b=lyvc9VjFK2LRGGqSuODbY7+vlVkOtjvbOzMbfohAQszX+vs67HbO1W8C4wkE5TOPkSWeiU
	NQozjmGSAPimE9f4qOsvbtTgXOQ3NXkRlOdciC03IqlhiCx5gcbsnQE5xcacEsFOTcfFc+
	RCvTbLOoB1xjC8hWtuK+h+oQuvLuRVdjeiXKiw76zbYGZxmh7VWdG7xOts1U4siHbJBoXR
	aDYfGGZKFlAEP0XmPEub3VJSypYom5TMKZbipwvj+oT5/bnztLhNo/iVqmwVFZi21CkYid
	5IpMr5Jmkhb7yATNiWJosQKEIOZT/OfCLN0IsPrG0w8eSLKIRiZfdpfdqVFtJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Jun 2025 15:26:39 +0200
Message-Id: <DARE8AZAFPC6.37QGF7GPGEJ1I@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual/yocto-project-supported-features:
 Update to match current status
References: <20250620130702.2498598-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250620130702.2498598-1-richard.purdie@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeltdfgjedvtddvkeejiefhteefjeelkeeigfekhfdtgfevgfefueduffejtdeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjv
 ggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 13:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7126

On Fri Jun 20, 2025 at 3:07 PM CEST, Richard Purdie via lists.yoctoproject.=
org wrote:
> A few items were in the wrong sections or needed clarification, tweak acc=
ordinly.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../yocto-project-supported-features.rst      | 23 +++++++++++--------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/documentation/ref-manual/yocto-project-supported-features.rs=
t b/documentation/ref-manual/yocto-project-supported-features.rst
> index 345280d67..cae24f3cd 100644
> --- a/documentation/ref-manual/yocto-project-supported-features.rst
> +++ b/documentation/ref-manual/yocto-project-supported-features.rst
> @@ -92,10 +92,10 @@ Below is a list of primary tested features, their mai=
ntainer(s) and builder(s):
>       - meta-exein layer testing
>       - TBD
>       - meta-exein
> -   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualiz=
ation/>`__
> -     - meta-virtualization layer testing
> +   * - `meta-webosose <https://github.com/webosose/meta-webosose>`__
> +     - meta-webosose layer testing
>       - TBD
> -     - meta-virt
> +     - meta-webosose
>     * - :ref:`Multilib <dev-manual/libraries:Combining Multiple Versions =
of Library Files into One Image>`
>       - Multilib feature testing
>       - Collective effort
> @@ -114,7 +114,7 @@ Below is a list of primary tested features, their mai=
ntainer(s) and builder(s):
>       - pkgman-non-rpm (other builders use RPM by default)
>     * - :ref:`Patchtest <contributor-guide/submit-changes:Validating Patc=
hes with Patchtest>`
>       - Patchtest tool selftests
> -     - TBD
> +     - Collective effort
>       - patchtest-selftest
>     * - :wikipedia:`RISC-V (64-bit) <RISC-V>`
>       - RISC-V architecture testing (64-bit)
> @@ -211,20 +211,19 @@ builder(s):
>       - PowerPC architecture testing (32-bit)
>       - TBD
>       - qemuppc,
> -       qemuppc-alt,
>         qemuppc-tc
>     * - :oe_git:`meta-openembedded </meta-openembedded>`
>       - meta-openembedded layer testing
> -     - TBD
> +     - Collective effort / openembedded-devel mailing list <openebedded-=
devel@lists.openembedded.org>
>       - meta-oe
>     * - `meta-mingw <https://git.yoctoproject.org/meta-mingw>`__
>       - mingw based SDKs testing
>       - TBD
>       - meta-mingw
> -   * - `meta-webosose <https://github.com/webosose/meta-webosose>`__
> -     - meta-webosose layer testing
> -     - TBD
> -     - meta-webosose
> +   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualiz=
ation/>`__
> +     - meta-virtualization layer testing
> +     - meta-virtualization mailing list <meta-virtualization@lists.yocto=
project.org>
> +     - meta-virt
>     * - :wikipedia:`RISC-V (32-bit) <RISC-V>`
>       - RISC-V architecture testing (32-bit)
>       - Collective effort
> @@ -256,6 +255,10 @@ it is on a best effort only basis.
>         qemumips-alt,
>         qemumips-tc,
>         qemumips64-tc
> +   * - :wikipedia:`PowerPC (32-bit) <PowerPC>` Systemd
> +     - PowerPC architecture testing (32-bit)

I guess you could update the description to:

"""
     - PowerPC architecture testing (32-bit) with systemd
"""

> +     - No maintainers
> +     - qemuppc-alt
>     * - :wikipedia:`PowerPC (64-bit) <PowerPC>`
>       - PowerPC architecture testing (64-bit)
>       - No maintainers

Otherwise LGTM!

Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


