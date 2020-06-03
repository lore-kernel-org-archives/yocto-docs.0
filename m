Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.2729.1591210035149480617
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 11:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=y1Axd2uf;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id z5so3302441ejb.3
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2020 11:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fjtd82JTi/HkULYh8P3r+d36djUj1MmqAhgFKgeWWUc=;
        b=y1Axd2ufACusrQ/gxKFvZ1438/bx74utdO9igsGfqeWqODjWhpchp7mhZ5tE4cEaxm
         zuyZcRBBc9VOW8YU9gRT0CLGKzgcKSkSGoWlthTC15wvbqKl5Bon7dbs6lKRyAGkPLhC
         mTippUAKAtcKqWQaglCEhUXJCBjqblGGbmK4dTViZv5K8wn/YUGA+ZGtWMqstbGfO2Qh
         Q55o9Syguf16jlGQg1YUtu4gh9D1gYYMvVg5Cjltt6G+8L/YftFTTSzUJDX0f5w6ZyGf
         k0CjtGjoiOnMsMGYMG8n6YeUOjQYmePHKSD1pa5jEfybVPBA9T2kaWXff4E+F0NkeoFr
         sEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fjtd82JTi/HkULYh8P3r+d36djUj1MmqAhgFKgeWWUc=;
        b=Eose2PvSPOUIKNzpAegWXVZuWjhKiNnJyIHHUl/G9+vIK2VPA5kmEju0emkeVmUFak
         lHwhn0JKjVs7TLx/aXBJb9IYlNuoukB3LwFOerBEQSesF+EPOSBZ5+bWNX0icOlP50c7
         By8LWG3BXnAU/6MVSlGopZRrSKnj1qkfbtGB5X6iArpcv94bUqN0D6bJxJTd3MB3Fzaa
         DhxLsq77xHMOnOvoZW8/rpQp7elnZ2PBpWSNckRayfFe3t92Up4nwtEk7EJxOfnPtYZj
         RaEFpDUy+txc91MmOz9Fvui2h1lOKNnaBgtDY1XVUxYp2YyGx1xYQ1p8luADCinqLOgE
         9HCQ==
X-Gm-Message-State: AOAM530XCiovvEGwS/T3Z8ZqK0tpNy3VKZmOw02GhjwZarR5R80poiOY
	zCS3mehORd3CK2kcrOV2eooaI2bXYYICv5GWSmn5vA==
X-Google-Smtp-Source: ABdhPJyM6b2DcHLrusLDOlOmU4TGtZIKT3yv3rVY99BAPYKnFlQ+/jtfuNSsCyI/oncWDOQBe2ov+p+kHhS0Syn7S8U=
X-Received: by 2002:a17:906:9149:: with SMTP id y9mr579933ejw.153.1591210033453;
 Wed, 03 Jun 2020 11:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591057623.git.steve@sakoman.com> <069c27574bf7333cdf58d9920734bb33c81ecc93.1591057623.git.steve@sakoman.com>
 <d0fa32a3-b193-51de-46c7-750d42c7ed4b@gmail.com>
