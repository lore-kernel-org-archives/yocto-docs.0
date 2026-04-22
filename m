Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F445F9B5FB
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:36:34 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78383.1776850584814959467
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=I+Oh4aXD;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=OQFqeb9E;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 197097A01D3;
	Wed, 22 Apr 2026 05:36:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Apr 2026 05:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776850583; x=1776936983; bh=y0axi6kD0g
	3gpyWusiuP1GmbMQtOyDjZMWRRsa3K/zA=; b=I+Oh4aXDdCG6vAvlac6EGPWxEd
	jTeVS9ViQJURt5m8U1RK1RbGZZx3A3Yebd4E6CAe6lZZjxJOWfJjFfWrG2oW+dZe
	b6ryDS1LKc66X+8QXoA0bsxssha4LQC5jsdcIsAwcrB1f9NqGuod9vrz6cfP1jX0
	M0x96DARG/BN7qjXPuVMIVa9ljQuSdzX11lvnlmDbI/AWY2F7NV9jCfq/Y3tGvpQ
	vAXpX9+QbEs3zxIiWwsmJLkqDDqEVSRrHlOPqFsBF+Zp796oSOsiqktdo5yciYrS
	1Ogsou6FthCu3Ydrb4UwVwrPhIXpS+VJbpeBHJ+gDsKdBezdc4ryk21SgqVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776850583; x=1776936983; bh=y0axi6kD0g3gpyWusiuP1GmbMQtOyDjZMWR
	Rsa3K/zA=; b=OQFqeb9EHieZZm1KeQ86mnquqsx2qVJZwT/fB6ec3NQuL7JChqp
	U8UGQX/QgrqJ8CH/Bf90+nH5oBkuICHbON5hcffbPz1HQR0yAdQMStIlVuPiub8p
	PFQpsGcsIQYWEjsMWQ+/QGJVOAVdL9RNwgW2j6RL9Sm6nbsDPbYMK+AEb8lL1/Yb
	FW1m2HC1l2e61asKbOVMk1NTLfAN9xec/tyrJvCncM29/ZRlh3VlidDvfIxBQ9MZ
	h5Faa6+mGpOzfSXM9+n+LcQPIytq7xMul8dUPPAK5iokbSoiQ0LJaEbWDMq5iLFa
	iNkDgvzhaxMVo7AvCh7Jx8FdlgJCp1tfnuw==
X-ME-Sender: <xms:l5boaZUMeZdvhD6wd_uKd4zxDOP9YUmHhBLJSJ3uc8rndc0BPUVVxA>
    <xme:l5boaRAxBsGnro7VBlzqZIwsXEobSW2VV2SjiEObbbL_ThqUbH9PZCvxgfaUPsNAC
    HOV91l6KF5yDjTW8ujdhB-eO6_25gwuOa1EsvBNRlGoDhtHRWIoeHej>
X-ME-Received: <xmr:l5boaSxM9Q6xcFfyXvxsuV5drCuz3Jl8Em5-FQvaJ9UbfbqD9Ia9Mxqr1SdpA1myQuQ-66XZQzoJUg5XKIa5QTVT1R3TEwG6aNFLfB8YDeqe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeifeelfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:l5boaWB6Owpm7uZoNUDSZ0f_UIvB97NB7U5lg-fNOOMQo8uU20ulpA>
    <xmx:l5boaXbWJkYC7jI0INnvhS5i5u4w0NeB6Vc7s8AwgyPGg1HLAxafzQ>
    <xmx:l5boaWjVkNY8p-jem1vBLE1NKXseGDJQRvrRXG--K2_MdmjY8ILPkw>
    <xmx:l5boaR5XGdWnDC-SCvHgaKTBzWAXDDpdMQ6D8GZosZ7ovqb9lVIIAw>
    <xmx:l5boaSumXCn2JHlhAMZPr1nRjuaM5yPugx3ytqRmTdFqv0Nj46RFNC7R>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Apr 2026 05:36:23 -0400 (EDT)
Message-ID: <4fedf1f0bd264095c2aa627193af481bf265cee5.camel@pbarker.dev>
Subject: Re: [whinlatter] Pull request
From: Paul Barker <paul@pbarker.dev>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 22 Apr 2026 10:36:20 +0100
In-Reply-To: <DHYVME7JZ0Z3.5SQMYFN5Z4DK@bootlin.com>
References: <DHYVME7JZ0Z3.5SQMYFN5Z4DK@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="=-nmwx3s3W0t9t/gcppER7"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 09:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9306


--=-nmwx3s3W0t9t/gcppER7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-04-21 at 15:44 +0200, Antonin Godard wrote:
> The following changes since commit b3966fa5ab7ee4653124badba3d2c54f0e5797=
aa:
>=20
>   migration-guide: add release notes for 5.3.3 (2026-04-02 15:22:19 +0200=
)
>=20
> are available in the Git repository at:
>=20
>   git@push.yoctoproject.org:yocto-docs whinlatter-next
>=20
> for you to fetch changes up to 10818445a22c524de0934901547cf676256c2b9d:
>=20
>   dev-manual/new-recipe.rst: rework Unpacking Code section (2026-04-21 15=
:19:46 +0200)

Merged, thanks!

--=20
Paul Barker


--=-nmwx3s3W0t9t/gcppER7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeiWlBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bmwpAP9j++Ex2SYtqBZnVoVbiteusRgrHmX5qjD1
C5Qef/s7jAD/fZw8wPZac8Puo8r0OWuAJIAoR/tE9cpubFuhG/YDcgw=
=L+OF
-----END PGP SIGNATURE-----

--=-nmwx3s3W0t9t/gcppER7--

