Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.72388.1600121131004422926
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 15:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GtjpFfKK;
 spf=pass (domain: linaro.org, ip: 209.85.219.174, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f174.google.com with SMTP id a2so1004859ybj.2
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2020 15:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yuPd6+eItnDjwTxFdL1hMikQZmzOWRyU+zotMr+70Dk=;
        b=GtjpFfKK9ej6UK+s6jsgmM/GeKRlt1oP2i94nUal37aCMChRu71ribEhRyS5Omj4h3
         fRg/p8vl7mwlTyy/JnZYZmiJf3zVa14Qz0tFw5JfUO3BmMFEWNk2IxitIkOezkBW3X82
         nicg/CCl3jUq0Rv3BFcFJ/aJ3RN3QkwNNJVUQXUcw6i6xG1UN4jlEgs1SgxHTG1gXOQn
         rpC3qi/FLrh/fB+fGtXrSBNUMN53pUhThAhO+sjC62tvT1CXxCpcRc2sEYIkbzSXAoOd
         S9X2ldoeNbjlAJlfPGDDyO9Kcd/OGkvWCmRRn3IaawPZAvtJ3w4rxKOcAnHeATk0xY8J
         eoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yuPd6+eItnDjwTxFdL1hMikQZmzOWRyU+zotMr+70Dk=;
        b=X1gSi3QPtl1yEWtOucZQW2CSpGu5H0NmKD7/eH6yPeQ/njYbBF9fENPjvsjrjQnXnK
         nAxvvpxF59VtfPqXFz42NASqEZzdgRGLAEk+BvtjsiDTRXee/x2T6YHO5fvJ01Npu3+x
         T5MXK4XznxgrsK2GMb7jQpBV8dooLxgf1YDLQECQ1BKAnG22z3coj1pR10pq5v0rN3CZ
         1fnT68mnor7f5BNnTGehJRxVIh3+M7oEyL0JRrPp9AvgBadap07iA8gXC6YQWaEQJsUs
         M5UmsnwTe/HQue8mXTgE2ggSu/Vk0yFgk6K4VUKNAm+U7daigtDrnWY3G3y5sP5fDXv2
         qXmw==
X-Gm-Message-State: AOAM530zWJLOpuHA+efNPeu16H/M8GeQ3jDl0Kp2UtFVQalsCRBZE6tD
	DLODxW5CaRpOTyVqVg8r+bmxKvieV1WLx8Lz9TK6rg==
X-Google-Smtp-Source: ABdhPJwsv0yGEcnEhYahsaTZbWbzO8Ha+N4q5nfjlCgRSDR14cHhIYrpFtuGQkuGfn00CgIAqutuMVGSVUDNUWyALlA=
X-Received: by 2002:a05:6902:4cf:: with SMTP id v15mr23489499ybs.373.1600121129918;
 Mon, 14 Sep 2020 15:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjyPj_FZP6+c3k4WMUZ7UZYzG_NGoVq=1y1R1VApHxot6A@mail.gmail.com>
 <16346239585A567B.3515@lists.yoctoproject.org> <16349A56620CF0CB.7642@lists.yoctoproject.org>
 <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org>
In-Reply-To: <16242b3cafddcea9747bbc02bc54fc8e7426bd31.camel@linuxfoundation.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 15 Sep 2020 00:05:19 +0200
Message-ID: <CAP71WjzF-Cq9KN1L2p-UPwMtO9yMrxTR5q+7nJSBHeYhxKFY_w@mail.gmail.com>
Subject: Re: [docs] [sphinx] updates as of Sep 10th.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000008bfd8505af4d3bee"

--0000000000008bfd8505af4d3bee
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 5:26 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2020-09-14 at 09:50 +0100, Richard Purdie via
> lists.yoctoproject.org wrote:
> > On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via
> > lists.yoctoproject.org wrote:
> > > On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:
> > > > If anybody has any cycle now, we need to finish #4. The current
> > > > status is that:
> > > > * brief-yoctoprojectqs/* is done.
> > > > * bitbake user manual is half done, and I am doing it
> > > > * bsp-guide/*: i started it, and will finish
> > > > * ref-manual/*: RP is on it.
> > >
> > > This is done, at least as a first pass with hopefully the bulk of
> > > issues fixed.
> > >
> > > > * there are plenty of warnings when we build, i would like to get
> > > > rid
> > > > of them all!
> > > >
> > > > Anything else is work that remains to be done. Before starting
> > > > anything, please send a quick email here to let everyone know, to
> > > > avoid duplication. If you have any improvement, please share your
> > > > patches, I will take them into the sphinx/master branch. And I
> > > > will
> > > > continue to work on the remaining files that no one would pick.
> > >
> > > I'll take dev-manual/* next.
> >
> > dev-manual is on the branch, I'll look at sdk-manual next.
>
> sdk-manual is on the branch, kernel-dev is my next target.
>

I am now done with bsp-guide and bitbake.  Based on Richard's last comment,
the remaining docs to process are:
overview-manual
profile-manual
test-manual
toaster-manual

They are rather 'small' books. I believe Armin is looking at
overview-manual and Mark at test-manual. I will take profile-manual next.

I've also updated https://docs.yoctoproject.org/ with all the latest
changes combined. If you can use the new website and report any issues,
please let us know.


> Cheers,
>
> Richard
>
>

--0000000000008bfd8505af4d3bee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 14, 2020 at 5:26 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Mon, 2020-09-14 at 09:50 +0100, Richard Purdi=
e via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> wrote:<br>
&gt; On Sun, 2020-09-13 at 16:42 +0100, Richard Purdie via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; &gt; On Fri, 2020-09-11 at 00:03 +0200, Nicolas Dechesne wrote:<br>
&gt; &gt; &gt; If anybody has any cycle now, we need to finish #4. The curr=
ent<br>
&gt; &gt; &gt; status is that:<br>
&gt; &gt; &gt; * brief-yoctoprojectqs/* is done.<br>
&gt; &gt; &gt; * bitbake user manual is half done, and I am doing it<br>
&gt; &gt; &gt; * bsp-guide/*: i started it, and will finish<br>
&gt; &gt; &gt; * ref-manual/*: RP is on it.<br>
&gt; &gt; <br>
&gt; &gt; This is done, at least as a first pass with hopefully the bulk of=
<br>
&gt; &gt; issues fixed.<br>
&gt; &gt; <br>
&gt; &gt; &gt; * there are plenty of warnings when we build, i would like t=
o get<br>
&gt; &gt; &gt; rid<br>
&gt; &gt; &gt; of them all!<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Anything else is work that remains to be done. Before starti=
ng<br>
&gt; &gt; &gt; anything, please send a quick email here to let everyone kno=
w, to<br>
&gt; &gt; &gt; avoid duplication. If you have any improvement, please share=
 your<br>
&gt; &gt; &gt; patches, I will take them into the sphinx/master branch. And=
 I<br>
&gt; &gt; &gt; will<br>
&gt; &gt; &gt; continue to work on the remaining files that no one would pi=
ck.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ll take dev-manual/* next.<br>
&gt; <br>
&gt; dev-manual is on the branch, I&#39;ll look at sdk-manual next.<br>
<br>
sdk-manual is on the branch, kernel-dev is my next target.<br></blockquote>=
<div><br></div><div>I am now done with bsp-guide and bitbake.=C2=A0 Based o=
n Richard&#39;s last comment, the remaining docs to process are:</div><div>=
overview-manual</div><div>profile-manual</div><div>test-manual</div><div>to=
aster-manual</div><div><br></div><div>They are rather &#39;small&#39; books=
. I believe Armin is looking at overview-manual and Mark at test-manual. I =
will take profile-manual next.=C2=A0</div><div><br></div><div>I&#39;ve also=
 updated=C2=A0<a href=3D"https://docs.yoctoproject.org/">https://docs.yocto=
project.org/</a> with all the latest changes combined. If you can use the n=
ew website and report any issues, please let us know.</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000008bfd8505af4d3bee--
