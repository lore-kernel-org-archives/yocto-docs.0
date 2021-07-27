Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.2407.1627398061779076436
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 08:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EqpIz+tk;
 spf=pass (domain: linaro.org, ip: 209.85.208.52, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f52.google.com with SMTP id x14so10933450edr.12
        for <docs@lists.yoctoproject.org>; Tue, 27 Jul 2021 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IXg2wSCm3/bvX1scRBnFOlpnfBHe2vK7fI5RfPlB13Y=;
        b=EqpIz+tk/oO+bOwyCWH7fZFMA3gvyy0/JHmCsTC+e9BRCGx9sO89ufXoZkm953CkA6
         w/NeUlesZxjmVs4IXM0Q6+hd/Ij2MzHrn2BKcBwvrogfrjdCNu5OxpzGqrv0Zd3N2nku
         yQGhQnv7tTY6PB6TaK5FF5YiOAE8pULvRzOW03RO3LzGL55/sQ1Luv8TiwYrMR6lOm8G
         9DVvKvvs/MOIt2HzuECUhPVyaD9e3MI8UJbYdseCppFijwwgTy5NU+XHXWKcF3/wb1eL
         N4bjoslY3FwomMpbLScSo5RuZmsgW5wPClcSYgpmWNyg1YjEWifT71OihQS9UDjw+NKg
         z0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IXg2wSCm3/bvX1scRBnFOlpnfBHe2vK7fI5RfPlB13Y=;
        b=AvyDSLFTtM9hrFpjdlchLIwj1xA22+IE9mlBhwqmx+qfrrJyEvWafaptkVcjkZIvzp
         cMrQnxQA74CVWt2W3zW41B2DdBmx/mVFBdXG5Y+EEvXfc+whx8BoA4HuxYyFecAlwWT9
         bmrX2T5SHWtXKr3CctdNL/I5lx763yP0ZLvhp8VsKdL4b532RUkq5xDLu0gJ6P2OB9xZ
         A9dN+TShZN6P2fAeBzJY/sknCu9lpNtjp1AhIYFTJ2H1ikmcbrO++QqU8adn+b/iRv/Q
         piKPypJV6PzKfe9PjcOYN4wy1OdunqTZg7Yj/L7P/aeUdECesdGquyiBIfsJqcNuZIkO
         Vehw==
X-Gm-Message-State: AOAM530F5VBZ7l6s/wr6SfHBdg38h+fFQJhZJYTx7+fy9o3zZV5QhUcR
	mwNHKmq6JQP2iBWcv2mMMuHMtrH4Hje5MRZZY2JbBg==
X-Google-Smtp-Source: ABdhPJyE0nWW+U47V34mbHHsMrIHX67sTotf+xy4UC2lghcKUtAI/l25oqbmYxfcqoepp0mI8heYOCoRO5txTjtkALI=
X-Received: by 2002:aa7:c4c4:: with SMTP id p4mr28878561edr.367.1627398059697;
 Tue, 27 Jul 2021 08:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210727141200.128209-1-michael.opdenacker@bootlin.com>
 <20210727141459.otifwpfjjigvu2gq@fedora> <1d5772ec-2039-02da-b0bb-98f7d55fe95b@bootlin.com>
In-Reply-To: <1d5772ec-2039-02da-b0bb-98f7d55fe95b@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 27 Jul 2021 17:00:49 +0200
Message-ID: <CAP71Wjxi=w7a_yxu6Q4tnL7skw0UOmfNwiw4Ku6v0gzwWGM1oQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] documentation/README: improve BitBake manual referencing guidelines
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000041b8b405c81c2387"

--00000000000041b8b405c81c2387
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 27, 2021 at 4:29 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Quentin,
>
> On 7/27/21 4:14 PM, Quentin Schulz wrote:
> > Hi Michael,
> >
> > On Tue, Jul 27, 2021 at 04:11:59PM +0200, Michael Opdenacker wrote:
> >> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >> ---
> >>  documentation/README | 12 ++++++++----
> >>  1 file changed, 8 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/documentation/README b/documentation/README
> >> index f9e803a28b..1d4d213076 100644
> >> --- a/documentation/README
> >> +++ b/documentation/README
> >> @@ -328,11 +328,15 @@ The sphinx.ext.intersphinx extension is enabled
> by default
> >>  so that we can cross reference content from other Sphinx based
> >>  documentation projects, such as the BitBake manual.
> >>
> >> -References to the bitbake manual can be done like this:
> >> -
> >> -  See the ":ref:`-D
> <bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage and syntax>`"
> option
> >> -or
> >> +References to the BitBake manual can be done:
> >> + - With a specific description instead of the section name:
> >> +  :ref:`Azure Storage fetcher (az://)
> <bitbake:bitbake-user-manual/bitbake-user-manual-fetching:fetchers>`
> >> + - With the section name:
> >> +  ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-intro:usage
> and syntax` option
> >> + - With a BitBake variable name:
> >>    :term:`bitbake:BB_NUMBER_PARSE_THREADS`
> > I'd rather not specify bitbake: for terms so that they can be overriden
> > from within yocto-docs if need be, without needing to modify all the
> > refs spread over the whole git repo.
>
>
> Thanks for the feedback. However, I'm not sure what you mean here... Do
> you mean we should replace all instances of ":term:`bitbake:VARIABLE`"
> by ":term:`VARIABLE`"?
>

Yes. I think we already discussed that. I initially didn't like the idea,
but Quentin convinced me ;)


