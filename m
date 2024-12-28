Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C413E77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 20:46:10 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.35256.1735418763308712255
 for <docs@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 12:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ggYk+kEU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53f757134cdso8992348e87.2
        for <docs@lists.yoctoproject.org>; Sat, 28 Dec 2024 12:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735418761; x=1736023561; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dvdO5JMATm310FKx/i5LtTfyhFDv585mhYG9jm69vVo=;
        b=ggYk+kEU3lvROtcDjRvW0/vv8XR2AKumO9Q0V9fUItrtjLhHaU3HiI7i4YwNLsWslW
         XzvIq5kP+W53La7CbbLH4FWfz3mv90+YMpn/v8hohUfkpygbp3PzTQwcqX6yx6PvtCfi
         QsPz/nRuaX0jO7/OMISeKqTW+Po/DeA4Y0k/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735418761; x=1736023561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvdO5JMATm310FKx/i5LtTfyhFDv585mhYG9jm69vVo=;
        b=mnpPFHivMb9CJVEafwMRaaeAyYjQlTya3TSfSd1ONjqEJdglXa+eqmkLjUjHKeCIpH
         EIWEx9KekY0JuxeR1OdVHqzRzjXj+F7l3PuYIBKDoiuhZIlwcmG9irOJ/g27qMjUuLO/
         cN0lP5Nj8jOvOR5uxckQwlFxU3hHkXy5ZMXGKv32uKW15EUHVh/iyd1XJKfpnPLzUabD
         +eC1JbDUCubDSrNrau1mDDb90HjdYDp/SaJzYhQIpnNUk24HyvEnqWcxIROuNWxh/mbu
         EB0+ekQded5Yo9/tWQaJs5hW2gl9EJ9VIIoFM84/gVcj+FcJL4UaKKcbT2zWOOLZP6MZ
         E++w==
X-Gm-Message-State: AOJu0YwNx/Vg/+jCsu9Sw4UI9N5mZ4aald64FbhbsRjLjXb9ctFLAM46
	GR8Sk5F4XuyCuorLxU2kasOe+KlDnS3lIj9NHb/JivB/s8DhmL6lzKRnjIlD4WOIPnvFup3Fv9n
	jLwtMGkspzClpEvb7S1sBHXtLChmvlhjVb8O5uw==
X-Gm-Gg: ASbGnctjc9h0cWmZgPYCk4uuiUzDnrT3B2p+YfKjL0B1zpE31kqacvMG7fRgHGOMFSo
	PYCN/HV1k0Qn0wuM1zg/VnV0NYrjp49APlnH/NI6o1k6gbHqcSjf6x25Vtxpe2bzZgO87uM2z
X-Google-Smtp-Source: AGHT+IEVnKRo0EoNoA5Fi31xIho/I/U1IHzESkp0frYT5rcIOipTgqOWFgsfts3hWogqpvfXXCY61hjELlKeLjhPZiw=
X-Received: by 2002:a05:6512:10cc:b0:53d:f177:51c2 with SMTP id
 2adb3069b0e04-542295246famr9055180e87.11.1735418760844; Sat, 28 Dec 2024
 12:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
In-Reply-To: <20241227-update-autobuilder-link-v1-1-6c1ec14a32fd@bootlin.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Sat, 28 Dec 2024 10:45:49 -1000
Message-ID: <CADfgfobhK_b+kyi2QDFbMR1=CkKziGTFdMCX1SGxkJ7VmR+i_A@mail.gmail.com>
Subject: Re: [docs] [PATCH] Update autobuilder URLs to valkyrie
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000c6f41e062a5aaaf0"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 28 Dec 2024 20:46:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6050

--000000000000c6f41e062a5aaaf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looking over this patch I think it would be better to move the typhoon
archive and valkyrie onto the same server.


   - https://autobuilder.yoctoproject.org/typhoon/#/
   - https://autobuilder.yoctoproject.org/valkryie/#/


