Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.4269.1631690569769494271
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 00:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=A4Ay+zJc;
 spf=pass (domain: linaro.org, ip: 209.85.218.46, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ej1-f46.google.com with SMTP id b10so3971249ejg.11
        for <docs@lists.yoctoproject.org>; Wed, 15 Sep 2021 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bARD/VxwLdEbwEVOBJOUM43CWaAuuT89kdZ8xzYH28=;
        b=A4Ay+zJcglg9Aqmw1jXHiqXZ0faZ8ymYM3ccjWbSgrq8xO8GqPrF01R4vIt4vjCzaZ
         WTQdH+d/MGPpfdOd+h781BLVP0Co5Oh2GtXcEPZewh87+1duZZv5LLDs1hGbCaeMDW6g
         0QWRiSIzygaaJ4C7BGqI4ovvScvwcx7haoMB1EyVJxNeSjnF2k1RRw4WwiTKPpZsLnUG
         eJt7xYxCdzRBxysqEQPVI6uaVJ61cwUgtaJDSerQPrtVbggAtGhSRsA97BXdMY3jjY1P
         h/zyW5KVg8PkjQQbN+xdJhnP/CNJxuWFTJFXtFmojFqBY2fapD8c1sfl4tuNHw1yqwQ2
         wRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bARD/VxwLdEbwEVOBJOUM43CWaAuuT89kdZ8xzYH28=;
        b=aagKgyMsvXHVhSAMgwAsadxJfXgAgmpyGX1rzuzhkZTtUsGJ/7mawR4r5ATzNf6FXK
         3r1EGNJAlBy13LgBgcgxy34zv1iYbjaDxCqdbZ/YTdp1lX8LZa2rj3+7BsdCiJa9vQUO
         XnSvmdcEFG5QwRVslCuGNCL9Jc9xjAwys+g3eoJDZv74McbYrFuOoZptEAq5dJypIIp1
         fFShFSZvg50+DgNwLAXDnzFJcQrrftiwgcP6lp2xxdXHZwxGdlv5Umh6IQvSE/Le/y92
         ykLSCj4NVVlP9AxrfdpfvzLgaLgWEykPpSb/zy9+lxDEpnnBpHygXOo/gPvOQIXbqe/t
         cPDg==
X-Gm-Message-State: AOAM533x5TX3fVVrUqqTOMpR8OAXx/UUr+W/rNRXtSaDC3fv8/SOlFfH
	2fovlQzcuW8f3/lZruhbfxrBTRnYQXfVOlgpNF6UiA==
X-Google-Smtp-Source: ABdhPJxn6QTeJxEzi5W7PY9N8ELMUzMQwz+D6ojvXUJqQ59dGcGXbLI40cUuI9TEGbHlJvdeeTsCmlzaV/YjCBAfqrw=
X-Received: by 2002:a17:906:e299:: with SMTP id gg25mr14762051ejb.339.1631690567923;
 Wed, 15 Sep 2021 00:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <e2e971ad0d00ea02456bdf5010015c1031fe2d77.camel@linuxfoundation.org>
 <20210915064830.2191396-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20210915064830.2191396-1-michael.opdenacker@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 15 Sep 2021 09:22:37 +0200
Message-ID: <CAP71Wjzfi4Lm7-NBmawMYh-3qxSfR9W6b_7rHYg6X0+NWb9SnQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] manuals: replace Freenode by Libera Chat as IRC host
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000af526005cc03908b"

