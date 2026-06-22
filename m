Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFBECDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:59:10 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5773.1782158347976740147
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=noJfFwf1;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=NRSKkkQX;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C7A1B140015D;
	Mon, 22 Jun 2026 15:59:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 22 Jun 2026 15:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782158346; x=1782244746; bh=zwEKWl5C3x
	ZZLAKsHXy97VNiWNbkR4YSKbrSPa/2XsU=; b=noJfFwf1LsdrKSjN69YYQ3u7xK
	G7fmeZhR5PLTEYFwUgoOR2x/ker6gCZs8eHI6zZEzLL/KkzU7G6ih4Bj/RcFhlLo
	4BmaYZbxxz5qt5vfyEYpvAiYf6KKA7buQe0l/KZK1mdoc6o4c92jAtf5HVgPA2Sx
	qPf8qQF7V4LjvhqtXwC3FCstOEARV1RQaEZWzU3Wxer6x36c4Xz/9jMLIpn5BL2s
	5NRnCo7O6bqxkXFtU4FnI5zESZhR5Nr2EGa9qsT3TRz6qUFooh+ck4FjqEBICGJU
	56YhAT4T7eeMZ8HF3/xBW+mV2dHJ4RvBhJyszJw/P1IaFsVp929FBTnNIuQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782158346; x=1782244746; bh=zwEKWl5C3xZZLAKsHXy97VNiWNbkR4YSKbr
	SPa/2XsU=; b=NRSKkkQX4KLF/22IQfT2/sJhCDV73Sn+pNyaK63V8PV5SDh9qXx
	pb2+GdXawskhOOgEq9mxcL132MEkc+CDacW6GNTgzxMGDZTeB1NL16ds1qTU8CGe
	GX18r+GvTDpNp893VIZ1qA3P06+sODuuVKTQCPUZd2kE/0mN8doVhkS6bpaz1COu
	rJpv6ErIkk9zjJF593HFz8NK2RNTvToj/H6hjz4J4wrf3qTwHuQ9mIwFvPmxnONi
	6m6LCcQVf7fvRvWFUadl81WJvNxyOfOnoKhCBh3tkUSDJhiMNYR8byq7Hao2x7V9
	MfGPqM1k2jvM4je5gtWTGTka05g3yIA6rTw==
X-ME-Sender: <xms:CpQ5avmFE8dDpBMQ7zobZMV1iW8aD3i3NG7F-dJqZDpX7tfE_4tDzQ>
    <xme:CpQ5ao1gzZUXSNt4eHu0ywBMFJ8fPl25hURW2zepQnd86WUyRFYgTvGHeJeL8zhbC
    3_j7l1Kx52SDZTgG2KcWSvPkLgus-UhFl7BpBsQO2kmRZhqpXXEzD4>
X-ME-Received: <xmr:CpQ5ajTAdckwHRX3n7kEvhO55fUd3HRC3LGqEkBVrRyxcQmloxla7HKFOOG0byM3gOiNM80DGA0B-hj1z8JsUs8fsoaTRRa0HNKAfVLZqFs4>
X-ME-Proxy-Cause: dmFkZTFgyE7A7p/tlgF8j4obLXacuNWyYAVqLUALzSuHWhHsNvWj8jWV+E8+bS62kZsSnQ
    T74uDXEWudswwS6nsGepjMSfuN6M3RDSpjx413cu8o3n5o+O8MiALyXZ4J9qLF7lqdxzXj
    20t+P0ny3NdotLmgM6mE7n/34wggrUUJmVYHxuMmb8AJtWhk49pM1qYePMsTBn3O+tqEb3
    kErRz4bT9HsiJqvm9RTk3JWExGhu4B+lDwZx7sJsyVIKWC0Vk6jCfTnIBDYRleRxFXkhYR
    fCK70p6J0kcUGQRPcDlU2YMHviYSbqlXwQX2yYjEFJ9Ju0853SONyYeeW+dSf62qCzZwl8
    +1f1ZlN4h+bNcphzPtC6OJ6CCuCOnjT7B6NXQO7Gm4zXmDXE2PO+80mrVbfXh2Bz0aowNd
    3+sEpWb8Qx+4i16u7Zpj0jf/DcUT0uRBFPxnKYFXDDBbo7FHwkKnfsZZDYr0kfnp00O7/d
    lxcaUz14scVvlvY77EXAP+w4LN73p0pUlUA22cTZss0wFJcZ++RprxjzCUwbzV6OhyQaUs
    cD9KbPSlhOemY1iFpDukEm4UStPENJollzGxOZvNvP88LrxczwhNxPhCk8BBI0KcneTyQ+
    pItxuUojsz4SeqjWjEOZ3ZMybceQcdS6rlYI4gm086iaoxhyqxDIfNwrUuvw
