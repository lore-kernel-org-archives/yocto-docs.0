Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD03C282CD
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 09:53:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.49980.1740995622128354355
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 01:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EUTz5MnM;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84C14432FB;
	Mon,  3 Mar 2025 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740995620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KrtG4B5v3do51d0olaYrDSJRmohu7qOqT6/rBJE4oc=;
	b=EUTz5MnMb/Ypr9m4K9e2B0KxFlNzdqeZBqT08pQDbXUCeRp7qe1YwpaBO4fTP6B2OflLlD
	G1YjZI5C6FOrWupg/BAkE3ynXfrzAg8OvkQvHLsOAzMDeMf+nts1PlYhFjZEofmvYXiG/7
	ZV/khm7ULYkxZznhhZRzn9lr4gMQFtFtatDVE7+uRukSuYsSTsYmr6mEP+ymKH7P7U6ZyC
	peeLIGqrW1dVcvlmdnHMioaMbmIgymVyxql3TJjrk6Pu9CLkrfgXNfX0ji2ogp8hWGKeAf
	qv5FGccx4VpGnr/P2N9qbV9PAOTS/n05eeqXPRpt1EKRvk7W0bFyxgpNoPrNPg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Mar 2025 10:53:39 +0100
Message-Id: <D86JFU1QJHTY.78XB8P642EP5@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: variable FIT_SIGN_INDIVIDUAL
 mix-and-match attacks
Cc: <marex@denx.de>, <rogerio.borin@toradex.com>, <L.Anderweit@phytec.de>,
 <quaresma.jose@gmail.com>, <quentin.schulz@cherry.de>,
 <richard.purdie@linuxfoundation.org>, <seanga2@gmail.com>, "Adrian
 Freihofer" <adrian.freihofer@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250224231156.3335643-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250224231156.3335643-1-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudduleegveevtedtjeejgfduteegtdegvdfggfduuefgteelfeeikeehffehffeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhop
 eguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopehrohhgvghrihhordgsohhrihhnsehtohhrrgguvgigrdgtohhmpdhrtghpthhtohepnfdrtehnuggvrhifvghithesphhhhihtvggtrdguvgdprhgtphhtthhopehquhgrrhgvshhmrgdrjhhoshgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 09:53:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6475

Hi Adrian,

On Tue Feb 25, 2025 at 12:11 AM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> Add a warning to the documentation of the FIT_SIGN_INDIVIDUAL variable.
>
> This is a conclusion of this discussion:
> https://lists.openembedded.org/g/openembedded-core/topic/111218371
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index b432488a012..de7f0a3b292 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3175,6 +3175,27 @@ system and gives an overview of their function and=
 contents.
> =20
>        This variable is set to "0" by default.
> =20
> +      .. note::
> +
> +         Setting this variable to =E2=80=9C0=E2=80=9D is recommended for=
 several reasons in

We usually use regular quote here ("") not =E2=80=9C=E2=80=9D and Sphinx do=
es the magic.

I would also remove "in particular" but that's my taste.

> +         particular:
> +
> +         -  If :term:`UBOOT_SIGN_ENABLE` is set to =E2=80=9C1=E2=80=9D, =
all image artifacts
> +            contained in the FIT image are signed correctly. This is bec=
ause
> +            the hashes of the image nodes are signed via the correspondi=
ng

"of the image nodes" I'd say even all kind of nodes right?

Proposal for rephrasing:

"""
This is because the kernel, device tree and ramdisk image nodes hashes are
contained in the configuration nodes which is also signed.
"""

> +            configuration nodes. Signing the individual image nodes is
> +            therefore redundant as long as the configuration nodes are p=
roperly

You imply that there are multiple configuration nodes then? Or only one tha=
t
contains the hashes? Unclear to me

> +            signed.
> +
> +         -  Allowing to removing the image nodes from the context of the=
 FIT
> +            image comes with a risk of mix-and-match attacks. This means=
 that
> +            an attacker could combine different signed images which toge=
ther
> +            have a vulnerability and allow an attack on the device.

Not sure I see how this is related to FIT_SIGN_INDIVIDUAL... I don't see ho=
w
this is unsafe since the configuration node is signed and contains the hash=
es
of the different nodes.

> +
> +         -  Not sure if this feature will be maintained for the long ter=
m.
> +            It adds complexity for a not obvious benefit. This can be se=
en as a
> +            problem, especially in a security context.
> +
>     :term:`FIT_SIGN_NUMBITS`
>        Size of the private key used in the FIT image, in number of bits.
>        The default value for this variable is set to "2048"

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

