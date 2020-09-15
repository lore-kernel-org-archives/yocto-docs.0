Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.9354.1600208746408242634
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Sep 2020 15:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jaswnDc8;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id y9so4603177ilq.2
        for <docs@lists.yoctoproject.org>; Tue, 15 Sep 2020 15:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2IYMD3zW9pshVo/EV6Dk+zTh/qn6VVci5DF9g3DLxpA=;
        b=jaswnDc8AENe8i6hdxVfbvRFJWPsXpbbtxijMkzlfEc8gj1+Jdz+ftQJxfWDhpNGRw
         pZ3MBPD57fnx1SwghXaVQrw0c1j1SAuHMjj7VN5e0I1Voc4BFx1703oPwSy0PG6a7D6E
         poS7Djfm0xzvqJQpNwAaVFhvwwhfd4O7+T3A9tNYKFBweK+WtysKlA6TTu/dwMES+1J+
         jYa8vJy9l4ZtU3hJobQicSLs0KaUXsK4iSRdEKxGR7t84aPzZFkEsR0kIywGvJIQuuW/
         4wheYch5WXtftSuNVBzm/7tKE3oMc6iVqAwtYSIkv5EAmyiY7k8TxEPLzwt3g5jy3PUN
         CMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2IYMD3zW9pshVo/EV6Dk+zTh/qn6VVci5DF9g3DLxpA=;
        b=YC1pQ0RW+Sw4/i81SF/fkKctCydLkXrMUaNEHGu3pqKAQwWnnOJI4HoX73oZoo9D0o
         SPC9BBOPf97TOYKgrRSfxpDDn0wFD+zbPmlfs6TR5VLot2APrNofhZGlw7DAeqOR2UvG
         J6vvTo6R8M20DNXjZwtNbdoWmew6na82QkGTjXrOyPqqQz4mXcBms7kgEaAdl+gl6zvq
         R8e2Wi6a2+4fVmA5Q3HibhegZYEGpRv/q9bOfzg7GFiCkK8QOmKBen1zxp9yjMelcKYF
         HwBd6a8EgZg4lO5xAspRbetxeXrvKZY0tuVlJkJBcp0c5zqSrSMmlEFh3xEB2ZB7fRVh
         KNYw==
X-Gm-Message-State: AOAM533dysgDNrt+XXuvhgPqmToP991Cq35RR+11U0I+Ug8kpZAXnFOa
	yqxUTmvYeCcVjkLOWnkz6RyT87J3OWqeo18ZpxQ=
X-Google-Smtp-Source: ABdhPJwdG3lSkDZi2ib5qLTtARtmcw4t9B9ZSPCJAiKy+wuG4Ed8l4f84PxADr19zQqbbPH/Qjw8W0GPItLcHrirB5Y=
X-Received: by 2002:a92:4805:: with SMTP id v5mr12563022ila.170.1600208745589;
 Tue, 15 Sep 2020 15:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
 <16346239585A567B.3515@lists.yoctoproject.org> <16349A56620CF0CB.7642@lists.yoctoproject.org>
 <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org>
 <CAP71WjzF-Cq9KN1L2p-UPwMtO9yMrxTR5q+7nJSBHeYhxKFY_w@mail.gmail.com>
 <CANx9H-D1W=S8Jz=b6_d+D3frcqpZQkhmSHW=ZCjZ4tUMGWWpyQ@mail.gmail.com>
 <CAP71WjxQNormFOzCsd5h3MopO4hTdn5ENgU_Wmt+UdwPJ0jQog@mail.gmail.com> <58afa847b98484557df7bbddb47e9bcde1d9264e.camel@linuxfoundation.org>
In-Reply-To: <58afa847b98484557df7bbddb47e9bcde1d9264e.camel@linuxfoundation.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 15 Sep 2020 15:25:34 -0700
Message-ID: <CANx9H-CDtnup=T3aw0WT4t6N_JxtCvaPxV_F3UH11msAWHnq3Q@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d8f0bd05af61a150"

--000000000000d8f0bd05af61a150
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 3:17 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2020-09-15 at 18:48 +0200, Nicolas Dechesne wrote:
>
> > I've finished profile-manual today. And excluded adt-manual from
>
> > Sphinx (deprecated doc). At this point, we have:
>
> > Richard on kernel-dev
>
>
>
> This is now done.
>
>
>
> I've also gone back over the reference manual and fixed a ton of issues
>
> I missed the first time as I had a better process for it.
>
>
>
> > Mark on test-manual
>
> > Armin on overview-manual
>
> > Tim on toaster-manual
>
> >
>
> > Which means everything is now covered! Please send patches on the
>
> > list for review, and if you have any trouble with Sphinx , let me
>
> > know!
>
>
>
> I've split the migration guide into separate files which should avoid
>
> warnings. I've also tweaked the css handling of "em" handling thanks to
>
> tips from Nico, to better match the existing style.
>
>
>
> One problem I've noticed is that example blocks don't need "\" escaping
>
> and so we have a ton of "\\" loose in them we now need to fix.
>

I noticed this during my toaster-manual edits.


>
>
> Its looking ever better though, quite excited to see it coming
>
> together.
>
>
>
> Cheers,
>
>
>
> Richard
>
>
>
>

--000000000000d8f0bd05af61a150
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 15, 2020 at 3:17 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2020-=
09-15 at 18:48 +0200, Nicolas Dechesne wrote:<br><br>&gt; I&#39;ve finished=
 profile-manual today. And excluded adt-manual from<br><br>&gt; Sphinx (dep=
recated doc). At this point, we have:<br><br>&gt; Richard on kernel-dev<br>=
<br><br><br>This is now done.<br><br><br><br>I&#39;ve also gone back over t=
he reference manual and fixed a ton of issues<br><br>I missed the first tim=
e as I had a better process for it.<br><br><br><br>&gt; Mark on test-manual=
<br><br>&gt; Armin on overview-manual<br><br>&gt; Tim on toaster-manual<br>=
<br>&gt; <br><br>&gt; Which means everything is now covered! Please send pa=
tches on the<br><br>&gt; list for review, and if you have any trouble with =
Sphinx , let me<br><br>&gt; know!<br><br><br><br>I&#39;ve split the migrati=
on guide into separate files which should avoid<br><br>warnings. I&#39;ve a=
lso tweaked the css handling of &quot;em&quot; handling thanks to<br><br>ti=
ps from Nico, to better match the existing style.<br><br><br><br>One proble=
m I&#39;ve noticed is that example blocks don&#39;t need &quot;\&quot; esca=
ping<br><br>and so we have a ton of &quot;\\&quot; loose in them we now nee=
d to fix.<br></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I n=
oticed this during my toaster-manual edits.</div><div dir=3D"auto"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br><br><br>Its looking ever better though=
, quite excited to see it coming<br><br>together.<br><br><br><br>Cheers,<br=
><br><br><br>Richard<br><br><br><br></blockquote></div></div>

--000000000000d8f0bd05af61a150--
