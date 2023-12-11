Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50FC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:10:12 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.5249.1702289404457467314
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 02:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=UB9YcwQY;
 spf=pass (domain: snapchat.com, ip: 209.85.218.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a00cbb83c80so481873766b.0
        for <docs@lists.yoctoproject.org>; Mon, 11 Dec 2023 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702289403; x=1702894203; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wjHH+WJf6fTCdQWWRNaCTh3Yn+LHfuEsj6cLT6pBlYc=;
        b=UB9YcwQYIzeo07Dtlb1nlwJaqVHwTZ70wYxJIpJoIYPf7RjYI5hIaTv/8Wpj4VPNQT
         a2KXecfk9rPRuxEBulq95KMhw1SPCtpenBnytq5giix0nGnohhHMZnHCRybPY4m2diLC
         uQ5ARBB+wFU7tyBtYOkEs2C/y2PrCky6n6rGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289403; x=1702894203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wjHH+WJf6fTCdQWWRNaCTh3Yn+LHfuEsj6cLT6pBlYc=;
        b=cvI30ChDykXQqyOmhv4UVAP+RVIP9sABigT3vgP8h2nbgTzmulK4csvZLNOawKUVo1
         sSM1PzVy2us/AQOkuH02L25klngD8IW7KBqdU4xY+YxsnVvc/CifMgATifaw8V+krcAt
         kid55bPH5vMJhuFj/nYAQXXK4BADbixZXYrrfjUtSlPT758cIq+HOUPZTgcRhBmQcYrc
         QjXVIaGEC7gZqnQ9MG/Ip/wpcynTlYOWRY4vBYWyLKwry5QU6LtJhYBgo4jbuel118cx
         DG9v1kz3unqhRx9vl0N3J9NNb4Wwcw+EhzQ3cKdmPt17PesdRAFHaQbNvcUlzSjDoT5D
         x9xg==
X-Gm-Message-State: AOJu0Yxa4ry7RKMK+3T/ImOgYjATwx4lYdwYTJ6/zm9RWNt3BbIvHVkR
	QWWNNVn5S7igJ9gv3tS6yU1gkAalEqhmDTFgYVv/nHXwOGQFX1DY5s8=
X-Google-Smtp-Source: AGHT+IEC8nnV9WCoK7HW9q6aO0+CjBlLx0ZqNw38mGGUJ6zAwiEL/0AKSJP4P6AY8ZvTRk2Vq6nJmsOIE2V7ohUusoU=
X-Received: by 2002:a17:907:2596:b0:a19:a19a:eaaa with SMTP id
 ad22-20020a170907259600b00a19a19aeaaamr1743377ejc.99.1702289402866; Mon, 11
 Dec 2023 02:10:02 -0800 (PST)
MIME-Version: 1.0
References: <179FBEBF1C225050.24323@lists.yoctoproject.org>
In-Reply-To: <179FBEBF1C225050.24323@lists.yoctoproject.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 11 Dec 2023 11:09:52 +0100
Message-ID: <CAHUKmYb_J2CqUvx=Chcmg8gQa5W9DTbymHaBaFQxZNF3gNgN_Q@mail.gmail.com>
Subject: Re: [docs][PATCH v3] manuals: document minidebuginfo
To: ecordonnier@snap.com
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002a29ee060c39231b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Dec 2023 10:10:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4674

--0000000000002a29ee060c39231b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v3 of the patch: implemented feedback of  Michael Opdenacker


On Mon, Dec 11, 2023 at 11:01=E2=80=AFAM Etienne Cordonnier via
lists.yoctoproject.org <ecordonnier=3Dsnap.com@lists.yoctoproject.org> wrot=
e:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  documentation/dev-manual/debugging.rst | 15 +++++++++++++++
>  documentation/ref-manual/features.rst  |  3 +++
>  2 files changed, 18 insertions(+)
>
> diff --git a/documentation/dev-manual/debugging.rst
> b/documentation/dev-manual/debugging.rst
> index fea2cb30a..b12dc284f 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do the
> following:
>     Consider that this will reduce the application's performance and is
>     recommended only for debugging purposes.
>
> +Enabling Minidebuginfo
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Enabling the :term:`DISTRO_FEATURES` minidebuginfo adds a compressed ELF
> section ``.gnu_debugdata``
> +to all binary files, containing only function names, and thus increasing
> the size of the
> +binaries only by 5 to 10%. For comparison, full debug symbols can be 10
> times as big as
> +a stripped binary, and it is thus not always possible to deploy full
> debug symbols.
> +Minidebuginfo data allows, on the one side, to retrieve a call-stack usi=
ng
> +GDB (command backtrace) without deploying full debug symbols to the
> target. It also
> +allows to retrieve a symbolicated call-stack when using
> ``systemd-coredump`` to manage
> +coredumps (commands ``coredumpctl list`` and ``coredumpctl info``).
> +
> +This feature was created by Fedora, see
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_=
wiki_Features_MiniDebugInfo&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DvDt1_X7POBA=
HcGehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&s=3DOk_SWBcsPgxZEk2l_=
Jm-vio0sz8uHQ4PKMTpKzd3VOk&e=3D
> for
> +more details.
> +
>  Other Debugging Tips
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/documentation/ref-manual/features.rst
> b/documentation/ref-manual/features.rst
> index dd14339bc..b9d3b30f1 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
>  -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
>     during boot).
>
> +-  *minidebuginfo:* Add minimal debug symbols
> :ref:`(minidebuginfo)<dev-manual/debugging:enabling minidebuginfo>`
> +   to binary files containing, allowing ``coredumpctl`` and ``gdb`` to
> show symbolicated stack traces.
> +
>  -  *multiarch:* Enable building applications with multiple architecture
>     support.
>
> --
> 2.36.1.vfs.0.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4672):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_message_4672&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DvDt1_X7POBAHcG=
ehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&s=3DJCr6PqJ-NLnFV3liItW6=
-fha6S55zl_u0yM3goUFPmk&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_103105997_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DvDt1_X7POBAHc=
GehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&s=3DClsIna0CQXzIj8FL8pj=
oZ2Fd55V_PqvStm_vLdRY1ps&e=3D
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DvDt1_X7POBAHcGehPe3ik=
0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&s=3D0MXnC_FMQeban-zqknf7r8y06cd=
HK_qUw32qh0ryEys&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002a29ee060c39231b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v3 of the patch: implemented feedback of=C2=A0	Michael Opd=
enacker <table cellpadding=3D"0" class=3D"gmail-ajC" style=3D"border-spacin=
g:0px;line-height:20px;font-family:&quot;Google Sans&quot;,Roboto,RobotoDra=
ft,Helvetica,Arial,sans-serif;font-size:14px"><tbody><tr class=3D"gmail-Usz=
Gxc gmail-ajv"><td colspan=3D"2" tabindex=3D"0" class=3D"gmail-gL" style=3D=
"vertical-align:top;width:auto;padding:2px 0px"><span class=3D"gmail-gI" st=
yle=3D"vertical-align:top"><span class=3D"gmail-qu" role=3D"gridcell" tabin=
dex=3D"-1" style=3D"outline:none"><span name=3D"Michael Opdenacker" class=
=3D"gmail-gD" style=3D"color:rgb(31,31,31);font-size:0.875rem;font-weight:b=
old;display:inline;vertical-align:top;line-height:20px"><span style=3D"vert=
ical-align:top"><br></span></span></span></span></td></tr></tbody></table><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Dec 11, 2023 at 11:01=E2=80=AFAM Etienne Cordonnier via <a href=3D"h=
ttp://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;ecordonnier=3D=
<a href=3D"mailto:snap.com@lists.yoctoproject.org">snap.com@lists.yoctoproj=
ect.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com"=
 target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0documentation/dev-manual/debugging.rst | 15 +++++++++++++++<br>