X-ME-Proxy: <xmx:CpQ5aivXmwGsMfFQ_UdkS8vESUKvfQzBKrv3UZEAodqL1QZQY6lKUQ>
    <xmx:CpQ5aga9FULDb4MZGqswx6BzV26ciL_xMcAsqclHIi6AWWYVazAYdg>
    <xmx:CpQ5avvKNL46xnHBmRGjaxXDVccdFDGXwcXBDfogFLXrnbiVmFaUcA>
    <xmx:CpQ5aqGh0A88orfAgDSCqJBhvpNLO5twwjXOaHHzjYk5y-gNzeU04g>
    <xmx:CpQ5anFJe8TArmOW9DPsgDkwheP9KmunRiqpvxSGl3Pn68C2JpKCFo0C>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jun 2026 15:59:05 -0400 (EDT)
Message-ID: <e597a381198b23da3200b20cae3d514337b588a9.camel@pbarker.dev>
Subject: Re: [docs] [PATCH v2] dev-manual: describe two ways to assign "PV"
 for external SCM
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Mon, 22 Jun 2026 20:58:58 +0100
In-Reply-To: <dca8856e-440c-a905-f11a-34ca6c253281@crashcourse.ca>
References: <dca8856e-440c-a905-f11a-34ca6c253281@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Fs9STQQIxqCpJQglytOu"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9834


--=-Fs9STQQIxqCpJQglytOu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-22 at 05:08 -0400, Robert P. J. Day wrote:
> In addition to hard-coding a PV value in the context of an external
> SCM, show also the alternative of simply appending the string "+git"
> to the value already calculated for PV from the recipe file name.
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
> diff --git a/documentation/dev-manual/external-scm.rst b/documentation/de=
v-manual/external-scm.rst
> index e7ab8a4c6..adab4370f 100644
> --- a/documentation/dev-manual/external-scm.rst
> +++ b/documentation/dev-manual/external-scm.rst
> @@ -13,9 +13,17 @@ Subversion (SVN) and Git.
>=20
>  To enable this behavior, the :term:`PV` of
>  the recipe needs to include a ``+`` sign in its assignment.
> -Here is an example::
> +You can do this in one of two ways:
>=20
> -   PV =3D "1.2.3+git"
> +-  Manually assign a version number and the string "+git"
> +   in the recipe::
> +
> +      PV =3D "1.2.3+git"
> +
> +-  A more elegant way is to simply append the "+git" string to the
> +   value of :term:`PV` already extracted from the recipe file name::
> +
> +      PV .=3D "+git"
>=20
>  :term:`Bitbake` later includes the source control information in :term:`=
PKGV`
>  during the packaging phase.

Hi Robert,

What's the benefit to offering users two ways to accomplish the same
thing?

IMHO this makes the docs less easy to follow, rather than more.

Thanks,

--=20
Paul Barker


--=-Fs9STQQIxqCpJQglytOu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajmUAhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkPSAQCoVb5gHzut3BDAgVGVmJu8vPnNvPxyim5e
AiMsEN4lqgEAkwqfvYdvqk0eKmbkCltfpQ5w+GFduglORdYg4Kf3aAk=
=IwnT
-----END PGP SIGNATURE-----

--=-Fs9STQQIxqCpJQglytOu--

