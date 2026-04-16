Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A3F8A178
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:35:34 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14275.1776346532130721160
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=LPg9wRfT;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=h87pBF7k;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4ED6CEC0143;
	Thu, 16 Apr 2026 09:35:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 16 Apr 2026 09:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776346531; x=1776432931; bh=1t3revuAbp
	CP1MG4V4NaZ2zT2gMB/FBJzgKb5gE0o48=; b=LPg9wRfTrmmiJF4o/vkKpNLJeB
	bFnICMbJG61fJZuQBmDOZzRoAZipSC2W9U2wY4aJWPIp82CrK7SOSQ+2BaTKiTao
	l4uSfxwngmpkE3+4afOcBHxH93qTpTT7q953jeQty5cNlf4/q1xWjhNqexT4ZhpB
	BRUdZXKp69+IWS0s2TyYT/qEGB0lyzsA6ZypUJm3UhufqMnQN/v1/Gunauz0OEx3
	QVraHW3YEbeIjEFKKtvKakVSlocK3xeR+/JddCU++KXO6oVM4cmk0sBIHrwrx1Bx
	eGYcp4bT2Irqa5PxmwNRN4gBZfpf9iA5Bon2M4iLja7jmrqFglZ1B0tkT2cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776346531; x=1776432931; bh=1t3revuAbpCP1MG4V4NaZ2zT2gMB/FBJzgK
	b5gE0o48=; b=h87pBF7knnyCjfs/wTp9zXfIOf/sLnYu+R5vUz7GK8wAKW/4B0+
	SR9jICcryoV/amndm/ySvRAY8/3lDZ9k7xYbJV4Ol4OydAgHBD2okzUhHBfedqH/
	skuOwgLkR2xowNjg0rOePY8rnVSgdGKf3n85UDa2iToLR2y319BePIoDLGVN6fkE
	/sTIf7CYF3eUHCtGOZ2kKZmf53qxkHllEAP4toGOqw2F1Bj/2l7O1uBrFp8XnAJL
	+Dw2BJVBJzKwbTlBFf+F9DyfePYzsLKFsbwxgcUCaL2EtoZmedhYsfDM5jaLt/Wm
	3oFc3v4xNPErj9q6h6Oy1zq9ggyZJtpvGLw==
X-ME-Sender: <xms:o-XgacCrkeBsvBb8VmdOZfS7uFd6UBYaxIG5MWzh7UjrnETw0p1gYA>
    <xme:o-XgaV-YJgUvQBNn0DuCTkqindsvuGKXqJBXwk1vvbmg-fRKMx3hb0I4PDIivvOLU
    co_OHy3tdGZfHkC9eQ7Vk9NhqTx-forw0HJ2v5pZP0hOJaFZyOpgg>
X-ME-Received: <xmr:o-Xgac9CZuydAtlRxlgRT78MErlkStMrfLpT6JnEvXwcSBkJZOodH5kdNsMtgzq4PkKs3HreE2SnJS1_fB372wShQKSfseraH_jRANY2M-gj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegjedufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efffdvfeegveekudfhteeuhefhieekvdeiueefveeiffeukedtledutdfggeevheenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpd
    hrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdp
    rhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:o-XgacfvLolBVtUYNPzmvjZnkjaPm-C9LSyJ16MptMutwXmueRHR0w>
    <xmx:o-XgaVFdPpyUH5eGMdwZwdixhsFI0kIWhV9jyXd6m84kcyH9RORv_g>
    <xmx:o-XgaacCot29OoieMz7nCPkTw8twk2PZsKkQHHPST5212_GuOAQVNQ>
    <xmx:o-XgafE0JJ6410XrH778d8xvmsVn1gfjlSLp2SYUylUJ4SMRyCH8rw>
    <xmx:o-XgaYFGFSqBhgrKWfaciIO_UjiEc4c-LqYw6-PqUg5924daCwNs79Zh>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Apr 2026 09:35:30 -0400 (EDT)
Message-ID: <ae52efe32a26bb09117a0b1a390baf1d4cdedd34.camel@pbarker.dev>
Subject: Re: [scarthgap] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 16 Apr 2026 14:35:27 +0100
In-Reply-To: <DHUL5C39WKWY.4KSM2HD4MW91@bootlin.com>
References: <DHUL5C39WKWY.4KSM2HD4MW91@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Nq/t96q/WoBsZP8OyJtM"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:35:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9261


--=-Nq/t96q/WoBsZP8OyJtM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-16 at 14:41 +0200, Antonin Godard wrote:
> The following changes since commit 345b2f248c5353d47248bba8dd7aaa10849453=
24:
>=20
>   migration-guide: add release notes for 4.0.33 4.0.34 (2026-04-02 15:22:=
08 +0200)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs scarthgap-next
>=20
> for you to fetch changes up to 48d15a62ed7c004fd6e1dced03923bac529c435e:
>=20
>   ref-manual/variables.rst: correct a reference to STAGING_DIR* (2026-04-=
16 14:34:21 +0200)

Merged, thanks!

--=20
Paul Barker


--=-Nq/t96q/WoBsZP8OyJtM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeDlnxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0boUEAQC2/x6I5QMgKaBoxK5KxrQRQPFNSYepbWsn
sEH8mgnEQAD/bC4jh0m+icP5oMbcTGHh2IjjbVd2VVCeEddTydwKawo=
=db3G
-----END PGP SIGNATURE-----

--=-Nq/t96q/WoBsZP8OyJtM--

