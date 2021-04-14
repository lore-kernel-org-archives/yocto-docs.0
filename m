Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.9997.1618388484109350472
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 01:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=uCYs3LJe;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id e14so30037639ejz.11
        for <docs@lists.yoctoproject.org>; Wed, 14 Apr 2021 01:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3p/DEldggfk0PSGvgsHVobabJ0OYb9D67FgIEJCvi4=;
        b=uCYs3LJegTS5/vabWDJP/F0+x1L17oR4BGrn6WLliF/bbFIB5FLSBPsZe3s7m5hp95
         NxlvZQ2RSyVDX+4OqxQ1GX6wGjk7l3+9kL8eEmB50qOP9fM0Pc+jLIVUPDaD7FqCZJOG
         hDdPLfCzKrz9vtjUdDlYtZHVWceAGvXGJR3dRFdJaXtU8nQqbXP7OUoy+Bn9RiIQXCzR
         qs9htMkWRdfmIaIDeEM08AkRZs12Nu4KsaI6itDm44Mw404x+sFfZC3OoRZXqULdzRKj
         fl2ECorI++XHuplAQUiD5BDFBySe1Gto5y4CR7xPt3YmxCIzL/cTpajM2ssiEFz+a//V
         3/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3p/DEldggfk0PSGvgsHVobabJ0OYb9D67FgIEJCvi4=;
        b=per3NgPwEoJyfyhO/X+bi03UH7el45VijZIFa3Dtf+G15Q+0GYOmhNzhTotIPkQY5h
         JRyeTMP81Cjr88LK4zKh8dnVeSkRAoBQXI/JzVgOHZ5vgl/udBMELbRhUQd+sgtySpX5
         6Va3egUfh6/DlJXREb5Yemsd5x3byfiaFZJElMPUQQ0ELzAODmBYtbR0hA5hIogs8mmz
         oa1lscsrZv7CO5tjNtrH+Iwe+la3UNR6Ux4BFKqhqEelzeuOeRIoIer6EpnodnSYqXKL
         p7WfnWAavU0pjjxfVP5KdH+viIhwcavnGChBX1XQUFAvT6+iB8pV9U9lxopKFkNlPrrK
         Akeg==
X-Gm-Message-State: AOAM531f2W/9PQDmnuYXicIeKfNy8B72L4qYlZHp/Ufg5HhKKhol6co3
	oJM6RcgwulcUt2Ivsy3axBxANxk5dj/i2FwKslcZPg==
X-Google-Smtp-Source: ABdhPJzVLsSNacwJQkZKHO8uTVBKK6XFMuroBlB/abqfV4Mf7tMsprflbxjBEjjDbbRIsAbPOz9pquS3FQZPia6dvSA=
X-Received: by 2002:a17:906:5906:: with SMTP id h6mr37537437ejq.288.1618388482481;
 Wed, 14 Apr 2021 01:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618358456.git.paul.eggleton@linux.microsoft.com>
 <be9ee46d744c7b2b559819c61cb68ae47898b7c0.1618358456.git.paul.eggleton@linux.microsoft.com>
 <20210414081756.ydogingjrtmmsv6x@qschulz>
In-Reply-To: <20210414081756.ydogingjrtmmsv6x@qschulz>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 14 Apr 2021 10:21:11 +0200
Message-ID: <CAP71WjwUsfFTX6TFOXtbwfrRU6C4ehCs3uAc6EodtpTC2nHurg@mail.gmail.com>
Subject: Re: [docs] [PATCH 10/13] ref-manual: fix reference to build-essential
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Paul Eggleton <paul.eggleton@linux.microsoft.com>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000009b71f805bfea6e50"

--0000000000009b71f805bfea6e50
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 10:18 AM Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> Hi Paul,
>
> On Tue, Apr 13, 2021 at 05:19:51PM -0700, Paul Eggleton wrote:
> > From: Paul Eggleton <paul.eggleton@microsoft.com>
> >
> > This has been here since the text was added to the DocBook version.
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > ---
> >  documentation/ref-manual/system-requirements.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/ref-manual/system-requirements.rst
> b/documentation/ref-manual/system-requirements.rst
> > index dc619ce..2e2d0d3 100644
> > --- a/documentation/ref-manual/system-requirements.rst
> > +++ b/documentation/ref-manual/system-requirements.rst
> > @@ -274,7 +274,8 @@ version requirement for gcc:
> >
> >  If your host development system does not meet this requirement, you can
> >  resolve this by installing a ``buildtools-extended`` tarball that
> > -contains additional tools, the equivalent of ``buildtools-essential``.
> > +contains additional tools, the equivalent of the Debian/Ubuntu
> ``build-essential``
> > +package.
> >
> >  Installing a Pre-Built ``buildtools`` Tarball with
> ``install-buildtools`` script
> >
> --------------------------------------------------------------------------------
> > --
> > 1.8.3.1
> >
>
> Thanks for the patch. Please send a backport patch once merged for still
> maintained Sphinx-using releases of the docs. (dunfell and gatesgarth I
> guess?).
>

Yes, I had this thought when I glanced at the patches too. I am not sure
how/if the LTS/stable process applies to yocto-docs. Are the LTS and stable
maintainers doing an active backports, or we do have to send all relevant
patches to them?


>
> Cheers,
> Quentin
>
> 
>
>

--0000000000009b71f805bfea6e50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 14, 2021 at 10:18 AM Quen=
tin Schulz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quenti=
n.schulz@streamunlimited.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Paul,<br>
<br>
On Tue, Apr 13, 2021 at 05:19:51PM -0700, Paul Eggleton wrote:<br>
&gt; From: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@microsoft.com=
" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; <br>
&gt; This has been here since the text was added to the DocBook version.<b=
r>
&gt; <br>
&gt; Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@micr=
osoft.com" target=3D"_blank">paul.eggleton@microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/system-requirements.rst | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/system-requirements.rst b/docum=
entation/ref-manual/system-requirements.rst<br>
&gt; index dc619ce..2e2d0d3 100644<br>
&gt; --- a/documentation/ref-manual/system-requirements.rst<br>
&gt; +++ b/documentation/ref-manual/system-requirements.rst<br>
&gt; @@ -274,7 +274,8 @@ version requirement for gcc:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 If your host development system does not meet this requirement,=
 you can<br>
&gt;=C2=A0 resolve this by installing a ``buildtools-extended`` tarball th=
at<br>
&gt; -contains additional tools, the equivalent of ``buildtools-essential`=
`.<br>
&gt; +contains additional tools, the equivalent of the Debian/Ubuntu ``bui=
ld-essential``<br>
&gt; +package.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Installing a Pre-Built ``buildtools`` Tarball with ``install-bu=
ildtools`` script<br>
&gt;=C2=A0 ---------------------------------------------------------------=
-----------------<br>
&gt; -- <br>
&gt; 1.8.3.1<br>
&gt; <br>
<br>
Thanks for the patch. Please send a backport patch once merged for still<b=
r>
maintained Sphinx-using releases of the docs. (dunfell and gatesgarth I<br=
>
guess?).<br></blockquote><div><br></div><div>Yes, I had this thought when =
I glanced at the patches too. I am not sure how/if the LTS/stable process a=
pplies to yocto-docs. Are the LTS and stable maintainers doing an active ba=
ckports, or we do have to send all relevant patches to them?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000009b71f805bfea6e50--
