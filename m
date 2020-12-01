Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web08.377.1606848304036186685
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Dec 2020 10:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qux9BTjw;
 spf=pass (domain: linaro.org, ip: 209.85.219.178, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f178.google.com with SMTP id v92so2805652ybi.4
        for <docs@lists.yoctoproject.org>; Tue, 01 Dec 2020 10:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aW4PGdy4zoMiu99wF1SSIC4gWZerUH3A/CTo1gHbc8=;
        b=qux9BTjwUVS01hVjndpJiJ5xbbEe+rnKU80CmC19mA+siQzUHw+BcJV/dqZ8LHQnXq
         LSCo7hbwC2a30JF1rqqbVQq1dBhmiQumhCvgRaIxvj6xz7aSmHwF6eYU22hMmnPziAtz
         jVdtwta4rvPJ5RJ6+mWQP5twP3/mFBeEFHP3yXfk3enIC2efdqvn1IcpyvqQIyaaFCKW
         k3VuMBa0KSpBHroJLxz0fgAUoaBvpMYVh3OCCciw91F0G+4n0fvd9kaTbcuAdjT61Y7H
         jYfeenwVQaGiKSCDzTyX1Pa2gRBfcvGZP3J3sIw0v0+GYYjUH6A6ugsDlle/VZDeWyvl
         2hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aW4PGdy4zoMiu99wF1SSIC4gWZerUH3A/CTo1gHbc8=;
        b=am+P4oMqTq396DvkNhOto3a8vYklwFFSlNXJh3y05NEIKtzokOt7Sl51FrCbXIgpCH
         n5JFBGxvfuNu3ZpT72HCy6tLwJ7KdNbQ/ZBIuDxKeKF/KEcBF8wBGAx699Gg9pvlgJCl
         SQE/duAAXkysggafna1wHqcJFAc5XrJrs+h1Eur4kdXZkUOg6yEF9hQIM+I5ZwqCWHdc
         x/+AQzTUZSj6tzQFu7M6Izizb4Re0mNSYrrnoHeNT3kQb3yihrMBrTQY8xOo0z6gXhHi
         WC21YwTY5dEr+n+RBwqncz7QRtN28w5+Io0WtU8W8jpoQXcebZAEx24ikyyqCl8rdXMu
         4w8Q==
X-Gm-Message-State: AOAM532aSG8yqjguTrLY3HnUnbEendHXg+dVtnrK9H6EMtnG/FJDdw9H
	jMOrJOD0lg16+Sl9XnJlPCXKB/BqSPBmv6/QRgLFYA==
X-Google-Smtp-Source: ABdhPJzKdXmsu3Tp1aB/YTyzwU3y3BbQ3q9NI5cc3UvQxpuc0VaICvPlwBcTdwJRYaE2mQ7mIspfjRJ+JTGq1oQ4KkQ=
X-Received: by 2002:a25:bbc5:: with SMTP id c5mr6594539ybk.373.1606848303129;
 Tue, 01 Dec 2020 10:45:03 -0800 (PST)
MIME-Version: 1.0
References: <CAP71WjwQ=X6OEifmdC-9M_UN=1HTG=ua1_TdGJWCNGY=FtTU2Q@mail.gmail.com>
 <5a3d1442-d910-7cd1-d2b8-eb62df872a95@gmail.com>
In-Reply-To: <5a3d1442-d910-7cd1-d2b8-eb62df872a95@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 1 Dec 2020 19:44:52 +0100
Message-ID: <CAP71Wjz1orNsfua9TWMos71WR2GoHKCLemBCkNwJXFL3Tzv4cQ@mail.gmail.com>
Subject: Re: [docs] Yocto Project Technical Documentation Request For Quote
To: akuster808 <akuster808@gmail.com>
Cc: yocto@lists.yoctoproject.org, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000051006705b56b863f"

--00000000000051006705b56b863f
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 7:32 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 11/30/20 11:42 PM, Nicolas Dechesne wrote:
> > hi there,
> >
> > The Yocto Project is looking to hire a technical writer to develop and
> > maintain the many documents the project supplies the greater
> > community, including the official Yocto Project documentation website
> [1].
> >
> > We expect to build a long term relationship with this technical
> > documentation person, and estimate that the workload for this role
> > should be no more than 50%, spread evenly throughout the year.
>
> Should this be posted on the YP Jobs page?
>

Good idea. I've done it now!


> -armin
> >
> > For more information, please check [2].
> >
> > cheers
> > nico
> >
> > [1] https://docs.yoctoproject.org/
> > [2]
> https://www.yoctoproject.org/yocto-project-technical-documentation-request-for-quote/
> >
> > 
> >
>
>

--00000000000051006705b56b863f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 1, 2020 at 7:32 PM akuste=
r808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/30/20 11:42 PM, Nicolas Dechesne wrote:<br>
&gt; hi there,<br>
&gt;<br>
&gt; The=C2=A0Yocto Project is=C2=A0looking to hire a technical writer to =
develop and<br>
&gt; maintain the many documents the project supplies the greater<br>
&gt; community, including the official Yocto Project documentation website=
 [1].<br>
&gt;<br>
&gt; We expect to build a long term relationship with this technical<br>
&gt; documentation person, and estimate that the workload for this role<br=
>
&gt; should be no more than 50%, spread evenly throughout the year.<br>
<br>
Should this be posted on the YP Jobs page?<br></blockquote><div><br></div>=
<div>Good idea. I&#39;ve done it now!</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
-armin<br>
&gt;<br>
&gt; For more information, please check [2].<br>
&gt;<br>
&gt; cheers<br>
&gt; nico<br>
&gt;<br>
&gt; [1]=C2=A0<a href=3D"https://docs.yoctoproject.org/" rel=3D"noreferrer=
" target=3D"_blank">https://docs.yoctoproject.org/</a><br>
&gt; [2]=C2=A0<a href=3D"https://www.yoctoproject.org/yocto-project-techni=
cal-documentation-request-for-quote/" rel=3D"noreferrer" target=3D"_blank">=
https://www.yoctoproject.org/yocto-project-technical-documentation-request-=
for-quote/</a><br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000051006705b56b863f--
