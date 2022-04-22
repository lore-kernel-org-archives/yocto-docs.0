Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D39C4708E
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.6594.1650620162948905775
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 02:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=DhlLgvUK;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650620163;
  x=1682156163;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UFB74wLta3ycStrT2HEtZlv+MJWU+38WDpoaVC8GSLQ=;
  b=DhlLgvUKWHIejEZPoI7UdRfELelJmUS36DTS/EV3RK52Zp7L+GvYhcbF
   E+nEeCk5/1Kkf2SBMMDwjggDudKjmakh3IQk7WfdEvvLGl9abS9ruvKNh
   B4PdfEFGZei+btrn0OKyD8wL405nWOhTT5cR2hlYS6rFQr2nuDnedTES7
   Bh9Iyr/ZEmv6N+zs4tSuF3a/HhO8F/M2KYdFYMPxZ70Z8NO6GR6BTtCXJ
   zkMwo6oqUiSOtXt034BwnHcwEJA9t2U1yfw+7lbsr2cOBKXjOtMqZzi/F
   9PDZjwcBnXWM5vr+j2CrCYGsLDeqdvHZs/3AJcO95QKNWrJI9P5gpfXAK
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH 2/9] ref-manual: add a note about hard-coded
 passwords
Thread-Topic: [docs] [PATCH 2/9] ref-manual: add a note about hard-coded
 passwords
Thread-Index: AQHYVeoB3NjdabOs2U6rVJklBmx7e6z7qxLg
Date: Fri, 22 Apr 2022 09:35:59 +0000
Message-ID: <e92fa932b4594c58a007b4db5cc70551@axis.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <52c5571a8664a7547caed420ea83d77ab5d21d0f.1650591341.git.paul.eggleton@linux.microsoft.com>
In-Reply-To: 
 <52c5571a8664a7547caed420ea83d77ab5d21d0f.1650591341.git.paul.eggleton@linux.microsoft.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2831

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Paul Eggleton
> Sent: den 22 april 2022 03:41
> To: docs@lists.yoctoproject.org
> Subject: [docs] [PATCH 2/9] ref-manual: add a note about hard-coded
> passwords
>=20
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> It seems prudent to point out that hard-coding passwords in the manner
> detailed in the example is not a good idea in production. This type of
> mistake has unfortunately been made by many device vendors (outside of
> the Yocto Project context) leading to security vulnerabilities.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/classes.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 6ba792d..13cc2bb 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -576,6 +576,13 @@ Finally, here is an example that sets the root passw=
ord::
>         usermod -p '${PASSWD}' root; \
>         "
>=20
> +.. note::
> +
> +   From a security perspective, hardcoding a default password is not
> +   generally a good idea. It is recommended that you do not do this if y=
ou are

I would suggest adding "or even legal in some jurisdictions" after "good id=
ea".

> +   building a production image.
> +
> +
>  .. _ref-classes-features_check:
>=20
>  ``features_check.bbclass``
> --
> 1.8.3.1

//Peter


