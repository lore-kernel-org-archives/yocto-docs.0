Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3222D1D46C
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:04:12 +0000 (UTC)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8383.1767884650621724859
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 07:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=zlA4/twX;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=TLiWtm5Y;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id E22941D00127;
	Thu,  8 Jan 2026 10:04:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 08 Jan 2026 10:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767884649; x=1767971049; bh=hjU3d6n7xP
	uBC+ZYD+iuLL1vyeDHNbN3Qy4KgX9q6sk=; b=zlA4/twXJ5tJXgwFnG+4ARbqTb
	/wEZKbvoDfArmBCJvUwwYnPpPPpFYUQJjGXcG6mf1V7fdQena1t+1IruqrsMCYNp
	8UXsAgc7WuPANhF5iUUFyyKPep73xRdyNs0dTn92qD6w9H66FOwU4+MgoY913jFH
	xlRUua3T1yumHyCLFjFfAiK23od1kDWwZXYAb3RExa31R54bKheBkhjasnrPM786
	uanapwYXjngLqcFq7KTSMK+KjudKPL1rUlEFoeKwEz197fq1dnk8ezrEnUQBTg+H
	OwqCwXkVCM0Ov2+by4iJE3uIJnV64txxFGScx2OLUO9Q2zEEC1jG575539FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767884649; x=1767971049; bh=hjU3d6n7xPuBC+ZYD+iuLL1vyeDHNbN3Qy4
	KgX9q6sk=; b=TLiWtm5YlT7icwWfIkMxMD3Nra/4zMFo5gg6BgoSIy+4bDWgW5v
	2bLlc/NPdUTumdvIt5ar3UKCQ0WibGN5W7b19TJ/8F3HjYmz3s7TzG6HzzRBB0Fc
	YK5VM8+QFVpOj0oElYC1Df30/XZBJxA50SgyAfPfOpSeXlVRTp8RPVJpJZU5RJzv
	T4cgYgRAm0cbS1xP0IbOl7mieEl+SDXsu+6MvrmiCvu5HXwaepcPoG06zXXugdO6
	u2yjKLSkqybUutoduKu30Ugr+FMrSC/1Dr9JiiLoGorEIxebBG2XxjAa/dDK2qPt
	VOWHYlnuQSXn57mbRnFJ0hglnkUTJdx8Btw==
X-ME-Sender: <xms:acdfaR_o8gDfyBKjcV76DnnlzApSabV4o2pSoDSD_wfn3Y-HKwAXRw>
    <xme:acdfadKmXjRAs2AvUbftoxqHEM4V8i05Cd2uRvaRjllhWKlWze1_reVdUskEtSd6_
    QzJiXJXgt4ZvVvAzVIUjzngaSFuL3_GtfgcVmj66fL9NsTZb4zIA5w>
X-ME-Received: <xmr:acdfaca7Q3Ch_FYyc-AbDCko6Z4BIAgYcHaqg3WQxuc6LIQeHaOPusoQtT70UjtAf1h7xs68M50l5bSCfZeeSqs4rc4WclysvCikvGXRt7B1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeivdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjedufedvhfehvedtudelvdeljeeiheeiveffleehffeftdfguddvveejkeehfffhnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepugho
    tghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopehthh
    homhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:acdfafJa3V6PH9PWonmAFgmMaFWIBila5e8M896gvGOChliidfDYEw>
    <xmx:acdfaaCgbmH5dqbgV6mnPjW2g0NNIn_wtWq49-Ra9fOpRWhBRsFGwg>
    <xmx:acdfaUqle76tzZFSvuJoR3HC5UyPTXovrsEqklLg6zVN34JhNGjAeg>
    <xmx:acdfaVjmMCtj7fzXm1wwPpR2OiiS0mVEOOgm_fA9A9cl3cp-uxrXeA>
    <xmx:acdfaYgzS7DpOi2fXagnIuyCFtIj_M1WqhDkpgMHmj0MIUGgrZPbyttp>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 10:04:08 -0500 (EST)
Message-ID: <42a421a406ba11170bc89a052dc28b9ed201ee7d.camel@pbarker.dev>
Subject: Re: [docs] [PATCH 5/5] ref-manual/terms.rst: refresh the
 OpenEmbedded build system definition
From: Paul Barker <paul@pbarker.dev>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 08 Jan 2026 15:04:06 +0000
In-Reply-To: <20251224-terms-refresh-v1-5-691329fd038f@bootlin.com>
References: <20251224-terms-refresh-v1-0-691329fd038f@bootlin.com>
	 <20251224-terms-refresh-v1-5-691329fd038f@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-evyuTTmSbAKh4zHKyeMW"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 15:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8424


--=-evyuTTmSbAKh4zHKyeMW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-12-24 at 17:24 +0100, Antonin Godard via
lists.yoctoproject.org wrote:
> Remove the mention of Poky containing BitBake, just mention BitBake.
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/terms.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manua=
l/terms.rst
> index 21e30de96..ea674eff6 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -403,7 +403,7 @@ universal, the list includes them just in case:
>     :term:`OpenEmbedded Build System`
>        The build system specific to the Yocto
>        Project. The OpenEmbedded build system is based on another project
> -      known as "Poky", which uses :term:`BitBake` as the task
> +      known as :term:`BitBake` which is the task
>        executor. Throughout the Yocto Project documentation set, the
>        OpenEmbedded build system is sometimes referred to simply as "the
>        build system". If other build systems, such as a host or target bu=
ild

I think we should replace the first two sentences here with:

  The build system used by the Yocto Project, using :term:`Bitbake` as
  the task executor.

Best regards,

--=20
Paul Barker


--=-evyuTTmSbAKh4zHKyeMW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV/HZhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boZHAQC1u1WkYMMZ8Q/qYH7Icb8f0Tb+KIwcCuRG
p+7ivzwRswEAzulyfhu1vVRE83LrlowGE7m0S2l7I93HGHGCfmfMPwU=
=bCrZ
-----END PGP SIGNATURE-----

--=-evyuTTmSbAKh4zHKyeMW--

