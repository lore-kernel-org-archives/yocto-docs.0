Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA633C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 16:12:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.415.1714666337215069735
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 09:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cdah8UOG;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61df496df01so23526547b3.3
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 09:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714666336; x=1715271136; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=66QqZV8r7BB35V97RqVzETpHVW6Bs4Bjtu5iDtm3JGw=;
        b=cdah8UOGhqjLNvQtwbYaho4eQKxYCQNjA9ycaGEGdh5xReZvoggPcM74SoN+iFsPiT
         KMPWxnqx/GUz7eQ94RqLzD1Ag2JKpihwRcCW3iWGTcIHngQjepvRZBSedkDm93qYLmP4
         0kml8o2yxgXzWER6ow8cb9UyM69GI7IX1mNIrdoCnTtfYY5Pm9SueDzslkOz4KIPFQWc
         0IgqpTZOboPVxr4G80/tK0vGswgpfZbcjWHp7cQEBOwb0xjHarXmzQOMCdpGyPk8m5uw
         SJ//edo58/BuQiuqXWfbgdtEaQ3jaj6Bq9XUGm/NZ8MOeA4D+MUJtBPo6xJZB5bGUjVt
         p9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714666336; x=1715271136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66QqZV8r7BB35V97RqVzETpHVW6Bs4Bjtu5iDtm3JGw=;
        b=E7j4Uhv4WHQmrOPqZ7+gOpT0ATKBJ4Wzf77fMkfen158lqAnUgtyacleEBRN82QiAh
         frDvxMS+vgc/hb57XcIQRKcdUrybzUsXC8cTkM7saxgEksbH7XZ8eC4Co2M7ZrehwRsT
         1u9oNrap8qa0LExh8RSfRmmvjagPAzdiXo+gGOcRv9WqoohB4S1HXuZQrqSpewbZpfav
         7JEGy3En7RDC2T5D/Uj+8IXKEK3XT2yF4uQgb+kxHgwowQCufkWeQOhS6TVLEZqyoTYO
         2ck8qNyHyIat11zrQ1pYt8Oe7M/Fynpd0bZxEnSfdxlvLAzS21NRQ6xww5GZb0yeagDB
         5syg==
X-Forwarded-Encrypted: i=1; AJvYcCUVPbIQLLme5vcedm+NXnua+0tWXTyBIXEoFpTxcgJwL/1rpzbOMk7lzfZCVcsxiwkfd1KZPMnXZ/eKlgTXMv2QDrPVnz/j4EV1/Ig=
X-Gm-Message-State: AOJu0Ywo2WL7NRn4+1mAR0Rvg8kdk6LC5JLNe0LrVJabaDvvwjp0oUsX
	mTv5ysBQ0ukJR5LoZ4wisolcXreNoWOGCIIaOfVn+/T8ZoNXj4zDNW/NI/9CkG3ZNGKq+LSXqGz
	rVY/uCcq1f6Wm6jdnqM1dVEL3TA0=
X-Google-Smtp-Source: AGHT+IHUf5Ze29O0j+g1aL90VZrmfJmtI5fpZ/Nb4512QVonUnMYR3eLMXVJJ0MqASGL1M3jeWFfUpZSq2Sbl4tUF6s=
X-Received: by 2002:a05:690c:3612:b0:609:ff2d:1814 with SMTP id
 ft18-20020a05690c361200b00609ff2d1814mr7338046ywb.37.1714666336298; Thu, 02
 May 2024 09:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com> <CAJdd5GYyNK5qq-CKH=WHQRAZLxhJN45Nz8xYtKkO3MpYDXiBhQ@mail.gmail.com>
In-Reply-To: <CAJdd5GYyNK5qq-CKH=WHQRAZLxhJN45Nz8xYtKkO3MpYDXiBhQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 2 May 2024 09:12:05 -0700
Message-ID: <CANx9H-BNJs3qXfJgrUzkki=A=E=1wq_WsvT=giQMzu08z2JzTg@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: JPEWhacker@gmail.com
Cc: tim.orling@konsulko.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e22c0f06177addd7"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 16:12:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5202

--000000000000e22c0f06177addd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 8:38=E2=80=AFAM Joshua Watt via lists.yoctoproject.o=
rg
<JPEWhacker=3Dgmail.com@lists.yoctoproject.org> wrote:

