Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AABC4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:10:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.84998.1701958201282184067
 for <docs@lists.yoctoproject.org>;
 Thu, 07 Dec 2023 06:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=OWbqqord;
 spf=pass (domain: snapchat.com, ip: 209.85.218.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1ca24776c3so419197366b.0
        for <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 06:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1701958200; x=1702563000; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xDh8xYVoDBi3c9jho/qh+Lkir1lOSvgXyS5CtFPweb4=;
        b=OWbqqordUK4J5C1zYOyE4iNOQ7OEOveVADdVw1d/F3Yy0TIs+aHkQxBmZTqV7W02/e
         ACbBofrJKxGIKSCOnnV21651E52nAXGWjw5jPqxNLn8UCIJ82y/OH1C3nDEq0laNaDsw
         vBayYb27HmVrjYH1SVlEPuZSBV6icu6DdoRl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958200; x=1702563000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDh8xYVoDBi3c9jho/qh+Lkir1lOSvgXyS5CtFPweb4=;
        b=HORmSkFVG5oMTJRv9EvNHL7I540MJGt/N9FCIwJOx2eTsA8Q3Pc9cd9BJjOsJVGtUz
         X11Q6DPMmJuqQ+9+JpRWQ8ZfODyXN6BLMka9WfcFx39vDWewl+EMuWB/Ap6dXV2kMe2z
         xL4oXWpsv0+pG4maGhf3wc2E2c4/OU5r3Xjxa7Sv+Bdg0fvFFtuhtEXyyqLq4JCfzPzU
         pcoseS+frJ298lQcK4IfRlo/9zbMBTSotSOcXhCJEreMK/h9mF9rgAFlfgh3eeD3aijz
         jv+nMzq6/Y35EFPWWgLPy1vONucI4S10XC2TEByZrZbzx+JZRcplJ2FWrUpmwmdSSl4c
         NC1g==
X-Gm-Message-State: AOJu0YzOEth+Q4TS7wTZRsgcAtScxU2w9q6v21sP4dD2GnJMgHwVo5pp
	27v1sDydxj2GaSWe1ZWhTYbbihiQ2N7F4Nj2urUxyQ==
X-Google-Smtp-Source: AGHT+IG8Z/RJMzbzSpoxwcTL05kqODs/JJK9V1o3aOJu0nSjLnLgbShrHgkOEJPkSXfYzLOu2B5gH7/TRcI9vWOxCdU=
X-Received: by 2002:a17:906:92:b0:a1e:3254:d461 with SMTP id
 18-20020a170906009200b00a1e3254d461mr2056639ejc.50.1701958199434; Thu, 07 Dec
 2023 06:09:59 -0800 (PST)
MIME-Version: 1.0
References: <179E91E4E2B2BCFA.29440@lists.yoctoproject.org>
In-Reply-To: <179E91E4E2B2BCFA.29440@lists.yoctoproject.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 7 Dec 2023 15:09:48 +0100
Message-ID: <CAHUKmYYiR=CyJXSDAgT6BNr7LMCiQr=24nD5NNgH=xPRvT0OhA@mail.gmail.com>
Subject: Re: [docs][PATCH v2] manuals: document minidebuginfo
To: ecordonnier@snap.com
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e6ede2060bec05fa"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 07 Dec 2023 14:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4667

--000000000000e6ede2060bec05fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch v2: Fixed grammar according to Ulrich's feedback:
s/of 5 to 10%/by 5 to 10%/

Etienne

On Thu, Dec 7, 2023 at 3:08=E2=80=AFPM Etienne Cordonnier via lists.yoctopr=
oject.org
<ecordonnier=3Dsnap.com@lists.yoctoproject.org> wrote:

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
> index fea2cb30a..12694b01b 100644
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
> +Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF section
> ".gnu_debugdata"
> +to all binary files, containing only function names, and thus increasing
> the size of the
> +binaries only by 5 to 10%. For comparison, full debug symbols can be 10
> times as big as
> +a stripped binary, and it is thus not always possible to deploy full
> debug symbols.
> +Minidebuginfo data allows, on the one side, to retrieve a call-stack usi=
ng
> +gdb (command backtrace) without deploying full debug-symbols to the
> target. It also
> +allows to retrieve a symbolicated call-stack when using systemd-coredump
> to manage
> +coredumps (commands "coredumpctl list" and "coredumpctl info").
> +
> +This feature was created by Fedora, see
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_=
wiki_Features_MiniDebugInfo&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYXeDmFamWpT=
6qC-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&s=3DnLuMgeFeJNMlIMiWN=
8PUROk-3ig9Cm7VHE0J-vVeP2A&e=3D
> for
> +more details.
> +
>  Other Debugging Tips
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/documentation/ref-manual/features.rst
> b/documentation/ref-manual/features.rst
> index dd14339bc..1320c3a58 100644
> --- a/documentation/ref-manual/features.rst
> +++ b/documentation/ref-manual/features.rst
> @@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
>  -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
>     during boot).
>
> +-  *minidebuginfo:* Add minimal debug symbols
> :ref:`(minidebuginfo)<dev-manual/debugging:enabling minidebuginfo>`
> +   to binary files containing, allowing coredumpctl and gdb to show
> symbolicated stack traces.
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
> View/Reply Online (#4666):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_message_4666&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYXeDmFamWpT6qC=
-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&s=3D7PlaS4qaGHb1v_X9vINb=
ttbEvcXYCom5eXEQCwKZLDA&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_103034540_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYXeDmFamWpT6q=
C-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&s=3D-s69Se9_govdXJfABjA=
cyjYfch1dRtFTX3-t-DsOAfU&e=3D
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DYXeDmFamWpT6qC-yFNYvN=
IC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&s=3DWPXYi_eDq2Maud3rxLAD1r5pjG3=
pCDifwZaOYRBJMeM&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e6ede2060bec05fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patch v2: Fixed grammar according to Ulrich&#39;s feedback=
:<br>s/of 5 to 10%/by 5 to 10%/<br><br>Etienne</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 7, 2023 at 3:08=
=E2=80=AFPM Etienne Cordonnier via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@l=
ists.yoctoproject.org">snap.com@lists.yoctoproject.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Etienne Cordonn=
ier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonni=
er@snap.com</a>&gt;<br>
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
index fea2cb30a..12694b01b 100644<br>
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
+Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF section &=
quot;.gnu_debugdata&quot;<br>
+to all binary files, containing only function names, and thus increasing t=
he size of the<br>
+binaries only by 5 to 10%. For comparison, full debug symbols can be 10 ti=
mes as big as<br>
+a stripped binary, and it is thus not always possible to deploy full debug=
 symbols.<br>
+Minidebuginfo data allows, on the one side, to retrieve a call-stack using=
<br>
+gdb (command backtrace) without deploying full debug-symbols to the target=
. It also<br>
+allows to retrieve a symbolicated call-stack when using systemd-coredump t=
o manage<br>
+coredumps (commands &quot;coredumpctl list&quot; and &quot;coredumpctl inf=
o&quot;).<br>
+<br>
+This feature was created by Fedora, see <a href=3D"https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Features_MiniDebugIn=
fo&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYv=
NIC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&amp;s=3DnLuMgeFeJNMlIMiWN8PURO=
k-3ig9Cm7VHE0J-vVeP2A&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Fea=
tures_MiniDebugInfo&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYXe=
DmFamWpT6qC-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&amp;s=3DnLuMg=
eFeJNMlIMiWN8PUROk-3ig9Cm7VHE0J-vVeP2A&amp;e=3D</a>=C2=A0 for<br>
+more details.<br>
+<br>
=C2=A0Other Debugging Tips<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manu=
al/features.rst<br>
index dd14339bc..1320c3a58 100644<br>
--- a/documentation/ref-manual/features.rst<br>
+++ b/documentation/ref-manual/features.rst<br>
@@ -161,6 +161,9 @@ metadata, as extra layers can define their own:<br>
=C2=A0-=C2=A0 *keyboard:* Include keyboard support (e.g. keymaps will be lo=
aded<br>
=C2=A0 =C2=A0 during boot).<br>
<br>
+-=C2=A0 *minidebuginfo:* Add minimal debug symbols :ref:`(minidebuginfo)&l=
t;dev-manual/debugging:enabling minidebuginfo&gt;`<br>
+=C2=A0 =C2=A0to binary files containing, allowing coredumpctl and gdb to s=
how symbolicated stack traces.<br>
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
View/Reply Online (#4666): <a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_4666&amp;d=3DDwIFaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYvNIC8dcQgCpj0yktlG=
vqpuJU1lflqnaJCc47hrcxEtbdf&amp;s=3D7PlaS4qaGHb1v_X9vINbttbEvcXYCom5eXEQCwK=
ZLDA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_4666&=
amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYvNIC=
8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&amp;s=3D7PlaS4qaGHb1v_X9vINbttbEv=
cXYCom5eXEQCwKZLDA&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.yoctoproject.org_mt_103034540_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lf=
lqnaJCc47hrcxEtbdf&amp;s=3D-s69Se9_govdXJfABjAcyjYfch1dRtFTX3-t-DsOAfU&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_103034540_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYvNIC8dcQgCpj=
0yktlGvqpuJU1lflqnaJCc47hrcxEtbdf&amp;s=3D-s69Se9_govdXJfABjAcyjYfch1dRtFTX=
3-t-DsOAfU&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvj=
IDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lflqnaJCc47hrc=
xEtbdf&amp;s=3DWPXYi_eDq2Maud3rxLAD1r5pjG3pCDifwZaOYRBJMeM&amp;e=3D" rel=3D=
"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncD=
TmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1=
DULJTKUkSGa66m67E&amp;m=3DYXeDmFamWpT6qC-yFNYvNIC8dcQgCpj0yktlGvqpuJU1lflqn=
aJCc47hrcxEtbdf&amp;s=3DWPXYi_eDq2Maud3rxLAD1r5pjG3pCDifwZaOYRBJMeM&amp;e=
=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ec=
ordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e6ede2060bec05fa--

