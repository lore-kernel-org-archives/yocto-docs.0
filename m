Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24C2CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:58:43 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126190.1781517513749223077
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Jun 2026 02:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=SAd5O0v2;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=JUEJ+fzZ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D6A307A00E2;
	Mon, 15 Jun 2026 05:58:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 15 Jun 2026 05:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781517512; x=1781603912; bh=mgZeyivZ6X
	6tMm5rhJmPpj/CfeF1CnGoocG6697HQUs=; b=SAd5O0v2jaAxLB+DGhBpGCrXFl
	NeeMZGfckSVSzBouOdxzrvHLFWgaivC3Z/E5QNopmJaqzEtSlVKJY8D5oJ7QA6OB
	ZZRWkJbI/2FJUGa2WVVlhSdZGgYS9e2ehnUmjlJVVFRzH8L3cyxDbff1aGjz1qCj
	a7b9mnv/yPm0wF1vjBo34XxvMfPGcCjsNLTpJrAUa3m3E0o0neSM0EXHQ9wGRzU9
	QPG0o8Gm32OTtOnES9n8ERXrrZx54AemJe57uSN9VXB3dDBsG6IFMSfevnO0593/
	g8w6ATt8+5M4/xsCLaKDzgcPjTB8jQlju2O5vruZcFc2fFnV8lT21qW5UF+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781517512; x=1781603912; bh=mgZeyivZ6X6tMm5rhJmPpj/CfeF1CnGoocG
	6697HQUs=; b=JUEJ+fzZXqq02+FDCKJumsuQJacgWLQa5RraDUQbTHxhkwztt2o
	+9LG5CV9DOrQLkqD7/C3au2gGT9fLNu7fPSqj7Sbm/+s+Lw9ERlUowUdiQ3XdJTr
	dpq168cG/oBEqMygSz4nEW0B/4SqiuqJEXFm+h+0tMp2QSFrVYfrWBHoUOj/Tj0O
	3zyjj8dFiXDSlUCEag7BWDu1f6pUSB/IRZ08SMKc5t0tD3pvs+L4zuOXDR9wQ0xs
	sE2hvSVzUMw3z2hKyZrAlyN/Citl0R0pn3Qdz7b+WF3LU1qSJykA2EJnHeaXLJHt
	Gg5Da5VQjROMvHCqqdAxsSlv16qjcUmdxyA==
X-ME-Sender: <xms:yMwvaunNeurjIOpDWHhWE3ohEXA14xu6OnRrC9qCcbCmjtbcSGJ3aw>
    <xme:yMwvar2hqOTBA0RuqFnXbwT3AXhcY-ap9YI4P6PrELqPc-LnAesXEAT2A4iqIlQ0A
    Wc_tIF8uCKuMBtGEbJZlWuMKUugvwWy6TSBp9ZPWsOzjbbxZLTPAw>
X-ME-Received: <xmr:yMwvaqShoRHtgqPc4s9KWQiHG-APxOWsyFoHsR2llebE91xfNqhhRHUWxP_GKoiLIm8Zy50x6Fg4duOz-Y45Fzp59FN2nvAg9MTmKUPlrmJ3>
X-ME-Proxy-Cause: dmFkZTGtNC9eStnPixhI9fT1Z+CetjQOfUZRe4UWXdPc3suVeax/iZ1lpBc25orstYYrpS
    oUnpntRNH285ywC1TodarqDXWtXvVPKrzHb0aAMP90DG2yaTmbEOAu67/WuWAg/b0ENqNF
    eqwJfswVCWf7c6HmLW+TTwLJWwPTcszEb5Wx6XoJwd/jcuCWl4NlSZDtkRVvCKgeT++rPN
    t6vo88GdK0Z44qwgjYyeMiCiyP+dF/gc6oeSbGp5GsPRuvT6qTaLSv4QdP9t6/o0A+jgdz
    6s43K4f7gkcA/7Cms8KMnbHbJQZXw6CZqUlHmapM7GDrbsoJRd5y7OSYhzBegNq0o5D3LH
    +MQ+KKIELHmd2NMg45oV+BOeuqss2a3jZhHXxCGQtuO9eb4M030iluaMEg3FIbvcjWDzJv
    l9jaVglNUy/uuvkE7ya7cnUzFq6w3MsGJbeJ+rLJg+G2wibruoPm/pWV0pV5DFezJnIJpK
    +j7d861n8htMy+tygWZvw5ZcWFdAAUYn7/DMLvLezE56UE38kvi2nIGFMC2p71O+9NNZ0f
    xN4OK4DCMvAgmCYjAYS8NpfmPrS5brpgEQRFv2BkQjEXp3NY4yuZzs2OVemF6F7LPQp2PE
    fTSUP97aMsHBay59svjHIhY5UbcTdL4D9aPQcOpWgx/sh1oUTgWzebxwta9A
X-ME-Proxy: <xmx:yMwvattzFRwEZTy_Q8xM7QenjDGga_8pOAS3bpUZLu6PDzXXiLuXwA>
    <xmx:yMwvavaT49webvyk8KVVuCOdyXvyIUBUGRLWa0AEv101Ai64oDibKw>
    <xmx:yMwvaivvNNw0NT6mMUTs7HgUgHVY24fLpDwkK0bUeatSIoUQa2U7vQ>
    <xmx:yMwvahEqo_KUKbqmruN178MKIq02A3dMa9XYfKlpjBOTE-6AuGwaZA>
    <xmx:yMwvamEqbsyBy4sd00qxJtJP1slZAUt7DuIKrTKISOOHY1Ejdr735C8R>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jun 2026 05:58:31 -0400 (EDT)
Message-ID: <69aa94d76c521ccab58336b5ca5b953253cbb6d2.camel@pbarker.dev>
Subject: Re: [docs] [PATCH] kernel-dev: add anonymous hyperlinks for "LTSI"
 acronym
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Mon, 15 Jun 2026 10:58:29 +0100
In-Reply-To: <16a55764-9ceb-5638-53e0-59eff365a7fd@crashcourse.ca>
References: <16a55764-9ceb-5638-53e0-59eff365a7fd@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BYJi8wWwM3JVDPK7hZnC"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Jun 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9719


--=-BYJi8wWwM3JVDPK7hZnC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-15 at 05:18 -0400, Robert P. J. Day wrote:
> Link to Linux Foundation LTSI page from "LTSI" references.

The last LTSI release was in 2018, it's ancient history at this point.
Better to remove references to it from the docs.

The closest current equivalent is the CIP Project [1].

[1]: https://cip-project.org

Best regards,

--=20
Paul Barker


--=-BYJi8wWwM3JVDPK7hZnC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCai/MxREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0br0EAP9JujOCaiiIgLxbqACWhhM7oKNUrjDQ7m4k
G7tRch9ZkwEAsutWjfcYqkrfZwM8cADunK+R3iAm32EyB3kVV+AlCwA=
=H/C+
-----END PGP SIGNATURE-----

--=-BYJi8wWwM3JVDPK7hZnC--

