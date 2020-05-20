Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
 by mx.groups.io with SMTP id smtpd.web11.8555.1589962170122785997
 for <docs@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o/2xA4Me;
 spf=pass (domain: gmail.com, ip: 209.85.221.194, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f194.google.com with SMTP id 21so546069vkq.6
        for <docs@lists.yoctoproject.org>; Wed, 20 May 2020 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhRiV93zre+NnP2L/sIwzyz12xcr1n0+KGjc+/gOFQ4=;
        b=o/2xA4MePWcqCS2TqAJ5UgU2jr5tkXMgfsHkCHp0TI6Fnd7t4uwwCKFaBBjv0c5Mnd
         f/CTOIHG6dE+taOEyfhH8sPw346ANr9c2//p4R5+z7i7kNO6IgMYb9TIzbJB70lNEhAc
         9uO8wUVMntuihUTkgnaC7l9bIJO/zUvGKHAJWCo+u4Fobm/Tfsyo2LQSDUAjPDcf+Azc
         irS8fw8dhXq4pJuRilVCa9yTIHVaVfgW3u03HIuMpPlbrjrbVUPlCLTz7gIP2d31jiuv
         vLziVefol/SSZgq77ldeqcng23Pdil3QX3OQ2lQXrbRuMJvXnpCNQr2YVkmw56WeOBel
         D2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhRiV93zre+NnP2L/sIwzyz12xcr1n0+KGjc+/gOFQ4=;
        b=QVjEIM4FYSvNLs+ol/BP5T2JVgPjnz02oEQR6ozxzfWoY84cA6B9mG0MOVPrsm+NUV
         RTv1fsUmxM2JdJjTTgHYqJEkk0ujF1IG83AckDZuT7n80iwgfe7tLfBvdtD7mrHq0T2F
         l1GSryIHafBti91RB4mmRsZ6y6qc7dMaSlhXUoLKLkYatzEsCpovkXRzMWQXXLVt3eOP
         j6hTbWlS9TanZ/U2AuAe/mdZuWvqS4ecLlPfg9raWMMW2G0jUwYJicpxF+5D8JvJBTgI
         GI162RW4FVw2ABZ3FhhhlzWY1Jq25ttCxgUJUZLGV75elnIveAJlBO8l1uFPOGPy7n0z
         oJZw==
X-Gm-Message-State: AOAM531t7kx+SroPNOFAjZFu9xB3zjyWA+/fcqwbwc+7cfNrKZmkThnW
	c/uAkUT+RoYFV5n5tVVHtpgHyjeooAGj2SCF8eU=
X-Google-Smtp-Source: ABdhPJyRAuDHfYvEihbQbHIyLThDzt0VHjtsltrackPglS28nz2yQcVO+c2t07wEKcth0J/IiQClLagCz55UsnuqoAI=
X-Received: by 2002:a1f:3655:: with SMTP id d82mr2805116vka.1.1589962169273;
 Wed, 20 May 2020 01:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200520042639.7077-1-akuster808@gmail.com>
In-Reply-To: <20200520042639.7077-1-akuster808@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 20 May 2020 10:09:18 +0200
Message-ID: <CANNYZj8Hc0XNj3+xP4nZmoy27MhqSwQ9Of6ziDxVAFyhgLPMmg@mail.gmail.com>
Subject: Re: [docs] [V2][PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
To: akuster <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004e53b505a60feace"

--0000000000004e53b505a60feace
Content-Type: text/plain; charset="UTF-8"

This still is missing the entries for other distros which I sent?

Alex

On Wed 20. May 2020 at 6.26, akuster <akuster808@gmail.com> wrote:

> [v2]
> Fix typo
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/poky.ent | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index a54793911a..07dc1af3d6 100755
> --- a/documentation/poky.ent
> +++ b/documentation/poky.ent
> @@ -70,7 +70,7 @@
>       python3-jinja2 SDL-devel xterm rpcgen">
>  <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath
> make wget python-xml \
>       diffstat makeinfo python-curses patch socat python3 python3-curses
> tar python3-pip \
> -     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel
> xterm rpcgen
> +     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel
> xterm rpcgen Mesa-dri-devel
>       $ sudo pip3 install GitPython">
>  <!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
>       $ sudo yum makecache
> --
> 2.17.1
>
> 
>

--0000000000004e53b505a60feace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This still is missing the entries for other distros =
which I sent?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div>=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed 20. May 2020 at 6.26, akuster &lt;<a href=3D"mailto:akuster808@=
gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
>[v2]<br>
Fix typo<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" ta=
rget=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/poky.ent | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/documentation/poky.ent b/documentation/poky.ent<br>
index a54793911a..07dc1af3d6 100755<br>
--- a/documentation/poky.ent<br>
+++ b/documentation/poky.ent<br>
@@ -70,7 +70,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 python3-jinja2 SDL-devel xterm rpcgen&quot;&gt;<br>
=C2=A0&lt;!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL &quot;python gcc gcc-c+=
+ git chrpath make wget python-xml \<br>
=C2=A0 =C2=A0 =C2=A0 diffstat makeinfo python-curses patch socat python3 p=
ython3-curses tar python3-pip \<br>
-=C2=A0 =C2=A0 =C2=A0python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 =
libSDL-devel xterm rpcgen<br>
+=C2=A0 =C2=A0 =C2=A0python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 =
libSDL-devel xterm rpcgen Mesa-dri-devel<br>
=C2=A0 =C2=A0 =C2=A0 $ sudo pip3 install GitPython&quot;&gt;<br>
=C2=A0&lt;!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL &quot;-y epel-release<br=
>
=C2=A0 =C2=A0 =C2=A0 $ sudo yum makecache<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000004e53b505a60feace--
