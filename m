Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.13.1600184689739448972
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 08:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IH0RWPMf;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id d190so4600186iof.3
        for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2020 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LB+Nmakldk8aFwODV39l6XIEPrALTK81FtE0SZeH8jg=;
        b=IH0RWPMf9FyhkkUkMGH9UoXrTYp/O5ZPEn5ETMb1xzwq/O5YRnrzauLlekYhqv7DJu
         GYFnaSTw0frWoi6NFCbqdKxQXJsN4+wZwzU+uhDLlBt+ovh4TUYGa7vfjN8bPZfDwmO6
         ZKh2RsXAo7eTOHKAoWQxxg8ZoSsiCeurAXzKsN5L+t0ITBWF/0PIKANGh8Zia6mias00
         vbs7pcx3auGgoG+9fjjhsrt/tC0NDMsMqdx7aMRAoMzBCRvr4a2ca/aaD4eQuIyTGGLZ
         qvkkCxYRaPdRBIlUc7CYUVIhEvC+/9q3Zve5N2VBCl6p4L0WAaz7Rj+C6+uMqsBWqzfy
         n8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LB+Nmakldk8aFwODV39l6XIEPrALTK81FtE0SZeH8jg=;
        b=QKzCFxwL1sEG/IAqHdyGt3IlbeAfIX7bWNbCaVy39XdWFbfywjpI6hQQSEEIIWY9TA
         M2yuO5EHUEuIRo2+8Lu8LuavrdQ8E7PkQY4OgSnfT7Rl2kmGxL0XZE/Kk1g7c2j6YPPZ
         fpQzgbtZlW5tNpJ6DHChstNqlPE7dr0SaKt4Ia7RGC8vrcypqZHP59K1hvY7R5zTZBtA
         DUVKO8uj5HhhaQEMPtTCd7Cz659PwPenPtMSCVk1jJcYDvGUkbCJ7RLFHBFbjdfm2Bja
         weTYL3ySAu8rYZuS68ghDQGPlbcmTIUwA6CLYaFUgcJlwiuDK6AtI/bVE9V9tWnImEOk
         bNkQ==
X-Gm-Message-State: AOAM533ZVVi2X2tgOXiX2y0e2FYzsKhMXx0Qy8PIEdrKJ0FIncL+P+6i
	M2uT7cG99wxO9lV9FE3GSDd1Tf0NY6ufE59vNZE=
X-Google-Smtp-Source: ABdhPJzqPp37zFXVVp05uIBwg77wI4ZXt/PGx2l8ngxXgUzyNJxAdpy/3uOWZNB1Vxmf7o1iCJ1oekCj4g1NitTF7mk=
X-Received: by 2002:a05:6638:69d:: with SMTP id i29mr18349324jab.138.1600184688870;
 Tue, 15 Sep 2020 08:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
 <16346239585A567B.3515@lists.yoctoproject.org> <16349A56620CF0CB.7642@lists.yoctoproject.org>
 <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org> <CAP71WjzF-Cq9KN1L2p-UPwMtO9yMrxTR5q+7nJSBHeYhxKFY_w@mail.gmail.com>
In-Reply-To: <CAP71WjzF-Cq9KN1L2p-UPwMtO9yMrxTR5q+7nJSBHeYhxKFY_w@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 15 Sep 2020 08:44:37 -0700
Message-ID: <CANx9H-D1W=S8Jz=b6_d+D3frcqpZQkhmSHW=ZCjZ4tUMGWWpyQ@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f489a105af5c074f"