I will redirect from valkyrie.yoctoproject.org to
https://autobuilder.yoctoproject.org/valkryie/#/

I'll make the changes this weekend.

On Thu, Dec 26, 2024 at 11:11=E2=80=AFPM Antonin Godard via lists.yoctoproj=
ect.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:

> We have moved to Valkyrie which is hosted on
> https://valkyrie.yoctoproject.org. Update the URL in the documentation.
>
> Also, the YOCTO_AB_URL macro was used in a single location in the
> documentation so replace it by the :yocto_ab: custom extlink and remove
> the macro.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/README                                 | 2 +-
>  documentation/conf.py                                | 2 +-
>  documentation/poky.yaml.in                           | 1 -
>  documentation/ref-manual/release-process.rst         | 2 +-
>  documentation/test-manual/reproducible-builds.rst    | 8 ++++----
>  documentation/test-manual/test-process.rst           | 2 +-
>  documentation/test-manual/understand-autobuilder.rst | 2 +-
>  7 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/documentation/README b/documentation/README
> index
> 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..043c703f38a0fe96682a3e426431fac=
b64e8afd2
> 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -357,7 +357,7 @@ the 'documentation/conf.py' file:
>    'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
>    'yocto_lists': ('https://lists.yoctoproject.org%s', None),
>    'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
> -  'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
> +  'yocto_ab': ('https://valkyrie.yoctoproject.org%s', None),
>    'yocto_docs': ('https://docs.yoctoproject.org%s', None),
>    'yocto_git': ('https://git.yoctoproject.org%s', None),
>    'oe_home': ('https://www.openembedded.org%s', None),
> diff --git a/documentation/conf.py b/documentation/conf.py
> index
> b0e7c91eb5d8e4e855c0ca46351586cdf237fcb3..59d7fb4fa19075292955e4618193670=
491fc2bff
> 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -98,7 +98,7 @@ extlinks =3D {
>      'yocto_dl': ('https://downloads.yoctoproject.org%s', None),
>      'yocto_lists': ('https://lists.yoctoproject.org%s', None),
>      'yocto_bugs': ('https://bugzilla.yoctoproject.org%s', None),
> -    'yocto_ab': ('https://autobuilder.yoctoproject.org%s', None),
> +    'yocto_ab': ('https://valkyrie.yoctoproject.org%s', None),
>      'yocto_docs': ('https://docs.yoctoproject.org%s', None),
>      'yocto_git': ('https://git.yoctoproject.org%s', None),
>      'yocto_sstate': ('http://sstate.yoctoproject.org%s', None),
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index
> 0933cbbd351985899ecaea94ae42748bd7ba1753..d045ff596e6d7d7d46be373078e8bb8=
b38483267
> 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -12,7 +12,6 @@ DISTRO_REL_TAG : "yocto-5.1"
>  DOCCONF_VERSION : "dev"
>  BITBAKE_SERIES : ""
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
> -YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>  MIN_PYTHON_VERSION : "3.8.0"
>  MIN_TAR_VERSION : "1.28"
> diff --git a/documentation/ref-manual/release-process.rst
> b/documentation/ref-manual/release-process.rst
> index
> 691e7d3ed90c98e43e558809828b5094670ccca3..4b54909c54cbcbabcf4818602d243c7=
882e5e5d7
> 100644
> --- a/documentation/ref-manual/release-process.rst
> +++ b/documentation/ref-manual/release-process.rst
> @@ -190,7 +190,7 @@ effort has been made to automate the tests so that
> more people can use
>  them and the Yocto Project development team can run them faster and more
>  efficiently.
>
> -The Yocto Project's main Autobuilder (&YOCTO_AB_URL;) publicly tests eac=
h
> Yocto
> +The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each
> Yocto
>  Project release's code in the :oe_git:`openembedded-core
> </openembedded-core>`,
>  :yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories.
> The
>  testing occurs for both the current state of the "master" branch and als=
o
> for
> diff --git a/documentation/test-manual/reproducible-builds.rst
> b/documentation/test-manual/reproducible-builds.rst
> index
> 91f94a5c74e8e0387f1857cbbdf38e7170bb5248..c90be49223deb52ef5632b984417331=
cfcef3a1c
> 100644
> --- a/documentation/test-manual/reproducible-builds.rst
> +++ b/documentation/test-manual/reproducible-builds.rst
> @@ -113,10 +113,10 @@ The project's current reproducibility status can be
> seen at
>
>  You can also check the reproducibility status on supported host
> distributions:
>
> --  CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
> --  Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
> --  Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
> --  Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
> +-  CentOS: :yocto_ab:`/#/builders/reproducible-centos`
> +-  Debian: :yocto_ab:`/#/builders/reproducible-debian`
> +-  Fedora: :yocto_ab:`/#/builders/reproducible-fedora`
> +-  Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`
>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>  Can I test my layer or recipes?
> diff --git a/documentation/test-manual/test-process.rst
> b/documentation/test-manual/test-process.rst
> index
> 7bec5ba8285cda1d6b0157c38eb693fde7d0e557..60e71f02691ef5be7cbd8a0f7a5454b=
c3bfff5ea
> 100644
> --- a/documentation/test-manual/test-process.rst
> +++ b/documentation/test-manual/test-process.rst
> @@ -20,7 +20,7 @@ helps review and test patches and this is his testing
> tree).
>  We have two broad categories of test builds, including "full" and
>  "quick". On the Autobuilder, these can be seen as "a-quick" and
>  "a-full", simply for ease of sorting in the UI. Use our Autobuilder
> -:yocto_ab:`console view </typhoon/#/console>` to see where we manage mos=
t
> +:yocto_ab:`console view </#/console>` to see where we manage most
>  test-related items.
>
>  Builds are triggered manually when the test branches are ready. The
> diff --git a/documentation/test-manual/understand-autobuilder.rst
> b/documentation/test-manual/understand-autobuilder.rst
> index
> 6b4fab4f0b2be5a6806db0982e257b9059d15fa7..b30afaa36a5a9c3eae9396d459d56ce=
54c2d2cf2
> 100644
> --- a/documentation/test-manual/understand-autobuilder.rst
> +++ b/documentation/test-manual/understand-autobuilder.rst
> @@ -10,7 +10,7 @@ Execution Flow within the Autobuilder
>  The "a-full" and "a-quick" targets are the usual entry points into the
>  Autobuilder and it makes sense to follow the process through the system
>  starting there. This is best visualized from the :yocto_ab:`Autobuilder
> -Console view </typhoon/#/console>`.
> +Console view </#/console>`.
>
>  Each item along the top of that view represents some "target build" and
>  these targets are all run in parallel. The 'full' build will trigger the
>
> ---
> base-commit: 28850c974a3896895bc921c094071523218d6d07
> change-id: 20241226-update-autobuilder-link-97b19c8c7c88
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6045):
> https://lists.yoctoproject.org/g/docs/message/6045
> Mute This Topic: https://lists.yoctoproject.org/mt/110302612/1003190
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> mhalstead@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000c6f41e062a5aaaf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looking over this patch I think it would be better to move=
 the typhoon archive and valkyrie onto the same server.<div><br></div><div>=