--000000000000af526005cc03908b
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 15, 2021 at 8:48 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Fixes [YOCTO #14546]
> This also replaces the "#poky" channel (inactive)
> by "#oe", which is more actively used.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>

Good catch! Thanks for the patch. Looks good to me.


> ---
>  documentation/boilerplate.rst          |  2 +-
>  documentation/ref-manual/resources.rst | 13 +++++++------
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst
> index baccc9fe40..9b64d91efd 100644
> --- a/documentation/boilerplate.rst
> +++ b/documentation/boilerplate.rst
> @@ -14,5 +14,5 @@ Commons.
>  To report any inaccuracies or problems with this (or any other Yocto
> Project)
>  manual, or to send additions or changes, please send email/patches to the
> Yocto
>  Project documentation mailing list at ``docs@lists.yoctoproject.org`` or
> -log into the Freenode ``#yocto`` channel.
> +log into the `Libera Chat <https://libera.chat/>`__ ``#yocto`` channel.
>
> diff --git a/documentation/ref-manual/resources.rst
> b/documentation/ref-manual/resources.rst
> index 5ffd2b3991..c942384662 100644
> --- a/documentation/ref-manual/resources.rst
> +++ b/documentation/ref-manual/resources.rst
> @@ -90,12 +90,12 @@ For more Yocto Project-related mailing lists, see the
>  Internet Relay Chat (IRC)
>  =========================
>
> -Two IRC channels on Freenode are available for the Yocto Project and
> -Poky discussions:
> +Two IRC channels on `Libera Chat <https://libera.chat/>`__
> +are available for the Yocto Project and OpenEmbedded discussions:
>
>  -  ``#yocto``
>
> --  ``#poky``
> +-  ``#oe``
>
>  .. _resources-links-and-related-documentation:
>
> @@ -187,9 +187,10 @@ Here is a list of resources you might find helpful:
>     implementation of Bugzilla for logging and tracking Yocto Project
>     defects.
>
> --  *Internet Relay Chat (IRC):* Two IRC channels on Freenode are
> -   available for Yocto Project and Poky discussions: ``#yocto`` and
> -   ``#poky``, respectively.
> +-  *Internet Relay Chat (IRC):* Two IRC channels on
> +   `Libera Chat <https://libera.chat/>`__ are
> +   available for Yocto Project and OpenEmbeddded discussions: ``#yocto``
> and
> +   ``#oe``, respectively.
>
>  -  `Quick EMUlator (QEMU) <https://wiki.qemu.org/Index.html>`__\ *:* An
>     open-source machine emulator and virtualizer.
> --
> 2.25.1
>
>
> 
>
>

--000000000000af526005cc03908b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 8:48 AM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Fixes [YOCTO #14546]<br>
This also replaces the &quot;#poky&quot; channel (inactive)<br>
by &quot;#oe&quot;, which is more actively used.<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br></=
blockquote><div><br></div><div>Good catch! Thanks for the patch. Looks good=
 to me.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0documentation/boilerplate.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0documentation/ref-manual/resources.rst | 13 +++++++------<br>
=C2=A02 files changed, 8 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/documentation/boilerplate.rst b/documentation/boilerplate.rst<=
br>
index baccc9fe40..9b64d91efd 100644<br>
--- a/documentation/boilerplate.rst<br>
+++ b/documentation/boilerplate.rst<br>
@@ -14,5 +14,5 @@ Commons.<br>
=C2=A0To report any inaccuracies or problems with this (or any other Yocto =
Project)<br>
=C2=A0manual, or to send additions or changes, please send email/patches to=
 the Yocto<br>
=C2=A0Project documentation mailing list at ``<a href=3D"mailto:docs@lists.=
yoctoproject.org" target=3D"_blank">docs@lists.yoctoproject.org</a>`` or<br=
>
-log into the Freenode ``#yocto`` channel.<br>
+log into the `Libera Chat &lt;<a href=3D"https://libera.chat/" rel=3D"nore=
ferrer" target=3D"_blank">https://libera.chat/</a>&gt;`__ ``#yocto`` channe=
l.<br>
<br>
diff --git a/documentation/ref-manual/resources.rst b/documentation/ref-man=
ual/resources.rst<br>
index 5ffd2b3991..c942384662 100644<br>
--- a/documentation/ref-manual/resources.rst<br>
+++ b/documentation/ref-manual/resources.rst<br>
@@ -90,12 +90,12 @@ For more Yocto Project-related mailing lists, see the<b=
r>
=C2=A0Internet Relay Chat (IRC)<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br>
<br>
-Two IRC channels on Freenode are available for the Yocto Project and<br>
-Poky discussions:<br>
+Two IRC channels on `Libera Chat &lt;<a href=3D"https://libera.chat/" rel=
=3D"noreferrer" target=3D"_blank">https://libera.chat/</a>&gt;`__<br>
+are available for the Yocto Project and OpenEmbedded discussions:<br>
<br>
=C2=A0-=C2=A0 ``#yocto``<br>
<br>
--=C2=A0 ``#poky``<br>
+-=C2=A0 ``#oe``<br>
<br>
=C2=A0.. _resources-links-and-related-documentation:<br>
<br>
@@ -187,9 +187,10 @@ Here is a list of resources you might find helpful:<br=
>
=C2=A0 =C2=A0 implementation of Bugzilla for logging and tracking Yocto Pro=
ject<br>
=C2=A0 =C2=A0 defects.<br>
<br>
--=C2=A0 *Internet Relay Chat (IRC):* Two IRC channels on Freenode are<br>
-=C2=A0 =C2=A0available for Yocto Project and Poky discussions: ``#yocto`` =
and<br>
-=C2=A0 =C2=A0``#poky``, respectively.<br>
+-=C2=A0 *Internet Relay Chat (IRC):* Two IRC channels on<br>
+=C2=A0 =C2=A0`Libera Chat &lt;<a href=3D"https://libera.chat/" rel=3D"nore=
ferrer" target=3D"_blank">https://libera.chat/</a>&gt;`__ are<br>
+=C2=A0 =C2=A0available for Yocto Project and OpenEmbeddded discussions: ``=
#yocto`` and<br>
+=C2=A0 =C2=A0``#oe``, respectively.<br>
<br>
=C2=A0-=C2=A0 `Quick EMUlator (QEMU) &lt;<a href=3D"https://wiki.qemu.org/I=
ndex.html" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Index=
.html</a>&gt;`__\ *:* An<br>
=C2=A0 =C2=A0 open-source machine emulator and virtualizer.<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000af526005cc03908b--
