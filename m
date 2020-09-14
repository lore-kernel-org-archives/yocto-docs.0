Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.56570.1600070843816195556
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2020 01:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AvfVhTmF;
 spf=pass (domain: linaro.org, ip: 209.85.219.180, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f180.google.com with SMTP id v60so5319020ybi.10
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2020 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSP9xZWOV90fQeewxySUSMC0q7RQxXRYfDsXvrCwusY=;
        b=AvfVhTmFtirKDbKlSCkKzOd951uJERNTXsOaLiCqQLUihyW6l4pLhEtHCee0CgQhWq
         GxxT6+7LlOnPtVz6FXiNqOhfMlIDC1tZZvGgzkTCzj/bb+IhaaqySOmAlXUDRJK+djIu
         +41PK84yTTRBQb8qzEVMNC+kwvTV/xVR5aTzpQWBcGHykzvup5u3yxCbmnDcjD18m2IN
         DrkBKOcKibUviKtQJwXhWlFbSHHAFCWpB9YPG84n6X16J+odVGxAXqMCJbr4dukPlWqP
         UDsnOMfiFCCVtRqciePNQcR2kl7vBEiu151kzbe5RxLKqLTFVKkb2y5aDIc8FSoCNDDi
         W4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSP9xZWOV90fQeewxySUSMC0q7RQxXRYfDsXvrCwusY=;
        b=DdsJb2KLenNPxKpmNijX9UGl6WYPrpxg11Mjz8iVXJWe32hcwDZUx9R698GParURrN
         MXRFJnwhsPO0XHeXANcdqLmkJ3v/kAiB99GnOtY2lblaum02vKl3CeZ8bs1mOF0Jh/TC
         NZ4u6IqHgH5vgicCIsAvyJ46CGYCglHnBl0EWNuaGz633pNaZGYlsyC8zso5XDVzbUr5
         fWGd97IwqsxsHkNpA+w6YtXhBV4ipIdNWC7gW9O50HkoF+rsnAObZJ4+Bi0AAQPdhroK
         NfYFhL5jE8EVd65CK0JF4Qzseopw9eewFCLm8lylt1aUxbjOfeNJ8SQ9vibqL6ek98Aa
         i6xA==
X-Gm-Message-State: AOAM5308EYTuHBb2K3Rvo6WVoEC3ICKkrY5SMAzYyLsXd+xeEp4blhDv
	IQNG2zJZS3sQGnvrLfAKYQ3jsFQ9OxLa/WcDvhnvVQ==
X-Google-Smtp-Source: ABdhPJyLSwS885R8HLHPQ7tu8fu2hzb5ZrowKU4DBfVU3T6vkJokWrF2qH1PPI0DkUC5OSCK02l1IgEMVkRZU6r6E5c=
X-Received: by 2002:a25:d40c:: with SMTP id m12mr2470186ybf.273.1600070842866;
 Mon, 14 Sep 2020 01:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200912205047.21516-1-akuster808@gmail.com>
In-Reply-To: <20200912205047.21516-1-akuster808@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 14 Sep 2020 10:07:12 +0200
Message-ID: <CAP71Wjxjy2qBiPs2q_PwmjswRZqrC3Qxnatt5LAcFBBwc0ea3Q@mail.gmail.com>
Subject: Re: [docs] [sphinx][PATCH] overview-manual: Clean up warnings for sphinx
To: akuster <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000034678505af4186d9"

--00000000000034678505af4186d9
Content-Type: text/plain; charset="UTF-8"

hi Armin!

thanks for trying out the Sphinx docs!

On Sat, Sep 12, 2020 at 10:50 PM akuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../overview-manual/overview-manual-concepts.rst    | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/overview-manual/overview-manual-concepts.rst
> b/documentation/overview-manual/overview-manual-concepts.rst
> index 7f8f735b3..c7a34f649 100644
> --- a/documentation/overview-manual/overview-manual-concepts.rst
> +++ b/documentation/overview-manual/overview-manual-concepts.rst
> @@ -251,7 +251,7 @@ if versions do not already exist in the Build
> Directory at the time you
>  source the build environment setup script.
>
>  Because the Poky repository is fundamentally an aggregation of existing
> -repositories, some users might be familiar with running the ```` script
> +repositories, some users might be familiar with running the "script"
>

This is not the proper fix. This is a weird artifact of the pandoc
migration.. if you look at the original XML you will see:

            <para>


                Because the Poky repository is fundamentally an aggregation
of

                existing repositories, some users might be familiar with


                running the <filename>&OE_INIT_FILE;</filename> script


                in the context of separate


                <ulink
url='&YOCTO_DOCS_REF_URL;#oe-core'>OpenEmbedded-Core</ulink>


                and BitBake repositories rather than a single Poky
repository.

                This discussion assumes the script is executed from


                within a cloned or unpacked version of Poky.


            </para>

Because pandoc does not understand the &XXX; notation, it ends up with an
'empty' string in verbatim mode, so : ````. So the right fix here is to
replace ```` with the link to this section:
https://docs.yoctoproject.org/ref-manual/ref-structure.html#oe-init-build-env


e.g. :ref:`ref-manual/ref-structure:\`\`oe-init-build-env\`\``

 in the context of separate
>  :term:`OpenEmbedded-Core (OE-Core)` and BitBake
>  repositories rather than a single Poky repository. This discussion
> @@ -382,10 +382,10 @@ In general, three types of layer input exists. You
> can see them below
>  the "User Configuration" box in the `general workflow
>  figure <#general-workflow-figure>`__:
>
> --  *Metadata (``.bb`` + Patches):* Software layers containing
> +-  *Metadata (".bb" + Patches):* Software layers containing
>     user-supplied recipe files, patches, and append files. A good example
>     of a software layer might be the
> -   ```meta-qt5`https://github.com/meta-qt5/meta-qt5 layer from
> +   `meta-qt5`https://github.com/meta-qt5/meta-qt5 layer from
>

hmm. did that produce the right link? I would expect

`meta-qt5 <https://github.com/meta-qt5/meta-qt5>`__

    the `OpenEmbedded Layer
>     Index <http://layers.openembedded.org/layerindex/branch/master/layers/
> >`__.
>     This layer is for version 5.0 of the popular
> @@ -704,8 +704,7 @@ architecture are placed in
> ``build/tmp/deploy/ipk/qemux86``.
>
>  .. _bitbake-dev-environment:
>
> -BitBake
> --------
> +=, BitBake
>

what is this change?


>
>  The OpenEmbedded build system uses
>  :term:`BitBake` to produce images and
> @@ -1143,9 +1142,9 @@ the extensible SDK (eSDK):
>
>  Like image generation, the SDK script process consists of several stages
>  and depends on many variables. The
> -:ref:`ref-tasks-populate_sdk`
> +`ref-tasks-populate_sdk`
>

I think this change was not needed (e.g. the link is already the right
one). It's a link to a label in another doc, so :ref: is right here.


>  and
> -:ref:`ref-tasks-populate_sdk_ext`
> +`ref-tasks-populate_sdk_ext`
>

Right, here, it's a link to a label which doesn't seem to exist. Looking a
bit closer.. it doesn't exist in the DocBook XML files themselves, so it's
a bug in the docbook xml file! If you look at the manual it has the
following link:
https://www.yoctoproject.org/docs/3.1.2/ref-manual/ref-manual.html#ref-tasks-populate_sdk_ext
which does not exist..

 tasks use these key variables to help create the list of packages to
>  actually install. For information on the variables listed in the figure,
>  see the "`Application Development SDK <#sdk-dev-environment>`__"
> --
> 2.17.1
>
> 
>

--00000000000034678505af4186d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">hi Armin!<div><br></div><div>thanks for t=
rying out the Sphinx docs!</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 12, 2020 at 10:50 PM akuster &l=
t;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by=
: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank=
">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../overview-manual/overview-manual-concepts.rst=C2=A0 =C2=A0 | 13 +=
+++++-------<br>
=C2=A01 file changed, 6 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/documentation/overview-manual/overview-manual-concepts.rst b/=
documentation/overview-manual/overview-manual-concepts.rst<br>
index 7f8f735b3..c7a34f649 100644<br>
--- a/documentation/overview-manual/overview-manual-concepts.rst<br>
+++ b/documentation/overview-manual/overview-manual-concepts.rst<br>
@@ -251,7 +251,7 @@ if versions do not already exist in the Build Director=
y at the time you<br>
=C2=A0source the build environment setup script.<br>
<br>
=C2=A0Because the Poky repository is fundamentally an aggregation of exist=
ing<br>
-repositories, some users might be familiar with running the ```` script<b=
r>
+repositories, some users might be familiar with running the &quot;script&=
quot;<br></blockquote><div><br></div><div>This is not the proper fix. This =
is a weird artifact of the pandoc migration.. if you look at the original X=
ML you will see:</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;para&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Because the Poky repository is fundamentally a=
n aggregation of =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 existing repositories, some users might be=
 familiar with =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 running the &lt;filename&=
gt;&amp;OE_INIT_FILE;&lt;/filename&gt; script =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in the context of separate =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;ulink url=3D&#39;&amp;YOCTO_DOCS_RE=
F_URL;#oe-core&#39;&gt;OpenEmbedded-Core&lt;/ulink&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and BitBake repositories rat=
her than a single Poky repository. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This discussion assumes t=
he script is executed from =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
within a cloned or unpacked version of Poky. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br></div><div><br></div><=
div>Because pandoc does not understand the &amp;XXX; notation, it ends up w=
ith an &#39;empty&#39; string in verbatim mode, so : ````. So the right fix=
 here is to replace ```` with the link to this section:=C2=A0</div><div><a =
href=3D"https://docs.yoctoproject.org/ref-manual/ref-structure.html#oe-init=
-build-env">https://docs.yoctoproject.org/ref-manual/ref-structure.html#oe-=
init-build-env</a>=C2=A0</div><div><br></div><div>e.g.=C2=A0:ref:`ref-manua=
l/ref-structure:\`\`oe-init-build-env\`\``</div><div><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
=C2=A0in the context of separate<br>
=C2=A0:term:`OpenEmbedded-Core (OE-Core)` and BitBake<br>
=C2=A0repositories rather than a single Poky repository. This discussion<b=
r>
@@ -382,10 +382,10 @@ In general, three types of layer input exists. You c=
an see them below<br>
=C2=A0the &quot;User Configuration&quot; box in the `general workflow<br>
=C2=A0figure &lt;#general-workflow-figure&gt;`__:<br>
<br>
--=C2=A0 *Metadata (``.bb`` + Patches):* Software layers containing<br>
+-=C2=A0 *Metadata (&quot;.bb&quot; + Patches):* Software layers containin=
g<br>
=C2=A0 =C2=A0 user-supplied recipe files, patches, and append files. A goo=
d example<br>
=C2=A0 =C2=A0 of a software layer might be the<br>
-=C2=A0 =C2=A0```meta-qt5`<a href=3D"https://github.com/meta-qt5/meta-qt5"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-qt5/meta-qt5<=
/a> layer from<br>
+=C2=A0 =C2=A0`meta-qt5`<a href=3D"https://github.com/meta-qt5/meta-qt5" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/meta-qt5/meta-qt5</a=
> layer from<br></blockquote><div><br></div><div>hmm. did that produce the =
right link? I would expect</div><div><br></div><div>`meta-qt5 &lt;<a href=
=3D"https://github.com/meta-qt5/meta-qt5">https://github.com/meta-qt5/meta=
-qt5</a>&gt;`__</div><div><br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
=C2=A0 =C2=A0 the `OpenEmbedded Layer<br>
=C2=A0 =C2=A0 Index &lt;<a href=3D"http://layers.openembedded.org/layerind=
ex/branch/master/layers/" rel=3D"noreferrer" target=3D"_blank">http://layer=
s.openembedded.org/layerindex/branch/master/layers/</a>&gt;`__.<br>
=C2=A0 =C2=A0 This layer is for version 5.0 of the popular<br>
@@ -704,8 +704,7 @@ architecture are placed in ``build/tmp/deploy/ipk/qemu=
x86``.<br>
<br>
=C2=A0.. _bitbake-dev-environment:<br>
<br>
-BitBake<br>
--------<br>
+=3D, BitBake<br></blockquote><div><br></div><div>what is this change?</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0The OpenEmbedded build system uses<br>
=C2=A0:term:`BitBake` to produce images and<br>
@@ -1143,9 +1142,9 @@ the extensible SDK (eSDK):<br>
<br>
=C2=A0Like image generation, the SDK script process consists of several st=
ages<br>
=C2=A0and depends on many variables. The<br>
-:ref:`ref-tasks-populate_sdk`<br>
+`ref-tasks-populate_sdk`<br></blockquote><div><br></div><div>I think this=
 change was not needed (e.g. the link is already the right one). It&#39;s a=
 link to a label in another doc, so :ref: is right here.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0and<br>
-:ref:`ref-tasks-populate_sdk_ext`<br>
+`ref-tasks-populate_sdk_ext`<br></blockquote><div><br></div><div>Right, h=
ere, it&#39;s a link to a label which doesn&#39;t seem to exist. Looking a =
bit closer.. it doesn&#39;t exist in the DocBook XML files themselves, so i=
t&#39;s a bug in the docbook xml file! If you look at the manual it has the=
 following link:=C2=A0<a href=3D"https://www.yoctoproject.org/docs/3.1.2/re=
f-manual/ref-manual.html#ref-tasks-populate_sdk_ext">https://www.yoctoproje=
ct.org/docs/3.1.2/ref-manual/ref-manual.html#ref-tasks-populate_sdk_ext</a>=
 which does not exist..</div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0tasks use these key variables to help create the list of packages to=
<br>
=C2=A0actually install. For information on the variables listed in the fig=
ure,<br>
=C2=A0see the &quot;`Application Development SDK &lt;#sdk-dev-environment&=
gt;`__&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000034678505af4186d9--
