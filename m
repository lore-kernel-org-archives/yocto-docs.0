Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB54AFF60E9
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:15:24 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15387.1774944914624433906
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 01:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=sQ+p0hYg;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=XP2L9NVW;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D58497A0327;
	Tue, 31 Mar 2026 04:15:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 04:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774944913; x=1775031313; bh=AncFsg/gP4
	kF+Y7643S1yneTMq9odbpBwVsbdXjBlkU=; b=sQ+p0hYgR+2T54K5LoVz6E/dqg
	MX6gpAKmd073VtX1n6TX84udeAOA4/a5pxmDgsaB2iQe+EDQQNmZjHDRJiRZN7jV
	dLbHHT6D445D37kE/ckwpNWFab6hY3aaIdTX5SXAXpjRUiT/ye7TpjFcjOpMTMYx
	Pul82Ur3dyNKpr5/YHZ7qqcshiD/hRM+aCvZ9hfb77py9F9yue1P5qDYmBJpb3Oo
	UlmeTO/FfaH76slcOBqar7Aw7PggXkaTU+rE95muY+0QGLRPgecNqe1lmNTpER19
	/OFY+NCw891ThuVByUmJwww+DNHu29fdgBeQ+eNfOzhJFaVJ4pSJ9vfFU65A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774944913; x=1775031313; bh=AncFsg/gP4kF+Y7643S1yneTMq9odbpBwVs
	bdXjBlkU=; b=XP2L9NVW3LQFSnDSf4n+jpfnclNLsUpTdJysZ7L9gvWR51PJudp
	oD8ag5l0ZyImdfUKi1Q9OOS3Auyh9WGVEX6ghy7iy30XuJ1Ro9KZTtFcsI9HUzWW
	IP1D0UQj3VQjODdFqQFryFxHuATcp/QNwQhCVs4dx2aiSI6PbBiLpNIIivro59tu
	BZW6gPLkiM528+2oGXBIBWXSJSseGDb8eFSR/5zx1pwIIP3CBhyH7oMwNE072tqD
	n4lQ+0mjUFPb81AEtODMxsNsdpH62tlxsLYrp91bO547OrfMF24GClKklgiTFhy+
	QIDN0LIwuXVburgO9NYib8IFSrcn2q+6W6g==
X-ME-Sender: <xms:kYLLaZxX4PVzbZDA4qz2-HiK78VEnqiVI396PtajpFM1IAHi_kkQsA>
    <xme:kYLLafQUnyM7I-IO3wbgeVYyu__w6hlxV6Ml1gROboZRYybVi1WTx-HHzGGeQQ9yn
    PoAUuX-oAPjBlLywMVDlyGVeqDdf3wv3YqalKfsLGgXJDPKKnh00l4>
X-ME-Received: <xmr:kYLLaQ8ayDRY-Y1Hf0re3DiFKEUS5SxiabNxRFjp4-C-bqJABsTSlvaMqHfcDc0FwRcwAihm_6wm4y15iYo1Yy3kHR3X5sh0NIPMLAM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgedufeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
    dprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:kYLLaWrbSnAcsMCa2aDBJamaU1v3hMTOoqk12Yvv3tUQ5tK-sCWhhA>
    <xmx:kYLLadklfyz2YNVlkJjdJ6G43RVteD8od7KvEmPXL-jb0-AezrsGWg>
    <xmx:kYLLadL-x934BOS0crPt8Qkt2XTq_102p6PgZ4n9iBHMOZdzxxG3QA>
    <xmx:kYLLaSzeRP71NdjPpEgv1MHXny_ql4ip1CxtW_wYT2jvBeq0-uvu0A>
    <xmx:kYLLaaVOAsCrRQA4ugDxFUYPhccrKxsQCDacROPOE91qzxmkgafQ8lAF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 04:15:12 -0400 (EDT)
Message-ID: <73ebcd74f63c5004803bebb539c1777c8dd0f1e2.camel@pbarker.dev>
Subject: Re: [master] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Date: Tue, 31 Mar 2026 09:15:07 +0100
In-Reply-To: <DHFZELR6D1BT.3RN7O6PUJQDJN@bootlin.com>
References: <DHFZELR6D1BT.3RN7O6PUJQDJN@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-l/PZl1XraQKS/TTpkWcj"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Mar 2026 08:15:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9146


--=-l/PZl1XraQKS/TTpkWcj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-30 at 10:42 +0200, Antonin Godard wrote:
> The following changes since commit 5bfe4f9aecf542766dec727bedbb30b1f93ab6=
4a:
>=20
>   ref-manual/system-requirements.rst: remove Fedora 41 from supported dis=
tros (2026-03-20 11:00:44 +0100)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs master-next
>=20
> for you to fetch changes up to dc1574b9f71532c469f355af2ff5ff5664083e48:
>=20
>   ref-manual: document the usage of FIT_LOADABLES (2026-03-30 10:40:23 +0=
200)

Merged, thanks!

--=20
Paul Barker


--=-l/PZl1XraQKS/TTpkWcj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCacuCixEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bro8AQC5yx95E7i5nCzbnTCjQ5eZ5V7OeB/9zf2s
eD2vte7togD/b2FynTcPkhDO49fYRBFmmJFoTwyDXZf6DKOMpWYM1AY=
=6eec
-----END PGP SIGNATURE-----

--=-l/PZl1XraQKS/TTpkWcj--

