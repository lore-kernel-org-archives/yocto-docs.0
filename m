Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDAFCD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 10:18:22 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8083.1780568299962229120
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 03:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=AvtaAqZz;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=lTME64j3;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1498914000F1;
	Thu,  4 Jun 2026 06:18:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 04 Jun 2026 06:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780568299; x=1780654699; bh=TqtwUMTSDD
	xSCpmfg/1sHSD2WwU5lZqmdTrY+sXtXwU=; b=AvtaAqZzMQCvrZ/x19MVby7+5+
	Y34Rn32qcG7JDp9rd+qHjdlSvOzMwzL7CnRxTErR3MKxSW/u21mx62nReOo+LIbG
	N5e6axaKLI8cM/tszQAGLkcUwfdMx5py3//0dOtvaS1382Ip2bgYR64k2Ho1eA/z
	vrzGR8P3rc6Vo1ZdfA2kFYCyce+OGv8a+jrOPoYOpTTpde1YrMZCLf5mA0FOXiHe
	KRv+xmH23w21qFXxDFxdeRC7H6mKquj1cyp7HqzGk5EWOL7BrWamqYFI/AK21WXJ
	U2ORcCwNxcoNEUWj9wWVmhbn/sS/hx6Y/pcXWxdU9R3rtXQDvoVQSH0hntnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780568299; x=1780654699; bh=TqtwUMTSDDxSCpmfg/1sHSD2WwU5lZqmdTr
	Y+sXtXwU=; b=lTME64j3795MsK2mPGM5IlypAxTeqC+wZN5iES6W6nyo1Uk4WDW
	tcMffaABnmKa9wBTFBNbhkHUmL0rH1BNaDv4U5QOZiCviFJnU6J6qcOUPoqlYWLL
	S4izLfG1VBb7JNUinBUokknJSwmxHCiR8k/MtZ9rBSZ1WrDkHFBxAeACzNBuGq/O
	SIUWsG4Ezk2tD0jTwBk02IRLTqmoMgQbiulyhCkFsDHCbGQZQ2wsYQHNVz3ix4++
	cyvGrL+LpGz8FPCE4cdJozsQAvBZz6Sl9cRtZrubv5wLj8d5gKiq6BBxrSLnJP3y
	uGKuUme8tH12Yrj3FKPsyMhYmwU5n3lZs9A==
X-ME-Sender: <xms:6lAhajJIM9mmu2KHOaI5qIyIk_iabxB4ErQmvnYpmNQsQIgqOX4vgw>
    <xme:6lAhatJIXlDdcq8v6zlRu9CtdAUMZobK-Im7ALRVve9Hc0g3a4ZyAMcNDtehGLK-t
    nl6gW5Bt8G1HHyw4wx1x7Jzya-RE3sqqTW2S1E-0qsmV2VC0O5JxQ>
X-ME-Received: <xmr:6lAhapWjcl_atHncwGUlq0jIZvbGprNgRP4kV0fUxdrApSIEtorBdNcjSQmWXHGn52c32uSk_MUZgozMrzRQKNYtY0HWGBXjxtDMcRAAkYxLlVHdhvdUXaV_ZgxwQe_S>
X-ME-Proxy-Cause: dmFkZTGHrHGCnuI6ZWeI0CthcLeUY+mDuBT/gq7xJnj26enBygjoDTEPOYqREakW6JkMob
    ceeB3ef9NMVHIDHyXEGlah225PHLtWocjDQjgOmRqn7NtfhDbTl8eKetlMj30KK88+61jL
    p9QM6p6jVDLyX/2D2M/IhG8wy0ruuKS6kiKu+JuyWxdY42KVcFV8B6kBiFIH1xRs+8X4ys
    KTzIXrhJpPrVnctoCDje4BN6nxfBRJF6QmrZdHui435KvQFRGLpzyf6WXFQRLUGE4ABsFV
    ootqg4EW3ua8yMejScTOBkHlCgoTewh5SGRsY+EJ01JLPsE1Rk/W613MxSFlXKQpvGeTVV
    ADj4ho1p3tMX4dH/vbbFyiOd1YbJQ5RTfmuQ7fh8EXzhOYTxVLCI1W6iw3U1TNAgCCNRLK
    r8A2ALht49jNiltRT26gbHiMQE1R+EwBPLf46KQthlMKETvfHXz5b/fqsG8Z4XtYQitClx
    i2VR19T9fQy14OniOjGH07nkNGeADqtdqMH+KtqzsiP/AMfAT906Jx3/xBJJH8BwFYq1F1
    ijPcnvKqNir3dpjLZRA8hiFD+A7vKiBlwS+2PikrLIjwbRiayUBbWXGNa4PLpUXuqjlr/R
    Daop00G6t6GWk/vT5SYMiIHmOBnJlzz4KFE8nH+k9b8byTsTUxKL8fM5apzA
