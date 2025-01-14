Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBD7E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 18:21:22 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.1241.1736878874497408727
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 10:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TR38Wzfh;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f6497fbccbso35345eaf.0
        for <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 10:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736878873; x=1737483673; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2N+vCWY/VABlTikXZKt5kCvqWdXNwdNiFDa36prt14k=;
        b=TR38WzfhYeg7wS0SbIeQ0NDFXoUnS9vXArOJEm2DL6nySgzv/LGd23U1gSYKdE1hm6
         l7jc+GOFY2SNf5bFUUVlYWW+HHdu0WLDvi9xi9lTF6vAfVVoYzo52xk/YJD8x4adV9u3
         liHMZWekOeI5e4zOKKD8O5AMbYjLxSd/lp/jXqtq13wVkZ3oFAhU0Efknr6AkvP/L0zV
         pXkdrOvrwEt8y7TGfBMrgOcmh+z1szsMY4TU87mKuuGwv4C9Gh4RBzjLJmUtTdwuAdn3
         rjeWuGw5+or+kvOATmqfvez+ibfhdVPsO6HF8v9P31tQzMsLETD0VgXnEtbDUbRDkg9M
         hx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878873; x=1737483673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N+vCWY/VABlTikXZKt5kCvqWdXNwdNiFDa36prt14k=;
        b=LDRIoOvsZy2emXgDhVCGI/rTucUDGEWQlz535D7deJl73tLKHH0j7xCrvyZ9JwR0zO
         Fn+2B3w3hMRICGdSL+5c1gNUzuuL0qCAnbDfS12abpS284n1ExI1GEVO7iJJ2G9mhiFC
         +HK1sZUXKup1hVmhjLIsVDLGCq6kEYclS0PQGhCceFOXSy6emifhHZnnKtGAQvFVuT9x
         GFS3hiLEcQbQ6mSRYBt7F2PpegNtwflsjMm00PHu2vQLXNxx3qjTlvt6qQigG7mgt99Y
         q3lgfprK83XAWMYiL5V0m4A6IlNxn3iks4Ox6go6XcOO0GesvdAZAVwJ/LqdC3RQiHis
         bGKQ==
X-Gm-Message-State: AOJu0Ywg0WeWzCQEO+qk8+UrklaowKldobICsE6niXR3q/rqZcfQw1JY
	A7KgIazIM+z/Bq8nLc12HvpAv4LJyOvS5zgZ4snh0+v7pQ3L4WRgn8k8ASnilt/itkKRkMKmucn
	HlQM2QzEWrIe1bpS+PNYAFRKx5ok=
X-Gm-Gg: ASbGncvl6VftFkUb3JX8e8TwkEfHMchre93ontkdkh6XT79zj+EMR/2Nl2Fa0OJKqZp
	lLBoMrH7LrWuyAHnJsQNIqyzeCFkJARzf1OqtVbw=
X-Google-Smtp-Source: AGHT+IFPutyu5W/Ze8xhQL/9YIGzCchS4AdHXBPZdp9d3E+vH528y8NJZlmuWnL5rwP224ocfNM6WKLJbt6sqVjcjXU=
X-Received: by 2002:a05:6871:5e10:b0:29e:37af:a943 with SMTP id
 586e51a60fabf-2ad80907cc8mr14695050fac.18.1736878873422; Tue, 14 Jan 2025
 10:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
 <20250113233736.4181201-3-adrian.freihofer@siemens.com> <b363d565-c568-4a15-be1f-725e24f0191a@cherry.de>
In-Reply-To: <b363d565-c568-4a15-be1f-725e24f0191a@cherry.de>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Tue, 14 Jan 2025 19:21:02 +0100
X-Gm-Features: AbW1kvZa1kBsslPbvLhp2ov2xnIerG7FeF_PEGX_rTQmXwmwMczRdg7W-fSAtEs
Message-ID: <CAB3asfiixwFwsr4Fmhct2ZsicD=6-mdDvfvz36UpJveRAo-9jw@mail.gmail.com>
Subject: Re: [docs] [PATCH v3 2/3] sdk-manual: extensible.rst: update devtool ide-sdk
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="00000000000044b23e062baea058"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Jan 2025 18:21:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6105

