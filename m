Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D55BC282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 11:16:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.51141.1741000587476327120
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 03:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a9wHxcdN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 333B444197;
	Mon,  3 Mar 2025 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741000585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+idPEnb4NOCkTqC3GKf98ha1/G7N0cfc3Uo5RfEOdwI=;
	b=a9wHxcdNEaYcaX51NpSNbIaReAZvXgIG8++AuhrAa6dOVFMMPa+7Rayzc5BX8bX/bqubpn
	t2GEN6Y0jEZZVlfH4PCz6mZCzFbHtc3inxFQd6qnoUWnAy8RCB+zg25rRDGXwv5JFMylMs
	PWX1+LcOCgrv5kBTRj/BvrRMq6R6foCi6bZ4ffb7l8/z2WnR1gSTroROdE1TEfOai+x+OB
	9TpflWrouJI7JiytU0o+rr6QmQ/eiQIke0x1txa14wyax/TBEMw87ecisahLBwYWSKzKnG
	x4A25RxUXk8Z8k3YudZFiR3+2WKppC+UqobybYny8l91WKc5lxd4kFre2Ydzxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Mar 2025 12:16:24 +0100
Message-Id: <D86L777M38EM.38AIIV3XEFCYI@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual: variable FIT_SIGN_INDIVIDUAL
 mix-and-match attacks
Cc: <marex@denx.de>, "Adrian Freihofer" <adrian.freihofer@siemens.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250225213737.3343894-1-adrian.freihofer@siemens.com>
In-Reply-To: <20250225213737.3343894-1-adrian.freihofer@siemens.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuvefofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfevheehhfegjeekgeduueeigfduueduvddtvedvjedtfeevieduiefhhefgvdeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhpr
 hhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvgdprhgtphhtthhopegrughrihgrnhdrfhhrvghihhhofhgvrhesshhivghmvghnshdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 03 Mar 2025 11:16:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6476

Hi Adrian,

On Tue Feb 25, 2025 at 10:37 PM CET, Adrian Freihofer via lists.yoctoprojec=
t.org wrote:
> Incorporate the lessons learned from a regression introduced with commit
> 29d32063ac0abb1017756f62f94aec22ce305b60 and fixed with commit
> d63dba2f98edf89558647e336b19d805b00f4d98 into the documentation.
>
> The use of the variable FIT_SIGN_INDIVIDUAL is explicitly discouraged.
> It is also noted that this variable may be removed. It is important that
> we try to simplify the implementation of the FIT screen as much as
> possible. Adding appropriate notes to the documentation is a first step
> towards this direction.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  documentation/ref-manual/variables.rst | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index b432488a012..645bb1453d1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3173,7 +3173,18 @@ system and gives an overview of their function and=
 contents.
>        intending to verify signatures in another context than booting via
>        U-Boot.
> =20
> -      This variable is set to "0" by default.
> +      If :term:`UBOOT_SIGN_ENABLE` is set to =E2=80=9C1=E2=80=9D and :te=
rm:`FIT_SIGN_INDIVIDUAL`

s/=E2=80=9C=E2=80=9D/""/, Sphinx will handle the quotes

> +      is left at its default value of =E2=80=9C0=E2=80=9D, only the conf=
igurations are signed.
> +      However, the configuration signatures include the hashes of the re=
ferenced
> +      image nodes. This means that the entire FIT image is appropriately=
 signed.

s/image nodes/nodes/? a node can be anything (kernel, device tree...)

I feel that "the entire FIT image is appropriately signed" is a bit of a
shortcut. Instead I would suggest something like:

"""
This means that the integrity of the entire FIT image is ensured because ea=
ch
hash is compared against a runtime-computed hash for each node.
"""

> +
> +      If :term:`UBOOT_SIGN_ENABLE` is set to =E2=80=9C1=E2=80=9D and :te=
rm:`FIT_SIGN_INDIVIDUAL`
> +      is set to =E2=80=9C1=E2=80=9D, then the FIT image is signed twice,=
 which is redundant.
> +      As this leads to additional complexity without providing any obvio=
us
> +      advantage, this feature will likely be removed in a future version=
.
> +
> +      Signing only the image nodes is intentionally not implemented by O=
E-core,

s/OE-core/:term:`OpenEmbedded-Core (OE-Core)`/

> +      as it is vulnerable to mix-and-match attacks.
> =20
>     :term:`FIT_SIGN_NUMBITS`
>        Size of the private key used in the FIT image, in number of bits.

Thanks this is a lot clearer to me than the previous version.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