In-Reply-To: <d0fa32a3-b193-51de-46c7-750d42c7ed4b@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 3 Jun 2020 08:47:01 -1000
Message-ID: <CAOSpxdYgNiMFzc+4Sfh6HU8FVo7QMjdi8K+GmbH+n=LR9HRzxA@mail.gmail.com>
Subject: Re: [docs] [yocto-docs][dunfell 6/6] Documenation: Prepared for the 3.1.1 release
To: akuster808 <akuster808@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You are right of course!  I can swear I changed those, I must be losing it =
:-(

Thanks for the catch!

Steve

On Wed, Jun 3, 2020 at 7:41 AM akuster808 <akuster808@gmail.com> wrote:
>
> I think you are missing some updates, please check these files:
>
> ./kernel-dev/kernel-dev.xml
> ./ref-manual/ref-manual.xml
> ./sdk-manual/sdk-manual.xml
> ./overview-manual/overview-manual.xml
>
> - armin
>
> On 6/1/20 5:28 PM, Steve Sakoman wrote:
>
> ---
>  documentation/bsp-guide/bsp-guide.xml         |  7 ++-
>  documentation/dev-manual/dev-manual.xml       |  7 ++-
>  documentation/mega-manual/mega-manual.xml     |  7 ++-
>  documentation/poky.ent                        | 14 +++---
>  .../profile-manual/profile-manual.xml         |  7 ++-
>  .../toaster-manual/toaster-manual.xml         |  7 ++-
>  documentation/tools/mega-manual.sed           | 46 +++++++++----------
>  7 files changed, 60 insertions(+), 35 deletions(-)
>
> diff --git a/documentation/bsp-guide/bsp-guide.xml b/documentation/bsp-g=
uide/bsp-guide.xml
> index a189606ce..6ab89d653 100755
> --- a/documentation/bsp-guide/bsp-guide.xml
> +++ b/documentation/bsp-guide/bsp-guide.xml
> @@ -127,9 +127,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.=
</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Releas=
e.</revremark>
> +            </revision>
>          </revhistory>
>
>      <copyright>
> diff --git a/documentation/dev-manual/dev-manual.xml b/documentation/dev=
-manual/dev-manual.xml
> index 6f86454ed..5c6b3457f 100755
> --- a/documentation/dev-manual/dev-manual.xml
> +++ b/documentation/dev-manual/dev-manual.xml
> @@ -117,9 +117,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.=
</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Releas=
e.</revremark>
> +            </revision>
>          </revhistory>
>
>      <copyright>
> diff --git a/documentation/mega-manual/mega-manual.xml b/documentation/m=
ega-manual/mega-manual.xml
> index e730f7259..a20843fc1 100755
> --- a/documentation/mega-manual/mega-manual.xml
> +++ b/documentation/mega-manual/mega-manual.xml
> @@ -93,9 +93,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.=
</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Releas=
e.</revremark>
> +            </revision>
>         </revhistory>
>
>      <copyright>
> diff --git a/documentation/poky.ent b/documentation/poky.ent
> index a54793911..0a0deab8f 100755
> --- a/documentation/poky.ent
> +++ b/documentation/poky.ent
> @@ -1,17 +1,17 @@
> -<!ENTITY DISTRO "3.1">
> -<!ENTITY DISTRO_COMPRESSED "31">
> +<!ENTITY DISTRO "3.1.1">
> +<!ENTITY DISTRO_COMPRESSED "311">
>  <!ENTITY DISTRO_NAME_NO_CAP "dunfell">
>  <!ENTITY DISTRO_NAME "Dunfell">
>  <!ENTITY DISTRO_NAME_NO_CAP_MINUS_ONE "zeus">
>  <!ENTITY DISTRO_NAME_MINUS_ONE "Zeus">
> -<!ENTITY YOCTO_DOC_VERSION "3.1">
> +<!ENTITY YOCTO_DOC_VERSION "3.1.1">
>  <!ENTITY YOCTO_DOC_VERSION_MINUS_ONE "3.0.2">
> -<!ENTITY DISTRO_REL_TAG "yocto-3.1">
> +<!ENTITY DISTRO_REL_TAG "yocto-3.1.1">
>  <!ENTITY METAINTELVERSION "12.0">
> -<!ENTITY REL_MONTH_YEAR "April 2020">
> +<!ENTITY REL_MONTH_YEAR "June 2020">
>  <!ENTITY META_INTEL_REL_TAG "&METAINTELVERSION;-&DISTRO_NAME_NO_CAP;-&Y=
OCTO_DOC_VERSION;">
> -<!ENTITY POKYVERSION "23.0.0">
> -<!ENTITY POKYVERSION_COMPRESSED "2300">
> +<!ENTITY POKYVERSION "23.0.1">
> +<!ENTITY POKYVERSION_COMPRESSED "2301">
>  <!ENTITY YOCTO_POKY "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;">
>  <!ENTITY COPYRIGHT_YEAR "2010-2020">
>  <!ENTITY ORGNAME "The Yocto Project">
> diff --git a/documentation/profile-manual/profile-manual.xml b/documenta=
tion/profile-manual/profile-manual.xml
> index fa1fa8ac8..710fb770e 100755
> --- a/documentation/profile-manual/profile-manual.xml
> +++ b/documentation/profile-manual/profile-manual.xml
> @@ -102,9 +102,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.=
</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Releas=
e.</revremark>
> +            </revision>
>          </revhistory>
>
>      <copyright>
> diff --git a/documentation/toaster-manual/toaster-manual.xml b/documenta=
tion/toaster-manual/toaster-manual.xml
> index e6d424523..53d666446 100755
> --- a/documentation/toaster-manual/toaster-manual.xml
> +++ b/documentation/toaster-manual/toaster-manual.xml
> @@ -82,9 +82,14 @@
>              </revision>
>              <revision>
>                  <revnumber>3.1</revnumber>
> -                <date>&REL_MONTH_YEAR;</date>
> +                <date>April 2020</date>
>                  <revremark>Released with the Yocto Project 3.1 Release.=
</revremark>
>              </revision>
> +            <revision>
> +                <revnumber>3.1.1</revnumber>
> +                <date>&REL_MONTH_YEAR;</date>
> +                <revremark>Released with the Yocto Project 3.1.1 Releas=
e.</revremark>
> +            </revision>
>         </revhistory>
>
>      <copyright>
> diff --git a/documentation/tools/mega-manual.sed b/documentation/tools/m=
ega-manual.sed
> index b1ea9edb7..d52f1ebdb 100644
> --- a/documentation/tools/mega-manual.sed
> +++ b/documentation/tools/mega-manual.sed
> @@ -1,36 +1,36 @@
>  # Processes bitbake-user-manual (<word>-<word>-<word> style).
>  # This style is for manual three-word folders, which currently is only =
the BitBake User Manual.
>  # We used to have the "yocto-project-qs" and "poky-ref-manual" folders =
but no longer do.
> -# s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*-=
[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/bitbake-user-man=
ual/bitbake-user-manual.html#@"link" href=3D"#@g
> +# s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]=
*-[a-z]*/[a-z]*-[a-z]*-[a-z]*.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/bitbake-user-m=
anual/bitbake-user-manual.html#@"link" href=3D"#@g
>
>  # Processes all other manuals (<word>-<word> style).
>  # This style is for manual folders that use two word, which is the stan=
dard now (e.g. "ref-manual").
>  # Here is the one-liner:
> -# s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/[a-z]*-[a-z]*/=
[a-z]*-[a-z]*.html#@"link" href=3D"#@g
> +# s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/[a-z]*-[a-z]=
*/[a-z]*-[a-z]*.html#@"link" href=3D"#@g
>
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/sdk-manual/sdk-m=
anual.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/bsp-guide/bsp-gu=
ide.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/dev-manual/dev-m=
anual.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/overview-manual/=
overview-manual.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/brief-yoctoproje=
ctqs/brief-yoctoprojectqs.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/kernel-dev/kerne=
l-dev.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/profile-manual/p=
rofile-manual.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/ref-manual/ref-m=
anual.html#@"link" href=3D"#@g
> -s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/toaster-manual/t=
oaster-manual.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/sdk-manual/sdk=
-manual.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/bsp-guide/bsp-=
guide.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/dev-manual/dev=
-manual.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/overview-manua=
l/overview-manual.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/brief-yoctopro=
jectqs/brief-yoctoprojectqs.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/kernel-dev/ker=
nel-dev.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/profile-manual=
/profile-manual.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/ref-manual/ref=
-manual.html#@"link" href=3D"#@g
> +s@"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/toaster-manual=
/toaster-manual.html#@"link" href=3D"#@g
>
>  # Process cases where just an external manual is referenced without an =
id anchor
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/brief=
-yoctoprojectqs/brief-yoctoprojectqs.html" target=3D"_top">Yocto Project Qu=
ick Build</a>@Yocto Project Quick Build@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/bitba=
ke-user-manual/bitbake-user-manual.html" target=3D"_top">BitBake User Manua=
l</a>@BitBake User Manual@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/dev-m=
anual/dev-manual.html" target=3D"_top">Yocto Project Development Tasks Manu=
al</a>@Yocto Project Development Tasks Manual@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/overv=
iew-manual/overview-manual.html" target=3D"_top">Yocto Project Overview and=
 Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/sdk-m=
anual/sdk-manual.html" target=3D"_top">Yocto Project Application Developmen=
t and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Appl=
ication Development and the Extensible Software Development Kit (eSDK)@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/bsp-g=
uide/bsp-guide.html" target=3D"_top">Yocto Project Board Support Package (B=
SP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Develop=
er's Guide@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/profi=
le-manual/profile-manual.html" target=3D"_top">Yocto Project Profiling and =
Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/kerne=
l-dev/kernel-dev.html" target=3D"_top">Yocto Project Linux Kernel Developme=
nt Manual</a>@Yocto Project Linux Kernel Development Manual@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/ref-m=
anual/ref-manual.html" target=3D"_top">Yocto Project Reference Manual</a>@Y=
octo Project Reference Manual@g
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/toast=
er-manual/toaster-manual.html" target=3D"_top">Toaster User Manual</a>@Toas=
ter User Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/bri=
ef-yoctoprojectqs/brief-yoctoprojectqs.html" target=3D"_top">Yocto Project =
Quick Build</a>@Yocto Project Quick Build@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/bit=
bake-user-manual/bitbake-user-manual.html" target=3D"_top">BitBake User Man=
ual</a>@BitBake User Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/dev=
-manual/dev-manual.html" target=3D"_top">Yocto Project Development Tasks Ma=
nual</a>@Yocto Project Development Tasks Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/ove=
rview-manual/overview-manual.html" target=3D"_top">Yocto Project Overview a=
nd Concepts Manual</a>@Yocto project Overview and Concepts Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/sdk=
-manual/sdk-manual.html" target=3D"_top">Yocto Project Application Developm=
ent and the Extensible Software Development Kit (eSDK)</a>@Yocto Project Ap=
plication Development and the Extensible Software Development Kit (eSDK)@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/bsp=
-guide/bsp-guide.html" target=3D"_top">Yocto Project Board Support Package =
(BSP) Developer's Guide</a>@Yocto Project Board Support Package (BSP) Devel=
oper's Guide@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/pro=
file-manual/profile-manual.html" target=3D"_top">Yocto Project Profiling an=
d Tracing Manual</a>@Yocto Project Profiling and Tracing Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/ker=
nel-dev/kernel-dev.html" target=3D"_top">Yocto Project Linux Kernel Develop=
ment Manual</a>@Yocto Project Linux Kernel Development Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/ref=
-manual/ref-manual.html" target=3D"_top">Yocto Project Reference Manual</a>=
@Yocto Project Reference Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/toa=
ster-manual/toaster-manual.html" target=3D"_top">Toaster User Manual</a>@To=
aster User Manual@g
>
>  # Process a single, rouge occurrence of a linked reference to the Mega-=
Manual.
> -s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1/mega-=
manual/mega-manual.html" target=3D"_top">Yocto Project Mega-Manual</a>@Yoct=
o Project Mega-Manual@g
> +s@<a class=3D"ulink" href=3D"http://www.yoctoproject.org/docs/3.1.1/meg=
a-manual/mega-manual.html" target=3D"_top">Yocto Project Mega-Manual</a>@Yo=
cto Project Mega-Manual@g
>
>
>
>=20
>
>
