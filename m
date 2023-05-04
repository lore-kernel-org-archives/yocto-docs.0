Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F88C77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 19:47:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.4694.1683229651168725011
 for <docs@lists.yoctoproject.org>;
 Thu, 04 May 2023 12:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WalMlpsh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.41, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-95369921f8eso152710966b.0
        for <docs@lists.yoctoproject.org>; Thu, 04 May 2023 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683229649; x=1685821649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FI5VR9RzYjarNQ+aep2GfM9BFKQOyQDXBdC7xcAXPI8=;
        b=WalMlpshhPxUCq8E59sqxnelfbzJaq4uivV2uNgTuJCnrk3v3fOULzP3CEWOh5Y1IJ
         HFUxoabre6vmqOWP2qQ/eeRIxoYpRMUFBeg2r0cGnFRmLfCsSNm9GIWftURvGdPmIK6w
         bt3p3yw2cvahCSae0lWfNhKX8AHGV7qP7wIL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683229649; x=1685821649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FI5VR9RzYjarNQ+aep2GfM9BFKQOyQDXBdC7xcAXPI8=;
        b=a8Fdjfj/kHtfld7k7/MlGISUFmPAJXEDUE51WAGpDoQx8+tyktnghBK38fHQF91Fz7
         3eAne9QQCwiLWOs/LYnh47njCC5J9b6xGN33FS6+9aImQURmXScLVvaezdvcGPK6Q3PI
         AQAM3kOOwUKNVK7p0vOozaAC4VrRZfBD11qUnyo3xlrHGY6Y+1V9rW6JEGQw1cTOQ6TY
         HlIl1UoEYUQyUwHI+eXwb0Gmvg3wWj6T61KlqeevBaamUkx339lgx7ZJODZMLQJZwNFq
         0AENVjwXQgMrgYSamJL2zhmz97+vlqpGh33V9v6J2YOy5ianfUeu2J0KeuvnwHtNamew
         Wl2A==
X-Gm-Message-State: AC+VfDxsVPTKWvBThKsNR8G59G5ZWmHWABlUoPT+akgdeHQ8PaV9P50h
	0ul4O2bK79h8KNVEnD+PyQvy+H0lrAThzl8p5jcFXQ==
X-Google-Smtp-Source: ACHHUZ7BtBrKbdJ3Fczhc6Dr4R+lEsD5i+tmNN0viChOG1mEL6+JZUmJgGGOkr696AB70Qo/tB1uTgc7iK9sqOboHUY=
X-Received: by 2002:a17:907:9405:b0:94f:432f:243e with SMTP id
 dk5-20020a170907940500b0094f432f243emr31092ejc.14.1683229649528; Thu, 04 May
 2023 12:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230503223456.23985-1-mhalstead@linuxfoundation.org> <fcd085b3-44de-9dfe-a063-381de52dae5b@bootlin.com>
In-Reply-To: <fcd085b3-44de-9dfe-a063-381de52dae5b@bootlin.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 4 May 2023 12:47:18 -0700
Message-ID: <CADfgfoZ0VtaxPni_Uy1vptxqmmeX9zvvE6C2867v=bt=EnZi9A@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: add support for mickledore (4.2) release
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org, richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="00000000000055fc0405fae371be"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 04 May 2023 19:47:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3907

--00000000000055fc0405fae371be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After this patch the docs are labeling both 4.2 and 4.2.999 as Mickledore.
Is that correct or should 4.2.999 use the devbranch name?

Also it marks 4.1.3 as obsolete already. Is that correct or is it supported
until the end of May?

