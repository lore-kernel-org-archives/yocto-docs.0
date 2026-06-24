Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8F8CDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:22:02 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1629.1782285715577044035
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 00:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=fIae6HPG;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=eFaBq/d2;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id C388AEC0121;
	Wed, 24 Jun 2026 03:21:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 24 Jun 2026 03:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782285714; x=1782372114; bh=720KJcWuBz
	aNC4tc6uCAg9Sx3JvvzgwX/oaohPCejMI=; b=fIae6HPGoHUDNCorZEcq6FC4Nz
	Empsl0x98q6+GbsXoNKxeGGr8W4AjEv3m+bsSjc5d9UzhfOj5zL7Y98boaP1s954
	sL1rjl4tnsEiNhpJmRaKlDXpLiZjepCAQLsDdhgOG3LG/uW+0o/gBRa5pu748ZF5
	B41Z7fCvIpeNGuAd0SBsLWVLrxA3nTYA4OhqJ+MQm42wJEbUg4v+GnZG/TSLcsMW
	5SkayV6P13Kjd/HHsiR2V2Jn9Sl2JgaFe2U7r7QiNP5vyg98wjemssgXateVMT7o
	UU73Un/4eRAVmIssSOQPZtwlJlJkH2Xkjd3yL+oaqgeB+cC+Wb4U4RoK2L+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782285714; x=1782372114; bh=720KJcWuBzaNC4tc6uCAg9Sx3JvvzgwX/oa
	ohPCejMI=; b=eFaBq/d20kWrpNwp6y+BXL1ONeDvrO18L90FfQ0eZztdwhu13Ag
	sEAPrt+vMWk3E7sIjREON7/3Xq+j2kOD/n/K3IIAP18S8f+/+95SlMfLc60yWU/J
	US5qWJLsY7G9FNk/OOr1G2YYV0Ifjm9vYQnEgvUGAHFlR3Dju2S5ge98fzYzOVhG
	cOhhEwLSgisoIqDZXN2s8roeSDtq6D5Q16zgtRoBg54hyC5sMDUtjCPjtwxJIUSX
	kesbCqC7U8mGdLbO2Pp3nzyj8H/qyv5GM3J70W3dPgZPg17u04ItYM6eQ18KAMn6
	mQcZu/xwkovdXUJdCYpeUscp/SaTOtA0sPQ==
X-ME-Sender: <xms:koU7arsUWdVp4Aqa9S7s8J2f9nVjLhEcgJzSwDUSeMiEyyEAytFxSA>
    <xme:koU7aid1hf4pyEhZwT_OEArjLral5V5TErJslUAAolFwz1qz9e91AkIt30rv0HiRR
    cq5QGWvepRlPywWKQny1EI7SiBYaxJfexx-XsBySsq5vGZu5SRNMsY>
X-ME-Received: <xmr:koU7asbhUExpPeRreaXP1aklluOx26Hfpc8uplA-EDTmpsYFgRC9d8YxL7UgvEeBZhZPXgqRUd0KywLZheemG3BTqb76ghbieJt7C1gdGXO9>
X-ME-Proxy-Cause: dmFkZTGPJT4jkl1cRh419K2uK3Qk7c+feMgt2iuccOc5y8JhmtCgQt93QSKXizIN6NzKmG
    MlTp0DMaTjYbvUV2k22KXqAEuZojhtdnmRYql/Zkd8SsbxyS2pc0HUuJUPJCx5VHJgi6le
    vTZAHYXX1Mm9Na+ijyzb5qk83D0K6ximNAPbX70f+1yBdS7rh/Jh3CXNO1NEvRtNwEunAx
    iR6mrFhOCOql9xZANmWettNgQla4VMrzDCXRI3+7E4S7PmIJ3gJ2zYV4CV53SwhPFAXLUA
    U6j2xZKNEbkjl6y8KsS2HjVLcqVw+jWEPdpM6ve95Wt9A/CLyxJkTn5oZ4NQlY3bRAoPfe
    MXXnfSvcMJkiMqkmFHbzQ13ZiFEwNZzhxoM74Lj4uzxE2I8Ygz0dWDGoHsvCcyCKGDpkts
    4Nws680LWb28/yo+bR0fB/1bODkrFeRVGYm7jJWTkdY1CFWZjhHUo6++CegV/mfNP03Vew
    IZSZHcT8qP9EPgLG2p5wazfWNG2jRyQHk3L2AnV2Oj54ZMXZuBlSSHshZj7sqT6ZC/6uM/
    PswVYXAITXpOjLrJueXBRc33WHh/Zxg84t1SfhX1CLNSUFGxZDaHvpRtTV7rn0N37XCT2m
    2GZ/ROzO45IOxKDuazfukNDGQwNwV/yJYNY5eL+18Aj/mooVYEi/DVXOALLw
X-ME-Proxy: <xmx:koU7alVOqicfpCI1V72qaFeN-zLrVLmv8OHlbGBWp56uXTjTuCoX0g>
    <xmx:koU7aug1BrwnsSXQ9F-wD43aktEEmvEf9N1327bWayAguJvClOxObw>
    <xmx:koU7ajVPiyJ0dlwIo7eoXuf_n_Ip7-qfWb-8Bu5pEyc0_eDFhawYbg>
    <xmx:koU7alMK67T-OD6a2osWGrm2O8L3sHatspMkc-GL7ttJLFpbDWvhnQ>
    <xmx:koU7ahNJBIVonerE7JTg9TX3V0OpTgRC29wmxByTo5Oghnrv-MSKkSFW>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 03:21:54 -0400 (EDT)
Message-ID: <720327d5a41a7ec8ef5fcfa4ebf48c6aabffa60d.camel@pbarker.dev>
Subject: Re: [docs] Should Poky's "tiny-init.bb" recipe be documented?
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 24 Jun 2026 08:21:51 +0100
In-Reply-To: <5288d9bd-9e65-5b51-02ca-c898b5b34bcb@crashcourse.ca>
References: <5288d9bd-9e65-5b51-02ca-c898b5b34bcb@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-tqX8t85KjEy312QJ1maT"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 07:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9847


--=-tqX8t85KjEy312QJ1maT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-22 at 08:59 -0400, Robert P. J. Day wrote:
>   Was just perusing the meta-poky layer and noticed the recipe
> "tiny-init.bb", which claims:
>=20
>   SUMMARY =3D "Poky-tiny init"
>   DESCRIPTION =3D "Basic init system for poky-tiny"
>=20
> But the poky-tiny distro defines its init manager with:
>=20
>   # enable mdev/busybox for init
>   POKY_INIT_MANAGER:poky-tiny =3D "mdev-busybox"
>=20
> and "tiny-init" is not a valid value for INIT_MANAGER, so what is the
> purpose of tiny-init.bb, and should it be documented?

Looking at the git history, tiny-init was a custom init for the
poky-tiny distro, added in 2012. In 2016 poky-tiny changed to use
busybox's init system by default. I don't see any other references to
tiny-init, so we should probably retire it.

Best regards,

--=20
Paul Barker


--=-tqX8t85KjEy312QJ1maT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajuFjxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkLyAQDTOAvGUvfFVf7uCpHmFrj+KkycFaD0ecHE
aEQcZhmRSwEA2XtDdpOo7mBiXsO/LWx4TBuc8Pzd1fS6J1gdH2nOowk=
=c0tS
-----END PGP SIGNATURE-----

--=-tqX8t85KjEy312QJ1maT--

