Return-Path: <aurelien@hackers.camp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806D0D6AAFC
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:19:11 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7176.1775204348963578406
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Apr 2026 01:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-953b54dba25so36146241.1
        for <docs@lists.yoctoproject.org>; Fri, 03 Apr 2026 01:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775204348; x=1775809148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmegvmEY5EndwW2GbMQUG1npYR+WKUwYweywoRwizwQ=;
        b=GK3VrPJON5+3RzQef/PP95rlYFnrNmHkrxEMAYBopWvZwTtIlaeg1FUAyRA+BdNRvg
         o9I4GNbr0pcSa7s8bQqV9Gu3dAfqjvc1CkUuHasaS5GFHKupApyZksDgJBHjcRY7Jj5q
         FUVcaXwjWlDvdeS1ScGQJigMLDgSD0l01QZGi9+wgICX8OeourPHdJlCxvyBGZw/NIn2
         9OJ32bDJ8XzrnhXKoWVMhi/RwNTyHNqcB9g8jTLqohhbmpaGopKP1SADiTb6tXDDjqZX
         ZfXs6MIwaOFqBTkEIP4mt/y3og77c2rCOREpQYOoyXVqkMrYL2D8WSLscOdPCLZXmU2N
         Thvg==
X-Gm-Message-State: AOJu0YzmiA8UL74ijSmV5C7G1oAi7WBZywhAjrSUZaFXrBdS0kfndviE
	tzpULkxevBnYRqiqoLgx5sAXfsMm1lQdw8MwbMTJ6DUNNijXT9oPy5t1FXY6UyDT4/k=
X-Gm-Gg: AeBDietFyzcpRDMtJpQJ8kT9ZNrWwd3uFHXSYY/0rTUKIY8eflCgf76ShIg5BlesNMq
	EVzxjsRw/HLKye9VSN0QJBfutwR1JG3d4bsEUfJGpIUzJyEsxo7sPEMJbRbxf6DlpPNVqkOi1ci
	apv6ddR1T75egtInh64d3A5k2fdsGdqcp4ycL5E3YIAAwjTY2elBvuImKxKIYYekOGMDNiwOA9C
	902ijBcF9NVSDuyqxpW/P/ciJzINHsRFO23NjGvYykf7MeIerlEvtdxLB5bIn9K0Xu9eHKzyiaU
	CjH6beoMVqc+PsSsgyEdMZZVAuNq+8HWMwUxgGTIrvxJriYhbgc8nHHyXsD0ae8DCefzsxKO0Gj
	y0tFCz7iC69ZpwCI/3ftOycxC8TzppnlFKpuPGLhYdldhkVV6HW7ocG692PYui1jJ2157rgQgXY
	lsEebGLUHQB16x01CK1kNWcya4KGx2mWr7/q1QAafWEwO11sRM4NHNkPwX3FRvbYUh9ru/jwxl8
	eNnov6jHHatusrJorDMQw==
X-Received: by 2002:a05:6102:3139:b0:605:5eec:cf0 with SMTP id ada2fe7eead31-605a4ffe4c0mr201459137.4.1775204347396;
        Fri, 03 Apr 2026 01:19:07 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60583093d14sm6541723137.11.2026.04.03.01.19.07
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 01:19:07 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-605afef5ca5so6648137.3
        for <docs@lists.yoctoproject.org>; Fri, 03 Apr 2026 01:19:07 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:605:53cd:302b with SMTP id
 ada2fe7eead31-605a5136da2mr344198137.8.1775204346978; Fri, 03 Apr 2026
 01:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260402164218.210974-1-aurelien@hackers.camp> <DHJD5FDDVNJB.PNZLGSKXTQIY@bootlin.com>
In-Reply-To: <DHJD5FDDVNJB.PNZLGSKXTQIY@bootlin.com>
From: Aurelien DESBRIERES <aurelien@hackers.camp>
Date: Fri, 3 Apr 2026 12:18:29 +0200
X-Gmail-Original-Message-ID: <CAM=40tX4d=bxm=d9fX+7wTi_PdmigJOA25A6DbJ-0diH8wOuqA@mail.gmail.com>
X-Gm-Features: AQROBzBALn8FxwHnRq0GimnafQfrs7pMyB9iW5tOLPwYpFxVH7cux9dyltTJaQA
Message-ID: <CAM=40tX4d=bxm=d9fX+7wTi_PdmigJOA25A6DbJ-0diH8wOuqA@mail.gmail.com>
Subject: Re: [docs] [PATCH 0/1] ref-manual: add Gentoo package list for build
 host setup
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000816642064e89f89e"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Apr 2026 08:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9174

