Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E10CCD6E68
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 08:23:16 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6466.1780561386421216491
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 01:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=jmmdKk6j;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=TFMzLDoM;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 272B0EC0141;
	Thu,  4 Jun 2026 04:23:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 04 Jun 2026 04:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780561385; x=1780647785; bh=m0OnYB19HD
	5LXZxEYP5rd5D8C751YhhOt39KKQmL4bY=; b=jmmdKk6jK9bnMIqwMJ+UKl0vB7
	+Ca1sVtch/zfFi05C1/rZzGiQxJ0SRYZzB7FpK7vnBmKELRKX8409B3v2IahFCMp
	OMum4JrtkTmcvpqoPKEDB42dzUnCw3mKHANdDbmerP46ZbjIlNmmKebziccKKwbe
	+4i3RF3Qz77D20Owt23w0QnKfo2QRe+kz7zEE9c9RaGF5BfLnDPQ3ucDGP8k88hE
	qSRm8AO+dGvpZys70ddtgyJk/mL1JUwr+9cWqDNaUnUhD0svG9BJg4T3wNkcVYY4
	N8TdD9GHjqQ7FGj+DrlmggLidVt9q3LmJFw9dXpVrQkiokDIvBMuQeADWMcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780561385; x=1780647785; bh=m0OnYB19HD5LXZxEYP5rd5D8C751YhhOt39
	KKQmL4bY=; b=TFMzLDoM0L2hn/u/C8f4h/oo4v2wCJ3fwidRhnyJj7D/Vj9AlVG
	Y+ulPoIiqR9EbNBu1j+MlQJ0qIma3DQzGpgAk/CU3F2RhYI5tviNbBacn2D6ni5R
	dgkcaMEmwyxHit2Cxclc9Hmblb9vFYcc7HRVlo1tozAQbhdZGX0Y9ULvjIVrsmcL
	2SALfnyHSC1kN6K9UcoFAVgfqljVOUz/8X/dh+4nwuCVJgAZ+wLQsv4/pw5hD2gL
	1EESYh0OtLzZ/orhbLmzNeUnEcRvuIsXwEXc0g/7gCj/L2PvmgDTj5IK4rGVHNgg
	oj3mGj/2Dl89amopVIVMwipNRJObYfw685w==
X-ME-Sender: <xms:6DUharzkAyAosBgyCTAaXAvn13xnggJaSTS2PmwtdgA6bvJ87VynzA>
    <xme:6DUhapTrDN8LLdL9e91BtXRjTHu44UXBBMIyYPPTrc7NDUu2SMIizVZsJOGeRFB8K
    rUhfFlyIZZl8mus-NluS2eLy0-IRf4n5K6_PYCcUrXZ3gIlPK1C0w>
X-ME-Received: <xmr:6DUhai884EzfhvZuSSBqPmcWWJJ-K9LYjVnyJSWC2Qp0wIJjk1uJ-q1vUzjkNucUoxb5Wk8HJokpB5mcAvr3kx7CcWWLVcaSMYeBkEzITdoQR9tdXkTpBDxzR3wIcU-C>
X-ME-Proxy-Cause: dmFkZTFvTQmOuFemxNOOvHtzrPEFdwn7ouqFhrL7xBbkM2mg00dcnXy+uf1DUR6XRgwViW
    8GuTvymSC/LMeOfqfooIh9c+FJC9SScVv8a1PCxT7ZAtrOl8XWQhtYUjQT4xHXS2mkuFlM
    +m5EGrsh13M5nANxQBlJzi1nnliIJZD0svouEZf/d+QTeH3/ghMG7a871zTUrOE3jhtnZ5
    oC2SVSui/gB0OQge8I9ou6FoTPD1jm0qkfv/irYHc2kX3yqyhhJCyr7X0HpHRqW/Gr2vCP
    pyBjbSpvnbVKtZEw8ggam2da3GoL80x8mSH/E5XvYMc8sda6zTXpiTv0LcC+6+8u7LiBDo
    1RQvZ9IvunyZjYkKEGuHhSj88vUPIDpI6TB/EtHy58OQiV+BNqhJsrwgUQtdkK31ZTao3y
    0JdmU1vxSHxAVIwUM56v2MLBiRfdAx7LqUcrgpxFKFPViNvEYpZpk50yMV2a0TJQihQoDu
    RglrPlERAz3Bu3UcDsqlzm8kRx1lXRbyt3WC+mOSXjLqCunIl0AtBRYO3SjFI7uNXDNW7G
    ziPmzVoQbQITanJDTKvToob3cz7SZ2V6FhjfPDSP1zEwGiIQ/k5CyqHaSxM42MHr8D96G3
    vh6bkksK0BPyIEJhNgxHuN/qgZChJ6cDG+HVJAWSpoHoE5Qz5rjoDHY7Qz4A
