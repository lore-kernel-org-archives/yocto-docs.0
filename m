Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web10.1805.1606951250513691221
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Dec 2020 15:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Miz29bJQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.194, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-yb1-f194.google.com with SMTP id 10so263256ybx.9
        for <docs@lists.yoctoproject.org>; Wed, 02 Dec 2020 15:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQSlKzId+iO/B0xm7FzBH1R13kbjpSiF6/Aoy9MrtrE=;
        b=Miz29bJQQqPVdU6g6icihg7awUdRTi8oHNg0qMdjORnifc9j1d1cL6yBXcHc9cyw42
         EdXsOHKm3fV9YM3aAEQT0gsFO3Mv+aB7i3qT8apb9gB234BhU3Nsxx67AldaJQDYzcDP
         nKq/pbmnyiKmjbfJa7Yh93uNheiKF17atBdW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQSlKzId+iO/B0xm7FzBH1R13kbjpSiF6/Aoy9MrtrE=;
        b=RMMsWq4XU8o42rEtyM8LS/3Wz9v1Wz1LxQApgBGjRS5L/C8FVGpTo4dDjf31xcdnfP
         tMu3YvdpuAMOgqvFPUDDtBbZ3VviDyTafi2DztaAaO7fq3gvvh+q54rjGIUNv2FmWHT8
         pX8lxAWqtiRZWwFrlpRcINTcMxEuQZ9LByBXeF0X9T2C653CHpgEiUcMB72LIZ4mpw7I
         0Rcr+0F0JYlowXmOPINhlcSlag16CKgDWLLYRt01viS55D9R1cmBKOTQjbEYokgb5bYv
         oPw6IKTyKDsS3IA9fo4RgGtSTjq7ln/IMt4hcax54hycTSXRG+8ev+aTgFAEopZ+pa+7
         h72g==
X-Gm-Message-State: AOAM531uktBlkBCDc9PllBPmrzKxGGXRtq+hsSBNAiBDkcqlGHdQwkHs
	93LmJZkvrcACvP5N3viZy4ZVb6a/9koJITxCd2ZeMQ==
X-Google-Smtp-Source: ABdhPJxSINam8EqDP6PiazaaZzD6aopYPNlAEnFJ9LCz9KAWZExx4vNB+CxBq5zQ7m6l+mKM29K+UnN1ZkyAx5fixBM=
X-Received: by 2002:a25:ac1a:: with SMTP id w26mr709953ybi.395.1606951249738;
 Wed, 02 Dec 2020 15:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20201202220453.33336-1-mhalstead@linuxfoundation.org> <CAP71WjxVVNuAtBvYJLwgMSSkx6FYsq3+06txyGpa2h=jFPWjdw@mail.gmail.com>
In-Reply-To: <CAP71WjxVVNuAtBvYJLwgMSSkx6FYsq3+06txyGpa2h=jFPWjdw@mail.gmail.com>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Wed, 2 Dec 2020 15:20:39 -0800
Message-ID: <CADfgfoZWoi4N67eckSAp93=1DRKqWayjAJ2r-oVmdjD=H50r-w@mail.gmail.com>
Subject: Re: [PATCH] releases: conf: add link to 3.1.4, update to include 3.1.4
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <rpurdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000698cac05b5837e60"

--000000000000698cac05b5837e60
Content-Type: text/plain; charset="UTF-8"

I just updated the transition branch and re-ran the docs build. It looks
good to me now.

On Wed, Dec 2, 2020 at 2:38 PM Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> On Wed, Dec 2, 2020 at 11:07 PM Michael Halstead
> <mhalstead@linuxfoundation.org> wrote:
> >
> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > ---
> >  documentation/poky.yaml                  | 2 +-
> >  documentation/releases.rst               | 1 +
> >  documentation/sphinx-static/switchers.js | 2 +-
> >  3 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> > index 57da0a7c2..c1340c25e 100644
> > --- a/documentation/poky.yaml
> > +++ b/documentation/poky.yaml
> > @@ -4,7 +4,7 @@ DISTRO_NAME : "Gatesgarth"
> >  DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
> >  DISTRO_NAME_NO_CAP_LTS : "dunfell"
> >  YOCTO_DOC_VERSION : "3.2"
> > -YOCTO_DOC_VERSION_MINUS_ONE : "3.1.3"
> > +YOCTO_DOC_VERSION_MINUS_ONE : "3.1.4"
> >  DISTRO_REL_TAG : "yocto-3.2"
> >  POKYVERSION : "24.0.0"
> >  YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
> > diff --git a/documentation/releases.rst b/documentation/releases.rst
> > index 9992f97d5..85b31b64d 100644
> > --- a/documentation/releases.rst
> > +++ b/documentation/releases.rst
> > @@ -12,6 +12,7 @@
> >  - :yocto_docs:`3.1.1 Documentation </3.1.1>`
> >  - :yocto_docs:`3.1.2 Documentation </3.1.2>`
> >  - :yocto_docs:`3.1.3 Documentation </3.1.3>`
> > +- :yocto_docs:`3.1.4 Documentation </3.1.4>`
>
> The patch looks good, however, but http://docs.yoctoproject.org/3.1.4
> currently does not exist. When are you planning to deploy the docs for
> 3.1.4?
>
> >
> >  ==========================
> >   Previous Release Manuals
> > diff --git a/documentation/sphinx-static/switchers.js
> b/documentation/sphinx-static/switchers.js
> > index fe9841b10..fc901d329 100644
> > --- a/documentation/sphinx-static/switchers.js
> > +++ b/documentation/sphinx-static/switchers.js
> > @@ -4,7 +4,7 @@
> >    var all_versions = {
> >      'dev': 'dev (3.3)',
> >      '3.2': '3.2',
> > -    '3.1.3': '3.1.3',
> > +    '3.1.4': '3.1.4',
> >      '3.0.4': '3.0.4',
> >      '2.7.4': '2.7.4',
> >    };
> > --
> > 2.28.0
> >
>