=C2=A0documentation/ref-manual/features.rst=C2=A0 |=C2=A0 3 +++<br>
=C2=A02 files changed, 18 insertions(+)<br>
<br>
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-man=
ual/debugging.rst<br>
index fea2cb30a..b12dc284f 100644<br>
--- a/documentation/dev-manual/debugging.rst<br>
+++ b/documentation/dev-manual/debugging.rst<br>
@@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do the f=
ollowing:<br>
=C2=A0 =C2=A0 Consider that this will reduce the application&#39;s performa=
nce and is<br>
=C2=A0 =C2=A0 recommended only for debugging purposes.<br>
<br>
+Enabling Minidebuginfo<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Enabling the :term:`DISTRO_FEATURES` minidebuginfo adds a compressed ELF s=
ection ``.gnu_debugdata``<br>
+to all binary files, containing only function names, and thus increasing t=
he size of the<br>
+binaries only by 5 to 10%. For comparison, full debug symbols can be 10 ti=
mes as big as<br>
+a stripped binary, and it is thus not always possible to deploy full debug=
 symbols.<br>
+Minidebuginfo data allows, on the one side, to retrieve a call-stack using=
<br>
+GDB (command backtrace) without deploying full debug symbols to the target=
. It also<br>
+allows to retrieve a symbolicated call-stack when using ``systemd-coredump=
`` to manage<br>
+coredumps (commands ``coredumpctl list`` and ``coredumpctl info``).<br>
+<br>
+This feature was created by Fedora, see <a href=3D"https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Features_MiniDebugIn=
fo&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DvDt1_X7POBAHcGehPe3i=
k0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&amp;s=3DOk_SWBcsPgxZEk2l_Jm-vi=
o0sz8uHQ4PKMTpKzd3VOk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Fea=
tures_MiniDebugInfo&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DvDt=
1_X7POBAHcGehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&amp;s=3DOk_SW=
BcsPgxZEk2l_Jm-vio0sz8uHQ4PKMTpKzd3VOk&amp;e=3D</a>=C2=A0 for<br>
+more details.<br>
+<br>
=C2=A0Other Debugging Tips<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst<br>
index dd14339bc..b9d3b30f1 100644<br>
--- a/documentation/ref-manual/features.rst<br>
+++ b/documentation/ref-manual/features.rst<br>
@@ -161,6 +161,9 @@ metadata, as extra layers can define their own:<br>
=C2=A0-=C2=A0 *keyboard:* Include keyboard support (e.g. keymaps will be lo=
aded<br>
=C2=A0 =C2=A0 during boot).<br>
<br>
+-=C2=A0 *minidebuginfo:* Add minimal debug symbols :ref:`(minidebuginfo)&l=
t;dev-manual/debugging:enabling minidebuginfo&gt;`<br>
+=C2=A0 =C2=A0to binary files containing, allowing ``coredumpctl`` and ``gd=
b`` to show symbolicated stack traces.<br>
+<br>
=C2=A0-=C2=A0 *multiarch:* Enable building applications with multiple archi=
tecture<br>
=C2=A0 =C2=A0 support.<br>
<br>
-- <br>
2.36.1.vfs.0.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#4672): <a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_4672&amp;d=3DDwIFaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DvDt1_X7POBAHcGehPe3ik0sGLll7WzlCH4W4-=
ZuMuJfOwHXsvL4rW_X8pojKevL5&amp;s=3DJCr6PqJ-NLnFV3liItW6-fha6S55zl_u0yM3goU=
FPmk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_4672&=
amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DvDt1_X7POBAHcGehPe3ik0s=
GLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&amp;s=3DJCr6PqJ-NLnFV3liItW6-fha6=
S55zl_u0yM3goUFPmk&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.yoctoproject.org_mt_103105997_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DvDt1_X7POBAHcGehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwH=
XsvL4rW_X8pojKevL5&amp;s=3DClsIna0CQXzIj8FL8pjoZ2Fd55V_PqvStm_vLdRY1ps&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_103105997_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DvDt1_X7POBAHcGehPe3ik0sGLll7Wzl=
CH4W4-ZuMuJfOwHXsvL4rW_X8pojKevL5&amp;s=3DClsIna0CQXzIj8FL8pjoZ2Fd55V_PqvSt=
m_vLdRY1ps&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvj=
IDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&amp;m=3DvDt1_X7POBAHcGehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwHXsvL4rW_X8po=
jKevL5&amp;s=3D0MXnC_FMQeban-zqknf7r8y06cdHK_qUw32qh0ryEys&amp;e=3D" rel=3D=
"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncD=
TmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1=
DULJTKUkSGa66m67E&amp;m=3DvDt1_X7POBAHcGehPe3ik0sGLll7WzlCH4W4-ZuMuJfOwHXsv=
L4rW_X8pojKevL5&amp;s=3D0MXnC_FMQeban-zqknf7r8y06cdHK_qUw32qh0ryEys&amp;e=
=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ec=
ordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002a29ee060c39231b--