X-ME-Proxy: <xmx:6lAhanjN_c1zvI-XVD8SYFR8u8cWZGBgNu48ay5QwBXyCNX7VYE5wg>
    <xmx:6lAhas_JECAtoFZvjil_RHIoQeElXrnySPBP6bdrJHL7QI1SQd3dKA>
    <xmx:6lAhapDS4ebh83-B2O-uMk_4F-AWd1zHeSejLBxSxH_AcbOcm9vL7g>
    <xmx:6lAhahK6qAnZCLypeJRUtR1kStRb8a_B3kBSnaZNCkY_BmyNTuOmRA>
    <xmx:61Ahapsl88NhqiJ4cIYgTk-Rvr_ZMKfxz84SHCB7RbhUFh51UClb2Z1n>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jun 2026 06:18:18 -0400 (EDT)
Message-ID: <a92e5b037d8da3ea466945b99c6190212c5110ba.camel@pbarker.dev>
Subject: Re: [docs] [PATCH] recipe-style-guide: Clarify when License-Update
 tag is needed
From: Paul Barker <paul@pbarker.dev>
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Date: Thu, 04 Jun 2026 11:18:15 +0100
In-Reply-To: <DJ06PF26JYAU.KBPZ0QZ4R8XC@bootlin.com>
References: <20260604-license-update-v1-1-16dad5e9b0a2@pbarker.dev>
	 <DJ06PF26JYAU.KBPZ0QZ4R8XC@bootlin.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAgU
 JCxiQFgAKCRB0l1yBt+ZrrLhdD/sH+qTaxCDUg47eW329yJWCDZmO+iuYzNSyHMs1x0DHKNIQQ8zN
 pA2S/de4jElQuPHjw/IS8B3VmM62Wuq5vHuxNlFv9IMwrwqi6zhCDui8+nCN/AQGGXousJI/SeZjm
 Y5gS9cqh4vNY+huqEEfdTFXIfTBRkmnvYozSO2uDB3EMuiWgBlw2uLrtmkvPLn/m/GvEouLNox6wv
 tcJcIbL59a0+3jv/m7pnWoZXOkWmKQnfFWikqjuKCISNU0gzBSL4UOj8gtQ2z+vu7ffi29b6SV5IL
 m1yzdbkigEn4HL44lz3N+oHZ3wWsRqqeyGSX5fCfx3tGWg6scZQrpsjT5yq+LiffiXVNpjeJ9KzQw
 0cbAZ/9uhk1sWBroP+/gMhsWjlbFYXVlRvkNKGPI22eZtOEz4jF6OrOONyOoY3i26niJUyIgdBpca
 H0hKUSVQ8VnG7qVTNrQk9BbeoSszqRwViN7lfyVtK9b1TCFuGewOETGn0TPvSzruYCtD3CLm7mjuX
 AMBpIGoRUiCFVmF1hlOgqDyH4F6zRTHhKLpfmNzfQcg+Uo147Q2IHpoh0mJsL4FEZEI8hFyecX1Pq
 7HqnvxGD2OhCof1Z6LDxptX0wbgocnYFNxN5S1owcXZUQOFnzYLlLugrcEjlGCm4Gn7k4SiFERSBj
 UFsQgIhw/7lVVn4o4rQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAw
 UJCxiQFgAKCRB0l1yBt+ZrrHy+EADNMt+ewz8H7BUKpEMMhpaA1VxyXO5IqlKXS0gElMgHYXl7L7C
 0/qLfRH96vwVD33zM+f0Vl9aWWkom/k8s42tLyPvX7D5zTrj3r5muJ+d9dXWGwBFXxXlE9YjSP26K
 bYfRusmRHbbEPlLPSnrr9KYS2FGVD6ViRNhhVguflgPv2i18+fNBE3YyByfNCiQgO/SgaSdh172Ql
 tuYE1Chk6FD45tCUv3dI9lO2PlVwrciiVYvIv/jiTDEwZOISOClTE/Ha18pxDJfLhS8QQnLWuBNX6
 HUkLi78fVmVYbcWIkTuSHjfNoGTMaFijMg9Wl6poFrY++Pl0S40681zEIrwZhW5pKoqXoaElt29Yf
 OwVo6BIsSOLEqKiWsdP7PJTaJYU1ovnshBcOmuXMgc13AjQ4AhEGqI1TaEJ/E1jEDDyTQFeWgrfew
 YaWdqpgiDmRMTj/tIGVj9iy7qZQICUUtlfm0QK6w6M7qq0GdO2o+S3uVF6y2AxQo8l9LSHiW9O35I
 juR37zeqv72puYyOteVYJsJaw999HUmhXc/X/J9FQFw8twxPKDLLu+w8MqDo9bhllzR93Zy/OShuG
 yGybcX3DKO2R+AQ90tXLbxKmHLtrnG/zyDPhLv/LGD480v5hEoT+IS0u9wPD2vP5q36a5DtzqXA/7
 t9PCamLoCvZLleg7GY7QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJeBDABCgBIFiEEmLKq
 wQCsP4K7XVRndJdcgbfma6wFAmlqDRwqHSBwYnJrci51ayBkb21haW4gd2lsbCBiZSBhbGxvd2VkI
 HRvIGxhcHNlAAoJEHSXXIG35muspk0P/1G08N6zGSdw2p8+8f/1HhaYEb9KdQHT1JmQfZUrIHIpD2
 ELNb91Z6Pz197d/igGpox1dzYOwE0WolWo44ZHX2yw+p9V+HJAUKRe0SPc1iNLkTzaAZ7oYJ1DnFh
 aaqZi4VtKKabKeorJjcDvl2apMwT0agRuDklU97n++ZUuXIEo1Z9uRqEvXz0iTSY7wPxwfoVOQsgf
 dN1cBLd9OpoOtJRdDJzQUYqjNoQi+5M6KRfBxPLZkmYb4uCGlp1H4AV50eC61j84LBg1ItvU2u+Fx
 X2JB7lHTswubprD2ZsSwp1VziU6pUj3vtslMWKpBGslpLtnaO561dihGyElayMd4VFg7VR/TsglJv
 A10EDs2DMhoYPfRQWvwlr5+jPP6s9H8KSTCGFvQt438rP/gk0lcEZUJK0iE2/yq5gQfaCNI5FLN7C
 q8LVr00oS4doXfmFFxMq6z1rs5SXZorWssjG7v5DILnPxLqYloQK/ebM5Ixbzm0Lq/8vWL7sw7yOH
 JVYCHCApGzKNii6rYyHdi0K8UwvpD++GCWLyvbgP/H3l5FqL63gAN0Rw1CO5r22+SmG7aOmekJH3N
 ChZPI3NMLnKZPJC8ZQZ4S8yb5oA3rqTA2DMODvsrEVlaB2cQ6IWHSa/mvBwA8Ias3771cp4fZS7W7
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qdjp1fMHVO0/z8hqh/kG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 10:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9581