X-ME-Proxy: <xmx:6DUhagojupY_kbnIh7HSncfHss1pAY38i03Ihm0S3TvTsLJSWWJQPA>
    <xmx:6DUhavlkukvVMQuKXLkaNe2njS5zECrcqY-J6e4mg92GCDsaigr8Rw>
    <xmx:6DUhanKfOFbi0CUF9uON5xtYTBr8yW-QvOoRwLbq7D58_V5Nge30nA>
    <xmx:6DUhakwCCUo2VY3_x0SOlRQQvt770x8YkgksC_rkvmDHPNV3fz1GmQ>
    <xmx:6TUhalNH_ckQX09w8FTb0RB8fRn-aN13HdQqDonqOD8D6Hx4LaVywdvf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 04:23:04 -0400 (EDT)
Message-ID: <53948f2d7759db8b99149fb1ace3f4f5fed92906.camel@pbarker.dev>
Subject: Re: [docs] [PATCH v2 2/3] security-team: Tidy and update section on
 security team operations
From: Paul Barker <paul@pbarker.dev>
To: rybczynska@gmail.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Thu, 04 Jun 2026 09:22:55 +0100
In-Reply-To: <CAApg2=Sk8FjK4PSHd+FfcDWYdAy0yvB8SqUYfB+ke908PRKniA@mail.gmail.com>
References: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
	 <20260603-sec-team-v2-2-ee7d2016fbf4@pbarker.dev>
	 <CAApg2=Sk8FjK4PSHd+FfcDWYdAy0yvB8SqUYfB+ke908PRKniA@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZAOm2oExtu8Rnm5pIMZ2"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 08:23:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9575


--=-ZAOm2oExtu8Rnm5pIMZ2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-04 at 07:33 +0200, Marta Rybczynska via
lists.yoctoproject.org wrote:
> On Wed, 3 Jun 2026, 21:45 Paul Barker via lists.yoctoproject.org, <paul=
=3D
> pbarker.dev@lists.yoctoproject.org> wrote:
>=20
> > The section "What Yocto Security Team does when it receives a security
> > vulnerability" duplicated information already found in the previous
> > section "Security Team Operations", so merge the sections and tidy up
> > the flow of the text.
> >=20
> > While we're editing this, Mitre is now just one of the places you can g=
o
> > to get a CVE assigned, many other CVE Numbering Authorities (CNAs) are
> > available. They also now have a web form for contact and requesting CVE
> > assignment so let's link directly to that.
> >=20
>=20
> Assigning CVEs from different CNAs for the same project has heavy
> disadvantages, and it has been an option since the beginning.
>=20
> I originally wrote only about Mitre, to have all CVEs in the same scope a=
nd
> make it easier to update if needed (contacting one entity only).
>=20
> But there are other options. For example, Ygreky is a CNA, so I can assig=
n
> from our pool if needed.

Hi Marta,

I think it's misleading to only mention Mitre as if it's the only CNA,
for example for the Linux kernel is now the preferred CNA for their
project.

>=20
> And that brings again the question if YP desires to become a CNA.

I've discussed this with Richard, and we're currently of the opinion
that it isn't worth the additional work for us.

Being our own CNA for Yocto Project would only apply for software we
directly publish (bitbake, metadata layers, layerindex, wic, etc), not
for upstream projects for which we have recipes, so the scope is narrow.
The overwhelming majority of CVEs we deal with are in upstream software,
not in our direct components.

Best regards,

--=20
Paul Barker


--=-ZAOm2oExtu8Rnm5pIMZ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaiE13xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btT2AQCDam8fQjuu93Up3mncJWg+EfBMztZQWd/G
l65o4c4wsQD/bQxofprLHMl/qeFbZmUx8eds/eZZ+tQeLrLpK/xwWwM=
=Vqzq
-----END PGP SIGNATURE-----

--=-ZAOm2oExtu8Rnm5pIMZ2--

