Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60F7CCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:18:18 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.web11.5000.1761293894035572618
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=XNUo5DZ6;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=cJlbd2l0;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2899A7A011C;
	Fri, 24 Oct 2025 04:18:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 24 Oct 2025 04:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1761293893; x=1761380293; bh=A1W1/mpuUw
	Rke3WBxzD1DJJ7SAoi8btPPhCdmRQSD7U=; b=XNUo5DZ6JXzlgUjwXJdwkEaK7s
	zvcQaGhKXSKtZZr8ouwnMt3nUV4kaTld5yJPlaMmfpAmPGkVwfbb+aDCT13V8p50
	q3ZsweH8QpLQ4AvpTXXfuDXUW69lZ7/mMq1jfvxFQWyg0fcsXbUE3x4fRVwZSB7X
	H5ACcKNqpccBB6PmM2Gwp6l7157+C4yFM1PVwQ3G6r6dW5p3v3BxPYNMnE5ZicxV
	yaeJE6uGPE9VOMCEFvByznQlFPJIfsmgFbreJqdgKcoWGFUC/5571r1PNqUCt9sj
	J9YqYlJGlVnaz2LeDON4czkk2xr5HYwRZNtLkv6cvcKHXb7i0bsnmLqQqpbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1761293893; x=1761380293; bh=A1W1/mpuUwRke3WBxzD1DJJ7SAoi8btPPhC
	dmRQSD7U=; b=cJlbd2l0KDEfZJUszlUAo96BxrEf+zIVmVt7M1DIVFXCQ/cbjGR
	otIePfdTrsZjWL1p+0JY3hifd89TscU+PU3s5VBuKH19zwTNdCZ23zYgx5sYECQh
	vDTfHwp8TIaQhWhUOaxRnrKFYySZ34aY3GPVb2k6sHQLcRyPZFT447K4Ee3lTSWD
	OiQuQo6kKPBj2d9R0fq1/1+QPQBCPu+FZ48YGWSpLTzUU4ip92tR+JU40J4JUIT/
	NoySpCP0ij6qCQI2yzFXaVa09ayh2HfR30yqP51JojVrPjntzlVtSpM9nD2w5+62
	EXYCNsBtrNwLB9qQJywk9fhyKd3/uoBeemQ==
X-ME-Sender: <xms:Qzb7aFlxmtJNsxkGiUVpn2RQWSmubAu6S9qVeKI4DPYm1NSV1zqlRA>
    <xme:Qzb7aOpGxPKJyyGnlA_BI4oSlUwdSWE4cQs8u__vtEEAvcBOAMRWyBWKXHFuKgSCu
    b8uVrJbDupRlxmfrYAQ9JjnWW7dSn0hZ4He__gUTcMtHcF0A0J7vYU>
X-ME-Received: <xmr:Qzb7aGGjQa6R8a5JOA-MIOHelA_gIeF13TCZXIkdddSFf_OrHFKSu8wS-nViKScRqhEpdCgrk2CnyGKUQ4oJEZKVhXBtBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeekkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjedufedvhfehvedtudelvdeljeeiheeiveffleehffeftdfguddvveejkeehfffhnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprh
    hpjhgurgihsegtrhgrshhhtghouhhrshgvrdgtrgdprhgtphhtthhopehmrghrkhdrhhgr
    thhlvgeskhgvrhhnvghlrdgtrhgrshhhihhnghdrohhrghdprhgtphhtthhopehrrghjrd
    hkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhiho
    tghtohhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:Qzb7aCwEvjRlxhlcOy_Q2OrQmU6nxVtmqwYQoyKS-Q5owzBkc0v_hQ>
    <xmx:Qzb7aDpiIrVzK4Q1ooyt99iwv-XnXBost_6v8sZihP46kGbhqMyisQ>
    <xmx:Qzb7aEjViPiS2c1-kjJ9BkrfO0DNmEi5WttcuiEq7mbwR6k3hLERvg>
    <xmx:Qzb7aIgSVHN30_fdzxlqMKMVXdHWN-WbNXsuIJRTOuc9Mz-lvH4qrg>
    <xmx:RTb7aJ-5SpkKpqh3oMPpCee6BCWIwBs-_Z9lO-9MTfPUJkXzWOgxbsnD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Oct 2025 04:18:11 -0400 (EDT)