-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000698cac05b5837e60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just updated the transition branch and re-ran the docs b=
uild. It looks good to me now.</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 2:38 PM Nicolas Deches=
ne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Dec 2, 2020 at 11:07 PM Michael Halstead<br>
&lt;<a href=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mhal=
stead@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxf=
oundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/poky.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 documentation/releases.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 documentation/sphinx-static/switchers.js | 2 +-<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/poky.yaml b/documentation/poky.yaml<br>
&gt; index 57da0a7c2..c1340c25e 100644<br>
&gt; --- a/documentation/poky.yaml<br>
&gt; +++ b/documentation/poky.yaml<br>
&gt; @@ -4,7 +4,7 @@ DISTRO_NAME : &quot;Gatesgarth&quot;<br>
&gt;=C2=A0 DISTRO_NAME_NO_CAP_MINUS_ONE : &quot;dunfell&quot;<br>
&gt;=C2=A0 DISTRO_NAME_NO_CAP_LTS : &quot;dunfell&quot;<br>
&gt;=C2=A0 YOCTO_DOC_VERSION : &quot;3.2&quot;<br>
&gt; -YOCTO_DOC_VERSION_MINUS_ONE : &quot;3.1.3&quot;<br>
&gt; +YOCTO_DOC_VERSION_MINUS_ONE : &quot;3.1.4&quot;<br>
&gt;=C2=A0 DISTRO_REL_TAG : &quot;yocto-3.2&quot;<br>
&gt;=C2=A0 POKYVERSION : &quot;24.0.0&quot;<br>
&gt;=C2=A0 YOCTO_POKY : &quot;poky-&amp;DISTRO_NAME_NO_CAP;-&amp;POKYVERSIO=
N;&quot;<br>
&gt; diff --git a/documentation/releases.rst b/documentation/releases.rst<b=
r>
&gt; index 9992f97d5..85b31b64d 100644<br>
&gt; --- a/documentation/releases.rst<br>
&gt; +++ b/documentation/releases.rst<br>
&gt; @@ -12,6 +12,7 @@<br>
&gt;=C2=A0 - :yocto_docs:`3.1.1 Documentation &lt;/3.1.1&gt;`<br>
&gt;=C2=A0 - :yocto_docs:`3.1.2 Documentation &lt;/3.1.2&gt;`<br>
&gt;=C2=A0 - :yocto_docs:`3.1.3 Documentation &lt;/3.1.3&gt;`<br>
&gt; +- :yocto_docs:`3.1.4 Documentation &lt;/3.1.4&gt;`<br>
<br>
The patch looks good, however, but <a href=3D"http://docs.yoctoproject.org/=
3.1.4" rel=3D"noreferrer" target=3D"_blank">http://docs.yoctoproject.org/3.=
1.4</a><br>
currently does not exist. When are you planning to deploy the docs for<br>
3.1.4?<br>
<br>
&gt;<br>
&gt;=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 =C2=A0Previous Release Manuals<br>
&gt; diff --git a/documentation/sphinx-static/switchers.js b/documentation/=
sphinx-static/switchers.js<br>
&gt; index fe9841b10..fc901d329 100644<br>
&gt; --- a/documentation/sphinx-static/switchers.js<br>
&gt; +++ b/documentation/sphinx-static/switchers.js<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 =C2=A0 var all_versions =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;dev&#39;: &#39;dev (3.3)&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;3.2&#39;: &#39;3.2&#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;3.1.3&#39;: &#39;3.1.3&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;3.1.4&#39;: &#39;3.1.4&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;3.0.4&#39;: &#39;3.0.4&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;2.7.4&#39;: &#39;2.7.4&#39;,<br>
&gt;=C2=A0 =C2=A0 };<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foun=
dation / Yocto Project</div><div>Systems Operations Engineer</div></div></d=
iv>

--000000000000698cac05b5837e60--