<ul><li><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/</a></li><li><a =
href=3D"https://autobuilder.yoctoproject.org/valkryie/#/" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/valkryie/#/</a></li></ul></div><div><=
br></div><div>I will redirect from=C2=A0<a href=3D"http://valkyrie.yoctopro=
ject.org/" target=3D"_blank">valkyrie.yoctoproject.org</a>=C2=A0to=C2=A0<a =
href=3D"https://autobuilder.yoctoproject.org/valkryie/#/" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/valkryie/#/</a></div><div><br></div><=
div>I&#39;ll make the changes this weekend.=C2=A0</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Dec 26, 2024 at 11:11=E2=80=AFPM Antonin Godard via <a href=3D"ht=
tp://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;antonin.godard=
=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.org">bootlin.com@lists.=
yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">We have moved to Valkyrie which is hosted on<br>
<a href=3D"https://valkyrie.yoctoproject.org" rel=3D"noreferrer" target=3D"=
_blank">https://valkyrie.yoctoproject.org</a>. Update the URL in the docume=
ntation.<br>
<br>
Also, the YOCTO_AB_URL macro was used in a single location in the<br>
documentation so replace it by the :yocto_ab: custom extlink and remove<br>
the macro.<br>
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
=C2=A0documentation/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
=C2=A0documentation/conf.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferrer" targ=
et=3D"_blank">poky.yaml.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0documentation/ref-manual/release-process.rst=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0documentation/test-manual/reproducible-builds.rst=C2=A0 =C2=A0 | 8 ++=
++----<br>
=C2=A0documentation/test-manual/test-process.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0documentation/test-manual/understand-autobuilder.rst | 2 +-<br>
=C2=A07 files changed, 9 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/documentation/README b/documentation/README<br>
index 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..043c703f38a0fe96682a3e42643=
1facb64e8afd2 100644<br>
--- a/documentation/README<br>
+++ b/documentation/README<br>
@@ -357,7 +357,7 @@ the &#39;documentation/conf.py&#39; file:<br>
=C2=A0 =C2=A0&#39;yocto_dl&#39;: (&#39;<a href=3D"https://downloads.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">https://downloads.yoctoproj=
ect.org</a>%s&#39;, None),<br>
=C2=A0 =C2=A0&#39;yocto_lists&#39;: (&#39;<a href=3D"https://lists.yoctopro=
ject.org" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg</a>%s&#39;, None),<br>
=C2=A0 =C2=A0&#39;yocto_bugs&#39;: (&#39;<a href=3D"https://bugzilla.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproj=
ect.org</a>%s&#39;, None),<br>
-=C2=A0 &#39;yocto_ab&#39;: (&#39;<a href=3D"https://autobuilder.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org</a>%s&#39;, None),<br>
+=C2=A0 &#39;yocto_ab&#39;: (&#39;<a href=3D"https://valkyrie.yoctoproject.=
org" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproject.org=
</a>%s&#39;, None),<br>
=C2=A0 =C2=A0&#39;yocto_docs&#39;: (&#39;<a href=3D"https://docs.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org<=
/a>%s&#39;, None),<br>
=C2=A0 =C2=A0&#39;yocto_git&#39;: (&#39;<a href=3D"https://git.yoctoproject=
.org" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org</a>=
%s&#39;, None),<br>
=C2=A0 =C2=A0&#39;oe_home&#39;: (&#39;<a href=3D"https://www.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org</a>%s=
&#39;, None),<br>
diff --git a/documentation/conf.py b/documentation/conf.py<br>
index b0e7c91eb5d8e4e855c0ca46351586cdf237fcb3..59d7fb4fa19075292955e461819=
3670491fc2bff 100644<br>
--- a/documentation/conf.py<br>
+++ b/documentation/conf.py<br>
@@ -98,7 +98,7 @@ extlinks =3D {<br>
=C2=A0 =C2=A0 =C2=A0&#39;yocto_dl&#39;: (&#39;<a href=3D"https://downloads.=
yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">https://downloads.yo=
ctoproject.org</a>%s&#39;, None),<br>
=C2=A0 =C2=A0 =C2=A0&#39;yocto_lists&#39;: (&#39;<a href=3D"https://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org</a>%s&#39;, None),<br>
=C2=A0 =C2=A0 =C2=A0&#39;yocto_bugs&#39;: (&#39;<a href=3D"https://bugzilla=
.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yo=
ctoproject.org</a>%s&#39;, None),<br>
-=C2=A0 =C2=A0 &#39;yocto_ab&#39;: (&#39;<a href=3D"https://autobuilder.yoc=
toproject.org" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoc=
toproject.org</a>%s&#39;, None),<br>
+=C2=A0 =C2=A0 &#39;yocto_ab&#39;: (&#39;<a href=3D"https://valkyrie.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yoctoproj=
ect.org</a>%s&#39;, None),<br>
=C2=A0 =C2=A0 =C2=A0&#39;yocto_docs&#39;: (&#39;<a href=3D"https://docs.yoc=
toproject.org" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproje=
ct.org</a>%s&#39;, None),<br>
=C2=A0 =C2=A0 =C2=A0&#39;yocto_git&#39;: (&#39;<a href=3D"https://git.yocto=
project.org" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org</a>%s&#39;, None),<br>
=C2=A0 =C2=A0 =C2=A0&#39;yocto_sstate&#39;: (&#39;<a href=3D"http://sstate.=
yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">http://sstate.yoctop=
roject.org</a>%s&#39;, None),<br>
diff --git a/documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferre=
r" target=3D"_blank">poky.yaml.in</a> b/documentation/<a href=3D"http://pok=
y.yaml.in" rel=3D"noreferrer" target=3D"_blank">poky.yaml.in</a><br>
index 0933cbbd351985899ecaea94ae42748bd7ba1753..d045ff596e6d7d7d46be373078e=
8bb8b38483267 100644<br>
--- a/documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferrer" targ=
et=3D"_blank">poky.yaml.in</a><br>
+++ b/documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferrer" targ=
et=3D"_blank">poky.yaml.in</a><br>
@@ -12,7 +12,6 @@ DISTRO_REL_TAG : &quot;yocto-5.1&quot;<br>
=C2=A0DOCCONF_VERSION : &quot;dev&quot;<br>
=C2=A0BITBAKE_SERIES : &quot;&quot;<br>
=C2=A0YOCTO_DL_URL : &quot;<a href=3D"https://downloads.yoctoproject.org" r=
el=3D"noreferrer" target=3D"_blank">https://downloads.yoctoproject.org</a>&=
quot;<br>
-YOCTO_AB_URL : &quot;<a href=3D"https://autobuilder.yoctoproject.org" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org</a>&=
quot;<br>
=C2=A0YOCTO_RELEASE_DL_URL : &quot;&amp;YOCTO_DL_URL;/releases/yocto/yocto-=
&amp;DISTRO;&quot;<br>
=C2=A0MIN_PYTHON_VERSION : &quot;3.8.0&quot;<br>
=C2=A0MIN_TAR_VERSION : &quot;1.28&quot;<br>
diff --git a/documentation/ref-manual/release-process.rst b/documentation/r=
ef-manual/release-process.rst<br>
index 691e7d3ed90c98e43e558809828b5094670ccca3..4b54909c54cbcbabcf4818602d2=
43c7882e5e5d7 100644<br>
--- a/documentation/ref-manual/release-process.rst<br>
+++ b/documentation/ref-manual/release-process.rst<br>
@@ -190,7 +190,7 @@ effort has been made to automate the tests so that more=
 people can use<br>
=C2=A0them and the Yocto Project development team can run them faster and m=
ore<br>
=C2=A0efficiently.<br>
<br>
-The Yocto Project&#39;s main Autobuilder (&amp;YOCTO_AB_URL;) publicly tes=
ts each Yocto<br>
+The Yocto Project&#39;s main :yocto_ab:`Autobuilder &lt;&gt;` publicly tes=
ts each Yocto<br>
=C2=A0Project release&#39;s code in the :oe_git:`openembedded-core &lt;/ope=
nembedded-core&gt;`,<br>
=C2=A0:yocto_git:`poky &lt;/poky&gt;` and :oe_git:`bitbake &lt;/bitbake&gt;=
` repositories. The<br>
=C2=A0testing occurs for both the current state of the &quot;master&quot; b=
ranch and also for<br>
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentat=
ion/test-manual/reproducible-builds.rst<br>
index 91f94a5c74e8e0387f1857cbbdf38e7170bb5248..c90be49223deb52ef5632b98441=
7331cfcef3a1c 100644<br>
--- a/documentation/test-manual/reproducible-builds.rst<br>
+++ b/documentation/test-manual/reproducible-builds.rst<br>
@@ -113,10 +113,10 @@ The project&#39;s current reproducibility status can =
be seen at<br>
<br>
=C2=A0You can also check the reproducibility status on supported host distr=
ibutions:<br>
<br>
--=C2=A0 CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`<br>
--=C2=A0 Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`<br>
--=C2=A0 Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`<br>
--=C2=A0 Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`<br>
+-=C2=A0 CentOS: :yocto_ab:`/#/builders/reproducible-centos`<br>
+-=C2=A0 Debian: :yocto_ab:`/#/builders/reproducible-debian`<br>
+-=C2=A0 Fedora: :yocto_ab:`/#/builders/reproducible-fedora`<br>
+-=C2=A0 Ubuntu: :yocto_ab:`/#/builders/reproducible-ubuntu`<br>
<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0Can I test my layer or recipes?<br>
diff --git a/documentation/test-manual/test-process.rst b/documentation/tes=
t-manual/test-process.rst<br>
index 7bec5ba8285cda1d6b0157c38eb693fde7d0e557..60e71f02691ef5be7cbd8a0f7a5=
454bc3bfff5ea 100644<br>
--- a/documentation/test-manual/test-process.rst<br>
+++ b/documentation/test-manual/test-process.rst<br>
@@ -20,7 +20,7 @@ helps review and test patches and this is his testing tre=
e).<br>
=C2=A0We have two broad categories of test builds, including &quot;full&quo=
t; and<br>
=C2=A0&quot;quick&quot;. On the Autobuilder, these can be seen as &quot;a-q=
uick&quot; and<br>
=C2=A0&quot;a-full&quot;, simply for ease of sorting in the UI. Use our Aut=
obuilder<br>
-:yocto_ab:`console view &lt;/typhoon/#/console&gt;` to see where we manage=
 most<br>
