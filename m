Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
 by mx.groups.io with SMTP id smtpd.web10.4114.1589915097377585753
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2020 12:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bqN5kMaa;
 spf=pass (domain: gmail.com, ip: 209.85.221.193, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f193.google.com with SMTP id 21so106618vkq.6
        for <docs@lists.yoctoproject.org>; Tue, 19 May 2020 12:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhMAR4WJBsMMb0EK/cvON3WZQPvl8RLfz+aqtd5uKVY=;
        b=bqN5kMaanizuVcVNYN2XfOryHJMGKZFkPE826pu+RirulUXH0woQ02d32excRegfHk
         viTnahDoitQQcD/MBqbHrBM243z9vAkNhPeMgbPnMbEEcdjppoabUMuVL/UCs3W+5G7j
         76Ae0ZQFbNL2HVczpchySoTXokq2lJcW3XDcti2TVfJ5gbaH0rXUgolUXPfyIL8AW+YG
         yrYtaHaNvzCny4iCj5p0jVC4vS12LtHgSgLkmau/gTuCRlT0io/UzIrxtI624P/dgIQM
         R3jvJMyzIRsYRxIQSwTnSuqCISKpb80lNzBbXfa9u5ufIrr+7UQkuweP6tNILPP648Y2
         BGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhMAR4WJBsMMb0EK/cvON3WZQPvl8RLfz+aqtd5uKVY=;
        b=Sqr4wEuSHq0PWZK4/Lxs36xzMVLCWFmSMr6xJLsAnGHFMmiC3jcgZgu9TZVQUFagLL
         stIOnCcwEq6xLTGvYLjrdyOR3C5f3hNIDuINO/JfUWeKmDIH3IH+gxtPD+WURXNo321m
         bRCiLTmhHUQZgTdN9sAz2iSDKPzhnhXxnbp2y6X/Oq/AurvZXGcSc4FzRZBNrbRWqcOt
         q6f5uuTLW73eacH/l7jEtPiNj9QFAOdVzgn0VN/5Y50+MHBxygsyGE8TGGwwYXHP/MaT
         4o0/HDrq21tGCdSak+bZJ8QNjfZVwMaWUXITiBZMmglh8Kwuj9wIR3iqT1YVFvSquhlq
         uYbg==
X-Gm-Message-State: AOAM530x4Djba6vnYkquhqmsPlJX3xUf+pcdFzLH1O8ZJ76WiUOMemuE
	n96Usj7SrIxfM4DN6AyWjtCegpL5dsy2cJJPW+I=
X-Google-Smtp-Source: ABdhPJxFC5en8H6w555gEvQskIP2uCykdjDK3WDrDH/6ugGoUR8yHj4YxXvuEfBdR0AiZMyBrrElHUBGM8/QiQ/QytY=
X-Received: by 2002:a1f:b209:: with SMTP id b9mr1174350vkf.9.1589915096301;
 Tue, 19 May 2020 12:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200519173141.20686-1-akuster808@gmail.com>
In-Reply-To: <20200519173141.20686-1-akuster808@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 19 May 2020 21:04:44 +0200
Message-ID: <CANNYZj98u=Qqga1sKO66pVXp0XdAhZZNpWshwbWH_yEPuuRH6w@mail.gmail.com>
Subject: Re: [docs] [PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
To: akuster <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000089d57605a604f4b2"

--00000000000089d57605a604f4b2
Content-Type: text/plain; charset="UTF-8"

Should be capitalized: Mesa-dri-devel.

Also, the equivalents for other distributions should be added, specifically
packages which contain dri.pc pkg-config file.

Alex

On Tue, 19 May 2020 at 19:31, akuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  documentation/poky.ent | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index a54793911a..fd8c335868 100755
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
> xterm rpcgen mesa-dri-devel
>       $ sudo pip3 install GitPython">
>  <!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
>       $ sudo yum makecache
> --
> 2.17.1
>
> 
>

--00000000000089d57605a604f4b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Should be capitalized: Mesa-dri-devel.</div><div><br>=
</div><div>Also, the equivalents for other distributions should be added, s=
pecifically packages which contain dri.pc pkg-config file.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 19 May 2020 at 19:31, akuster &lt;<a href=3D=
"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Armin Kust=
er &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808=
@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/poky.ent | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/documentation/poky.ent b/documentation/poky.ent<br>
index a54793911a..fd8c335868 100755<br>
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
libSDL-devel xterm rpcgen mesa-dri-devel<br>
=C2=A0 =C2=A0 =C2=A0 $ sudo pip3 install GitPython&quot;&gt;<br>
=C2=A0&lt;!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL &quot;-y epel-release<br=
>
=C2=A0 =C2=A0 =C2=A0 $ sudo yum makecache<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000089d57605a604f4b2--