--000000000000816642064e89f89e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Perfect, I will.

Thanks,

Aurelien

Le ven. 3 avr. 2026 =C3=A0 10:06, Antonin Godard <antonin.godard@bootlin.co=
m> a
=C3=A9crit :

> Hi,
>
> On Thu Apr 2, 2026 at 4:42 PM CEST, aurelien wrote:
> > The documentation currently has no Gentoo section under 'Required
> > Packages for the Build Host'. Third-party guides commonly reference
> > incorrect Gentoo package atoms (dev-util/chrpath, app-text/chrpath,
> > dev-util/cpio) which do not exist in the Portage tree, causing
> > confusion for Gentoo users trying to set up a Yocto build host.
> >
> > This patch adds a Gentoo-specific section with verified package atoms
> > and notes on the common naming mistakes, along with a reminder about
> > Python version compatibility for Scarthgap/Nanbield.
> >
> > Verified on Gentoo Linux (OpenRC, amd64) against the Portage tree
> > as of April 2026.
>
> The reason we don't list some popular distributions here is because they
> are not
> tested on our test infrastructure (our so called Autobuilder [1]). For th=
at
> reason, listing untested distributions here would come at risk of breakag=
e
> for
> people without us being able to support and properly test things on our
> side.
>
> Also, adding new distributions here comes at a cost, as we need to
> maintain the
> package list over time for these distributions as well.
>
> I suggest you propose this change to the Wiki instead [2]?
>
> [1]: https://autobuilder.yoctoproject.org/valkyrie/
> [2]: https://wiki.yoctoproject.org/wiki/Main_Page
>
> Thanks,
> Antonin
>

--000000000000816642064e89f89e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Antonin,</div><div><br></div><div>Perfect, I will.=
</div><div><br></div><div>Thanks,</div><div><br></div><div>Aurelien</div></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Le=C2=A0ven. 3 avr. 2026 =C3=A0=C2=A010:06, Antonin God=
ard &lt;<a href=3D"mailto:antonin.godard@bootlin.com">antonin.godard@bootli=
n.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hi,<br>
<br>
On Thu Apr 2, 2026 at 4:42 PM CEST, aurelien wrote:<br>
&gt; The documentation currently has no Gentoo section under &#39;Required<=
br>
&gt; Packages for the Build Host&#39;. Third-party guides commonly referenc=
e<br>
&gt; incorrect Gentoo package atoms (dev-util/chrpath, app-text/chrpath,<br=
>
&gt; dev-util/cpio) which do not exist in the Portage tree, causing<br>
&gt; confusion for Gentoo users trying to set up a Yocto build host.<br>
&gt;<br>
&gt; This patch adds a Gentoo-specific section with verified package atoms<=
br>
&gt; and notes on the common naming mistakes, along with a reminder about<b=
r>
&gt; Python version compatibility for Scarthgap/Nanbield.<br>
&gt;<br>
&gt; Verified on Gentoo Linux (OpenRC, amd64) against the Portage tree<br>
&gt; as of April 2026.<br>
<br>
The reason we don&#39;t list some popular distributions here is because the=
y are not<br>
tested on our test infrastructure (our so called Autobuilder [1]). For that=
<br>
reason, listing untested distributions here would come at risk of breakage =
for<br>
people without us being able to support and properly test things on our sid=
e.<br>
<br>
Also, adding new distributions here comes at a cost, as we need to maintain=
 the<br>
package list over time for these distributions as well.<br>
<br>
I suggest you propose this change to the Wiki instead [2]?<br>
<br>
[1]: <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/" rel=3D"nore=
ferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/valkyrie/</a=
><br>
[2]: <a href=3D"https://wiki.yoctoproject.org/wiki/Main_Page" rel=3D"norefe=
rrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Main_Page</a><br=
>
<br>
Thanks,<br>
Antonin<br>
</blockquote></div>

--000000000000816642064e89f89e--

