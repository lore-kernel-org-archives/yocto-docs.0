Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683FDC4345F
	for <webhook@archiver.kernel.org>; Sat, 27 Apr 2024 06:33:12 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.5936.1714199588307073328
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Apr 2024 23:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l7SuY1Fq;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2dd041acff1so32514581fa.1
        for <docs@lists.yoctoproject.org>; Fri, 26 Apr 2024 23:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714199586; x=1714804386; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VtldklyVvElnP2oo1EStxjs4EfD2lNkhzoE8u04Tb/s=;
        b=l7SuY1FqWhB4maZBRAapycXqJfAiLUuhoBBSYwNd+YkpBKsfaIvkH564oZBcVNU8Z+
         WVHcNhDf0KZ44lD35pg0oVk3Gu4XRGOVU/sauYuvzXNAMg/ZIVx4YhqXR6y8kdElXZsO
         cr/jdVfWt7M2/tCg+ARM3I6M+mMW0LwtnWjjLgIeKJy5JBSZ1D/Rk4xY+URG7UZczUMH
         oDJg71G0AcNIkmtYvaqD76amMqdCGLZ2Qde0c+WC/40ejpec9I6UvD6KTSLfRJa8RAJ5
         UAqJwllpQ8+Zzbhq/UQfLLY1eSjnUIGurpybu6oDHPu4H7Ns+GWuMQMNW3/DFNF2Petu
         JzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714199586; x=1714804386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtldklyVvElnP2oo1EStxjs4EfD2lNkhzoE8u04Tb/s=;
        b=CHSNG9zQk8IDCMdjsm81eOZpPCJ/C5LKQxWMn6sXbKomTQxfmojE+P0fVy7b0PA1/V
         jIKQbKANXyqty8gFfxEM8Tat+ZI72H5yq1Iegu8ua2vZqjScyC+9pld7yUTydX1YFDd+
         Sabz1CjJuFJgiZPMkxXkhMMIsqfVR30wM7FztcgVOB5xQAYKNLTivHmSzArxN6rXACeT
         cQ7ikSU997s/6pmacESBmo7QWexriQkKSGuF9wnbcWkVf/frSvRGtYCXzFXnkNNvLjgH
         uCfQLG2NJ+XyjXBjq9LtQw7kCft/1HaxDP0hoT5265waInD9Wq1hEU1FTYTY5V8GyVET
         CdKg==
X-Gm-Message-State: AOJu0YyFbKL8AycSIEh6tIUC+Dp5L9f2+z0OwVc3K3iqoz3bpJp1i6GU
	sJ9aIac32dMBVcZSwXCdUttaYKs7s0nUeVqaC8+icEXUspaOJGAaHnKb2UBrL6HvgN1B66lPppa
	lQMM5DUgWtG9K86dXOZbn0Q5/T/c=
X-Google-Smtp-Source: AGHT+IHUQQBKowB9nZpzVTUiuiI5eDRCjFs0i0UowvDw8avpBlynBZYPkLZi/3QGrSGuMyycrR8RPR9YSOfRV9+aYqo=
X-Received: by 2002:a2e:a26c:0:b0:2df:b0c4:3ede with SMTP id
 k12-20020a2ea26c000000b002dfb0c43edemr671463ljm.19.1714199585948; Fri, 26 Apr
 2024 23:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-CA+5VbUfPkqTSi_PygfXdGxOG577HQwaod=c=M_ismqw@mail.gmail.com>
 <5ecc01b083d12df9b24faec4ce01b0c856aa1c6b.camel@linuxfoundation.org>
In-Reply-To: <5ecc01b083d12df9b24faec4ce01b0c856aa1c6b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 27 Apr 2024 08:32:54 +0200
Message-ID: <CANNYZj8SaL_m4oPM+P6mZmHVWGEciC4_SU4PCbDw35xO+Lc1uw@mail.gmail.com>
Subject: Re: [docs] libegl1-mesa not available in Ubuntu 24.04
To: richard.purdie@linuxfoundation.org
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, ticotimo@gmail.com
Content-Type: multipart/alternative; boundary="000000000000650ac106170e31ac"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 27 Apr 2024 06:33:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5177

--000000000000650ac106170e31ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I believe this used to be but is no longer the case as qemu is now using
100% mesa-native without deferring to host. I=E2=80=99ll double check this =
later.
We can likely drop this from the docs.

Alex

On Sat 27. Apr 2024 at 7.19, Richard Purdie via lists.yoctoproject.org
<richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:

> On Fri, 2024-04-26 at 16:05 -0700, Tim Orling via
> lists.yoctoproject.org wrote:
> > In the docs, we currently tell users to install libegl1-mesa:
> >
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-=
and-debian
> >
> > But this is no longer available on Ubuntu 24.04 (there is a libegl1-
> > mesa-dev package).
> >
> > I came across this while trying to create the crops/yocto-
> > dockerfiles:ubuntu-24.04 containers.
> >
> > https://github.com/crops/yocto-dockerfiles/pull/103
> >
> https://github.com/crops/yocto-dockerfiles/actions/runs/8853986259/job/24=
316025556#step:3:128
> >
> > I'm not sure what the original need was for libegl1-mesa. It has been
> > in the docs since before the Sphinx refactor.
>
> The need is to have GL to build qemu against. Not sure what the new
> dependency would be?
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5176):
> https://lists.yoctoproject.org/g/docs/message/5176
> Mute This Topic: https://lists.yoctoproject.org/mt/105760426/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000650ac106170e31ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I believe this used to be but is no longer the case as qe=
mu is now using 100% mesa-native without deferring to host. I=E2=80=99ll do=
uble check this later. We can likely drop this from the docs.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 27. Apr 2024 at 7.19,=
 Richard Purdie via <a href=3D"http://lists.yoctoproject.org">lists.yoctopr=
oject.org</a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@li=
sts.yoctoproject.org">linuxfoundation.org@lists.yoctoproject.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">On Fri, 2024-04-26 at 16:05 -0700, Tim Orlin=
g via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> wrote:<br>
&gt; In the docs, we currently tell users to install libegl1-mesa:<br>
&gt; <a href=3D"https://docs.yoctoproject.org/ref-manual/system-requirement=
s.html#ubuntu-and-debian" rel=3D"noreferrer" target=3D"_blank">https://docs=
.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian</a>=
<br>
&gt; <br>
&gt; But this is no longer available on Ubuntu 24.04 (there is a libegl1-<b=
r>
&gt; mesa-dev package).<br>
&gt; <br>
&gt; I came across this while trying to create the crops/yocto-<br>
&gt; dockerfiles:ubuntu-24.04 containers.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/crops/yocto-dockerfiles/pull/103" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/crops/yocto-dockerfiles/p=
ull/103</a><br>
&gt; <a href=3D"https://github.com/crops/yocto-dockerfiles/actions/runs/885=
3986259/job/24316025556#step:3:128" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/crops/yocto-dockerfiles/actions/runs/8853986259/job/243160=
25556#step:3:128</a><br>
&gt; <br>
&gt; I&#39;m not sure what the original need was for libegl1-mesa. It has b=
een<br>
&gt; in the docs since before the Sphinx refactor.<br>
<br>
The need is to have GL to build qemu against. Not sure what the new<br>
dependency would be?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5176): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/5176" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/5176</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105760426/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105760426/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000650ac106170e31ac--