> On Thu, May 2, 2024 at 9:27=E2=80=AFAM Tim Orling via lists.yoctoproject.=
org
> <tim.orling=3Dkonsulko.com@lists.yoctoproject.org> wrote:
> >
> > We are seeing a lot of patches failing when the From:
> > line is not contained in the message body. It is probably
> > better to just recommend to force the in-body From: to be
> > present globally.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  documentation/contributor-guide/submit-changes.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/documentation/contributor-guide/submit-changes.rst
> b/documentation/contributor-guide/submit-changes.rst
> > index 47a416b24..c292a143a 100644
> > --- a/documentation/contributor-guide/submit-changes.rst
> > +++ b/documentation/contributor-guide/submit-changes.rst
> > @@ -65,6 +65,11 @@ use to identify your commits::
> >     git config --global user.name "Ada Lovelace"
> >     git config --global user.email "ada.lovelace@gmail.com"
> >
> > +To ensure that your patches are formatted properly, it is also
> > +recommended to set::
> > +
> > +   git config --global format.forceInBodyFrom true
> > +
>
> This is good, but we will probably need to clarify that there is a git
> version dependency here. Git 2.34.1 (at least) doesn't have this
> option. I'm not sure when it was added. It appears that 2.34 is the
> version that ships with Ubuntu 22.04
>

Looks like it was introduced in 2.38.0, I think?
https://github.com/git/git/commit/d5fc07df688ace8c5a32f66b358ebd55cdaf4d28


>
> >  Clone the Git repository for the component to modify
> >  ----------------------------------------------------
> >
> > --
> > 2.43.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5200):
> https://lists.yoctoproject.org/g/docs/message/5200
> Mute This Topic: https://lists.yoctoproject.org/mt/105864996/924729
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e22c0f06177addd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 2, 2024 at 8:38=E2=80=AFA=
M Joshua Watt via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproj=
ect.org</a> &lt;JPEWhacker=3D<a href=3D"mailto:gmail.com@lists.yoctoproject=
.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Thu, May 2, 2024 at 9:27=E2=80=AFA=
M Tim Orling via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferre=
r" target=3D"_blank">lists.yoctoproject.org</a><br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.yoctoproject.org" tar=
get=3D"_blank">konsulko.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; We are seeing a lot of patches failing when the From:<br>
&gt; line is not contained in the message body. It is probably<br>
&gt; better to just recommend to force the in-body From: to be<br>
&gt; present globally.<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/contributor-guide/submit-changes.rst | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/contributor-guide/submit-changes.rst b/docu=
mentation/contributor-guide/submit-changes.rst<br>
&gt; index 47a416b24..c292a143a 100644<br>
&gt; --- a/documentation/contributor-guide/submit-changes.rst<br>
&gt; +++ b/documentation/contributor-guide/submit-changes.rst<br>
&gt; @@ -65,6 +65,11 @@ use to identify your commits::<br>
&gt;=C2=A0 =C2=A0 =C2=A0git config --global <a href=3D"http://user.name" re=
l=3D"noreferrer" target=3D"_blank">user.name</a> &quot;Ada Lovelace&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0git config --global user.email &quot;<a href=3D"mai=
lto:ada.lovelace@gmail.com" target=3D"_blank">ada.lovelace@gmail.com</a>&qu=
ot;<br>
&gt;<br>
&gt; +To ensure that your patches are formatted properly, it is also<br>
&gt; +recommended to set::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0git config --global format.forceInBodyFrom true<br>
&gt; +<br>
<br>
This is good, but we will probably need to clarify that there is a git<br>
version dependency here. Git 2.34.1 (at least) doesn&#39;t have this<br>
option. I&#39;m not sure when it was added. It appears that 2.34 is the<br>
version that ships with Ubuntu 22.04<br></blockquote><div><br></div><div>Lo=
oks like it was introduced in 2.38.0, I think?</div><div><a href=3D"https:/=
/github.com/git/git/commit/d5fc07df688ace8c5a32f66b358ebd55cdaf4d28">https:=
//github.com/git/git/commit/d5fc07df688ace8c5a32f66b358ebd55cdaf4d28</a></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 Clone the Git repository for the component to modify<br>
&gt;=C2=A0 ----------------------------------------------------<br>
&gt;<br>
&gt; --<br>
&gt; 2.43.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5200): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/5200" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/5200</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105864996/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/105864996/924729</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e22c0f06177addd7--