--000000000000f489a105af5c074f
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 3:05 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
> On Mon, Sep 14, 2020 at 5:26 PM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2020-09-14 at 09:50 +0100, Richard Purdie via
>> lists.yoctoproject.org wrote:
>> > On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via
>> > lists.yoctoproject.org wrote:
>> > > On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:
>> > > > If anybody has any cycle now, we need to finish #4. The current
>> > > > status is that:
>> > > > * brief-yoctoprojectqs/* is done.
>> > > > * bitbake user manual is half done, and I am doing it
>> > > > * bsp-guide/*: i started it, and will finish
>> > > > * ref-manual/*: RP is on it.
>> > >
>> > > This is done, at least as a first pass with hopefully the bulk of
>> > > issues fixed.
>> > >
>> > > > * there are plenty of warnings when we build, i would like to get
>> > > > rid
>> > > > of them all!
>> > > >
>> > > > Anything else is work that remains to be done. Before starting
>> > > > anything, please send a quick email here to let everyone know, to
>> > > > avoid duplication. If you have any improvement, please share your
>> > > > patches, I will take them into the sphinx/master branch. And I
>> > > > will
>> > > > continue to work on the remaining files that no one would pick.
>> > >
>> > > I'll take dev-manual/* next.
>> >
>> > dev-manual is on the branch, I'll look at sdk-manual next.
>>
>> sdk-manual is on the branch, kernel-dev is my next target.
>>
>
> I am now done with bsp-guide and bitbake.  Based on Richard's last
> comment, the remaining docs to process are:
> overview-manual
> profile-manual
> test-manual
> toaster-manual
>
> They are rather 'small' books. I believe Armin is looking at
> overview-manual and Mark at test-manual. I will take profile-manual next.
>

I'll take a crack at toaster-manual today.
--Tim

>
> I've also updated https://docs.yoctoproject.org/ with all the latest
> changes combined. If you can use the new website and report any issues,
> please let us know.
>
>
>> Cheers,
>>
>> Richard
>>
>> 
>

--000000000000f489a105af5c074f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 14, 2020 at 3:05 PM Nicol=
as Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dech=
esne@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 14, 202=
0 at 5:26 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2020=
-09-14 at 09:50 +0100, Richard Purdie via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.yoctoproject.org</a> wrote:<br>
&gt; On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=
=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; &gt; On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt; If anybody has any cycle now, we need to finish #4. The cur=
rent<br>
&gt; &gt; &gt; status is that:<br>
&gt; &gt; &gt; * brief-yoctoprojectqs/* is done.<br>
&gt; &gt; &gt; * bitbake user manual is half done, and I am doing it<br>
&gt; &gt; &gt; * bsp-guide/*: i started it, and will finish<br>
&gt; &gt; &gt; * ref-manual/*: RP is on it.<br>
&gt; &gt; <br>
&gt; &gt; This is done, at least as a first pass with hopefully the bulk o=
f<br>
&gt; &gt; issues fixed.<br>
&gt; &gt; <br>
&gt; &gt; &gt; * there are plenty of warnings when we build, i would like =
to get<br>
&gt; &gt; &gt; rid<br>
&gt; &gt; &gt; of them all!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Anything else is work that remains to be done. Before start=
ing<br>
&gt; &gt; &gt; anything, please send a quick email here to let everyone kn=
ow, to<br>
&gt; &gt; &gt; avoid duplication. If you have any improvement, please shar=
e your<br>
&gt; &gt; &gt; patches, I will take them into the sphinx/master branch. An=
d I<br>
&gt; &gt; &gt; will<br>
&gt; &gt; &gt; continue to work on the remaining files that no one would p=
ick.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ll take dev-manual/* next.<br>
&gt; <br>
&gt; dev-manual is on the branch, I&#39;ll look at sdk-manual next.<br>
<br>
sdk-manual is on the branch, kernel-dev is my next target.<br></blockquote=
><div><br></div><div>I am now done with bsp-guide and bitbake.=C2=A0 Based =
on Richard&#39;s last comment, the remaining docs to process are:</div><div=
>overview-manual</div><div>profile-manual</div><div>test-manual</div><div>t=
oaster-manual</div><div><br></div><div>They are rather &#39;small&#39; book=
s. I believe Armin is looking at overview-manual and Mark at test-manual. I=
 will take profile-manual next.=C2=A0</div></div></div></blockquote><div><b=
r></div><div>I&#39;ll take a crack at toaster-manual today.</div><div>--Tim=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_quote"><div><br></div><div>I&#39;ve also updated=C2=A0<a =
href=3D"https://docs.yoctoproject.org/" target=3D"_blank">https://docs.yoct=
oproject.org/</a> with all the latest changes combined. If you can use the =
new website and report any issues, please let us know.</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>
<br>
</blockquote></div></div>

--000000000000f489a105af5c074f--
