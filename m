Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web09.41743.1606162635745063081
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 12:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LPPVkOEk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.182, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-yb1-f182.google.com with SMTP id o71so17120569ybc.2
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 12:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6BAJlB+gHx5VSZFW7L2GnRvUq696N9PfT4V1VQYpmI=;
        b=LPPVkOEkvOXBcBgA6/rN4n4Y+NejLhRllygjv8dWiytk4wVpHMo+VUnfkF5oWleetV
         xTHRwR5ypcMV+Pk8mT1ChVY9jVhNOQoOdWhKLlVb39v7YVWAXxy7sm3XLtvg3AUBfCm5
         Vd04jbWaZtXUJ4shkA+y3pyf66NJ8AwjiumGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6BAJlB+gHx5VSZFW7L2GnRvUq696N9PfT4V1VQYpmI=;
        b=kWcedXKAFXVSzNwmx6lwQrXpWO7+lXpBTO+HyD6DikpGiQd/2ANRG+SfeD7dLFcOg0
         KlTt2Wih8l3I6QcgmE8OAcLttkit97PN++dw+Ap8PSH9/CuQi0p1gwSyuT036mWzHB9K
         PdguC3WQ4PHE1bDqryLXlAnvfEo5dAgp76GI/2gF9Qe5qDtFuT+e3quF5lIIgKuYHfps
         7fd/8E1c4cBnws0uFsIsFu9THU+Equ4PrAxOkzhmzTOHHA9BrPj+htyXwLPD7rp/+Jig
         8o1E+P1cUHIKlUIif0tauSAkGDsIFpwZKwwJHHtyAtIyxS17mg4xkoiDEk7xmb2gCs8q
         K9yQ==
X-Gm-Message-State: AOAM530jq5DYqoqZNaMBoWsTlu7O4t5ZjUJVvXSpIEN8GZz+Df8g2OkR
	DZlyC6iSHd4d1AwZhZGZAALmxj4E+TaanUI+pTSzfQ==
X-Google-Smtp-Source: ABdhPJyLjXs5qyrSaNb/qTlqP3rJjxxdzEGyv6jZsZxhkofEojHajiisniWZsie14doUbFp7xUIoUnIg5ZxW/m+34MU=
X-Received: by 2002:a5b:f02:: with SMTP id x2mr1168828ybr.424.1606162634918;
 Mon, 23 Nov 2020 12:17:14 -0800 (PST)
MIME-Version: 1.0
References: <CAM9ZRVvsXTvLcT5+0c16Q=zub2wBZhUhdaudE5+qc_Pg8+vBdQ@mail.gmail.com>
 <858f33431e388f324d93bb75d5ac03f9f9c869f2.camel@linuxfoundation.org>
In-Reply-To: <858f33431e388f324d93bb75d5ac03f9f9c869f2.camel@linuxfoundation.org>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Mon, 23 Nov 2020 12:17:03 -0800
Message-ID: <CADfgfoabPkBrKCBVO10_ACVfieExuC0-KQwyqG9pZHDUvWu5UQ@mail.gmail.com>
Subject: Re: [docs] Tags in the yocto-docs repository
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Barker <pbarker@konsulko.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, 
	"Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>
Content-Type: multipart/alternative; boundary="0000000000004e716e05b4cbe1db"

--0000000000004e716e05b4cbe1db
Content-Type: text/plain; charset="UTF-8"

The most recent tag was 3.0.1 last year. I will add a tag for
yocto-3.2/gatesgarth-24.0.0. Shall I add tags for the releases in between
as well? I can determine the best commits to tag based on the date in the
git log.

On Mon, Nov 23, 2020 at 11:32 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-11-23 at 19:30 +0000, Paul Barker wrote:
> > Hey folks,
> >
> > I've just noticed as I have the web interface open for the yocto-docs
> > repository (https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/)
> > that no tags have been created in this repo for recent releases. Is
> > there any intentional reason for this or has it just fallen by the
> > wayside in favor of other concerns? Is it something we should
> > address?
>
> Not intentional, we should have them.
>
> I've added Vineela and Michael since they usually take care of this.
>
> Cheers,
>
> Richard
>
>

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--0000000000004e716e05b4cbe1db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The most recent tag was 3.0.1 last year. I will add a tag =
for yocto-3.2/gatesgarth-24.0.0. Shall I add tags for the releases in betwe=
en as well? I can determine the best commits to tag based on the date in th=
e git log.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Mon, Nov 23, 2020 at 11:32 AM Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Mon, 2020-11-23 at 19:30 +0000, Paul Barker wrote:<br>
&gt; Hey folks,<br>
&gt; <br>
&gt; I&#39;ve just noticed as I have the web interface open for the yocto-d=
ocs<br>
&gt; repository (<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/yoct=
o-docs/" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/=
cgit/cgit.cgi/yocto-docs/</a>)<br>
&gt; that no tags have been created in this repo for recent releases. Is<br=
>
&gt; there any intentional reason for this or has it just fallen by the<br>
&gt; wayside in favor of other concerns? Is it something we should<br>
&gt; address?<br>
<br>
Not intentional, we should have them.<br>
<br>
I&#39;ve added Vineela and Michael since they usually take care of this.<br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--0000000000004e716e05b4cbe1db--