On Thu, May 4, 2023 at 12:47=E2=80=AFAM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Michael,
>
> On 04.05.23 at 00:34, Michael Halstead wrote:
> > This adds support for the Mickledore (4.2) release and update the
> > current dev branch to Nanbield.
> >
> > Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> > ---
> >   documentation/poky.yaml.in    | 12 ++++++------
> >   documentation/set_versions.py |  6 ++++--
> >   2 files changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> > index 1c072c1d0..b2b6a6330 100644
> > --- a/documentation/poky.yaml.in
> > +++ b/documentation/poky.yaml.in
> > @@ -1,10 +1,10 @@
> > -DISTRO : "4.1"
> > -DISTRO_NAME_NO_CAP : "langdale"
> > -DISTRO_NAME : "Langdale"
> > -DISTRO_NAME_NO_CAP_MINUS_ONE : "kirkstone"
> > +DISTRO : "4.2"
> > +DISTRO_NAME_NO_CAP : "mickledore"
> > +DISTRO_NAME : "Mickledore"
> > +DISTRO_NAME_NO_CAP_MINUS_ONE : "langdale"
> >   DISTRO_NAME_NO_CAP_LTS : "kirkstone"
> > -YOCTO_DOC_VERSION : "4.1"
> > -DISTRO_REL_TAG : "yocto-4.1"
> > +YOCTO_DOC_VERSION : "4.2"
> > +DISTRO_REL_TAG : "yocto-4.2"
> >   DOCCONF_VERSION : "dev"
> >   BITBAKE_SERIES : ""
> >   YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> > diff --git a/documentation/set_versions.py
> b/documentation/set_versions.py
> > index efaebe43b..354dabe61 100755
> > --- a/documentation/set_versions.py
> > +++ b/documentation/set_versions.py
> > @@ -26,8 +26,8 @@ ourversion =3D None
> >   if len(sys.argv) =3D=3D 2:
> >       ourversion =3D sys.argv[1]
> >
> > -activereleases =3D ["langdale", "kirkstone", "dunfell"]
> > -devbranch =3D "mickledore"
> > +activereleases =3D ["mickledore", "kirkstone", "dunfell"]
> > +devbranch =3D "nanbield"
> >   ltsseries =3D ["kirkstone", "dunfell"]
> >
> >   # used by run-docs-builds to get the default page
> > @@ -36,6 +36,7 @@ if ourversion =3D=3D "getlatest":
> >       sys.exit(0)
> >
> >   release_series =3D collections.OrderedDict()
> > +release_series["nanbield"] =3D "4.3"
> >   release_series["mickledore"] =3D "4.2"
> >   release_series["langdale"] =3D "4.1"
> >   release_series["kirkstone"] =3D "4.0"
> > @@ -66,6 +67,7 @@ release_series["laverne"] =3D "0.9"
> >
> >
> >   bitbake_mapping =3D {
> > +    "nanbield" : "2.6",
> >       "mickledore" : "2.4",
> >       "langdale" : "2.2",
> >       "kirkstone" : "2.0",
>
>
> Thanks for the update! I feel the release coming :)
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into master-next.
>
> Thanks again
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--00000000000055fc0405fae371be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">After this patch the docs are labeling both 4.2 and 4.2.99=
9 as Mickledore. Is that=C2=A0correct or should 4.2.999=C2=A0use the devbra=
nch=C2=A0name?=C2=A0<div><br></div><div>Also it marks 4.1.3 as=C2=A0obsolet=
e=C2=A0already. Is that correct or is it supported until the end of May?=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, May 4, 2023 at 12:47=E2=80=AFAM Michael Opdenacker &lt;<a =
href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Michael,<br>
<br>
On 04.05.23 at 00:34, Michael Halstead wrote:<br>
&gt; This adds support for the Mickledore (4.2) release and update the<br>
&gt; current dev branch to Nanbield.<br>
&gt;<br>
&gt; Signed-off-by: Michael Halstead &lt;<a href=3D"mailto:mhalstead@linuxf=
oundation.org" target=3D"_blank">mhalstead@linuxfoundation.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/<a href=3D"http://poky.yaml.in" rel=3D"noref=
errer" target=3D"_blank">poky.yaml.in</a>=C2=A0 =C2=A0 | 12 ++++++------<br=
>
&gt;=C2=A0 =C2=A0documentation/set_versions.py |=C2=A0 6 ++++--<br>
&gt;=C2=A0 =C2=A02 files changed, 10 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/<a href=3D"http://poky.yaml.in" rel=3D"nore=
ferrer" target=3D"_blank">poky.yaml.in</a> b/documentation/<a href=3D"http:=
//poky.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a><br>
&gt; index 1c072c1d0..b2b6a6330 100644<br>
&gt; --- a/documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferrer"=
 target=3D"_blank">poky.yaml.in</a><br>
&gt; +++ b/documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferrer"=
 target=3D"_blank">poky.yaml.in</a><br>
