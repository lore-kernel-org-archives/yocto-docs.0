Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636A8C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 12:50:50 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.21908.1636980649908513382
 for <docs@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 04:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Htbjt9Su;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: simon.eu@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id s138so6455977pgs.4
        for <docs@lists.yoctoproject.org>;
 Mon, 15 Nov 2021 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6Or5uoraPAzLgObESUj0wj7fu2KbuKikQ4ZdSsi102Y=;
        b=Htbjt9SunAQZ96Qggw7ARin3kDZG104SFXL9/veLmTERVaw3BpqcO3ex1wIy86i34b
         ZEUpEuspQIcOG1Y5ZRF6D/FJvahIAonKpbjAJlLg7x5mtde3hihyijWfGPhE9DD4tRWm
         7TmgJ+aLJJVnqPxoUXLCmItSV46VZkUUbcF0YuyHANkDVdyWk5gNfwTfV50SG2S4NQ0G
         0J7xQ2ispEkgzH5SDMRmnwfvMEWyfLTc57qf45p72ZhENKG4RDpW1zJydImPUL6tyNu2
         +pQ+L0nIbZYThBNQgan4CGYzi+PKDZ/WMLnVaHQh/w9igOZJmoYKg2PlK22btsl06uMB
         y2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6Or5uoraPAzLgObESUj0wj7fu2KbuKikQ4ZdSsi102Y=;
        b=ijXJrqnTn7+1RsvmanJdmAHRBXlEXjqTYJUrI+HloFKXex/TtqE7kgmjTuqgjBpxE8
         PCixZQXwpG2723q2A+hdvygkM206su1yly2I8txx+yfRQtrBLFKWU4CxvaHMmp2wJzmv
         kkoJImAoHlbM0omXnn1ZJ9LuZfl8ILb/PwsNIKi93H+0/aJ+fubRRiAdB5BvhzKG3dFP
         fhbnz6iDdlMoWHL5s/XXW3mCNBfHohMCBQE3AwGHkIRhByzewb0GDmMkkC5ncLumQi3h
         ZkuQDlhSFMTXOUxOFsVU61DxfOI+efCodcHGsSkFpJEffMbCJX0CcwJCHGLp2hVivdSS
         8T7w==
X-Gm-Message-State: AOAM533ILbIO+QyggFZRyKfavYkQsRmYNhfIJ1Pms7E8hXEmrZIpfUu7
	hI5IYz9xmePvIEopSiMdyuHh7DVZKbLZGM2duWCI8sKw
X-Google-Smtp-Source: 
 ABdhPJzdiPcrcqxLU0V1EzCmQvRhGZ16oa3TzrNUy2H8XllKXUkDpHaWno8oh8btN5WdlMbak9ulJF1kRnVNdUhZgJg=
X-Received: by 2002:a63:874a:: with SMTP id i71mr24037770pge.81.1636980649112;
 Mon, 15 Nov 2021 04:50:49 -0800 (PST)
MIME-Version: 1.0
References: <16B7B8F5A0D625BE.25640@lists.yoctoproject.org>
In-Reply-To: <16B7B8F5A0D625BE.25640@lists.yoctoproject.org>
From: Simon Eugster <simon.eu@gmail.com>
Date: Mon, 15 Nov 2021 13:50:37 +0100
Message-ID: 
 <CAO8d5BbVLXWfEAUt7YMTVQnUszUsr+hNLxdPTpSsHj+F9_=fmg@mail.gmail.com>
Subject: Re: [docs] [PATCH] bitbake: doc: bitbake-user-manual: Add more
 explanations to OVERRIDES
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000183dc005d0d3422c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 15 Nov 2021 12:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2154

--000000000000183dc005d0d3422c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wrote this patch as a follow-up to our discussion on IRC last week. Not
sure regarding the MACHINE variable I mentioned =E2=80=93 should/can I link=
 to the
poky docs directly there?

Simon

Am Mo., 15. Nov. 2021 um 13:45 Uhr schrieb Simon A. Eugster via
lists.yoctoproject.org <simon.eu=3Dgmail.com@lists.yoctoproject.org>:

> Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
> ---
>  bitbake/doc/README                            |  3 +-
>  .../bitbake-user-manual-metadata.rst          | 35 +++++++++++++------
>  2 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/bitbake/doc/README b/bitbake/doc/README
> index 16e6cdf990..84e7cb702d 100644
> --- a/bitbake/doc/README
> +++ b/bitbake/doc/README
> @@ -47,8 +47,7 @@ To install all required packages run:
>
>  To build the documentation locally, run:
>
> - $ cd documentation
> - $ make -f Makefile.sphinx html
> + $ make html
>
>  The resulting HTML index page will be _build/html/index.html, and you
>  can browse your own copy of the locally generated documentation with
> diff --git
> a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> index 119720d527..3449bc1f68 100644
> --- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> +++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
> @@ -268,7 +268,7 @@ examples::
>     C =3D "cval"
>     C =3D. "test"
>
> -The variable :term:`B` contains "bvaladditionaldata" and ``C`` contains
> +The variable ``B`` contains "bvaladditionaldata" and ``C`` contains
>  "testcval".
>
>  Appending and Prepending (Override Style Syntax)
> @@ -300,6 +300,12 @@ It is also possible to append and prepend to shell
> functions and
>  BitBake-style Python functions. See the
> ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:shell functions`"
> and ":ref:`bitbake-user-manual/bitbake-user-manual-metadata:bitbake-style
> python functions`"
>  sections for examples.
>
> +.. note::
> +
> +   Before Honister (3.4), override style used ``_`` instead of ``:``, so
> you will
> +   still find a lot of documentation using =E2=80=9C_append=E2=80=9D, =
=E2=80=9C_prepend=E2=80=9D, and
> +   =E2=80=9C_remove=E2=80=9D.
> +
>  .. _removing-override-style-syntax:
>
>  Removal (Override Style Syntax)
> @@ -517,20 +523,21 @@ variable.
>  -  *Selecting a Variable:* The :term:`OVERRIDES` variable is a
>     colon-character-separated list that contains items for which you want
>     to satisfy conditions. Thus, if you have a variable that is
> -   conditional on "arm", and "arm" is in :term:`OVERRIDES`, then the
> +   conditional on "arm", and "arm" is listed in :term:`OVERRIDES`, then
> the
>     "arm"-specific version of the variable is used rather than the
>     non-conditional version. Here is an example::
>
> -      OVERRIDES =3D "architecture:os:machine"
> +      OVERRIDES =3D "foo:linux:arm"
>        TEST =3D "default"
> -      TEST_os =3D "osspecific"
> -      TEST_nooverride =3D "othercondvalue"
> +      TEST:arm =3D "armspecific"
> +      TEST:nooverride =3D "othercondvalue"
>
> -   In this example, the :term:`OVERRIDES`
> -   variable lists three overrides: "architecture", "os", and "machine".
> -   The variable ``TEST`` by itself has a default value of "default". You
> -   select the os-specific version of the ``TEST`` variable by appending
> -   the "os" override to the variable (i.e. ``TEST_os``).
> +   In this example, the :term:`OVERRIDES` variable lists three
> +   overrides: "foo", "linux", and "arm". The variable ``TEST`` by itself
> +   has a default value of "default", and the value of the =E2=80=9Carm=
=E2=80=9D specific
> +   version =E2=80=9Carmspecific=E2=80=9D is used because :term:`OVERRIDE=
S` contains
> +   =E2=80=9Carm=E2=80=9D. The =E2=80=9Cnooverride=E2=80=9D specific vers=
ion is not used because
> +   :term:`OVERRIDES` does not contain =E2=80=9Cnooverride=E2=80=9D.
>
>     To better understand this, consider a practical example that assumes
>     an OpenEmbedded metadata-based Linux kernel recipe file. The
> @@ -546,15 +553,21 @@ variable.
>        KBRANCH:qemux86-64 =3D "standard/common-pc-64/base"
>        KBRANCH:qemumips64 =3D "standard/mti-malta64"
>
> +   This works because in poky the :term:`OVERRIDES` variable by default
> +   includes the ``MACHINE`` variable, which is set to e.g. =E2=80=9Cqemu=
x86=E2=80=9D.
> +
>  -  *Appending and Prepending:* BitBake also supports append and prepend
>     operations to variable values based on whether a specific item is
>     listed in :term:`OVERRIDES`. Here is an example::
>
>        DEPENDS =3D "glibc ncurses"
>        OVERRIDES =3D "machine:local"
> +      DEPENDS:append =3D "defaultappend"
>        DEPENDS:append:machine =3D "libmad"
>
> -   In this example, :term:`DEPENDS` becomes "glibc ncurses libmad".
> +   In this example, :term:`DEPENDS` becomes "glibc ncurses libmad". The
> +   default append is ``DEPENDS:append`` is not used because the override
> +   mechanism choses the specific ``:append``.
>
>     Again, using an OpenEmbedded metadata-based kernel recipe file as an
>     example, the following lines will conditionally append to the
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2153):
> https://lists.yoctoproject.org/g/docs/message/2153
> Mute This Topic: https://lists.yoctoproject.org/mt/87068011/6562396
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> simon.eu@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000183dc005d0d3422c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I wrote this patch as a follow-up to our discussion o=
n IRC last week. Not sure regarding the MACHINE variable I mentioned =E2=80=
=93 should/can I link to the poky docs directly there?</div><div><br></div>=
<div>Simon<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Am Mo., 15. Nov. 2021 um 13:45=C2=A0Uhr schrieb Simon A=
. Eugster via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.=
org</a> &lt;<a href=3D"http://simon.eu">simon.eu</a>=3D<a href=3D"mailto:gm=
ail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt;:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Si=
mon A. Eugster &lt;<a href=3D"mailto:simon.eu@gmail.com" target=3D"_blank">=
simon.eu@gmail.com</a>&gt;<br>
---<br>
=C2=A0bitbake/doc/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A0.../bitbake-user-manual-metadata.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 35 +++++++++++++------<br>
=C2=A02 files changed, 25 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/bitbake/doc/README b/bitbake/doc/README<br>
index 16e6cdf990..84e7cb702d 100644<br>
--- a/bitbake/doc/README<br>
+++ b/bitbake/doc/README<br>
@@ -47,8 +47,7 @@ To install all required packages run:<br>
<br>
=C2=A0To build the documentation locally, run:<br>
<br>
- $ cd documentation<br>
- $ make -f Makefile.sphinx html<br>
+ $ make html<br>
<br>
=C2=A0The resulting HTML index page will be _build/html/index.html, and you=
<br>
=C2=A0can browse your own copy of the locally generated documentation with<=
br>
diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.r=
st b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<br>
index 119720d527..3449bc1f68 100644<br>
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<br>
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst<br>
@@ -268,7 +268,7 @@ examples::<br>
=C2=A0 =C2=A0 C =3D &quot;cval&quot;<br>
=C2=A0 =C2=A0 C =3D. &quot;test&quot;<br>
<br>
-The variable :term:`B` contains &quot;bvaladditionaldata&quot; and ``C`` c=
ontains<br>
+The variable ``B`` contains &quot;bvaladditionaldata&quot; and ``C`` conta=
ins<br>
=C2=A0&quot;testcval&quot;.<br>
<br>
=C2=A0Appending and Prepending (Override Style Syntax)<br>
@@ -300,6 +300,12 @@ It is also possible to append and prepend to shell fun=
ctions and<br>
=C2=A0BitBake-style Python functions. See the &quot;:ref:`bitbake-user-manu=
al/bitbake-user-manual-metadata:shell functions`&quot; and &quot;:ref:`bitb=
ake-user-manual/bitbake-user-manual-metadata:bitbake-style python functions=
`&quot;<br>
=C2=A0sections for examples.<br>
<br>
+.. note::<br>
+<br>
+=C2=A0 =C2=A0Before Honister (3.4), override style used ``_`` instead of `=
`:``, so you will<br>
+=C2=A0 =C2=A0still find a lot of documentation using =E2=80=9C_append=E2=
=80=9D, =E2=80=9C_prepend=E2=80=9D, and<br>
+=C2=A0 =C2=A0=E2=80=9C_remove=E2=80=9D.<br>
+<br>
=C2=A0.. _removing-override-style-syntax:<br>
<br>
=C2=A0Removal (Override Style Syntax)<br>
@@ -517,20 +523,21 @@ variable.<br>
=C2=A0-=C2=A0 *Selecting a Variable:* The :term:`OVERRIDES` variable is a<b=
r>
=C2=A0 =C2=A0 colon-character-separated list that contains items for which =
you want<br>
=C2=A0 =C2=A0 to satisfy conditions. Thus, if you have a variable that is<b=
r>
-=C2=A0 =C2=A0conditional on &quot;arm&quot;, and &quot;arm&quot; is in :te=
rm:`OVERRIDES`, then the<br>
+=C2=A0 =C2=A0conditional on &quot;arm&quot;, and &quot;arm&quot; is listed=
 in :term:`OVERRIDES`, then the<br>
=C2=A0 =C2=A0 &quot;arm&quot;-specific version of the variable is used rath=
er than the<br>
=C2=A0 =C2=A0 non-conditional version. Here is an example::<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;architecture:os:machine&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 OVERRIDES =3D &quot;foo:linux:arm&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST =3D &quot;default&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 TEST_os =3D &quot;osspecific&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 TEST_nooverride =3D &quot;othercondvalue&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 TEST:arm =3D &quot;armspecific&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 TEST:nooverride =3D &quot;othercondvalue&quot;<br>
<br>
-=C2=A0 =C2=A0In this example, the :term:`OVERRIDES`<br>
-=C2=A0 =C2=A0variable lists three overrides: &quot;architecture&quot;, &qu=
ot;os&quot;, and &quot;machine&quot;.<br>
-=C2=A0 =C2=A0The variable ``TEST`` by itself has a default value of &quot;=
default&quot;. You<br>
-=C2=A0 =C2=A0select the os-specific version of the ``TEST`` variable by ap=
pending<br>
-=C2=A0 =C2=A0the &quot;os&quot; override to the variable (i.e. ``TEST_os``=
).<br>
+=C2=A0 =C2=A0In this example, the :term:`OVERRIDES` variable lists three<b=
r>
+=C2=A0 =C2=A0overrides: &quot;foo&quot;, &quot;linux&quot;, and &quot;arm&=
quot;. The variable ``TEST`` by itself<br>
+=C2=A0 =C2=A0has a default value of &quot;default&quot;, and the value of =
the =E2=80=9Carm=E2=80=9D specific<br>
+=C2=A0 =C2=A0version =E2=80=9Carmspecific=E2=80=9D is used because :term:`=
OVERRIDES` contains<br>
+=C2=A0 =C2=A0=E2=80=9Carm=E2=80=9D. The =E2=80=9Cnooverride=E2=80=9D speci=
fic version is not used because<br>
+=C2=A0 =C2=A0:term:`OVERRIDES` does not contain =E2=80=9Cnooverride=E2=80=
=9D.<br>
<br>
=C2=A0 =C2=A0 To better understand this, consider a practical example that =
assumes<br>
=C2=A0 =C2=A0 an OpenEmbedded metadata-based Linux kernel recipe file. The<=
br>
@@ -546,15 +553,21 @@ variable.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0KBRANCH:qemux86-64 =3D &quot;standard/common-pc-=
64/base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0KBRANCH:qemumips64 =3D &quot;standard/mti-malta6=
4&quot;<br>
<br>
+=C2=A0 =C2=A0This works because in poky the :term:`OVERRIDES` variable by =
default<br>
+=C2=A0 =C2=A0includes the ``MACHINE`` variable, which is set to e.g. =E2=
=80=9Cqemux86=E2=80=9D.<br>
+<br>
=C2=A0-=C2=A0 *Appending and Prepending:* BitBake also supports append and =
prepend<br>
=C2=A0 =C2=A0 operations to variable values based on whether a specific ite=
m is<br>
=C2=A0 =C2=A0 listed in :term:`OVERRIDES`. Here is an example::<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DEPENDS =3D &quot;glibc ncurses&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0OVERRIDES =3D &quot;machine:local&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 DEPENDS:append =3D &quot;defaultappend&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0DEPENDS:append:machine =3D &quot;libmad&quot;<br=
>
<br>
-=C2=A0 =C2=A0In this example, :term:`DEPENDS` becomes &quot;glibc ncurses =
libmad&quot;.<br>
+=C2=A0 =C2=A0In this example, :term:`DEPENDS` becomes &quot;glibc ncurses =
libmad&quot;. The<br>
+=C2=A0 =C2=A0default append is ``DEPENDS:append`` is not used because the =
override<br>
+=C2=A0 =C2=A0mechanism choses the specific ``:append``.<br>
<br>
=C2=A0 =C2=A0 Again, using an OpenEmbedded metadata-based kernel recipe fil=
e as an<br>
=C2=A0 =C2=A0 example, the following lines will conditionally append to the=
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2153): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2153" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2153</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87068011/6562=
396" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87068011/6562396</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:simon.eu@gmail.com" target=3D"_blank">simon.eu@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000183dc005d0d3422c--