>
> If I understand well, if VARIABLE is only defined in the BitBake manual,
> we will directly get a reference in that manual.
>

When using :term:`FOO`, if FOO is defined in bitbake only, then the link
will be to the bitbake manual. If defined in both bitbake and yp-docs, then
it will link to yp-docs instead. Which is most likely what we always want
to do , if we ever need to override a term in yp-docs.


> Cheers,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> 
>
>

--00000000000041b8b405c81c2387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 27, 2021 at 4:29 PM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Quentin,<br>
<br>
On 7/27/21 4:14 PM, Quentin Schulz wrote:<br>
&gt; Hi Michael,<br>
&gt;<br>
&gt; On Tue, Jul 27, 2021 at 04:11:59PM +0200, Michael Opdenacker wrote:<b=
r>
&gt;&gt; Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.o=
pdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>=
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 documentation/README | 12 ++++++++----<br>
&gt;&gt;=C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/documentation/README b/documentation/README<br>
&gt;&gt; index f9e803a28b..1d4d213076 100644<br>
&gt;&gt; --- a/documentation/README<br>
&gt;&gt; +++ b/documentation/README<br>
&gt;&gt; @@ -328,11 +328,15 @@ The sphinx.ext.intersphinx extension is ena=
bled by default<br>
&gt;&gt;=C2=A0 so that we can cross reference content from other Sphinx ba=
sed<br>
&gt;&gt;=C2=A0 documentation projects, such as the BitBake manual.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -References to the bitbake manual can be done like this:<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 See the &quot;:ref:`-D &lt;bitbake:bitbake-user-manual/bi=
tbake-user-manual-intro:usage and syntax&gt;`&quot; option<br>
&gt;&gt; -or<br>
&gt;&gt; +References to the BitBake manual can be done:<br>
&gt;&gt; + - With a specific description instead of the section name:<br>
&gt;&gt; +=C2=A0 :ref:`Azure Storage fetcher (az://) &lt;bitbake:bitbake-u=
ser-manual/bitbake-user-manual-fetching:fetchers&gt;`<br>
&gt;&gt; + - With the section name:<br>
&gt;&gt; +=C2=A0 &quot;:ref:`bitbake:bitbake-user-manual/bitbake-user-manu=
al-intro:usage and syntax` option<br>
&gt;&gt; + - With a BitBake variable name:<br>
&gt;&gt;=C2=A0 =C2=A0 :term:`bitbake:BB_NUMBER_PARSE_THREADS`<br>
&gt; I&#39;d rather not specify bitbake: for terms so that they can be ove=
rriden<br>
&gt; from within yocto-docs if need be, without needing to modify all the<=
br>
&gt; refs spread over the whole git repo.<br>
<br>
<br>
Thanks for the feedback. However, I&#39;m not sure what you mean here... D=
o<br>
you mean we should replace all instances of &quot;:term:`bitbake:VARIABLE`=
&quot;<br>
by &quot;:term:`VARIABLE`&quot;?<br></blockquote><div><br></div><div>Yes. =
I think we already discussed that. I initially didn&#39;t like the idea, bu=
t Quentin convinced me ;)</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
If I understand well, if VARIABLE is only defined in the BitBake manual,<b=
r>
we will directly get a reference in that manual.<br></blockquote><div><br>=
</div><div>When using :term:`FOO`, if FOO is defined in bitbake only, then =
the link will be to the bitbake manual. If defined in both bitbake and yp-d=
ocs, then it will link to yp-docs instead. Which is most likely what we alw=
ays want to do , if we ever need to override a term in yp-docs.=C2=A0<br></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000041b8b405c81c2387--