--00000000000044b23e062baea058
Content-Type: text/plain; charset="UTF-8"

Hi Quentin

Am Di., 14. Jan. 2025 um 11:10 Uhr schrieb Quentin Schulz <
quentin.schulz@cherry.de>:

> Hi Adrian, Antonin,
>
> On 1/14/25 12:31 AM, Adrian Freihofer via lists.yoctoproject.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@gmail.com>
> >
> > Replace
> >    devtool ide-sdk --debug-build-config
> > by
> >    devtool modify --debug-build
> >
> > This change was introduced with commit
> >
> https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb
> >
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >   documentation/sdk-manual/extensible.rst | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/documentation/sdk-manual/extensible.rst
> b/documentation/sdk-manual/extensible.rst
> > index 9a50d7fc54c..3733997fac4 100644
> > --- a/documentation/sdk-manual/extensible.rst
> > +++ b/documentation/sdk-manual/extensible.rst
> > @@ -669,7 +669,8 @@ The extensible SDK supports two different
> development modes.
> >         IMAGE_INSTALL:append = " my-recipe"
> >
> >      Assuming the BitBake environment is set up correctly and a
> workspace has
> > -   been created for the recipe using ``devtool modify my-recipe``, the
> > +   been created for the recipe using ``devtool modify my-recipe`` or
> probably
> > +   even better by using ``devtool modify my-recipe --debug-build``, the
> >      following command can create the SDK and the configuration for
> VSCode in
> >      the recipe workspace::
> >
> > @@ -786,8 +787,8 @@ The extensible SDK supports two different
> development modes.
> >      .. code-block:: sh
> >
> >         # Create the SDK
> > -      devtool modify cmake-example
> > -      devtool ide-sdk cmake-example core-image-minimal -c
> --debug-build-config --ide=none
> > +      devtool modify cmake-example --debug-build
> > +      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
> >
>
> Considering the commit log that introduced this change, I wonder if we
> should mention this in the known issues of older releases, though I
> guess the whole example simply doesn't work?

Well, all examples have always worked. There is only one detail that did
not work
When devtool ide-sdk was called with the --debug-build option, a build
configuration
for the IDE should be generated that compiles with e.g. -Og instead of -O2.
From the
user's point of view, debugging did work, but with still optimized code. So
there is
definitely a better user experience now than before. But it has always
worked
reasonably well.
The VSCode bitbake plugin called devtool ide-sdk without --debug-build,
which was also
not ideal and has now also been improved. However, this also means that the
broken
function was not available for UI users with older releases.

>
> Also, we should probably highlight this change in the migration manual
> somehow?
>
Assuming that the feature has not been used that much so far, I would
announce it as a
new feature of devtool modify and mention that the same but buggy feature
has been
removed from devtool ide-sdk. I can send something like this going to the
devtool section:

   -  Replace the anyway broken ``--debug-build-config`` option from
      ``devtool ide-sdk`` by a new ``--debug-build`` option of
      ``devtool modify``. The new workflow is now::

         devtool modify my-recipe --debug-build
         devtool ide-sdk my-recipe my-image

Thank you!
Adrian


> What do you think?
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> in any case.
>
> Thanks!
> Quentin
>

