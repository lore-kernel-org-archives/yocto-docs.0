Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.951.1594160116756096177
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 15:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=jXkAhJtp;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1764; q=dns/txt; s=axis-central1;
  t=1594160117; x=1625696117;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ENkef2+m8MsJ5qa8+UXh3ZMLuK+txOuqE3MUXehF8IQ=;
  b=jXkAhJtpBhxlxKw6HGAQ+v5jVMdiwHNf4AUP/rIYF0GUxDJ7RL2oln2O
   C4gcBk98oqAXfjLUDFy2AvMG1QGhLeaUeGBk56I543CLJz8KbyZyP81LO
   2djLJqh0QYtqbSWeBFSj8ESU+U2jnBZPHqSn2Wm0pEK6IqT7jAL+3EZcN
   RQOqv3WQSjghu567b9Ys4zTz9RTLm8qJk0Xej5P1v+JuXWB5NbQ/cJvwH
   t1tS1HNFpLVpOqnyLXVpxQ0nDGKhokNm1lTuEW0PpOHnDfiFENua2415E
   LDiE213UcIdDjvedMJPhqezScrAooW9+6Tni7uqPZLl88k0EDiiIyZs1p
   w==;
IronPort-SDR: GlPboF2g37vNGTbu/krQNR1BJ1bMAimlV815xF2qtjLHuEyBib7q18Wwwl/qdOZ4vYNZP3ZrYM
 rbu8+WPOrYCwePnEMA58NiHXoI8kpAHjnYQhjwP3C1eh+hqs/eeu9kpucGProTn2wpAXPYRKDh
 yBGbTdGd3dri3vX42Rr9SH6GfjlhiQZ/j/bz9DhSjgdbl2XHEc2MZzkkqAhVD2YTvMPNDYggty
 4NLCts9257vhwT++0bNd+VzktcNQoIn7xF8zZS00qE54qNht6i/6pa89qJEa4AnJMTQHmyZDls
 cr0=
X-IronPort-AV: E=Sophos;i="5.75,325,1589234400"; 
   d="scan'208";a="10575055"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Leon Anavi <leon.anavi@konsulko.com>, "docs@lists.yoctoproject.org"
	<docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] documentation/poky.ent: Add screen
Thread-Topic: [docs] [PATCH] documentation/poky.ent: Add screen
Thread-Index: AQHWVEIkXuHSj51CD0KdWqORobT45Kj8rk9Q
Date: Tue, 7 Jul 2020 22:15:14 +0000
Message-ID: <f40b1190a1194109bb8c97bfaef284de@XBOX03.axis.com>
References: <20200707093632.17972-1-leon.anavi@konsulko.com>
In-Reply-To: <20200707093632.17972-1-leon.anavi@konsulko.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Leon Anavi
> Sent: den 7 juli 2020 11:37
> To: docs@lists.yoctoproject.org
> Cc: Leon Anavi <leon.anavi@konsulko.com>
> Subject: [docs] [PATCH] documentation/poky.ent: Add screen
>=20
> Add screen to the list of packages for Ubuntu. Without screen or
> an alternative terminal, executing -c devshell fails due to the
> following error:
>=20
> ERROR: do_devshell: No valid terminal found, unable to open devshell.
>=20
> Tested on a fresh installation of Ubuntu 18.04.4 LTS.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  documentation/poky.ent | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index aec8d455e..5e3563937 100755
> --- a/documentation/poky.ent
> +++ b/documentation/poky.ent
> @@ -62,7 +62,7 @@
>  <!ENTITY UBUNTU_HOST_PACKAGES_ESSENTIAL "gawk wget git-core diffstat unz=
ip texinfo gcc-multilib \
>       build-essential chrpath socat cpio python3 python3-pip python3-pexp=
ect \
>       xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl=
1-mesa libsdl1.2-dev \
> -     pylint3 xterm python3-subunit mesa-common-dev">
> +     pylint3 xterm python3-subunit mesa-common-dev screen">
                ^^^^^
Doesn't "xterm" fulfill the requirement for a valid terminal?
It is already specified for all the distros, not only Ubuntu.

>  <!ENTITY FEDORA_HOST_PACKAGES_ESSENTIAL "gawk make wget tar bzip2 gzip p=
ython3 unzip perl patch \
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath =
\
>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl=
-bignum socat \
> --
> 2.17.1

//Peter