Message-ID: <09b8e4f82bb36236b6642e53f7aa270e0ad7af7c.camel@pbarker.dev>
Subject: Re: [docs] political question: which vendors should be listed as
 providing support?
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Mark Hatle
	 <mark.hatle@kernel.crashing.org>
Cc: raj.khem@gmail.com, YP docs mailing list <docs@lists.yoctoproject.org>
Date: Fri, 24 Oct 2025 09:18:06 +0100
In-Reply-To: <1fe3bad1-8226-b22d-ece0-d918a193db3e@crashcourse.ca>
References: <4b7c71ff-0697-b099-0764-3cfdfbee1313@crashcourse.ca>
	 <CAMKF1srZwLCmPYfMeg_SnNjHYfVV0AHKK6QJWON03AyMbSTy0A@mail.gmail.com>
	 <cae364e5-12b4-e69a-fa62-dfc37d3c2d4b@crashcourse.ca>
	 <1c03195e-e70c-4523-900c-b6469f7975a7@kernel.crashing.org>
	 <1fe3bad1-8226-b22d-ece0-d918a193db3e@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9rJBKvaeazIHVz0ZBu1f"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:18:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7788


--=-9rJBKvaeazIHVz0ZBu1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-10-23 at 05:50 -0400, Robert P. J. Day wrote:
> On Wed, 22 Oct 2025, Mark Hatle wrote:
>=20
> >=20
> >=20
> > On 10/22/25 4:00 PM, Robert P. J. Day wrote:
> > > On Wed, 22 Oct 2025, Khem Raj via lists.yoctoproject.org wrote:
> > >=20
> > > > On Wed, Oct 22, 2025 at 1:37=E2=80=AFPM Robert P. J. Day via
> > > > lists.yoctoproject.org <rpjday=3Dcrashcourse.ca@lists.yoctoproject.=
org>
> > > > wrote:
> > > > >=20
> > > > >=20
> > > > >    reading here:
> > > > >=20
> > > > > file:///home/rpjday/oe/layers/yocto-docs/documentation/_build/htm=
l/overview-manual/yp-intro.html
> > > > >=20
> > > > > and that page states:
> > > > >=20
> > > > > "commercial Linux vendors such as Wind River, Mentor Graphics,
> > > > > Timesys, and ENEA could take it and provide ongoing support"
> > > > >=20
> > > > >    well, sure, but there are a *lot* of other sources for support=
 that
> > > > > are not listed there that might deserve a mention. perhaps that
> > > > > sentence should include a link to, perhaps:
> > > > >=20
> > > > >    https://www.yoctoproject.org/about/participants/
> > > > >=20
> > > > > or at least a more all-encompassing list of support providers.
> > > >=20
> > > > I think a link is a good option provided it is kept uptodate.
> > >=20
> > >    I'm sure there is a significant difference between "participants"
> > > and orgs that provide actual support; I'm just saying that the list o=
n
> > > that page is awfully short and it would be useful to have a separate
> > > list/link for support providers. How one gets onto that list is a
> > > whole other issue.
> >=20
> > (in the distant past) it was always expected that list would be
> > updated or pointing to another page.  The text that is there is
> > based on the original membership of the Yocto Project, and I suspect
> > does need to be updated.  IMHO members (not participants) should be
> > the ones listed.
> >=20
> > The original list was based on OSVs specifically, but this can
> > absolutely be word-smithed to be more generic then just OSVs.
>=20
>   Well, this is not something for which I can submit a simple patch,
> so I'll leave it for someone higher up the food chain.
>=20
> rday

I think we should drop these sentences so that this definition remains on
topic, we can just keep the first sentence:

    *Images and Code Transfer Easily:* Yocto Project output can easily
    move between architectures without moving to new development
    environments.

We have a later entry in the same list on the "Rich Ecosystem of Individual=
s
and Organizations". We could perhaps add a sentence there to say that ongoi=
ng
support is available from several Operating System Vendors (OSVs) and
consultants within the Yocto Project ecosystem.

Thanks,

--=20
Paul Barker

--=-9rJBKvaeazIHVz0ZBu1f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaPs2PhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bjuzAQCxj9Vaa3D1/VVcct308EkZY6PJi+9IXUS6
NpRg64bAoQD/YflOmW7+30lSEZFl+KE0RBBivARHLVHDE+m/G2koAQA=
=+xGo
-----END PGP SIGNATURE-----

--=-9rJBKvaeazIHVz0ZBu1f--

