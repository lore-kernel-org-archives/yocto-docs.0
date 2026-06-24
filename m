Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF883CDB470
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 07:17:32 +0000 (UTC)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1588.1782285450167892137
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 00:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=f9+669q2;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=cZ30Pa2g;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 5FC65EC0119;
	Wed, 24 Jun 2026 03:17:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 24 Jun 2026 03:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1782285449; x=1782371849; bh=POna77NHxL
	vZurkqnZl1hnADuY/Leeuo/reKm4j1oHg=; b=f9+669q2JN0WxeeTLzCI8SrXqP
	n3tpFsuZl1oO1CxM4aOg6bP7WvK3Y4COGxJyEF16rwI5YSk11i9F47yEt1nZ/blP
	Zf7DNfcl7E651ODBC9lSNNUcSAruryio5FJ+OyNvtBgHCAcqmo64PSSE1B9wrVkH
	r9BLhPFMXzRRejZuWvpfRh2ChFcYo9GS+EWtcInlrvvkKSkKDgamwhCKN3TWWdGb
	tX5b0HdAi/txxz90Qohp+hA1tcn6Rr3Rs7saCmjpkJMf555ZUAdFJYcoHe/M0egx
	1tdlX/qySSBQvZa9VYGzTWfRSvXrgA5ZFfVaBvwDy/fJnI8d2EmWIQp2jhDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782285449; x=1782371849; bh=POna77NHxLvZurkqnZl1hnADuY/Leeuo/re
	Km4j1oHg=; b=cZ30Pa2gIoCmumGtAVcOPn0JcA7tkNUXn9lyih7L+0OdtupYQ9N
	XXty9hzSxRnKA9xoHniGQHvAP75qMuXb13u93bAFkJrt4uenJ484IiWC4QW392p5
	/HD6CtnPE+m2tq/5BkObyYFXbYSVBy1M/h6pKHRkal48ukURYF97KkpsUZQD7x21
	rqJ2RQtLo5tN4+j3pXoKo6wMnTOIwzDLqwo+mdmEaAJFuc18UtXWkOEh8dw5a7Uw
	mJsirvi9haQoHzcKZeE17VHHNPFJ+aako+S6r8iV3YW7xZSrkitopqfFpy4d+dSg
	JW/aBfuiCku48gKvBKgdPGJ+8AoePQMb11Q==
X-ME-Sender: <xms:iYQ7aj9MK6FFiT7Ro2vqGDWpmsewFfhzeSvSofNABlDl62aEasbQCQ>
    <xme:iYQ7aluwl0rJGqreG8OncDQMlN7ouCGHCtSNUInqLmA7arTjgSbXLPPV9uLvjFj3H
    KWiH7-XRVIX-59fgXVKK5YiYaIMmiNNDAMMWrM0ijwOeALu-ApajJQ>
X-ME-Received: <xmr:iYQ7aurONL1uUnClRpfA5hiwnilI7kEN34kG0MJ6nxrnPlwg3fM5xAOfxeuS3M1WC1zZKE9eEtqPQJ2qI7TKkCoYSi6D4K9AM7aE5z0Mhp72>
X-ME-Proxy-Cause: dmFkZTEZatbC3/09HCTxyypviFJimt8i2KxjuYOqKgtce+vqAb1doTprdwvrIitnNx9dAl
    XV4Lvr2ujuI6VaOWJ9iWXRQFco2j+kX3hVXuSXQqcScrZX/SYA31CPNqDEwlYzCe5QSl9H
    FFuzsyu8g/Xhgo8bYv03op8ABbVnDx4m/0QZw0Z2HfrIXDKOWPT3eVw4/8dMgcwI16tXtZ
    zIu/DKq0l0v2jIa+XWj2bMqxcAqPze8W6K80GAbsT2lMXxcNu7ECp3x9wo2n6yzLOBzE69
    +ttUK2o/us3H1OxCWHPIVw+WBxG4QclbeWw9iCFFhFCka6yfoIK00uFIkrjoqyD+NYQusL
    8Y7kYIvUVxjxbnkezmyfKkq2N9KVmj9UovlQwm9SOTXQApskng6yTRWUoKl8tuiHMRbGgq
    9QwYYKe/IBSClpx0KJ2MjgprjfmcCy9iL2nmnX7MZQFtevPNSwZDrnDuKjVQ0TI7HKJwhA
    O0XT8ljalm6XmpskOqYF9v/0V+zbx7YYlGYFLbJe5Cq8EhJJrTMi1uUXzGU6x2iM5Xo4US
    JFseujU2vPU+f6MzSbTut7XJb4Zr6Pxa1oRWB62wrLSDvMi55GY6mrS9PenaU7/h0hTmPa
    xjg3thdi7YZPNfz2sB9yhCPdCZrTQ2wdR/5FyLHCdRAgtXPI9xTd86ADFluA
X-ME-Proxy: <xmx:iYQ7aqme9NSCvFNmkhPUWth0xQWA8yY0hkr2GLE6NxePVGg6o7yujg>
    <xmx:iYQ7aqzhRS4RtIr3EALm3IuGBZMr5zxF3rTnGlv0S6KZ9O7JTpSZMg>
    <xmx:iYQ7aqmJqUy_mB7Bc15lQ8j_SX2Wl_h8XJlW69EIxlOPMOeSewNpTQ>
    <xmx:iYQ7arclPkd7Ir_89CwkJEJ1xGpEpu8BW5fcixj9d3hsc1SvXET26Q>
    <xmx:iYQ7alfCxDa0nyg7YEqYaIXNyeGKWOq1m7UamNuyOoPHfI7JtNly1S6G>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 03:17:28 -0400 (EDT)
Message-ID: <ff53860cb34e588fb2f3d6ecb46cbb33f9a3b13d.camel@pbarker.dev>
Subject: Re: [docs] Zaurus? Really?
From: Paul Barker <paul@pbarker.dev>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 24 Jun 2026 08:17:25 +0100
In-Reply-To: <023dcad6-da72-e084-4c4d-5149ebaf0e79@crashcourse.ca>
References: <023dcad6-da72-e084-4c4d-5149ebaf0e79@crashcourse.ca>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5lYMVmL07XYGTZe4JCod"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 07:17:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9846


--=-5lYMVmL07XYGTZe4JCod
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-23 at 14:29 -0400, Robert P. J. Day wrote:
> here:
>=20
> https://docs.yoctoproject.org/dev-manual/debugging.html#other-debugging-t=
ips
>=20
> there is actually a reference to a Zaurus. how many readers are going
> to recognize that? :-)

Perhaps for those who do recognize it, it's a nice little easter egg.
It's harmless, and it's good to keep some character of where the project
came from.

Best regards,

--=20
Paul Barker


--=-5lYMVmL07XYGTZe4JCod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajuEhREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgLhAQC+U7JwDJ8gXnUhg14Y03GF+KTcYE7OVzVp
l8q5NwcP7gD+JG4dwxR8K0bBxlACkecMK7mArPPiuZB02YHNMR1RDQE=
=PX9T
-----END PGP SIGNATURE-----

--=-5lYMVmL07XYGTZe4JCod--