&gt; @@ -1,10 +1,10 @@<br>
&gt; -DISTRO : &quot;4.1&quot;<br>
&gt; -DISTRO_NAME_NO_CAP : &quot;langdale&quot;<br>
&gt; -DISTRO_NAME : &quot;Langdale&quot;<br>
&gt; -DISTRO_NAME_NO_CAP_MINUS_ONE : &quot;kirkstone&quot;<br>
&gt; +DISTRO : &quot;4.2&quot;<br>
&gt; +DISTRO_NAME_NO_CAP : &quot;mickledore&quot;<br>
&gt; +DISTRO_NAME : &quot;Mickledore&quot;<br>
&gt; +DISTRO_NAME_NO_CAP_MINUS_ONE : &quot;langdale&quot;<br>
&gt;=C2=A0 =C2=A0DISTRO_NAME_NO_CAP_LTS : &quot;kirkstone&quot;<br>
&gt; -YOCTO_DOC_VERSION : &quot;4.1&quot;<br>
&gt; -DISTRO_REL_TAG : &quot;yocto-4.1&quot;<br>
&gt; +YOCTO_DOC_VERSION : &quot;4.2&quot;<br>
&gt; +DISTRO_REL_TAG : &quot;yocto-4.2&quot;<br>
&gt;=C2=A0 =C2=A0DOCCONF_VERSION : &quot;dev&quot;<br>
&gt;=C2=A0 =C2=A0BITBAKE_SERIES : &quot;&quot;<br>
&gt;=C2=A0 =C2=A0YOCTO_DL_URL : &quot;<a href=3D"https://downloads.yoctopro=
ject.org" rel=3D"noreferrer" target=3D"_blank">https://downloads.yoctoproje=
ct.org</a>&quot;<br>
&gt; diff --git a/documentation/set_versions.py b/documentation/set_version=
s.py<br>
&gt; index efaebe43b..354dabe61 100755<br>
&gt; --- a/documentation/set_versions.py<br>
&gt; +++ b/documentation/set_versions.py<br>
&gt; @@ -26,8 +26,8 @@ ourversion =3D None<br>
&gt;=C2=A0 =C2=A0if len(sys.argv) =3D=3D 2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ourversion =3D sys.argv[1]<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -activereleases =3D [&quot;langdale&quot;, &quot;kirkstone&quot;, &quo=
t;dunfell&quot;]<br>
&gt; -devbranch =3D &quot;mickledore&quot;<br>
&gt; +activereleases =3D [&quot;mickledore&quot;, &quot;kirkstone&quot;, &q=
uot;dunfell&quot;]<br>
&gt; +devbranch =3D &quot;nanbield&quot;<br>
&gt;=C2=A0 =C2=A0ltsseries =3D [&quot;kirkstone&quot;, &quot;dunfell&quot;]=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# used by run-docs-builds to get the default page<br>
&gt; @@ -36,6 +36,7 @@ if ourversion =3D=3D &quot;getlatest&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0release_series =3D collections.OrderedDict()<br>
&gt; +release_series[&quot;nanbield&quot;] =3D &quot;4.3&quot;<br>
&gt;=C2=A0 =C2=A0release_series[&quot;mickledore&quot;] =3D &quot;4.2&quot;=
<br>
&gt;=C2=A0 =C2=A0release_series[&quot;langdale&quot;] =3D &quot;4.1&quot;<b=
r>
&gt;=C2=A0 =C2=A0release_series[&quot;kirkstone&quot;] =3D &quot;4.0&quot;<=
br>
&gt; @@ -66,6 +67,7 @@ release_series[&quot;laverne&quot;] =3D &quot;0.9&qu=
ot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bitbake_mapping =3D {<br>
&gt; +=C2=A0 =C2=A0 &quot;nanbield&quot; : &quot;2.6&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mickledore&quot; : &quot;2.4&quot;,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;langdale&quot; : &quot;2.2&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;kirkstone&quot; : &quot;2.0&quot;,<br>
<br>
<br>
Thanks for the update! I feel the release coming :)<br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
... and merged into master-next.<br>
<br>
Thanks again<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</div><=
div>Systems Operations Engineer</div></div></div>

--00000000000055fc0405fae371be--