--=-qdjp1fMHVO0/z8hqh/kG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-04 at 12:14 +0200, Antonin Godard via
lists.yoctoproject.org wrote:
> On Thu Jun 4, 2026 at 12:09 PM CEST, Paul Barker wrote:
> > As discussed in a patch review call, we don't need License-Update tags
> > in commits where the upstream license has not changed, and we are
> > instead changing the LICENSE variable to fix incorrect data.
> >=20
> > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > ---
> >  documentation/contributor-guide/recipe-style-guide.rst | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/d=
ocumentation/contributor-guide/recipe-style-guide.rst
> > index 79bf7c79b67b..d05a535784d9 100644
> > --- a/documentation/contributor-guide/recipe-style-guide.rst
> > +++ b/documentation/contributor-guide/recipe-style-guide.rst
> > @@ -268,14 +268,17 @@ License Updates
> >  ~~~~~~~~~~~~~~~
> > =20
> >  When you change the :term:`LICENSE` or :term:`LIC_FILES_CHKSUM` in the=
 recipe
> > -you need to briefly explain the reason for the change via a ``License-=
Update:``
> > -tag.  Often it's quite trivial, such as::
> > +due to an upstream license change, you need to briefly explain the rea=
son for
> > +the change via a ``License-Update:`` tag. Often it's quite trivial, su=
ch as::
> > =20
> >      License-Update: copyright years refreshed
> > =20
> >  Less often, the actual licensing terms themselves will have changed.  =
If so, do
> >  try to link to upstream making/justifying that decision.
> > =20
> > +The ``License-Update:`` tag is not needed for commits which fix incorr=
ect
> > +license data in our metadata.
>=20
> By reading this alone I fail to see a use-case, could you provide an exam=
ple?
> Perhaps a link to such a commit? (you can use :oecore_rev:`<commit sha>` =
to
> create the link).

Hi Antonin,

This was while discussing a series from Joshua [1] and follow-up patches
from Richard. I can send a v2 shortly once the commits are merged to
master and mirrors have updated, etc.

[1]: https://lore.kernel.org/openembedded-core/20260601181251.123019-1-JPEW=
hacker@gmail.com/

Best regards,

--=20
Paul Barker


--=-qdjp1fMHVO0/z8hqh/kG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaiFQ5xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkIyAQCt/mpVAmPvT+R4/0sucovD7KOlk1K+h666
GryUmjAGOQEApPNttA361TnK+l1bo7k5gR7b6kbb4fNZnKu/2HX9Bw8=
=mxJe
-----END PGP SIGNATURE-----

--=-qdjp1fMHVO0/z8hqh/kG--