+:yocto_ab:`console view &lt;/#/console&gt;` to see where we manage most<br=
>
=C2=A0test-related items.<br>
<br>
=C2=A0Builds are triggered manually when the test branches are ready. The<b=
r>
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documen=
tation/test-manual/understand-autobuilder.rst<br>
index 6b4fab4f0b2be5a6806db0982e257b9059d15fa7..b30afaa36a5a9c3eae9396d459d=
56ce54c2d2cf2 100644<br>
--- a/documentation/test-manual/understand-autobuilder.rst<br>
+++ b/documentation/test-manual/understand-autobuilder.rst<br>
@@ -10,7 +10,7 @@ Execution Flow within the Autobuilder<br>
=C2=A0The &quot;a-full&quot; and &quot;a-quick&quot; targets are the usual =
entry points into the<br>
=C2=A0Autobuilder and it makes sense to follow the process through the syst=
em<br>
=C2=A0starting there. This is best visualized from the :yocto_ab:`Autobuild=
er<br>
-Console view &lt;/typhoon/#/console&gt;`.<br>
+Console view &lt;/#/console&gt;`.<br>
<br>
=C2=A0Each item along the top of that view represents some &quot;target bui=
ld&quot; and<br>
=C2=A0these targets are all run in parallel. The &#39;full&#39; build will =
trigger the<br>
<br>
---<br>
base-commit: 28850c974a3896895bc921c094071523218d6d07<br>
change-id: 20241226-update-autobuilder-link-97b19c8c7c88<br>
<br>
Best regards,<br>
-- <br>
Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"=
_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#6045): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/6045" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/6045</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110302612/100=
3190" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110302612/1003190</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:mhalstead@linuxfoundation.org" target=3D"_blank">mha=
lstead@linuxfoundation.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Pr=
oject</div><div>Systems Operations Engineer</div></div></div>

--000000000000c6f41e062a5aaaf0--