--00000000000044b23e062baea058
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Quentin<br></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 14. Jan. =
2025 um 11:10=C2=A0Uhr schrieb Quentin Schulz &lt;<a href=3D"mailto:quentin=
.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt;:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Adrian, Antonin,<br>
<br>
On 1/14/25 12:31 AM, Adrian Freihofer via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wr=
ote:<br>
&gt; From: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.co=
m" target=3D"_blank">adrian.freihofer@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Replace<br>
&gt;=C2=A0 =C2=A0 devtool ide-sdk --debug-build-config<br>
&gt; by<br>
&gt;=C2=A0 =C2=A0 devtool modify --debug-build<br>
&gt; <br>
&gt; This change was introduced with commit<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D1f7eb26c947d=
de14698ae6e2ab88f0637027f4cb" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/poky/commit/?id=3D1f7eb26c947dde14698ae6e2ab88f0637027=
f4cb</a><br>
&gt; <br>
&gt; Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer=
@siemens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/sdk-manual/extensible.rst | 7 ++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/documentation/sdk-manual/extensible.rst b/documentation/s=
dk-manual/extensible.rst<br>
&gt; index 9a50d7fc54c..3733997fac4 100644<br>
&gt; --- a/documentation/sdk-manual/extensible.rst<br>
&gt; +++ b/documentation/sdk-manual/extensible.rst<br>
&gt; @@ -669,7 +669,8 @@ The extensible SDK supports two different developm=
ent modes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_INSTALL:append =3D &quot; my-re=
cipe&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Assuming the BitBake environment is set up correct=
ly and a workspace has<br>
&gt; -=C2=A0 =C2=A0been created for the recipe using ``devtool modify my-re=
cipe``, the<br>
&gt; +=C2=A0 =C2=A0been created for the recipe using ``devtool modify my-re=
cipe`` or probably<br>
&gt; +=C2=A0 =C2=A0even better by using ``devtool modify my-recipe --debug-=
build``, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 following command can create the SDK and the confi=
guration for VSCode in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the recipe workspace::<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -786,8 +787,8 @@ The extensible SDK supports two different developm=
ent modes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .. code-block:: sh<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create the SDK<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 devtool modify cmake-example<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 devtool ide-sdk cmake-example core-image-minimal=
 -c --debug-build-config --ide=3Dnone<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 devtool modify cmake-example --debug-build<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 devtool ide-sdk cmake-example core-image-minimal=
 -c --ide=3Dnone<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Considering the commit log that introduced this change, I wonder if we <br>
should mention this in the known issues of older releases, though I <br>
guess the whole example simply doesn&#39;t work?</blockquote>Well, all exam=
ples have always worked. There is only one detail that did not work</div><d=
iv class=3D"gmail_quote gmail_quote_container">When devtool ide-sdk was cal=
led with the --debug-build option, a build configuration</div><div class=3D=
"gmail_quote gmail_quote_container">for the IDE should be generated that co=
mpiles with e.g. -Og instead of -O2. From the</div><div class=3D"gmail_quot=
e gmail_quote_container">user&#39;s point of view, debugging did work, but =
with still optimized code. So there is</div><div class=3D"gmail_quote gmail=
_quote_container">definitely a better user experience now than before. But =
it has always worked</div><div class=3D"gmail_quote gmail_quote_container">=
reasonably well.</div><div>The VSCode bitbake plugin called devtool ide-sdk=
 without --debug-build, which was also</div><div>not ideal and has now also=
 been improved. However, this also means that the broken</div><div>function=
 was not available for UI users with older releases.</div><div class=3D"gma=
il_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
Also, we should probably highlight this change in the migration manual <br>
somehow?<br></blockquote>Assuming that the feature has not been used that m=
uch so far, I would announce it as a</div><div class=3D"gmail_quote gmail_q=
uote_container">new feature of devtool modify and mention that the same but=
 buggy feature has been</div><div class=3D"gmail_quote gmail_quote_containe=
r">removed from devtool ide-sdk. I can send something like this going to th=
e devtool section:</div><div class=3D"gmail_quote gmail_quote_container"><b=
r>=C2=A0 =C2=A0- =C2=A0Replace the anyway broken ``--debug-build-config`` o=
ption from<br>=C2=A0 =C2=A0 =C2=A0 ``devtool ide-sdk`` by a new ``--debug-b=
uild`` option of<br>=C2=A0 =C2=A0 =C2=A0 ``devtool modify``. The new workfl=
ow is now::<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devtool modify my-reci=
pe --debug-build<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devtool ide-sdk my-re=
cipe my-image</div><div class=3D"gmail_quote gmail_quote_container"><br></d=
iv><div class=3D"gmail_quote gmail_quote_container">Thank you!</div><div cl=
ass=3D"gmail_quote gmail_quote_container">Adrian<br></div><div class=3D"gma=
il_quote gmail_quote_container"><br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
What do you think?<br>
<br>
Reviewed-by: Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de"=
 target=3D"_blank">quentin.schulz@cherry.de</a>&gt;<br>
in any case.<br>
<br>
Thanks!<br>
Quentin<br>
</blockquote></div></div>

--00000000000044b23e062baea058--

