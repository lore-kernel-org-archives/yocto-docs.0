Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.49.60])
 by mx.groups.io with SMTP id smtpd.web11.1385.1580432667494367245
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Jan 2020 17:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@cetola.net header.s=default header.b=MnAgFBzq;
 spf=permerror, err=parse error for token &{10 18 bluehost.com}: parse error for token &{10 18 _spf.google.com}: parse error for token &{10 18 _netblocks3.google.com}: limit exceeded (domain: cetola.net, ip: 192.185.49.60, mailfrom: stephano@cetola.net)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
	by gateway23.websitewelcome.com (Postfix) with ESMTP id 0C3B43A02
	for <docs@lists.yoctoproject.org>; Thu, 30 Jan 2020 19:04:27 -0600 (CST)
Received: from box2192.bluehost.com ([50.87.253.143])
	by cmsmtp with SMTP
	id xKjSisKVOFYZhxKjSiSsrR; Thu, 30 Jan 2020 19:04:27 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cetola.net;
	 s=default; h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=r0djzxIRXQmXpxRSFRoEOF8LXK0Q40/+BjTqNG+fUvw=; b=MnAgFBzqdbQ+nojYpRAVLEvdgH
	e5wnDbKlohfps6LsR9y2ikANd/Q20HJR2+KkOQ50GMWD1h+H7/++i7rPXEcXIUrjD+zr+Y4CSFabs
	c2i5AApiosamPwT5VnbmrqyAqVjGjg5gVMuse0AsZaTu19+scK3LwidFj0bUy0Wdyzww=;
Received: from [209.152.44.202] (port=10500 helo=nobuo.wifi.pcc.edu)
	by box2192.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <stephano@cetola.net>)
	id 1ixKjS-002gZ4-Ez; Thu, 30 Jan 2020 18:04:26 -0700
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [docs] [yocto-docs][PATCH] Adding memoriam to scottrif
From: "Stephano Cetola" <stephano@cetola.net>
In-Reply-To: <20200131005220.1572-1-jefro.net@gmail.com>
Date: Thu, 30 Jan 2020 17:04:25 -0800
Cc: Jeffrey Osier-mixon <jefro@jefro.net>
Message-Id: <69EF8F29-92B3-492A-987A-DA3489FD6A98@cetola.net>
References: <20200131005220.1572-1-jefro.net@gmail.com>
To: docs@lists.yoctoproject.org
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box2192.bluehost.com
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cetola.net
X-BWhitelist: no
X-Source-IP: 209.152.44.202
X-Source-L: No
X-Exim-ID: 1ixKjS-002gZ4-Ez
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (nobuo.wifi.pcc.edu) [209.152.44.202]:10500
X-Source-Auth: stephano@cetola.net
X-Email-Count: 2
X-Source-Cap: Y2V0b2xhbmU7Y2V0b2xhbmU7Ym94MjE5Mi5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: Stephano Cetola <stephano@cetola.net>

This patch really ties the room together.

> On Jan 30, 2020, at 4:52 PM, Jeffrey Osier-Mixon <jefro.net@gmail.com> w=
rote:
>=20
> From: Jefro <jefro@jefro.net>
>=20
> Added a few comment lines in Makefile to commemorate Scott's
> contributions
>=20
> Signed-off-by: Jefro <jefro@jefro.net>
> ---
> documentation/Makefile | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/documentation/Makefile b/documentation/Makefile
> index 525a7309a..1a33c771f 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -76,6 +76,11 @@
> # example publishes the 1.2 version of the PDF and HTML YP Development T=
asks Manual
> # for the 'denzil' branch.
> #
> +# IN MEMORIAM: This comment is to remember Scott Rifenbark (scottrif), =
whom we lost
> +# in January, 2020. Scott was the primary technical writer for the Yoct=
o Project for
> +# over 9 years. In that time, he contributed many thousands of patches,=
 built this
> +# documentation tree, and enabled tens of thousands of developers to su=
cceed with
> +# embedded Linux. He ran this Makefile many thousands of times. Godspee=
d, Dude.
>=20
> ifeq ($(DOC),brief-yoctoprojectqs)
> XSLTOPTS =3D --stringparam html.stylesheet brief-yoctoprojectqs-style.cs=
s \
> --=20
> 2.17.1
>=20
>=20

