Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.32426.1627316590792963711
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 09:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s/Jvyksz;
 spf=pass (domain: linaro.org, ip: 209.85.208.51, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f51.google.com with SMTP id p21so4234713edi.9
        for <docs@lists.yoctoproject.org>; Mon, 26 Jul 2021 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RirEdPGnl3Wnds7fkMZ5qjjed1uhKt0aY0ZtPPFI1nA=;
        b=s/JvyksztRHKNLmW2S1iaDI1A7aIADdNRbGAMUMV6FaW7UHMOKThtq5UdVEkJywRyO
         Ldd1MDNw2TvlI62JozxehFeorLb4OO/XpuqwA4FUBRPndKS/cV7kbLQmJP6mrUIDrVvB
         hpRXIHEn1GCbsEa2/4m2XTgy1LK6ELVQkpUE7Y5qRv1VLMW9Z6SdJwax8xP0nc/uv7XH
         WQFYTrE2wopAVR3Hej1Vqs8BaSRIk4+dSOr+V1L2nu16liPDhraeRUarizMdYQc5i/Au
         5oxkKyTST8fYYqFFold0h6ySR/dkVir3ud/QyvmnbQ3dGuiapRhP0FWF1VoltXZFWzQ7
         hsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RirEdPGnl3Wnds7fkMZ5qjjed1uhKt0aY0ZtPPFI1nA=;
        b=hbDDnVlx4oZrdYxUV398hcZ5OdlUn8kuIZNYaP6kNE+TS8zNOR4zAnaqvQIuLV9OYJ
         z+f8cCo4M3Fk1k00niHaVYoELopdcKK3XPsIGUo5kMxUcTOpDrQc08zVaejkRarywoi9
         V1oLA7iLwgrlIKmxP15Tpqkc6qECTKu8a5k3rSasZHYYto/TQiI71HNg/UyKf161DwLU
         U3dW18n1zFE7WZZFmxtUJH+z4u2eohgehFzeGUBKAO4OQ6/tNoLF1ZROgYSWFn11buhc
         P8wP1CDN3zWAlHdX2jjKwYF0ZHJobZo9xb0U2Psq8rN1gqIxXPKR0Up6ZGbKD9OOIq1q
         lNUA==
X-Gm-Message-State: AOAM530zEvylMjCyXcRI63vFNlG1S/qiXcjtBF2k2whiQ+JCgFe6E4eu
	/RKB4GqVx1SICR4XNXvDOeIwD+LfTaYEWPgRUqPP6g==
X-Google-Smtp-Source: ABdhPJzXyXnzXKVRSLwU1+JGg3/uwp6gdpEJ7xPzCj5RtNwSsYLWASHxqW+kX+zg8pKE762Q/TUgjzcA70DikRc+LUo=
X-Received: by 2002:aa7:c4c4:: with SMTP id p4mr22949110edr.367.1627316589038;
 Mon, 26 Jul 2021 09:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210726152947.2501390-1-quentin.schulz@theobroma-systems.com> <20210726152947.2501390-2-quentin.schulz@theobroma-systems.com>
In-Reply-To: <20210726152947.2501390-2-quentin.schulz@theobroma-systems.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 26 Jul 2021 18:22:58 +0200
Message-ID: <CAP71WjzWoKtj4ck2_j3wuV9ANws-i-b2_gD5SE7fjdpKjXY5+w@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] documentation: ref-manual: force glossary output to be alphabetically sorted
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>, Quentin Schulz <foss@0leil.net>
Content-Type: multipart/alternative; boundary="0000000000003a204e05c8092bbb"

--0000000000003a204e05c8092bbb
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 5:30 PM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Even though, care should be taken to have the terms in the glossary
> sources alphabetically ordered, it is possible some terms might be in
> the wrong place.
>
> This makes sure that whatever the order of terms in the glossary
> sources, the generated medium is correctly sorted.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Quentin Schulz <foss@0leil.net>
> ---
>  documentation/ref-manual/terms.rst     | 1 +
>  documentation/ref-manual/variables.rst | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/documentation/ref-manual/terms.rst
> b/documentation/ref-manual/terms.rst
> index 545100efa..4d960393c 100644
> --- a/documentation/ref-manual/terms.rst
> +++ b/documentation/ref-manual/terms.rst
> @@ -9,6 +9,7 @@ development environment might find helpful. While some of
> these terms are
>  universal, the list includes them just in case:
>
>  .. glossary::
> +   :sorted:
>

Really nice! I wish I had noticed that earlier!

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

>
>     :term:`Append Files`
>        Files that append build information to a recipe file.  Append files
> are
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index e5525e922..220e88db1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -17,6 +17,7 @@ system and gives an overview of their function and
> contents.
>  :term:`W <WARN_QA>` :term:`X <XSERVER>`
>
>  .. glossary::
> +   :sorted:
>
>     :term:`ABIEXTENSION`
>        Extension to the Application Binary Interface (ABI) field of the GNU
> --
> 2.31.1
>
>
> 
>
>

--0000000000003a204e05c8092bbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 5:30 PM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quent=
in.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Even though, care should be taken to have=
 the terms in the glossary<br>
sources alphabetically ordered, it is possible some terms might be in<br>
the wrong place.<br>
<br>
This makes sure that whatever the order of terms in the glossary<br>
sources, the generated medium is correctly sorted.<br>
<br>
Signed-off-by: Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@theobro=
ma-systems.com" target=3D"_blank">quentin.schulz@theobroma-systems.com</a>&=
gt;<br>
Signed-off-by: Quentin Schulz &lt;<a href=3D"mailto:foss@0leil.net" target=
=
=3D"_blank">foss@0leil.net</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/terms.rst=C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0documentation/ref-manual/variables.rst | 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual=
/terms.rst<br>
index 545100efa..4d960393c 100644<br>
--- a/documentation/ref-manual/terms.rst<br>
+++ b/documentation/ref-manual/terms.rst<br>
@@ -9,6 +9,7 @@ development environment might find helpful. While some of =
these terms are<br>
=C2=A0universal, the list includes them just in case:<br>
<br>
=C2=A0.. glossary::<br>
+=C2=A0 =C2=A0:sorted:<br></blockquote><div><br></div><div>Really nice! I =
wish I had noticed that earlier!</div><div><br></div><div>Reviewed-by: Nico=
las Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dec=
hesne@linaro.org</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
=C2=A0 =C2=A0 :term:`Append Files`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Files that append build information to a recipe=
 file.=C2=A0 Append files are<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-ma=
nual/variables.rst<br>
index e5525e922..220e88db1 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -17,6 +17,7 @@ system and gives an overview of their function and conte=
nts.<br>
=C2=A0:term:`W &lt;WARN_QA&gt;` :term:`X &lt;XSERVER&gt;`<br>
<br>
=C2=A0.. glossary::<br>
+=C2=A0 =C2=A0:sorted:<br>
<br>
=C2=A0 =C2=A0 :term:`ABIEXTENSION`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Extension to the Application Binary Interface (=
ABI) field of the GNU<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000003a204e05c8092bbb--
