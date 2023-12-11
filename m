Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E8CC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:09:12 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.5175.1702289345025022843
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 02:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GENReMvm;
 spf=pass (domain: snapchat.com, ip: 209.85.208.173, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cc2238f597so7832611fa.3
        for <docs@lists.yoctoproject.org>; Mon, 11 Dec 2023 02:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702289343; x=1702894143; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LEYiztLMnsZcscr/tTgfFXewx/W87EA4O+Y7MS88bbY=;
        b=GENReMvmWidju56vMni/F/SSj9V5PFGbRD0rhMHs7YnYVJovH1iLqefIXtyyiI1uyp
         mhEwrbQtJ9DZDi3cgoemDEX7Ht39+76sQ+I5aXcdyFg+BSrGtTEGTmbIhtjq4VCO3d57
         sC4aIp5MG8zsTErsiDVoGtNeEoVxS4A42NzY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289343; x=1702894143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEYiztLMnsZcscr/tTgfFXewx/W87EA4O+Y7MS88bbY=;
        b=NXBFy/kAVKbgXMGy3KyO0u+M9Ljp4LRn8FkV1GRQdLOuiCaKymkyNOM55+xGPC5CNT
         17Cm+RftozQYlak9OOSU3Pbczm44fRdT2B5n0l4rWxrYp8IO9lqNf0C0WxFjyhZNFPPp
         VTRQclXorK0PtCHsfF34HK/WwwYPg9HeV97K1W/GW09NasF1z8FO+6fa4mxmc6xOx6Ix
         qadLMy1OPxlHXyX2IY8GO+28JxVe9276yW/ljf6EynhxaMuAKSowjicUMfO6qINuyuLr
         SyRlH/xNYTj+57lzOUScyh69ByCs5qscOi6BhwZ9x0VxVmKaRCDqib4zLbhWxiKCrA4M
         P9/A==
X-Gm-Message-State: AOJu0Yy9IjDRNBawoTyKyTPGEhq9Lz/w2YLqRpT52dgWesJ7XcVf0HKY
	ufiTpX3GkWqMTkAvQ4bKVL3ewbgOfa69hNtoQZrY9w==
X-Google-Smtp-Source: AGHT+IE4Hg36IY0mO0XVkFyd47RFi/HBG77EfJJL/PqYZGivEBQVj1ypRLh4KWoqVm0NVCZtNIHs4yfIF+nD8yBsJag=
X-Received: by 2002:a2e:a551:0:b0:2cc:1fbb:b6d5 with SMTP id
 e17-20020a2ea551000000b002cc1fbbb6d5mr370152ljn.162.1702289342967; Mon, 11
 Dec 2023 02:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20231207140828.3201054-1-ecordonnier@snap.com> <def95fe3-0675-4deb-82be-4f9e47c5ba67@bootlin.com>
In-Reply-To: <def95fe3-0675-4deb-82be-4f9e47c5ba67@bootlin.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 11 Dec 2023 11:08:52 +0100
Message-ID: <CAHUKmYYJRpvMZvTRSf1CPp4uVF7WiixEEsO1G6a-q6FNQw7kdw@mail.gmail.com>
Subject: Re: [docs][PATCH v2] manuals: document minidebuginfo
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000982a8d060c391f41"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Dec 2023 10:09:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4673

--000000000000982a8d060c391f41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi / bonjour Michael,

Thanks for your feedback, indeed it is meaningful that I learn the proper
formatting for future patches. I changed everything according to your
feedback, except "debug symbol" (I only removed the hyphen), my reasoning
being:
- even though I find both "debug symbol" and "debugging symbol" on google,
the wikipedia article is called "debug symbol" (
https://en.wikipedia.org/wiki/Debug_symbol )
- yocto documentation uses both "debug symbol" and "debugging symbol",
however I find 5 hits for "debugging symbol" vs 35 hits for "debug symbol"
- I asked a native English speaker and he thought "debug symbol" sounded
better

Etienne


On Fri, Dec 8, 2023 at 9:19=E2=80=AFAM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Etienne,
>
> Many thanks for your contribution. Happy to learn about MiniDebugInfo!
>
> See my comments below, mostly about formatting issues. I could fix it by
> myself if you lack time, but this way you know this for future patches :)
>
> On 07.12.23 at 15:08, Etienne Cordonnier via lists.yoctoproject.org wrote=
:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >   documentation/dev-manual/debugging.rst | 15 +++++++++++++++
> >   documentation/ref-manual/features.rst  |  3 +++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/documentation/dev-manual/debugging.rst
> b/documentation/dev-manual/debugging.rst
> > index fea2cb30a..12694b01b 100644
> > --- a/documentation/dev-manual/debugging.rst
> > +++ b/documentation/dev-manual/debugging.rst
> > @@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do
> the following:
> >      Consider that this will reduce the application's performance and i=
s
> >      recommended only for debugging purposes.
> >
> > +Enabling Minidebuginfo
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF
> section ".gnu_debugdata"
>
>
> Use :term:`DISTRO_FEATURES`
> and ``.gnu_debugdata``
>
> > +to all binary files, containing only function names, and thus
> increasing the size of the
> > +binaries only by 5 to 10%. For comparison, full debug symbols can be 1=
0
> times as big as
> > +a stripped binary, and it is thus not always possible to deploy full
> debug symbols.
> > +Minidebuginfo data allows, on the one side, to retrieve a call-stack
> using
> > +gdb (command backtrace) without deploying full debug-symbols to the
> target. It also
>
>
> Use ``gdb`` (to refer to the command) or GDB (to refer to the program)
> as in other parts of the manual.
>
> Replace "debug-symbols" by "debugging symbols"?
>
> > +allows to retrieve a symbolicated call-stack when using
> systemd-coredump to manage
>
>
> Use ``systemd-coredump``
>
> > +coredumps (commands "coredumpctl list" and "coredumpctl info").
>
> Use ``coredumpctl list`` and ``coredumpctl info``
>
> > +
> > +This feature was created by Fedora, see
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_=
wiki_Features_MiniDebugInfo&d=3DDwICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DhQV-UWkUsNI=
hb4Pyow0-VyHqmNd6krcB7umcC1z9AOQiDkBhJM3XT-1O8-fB_Gik&s=3DzTnO9U6vQxH0Thr-4=
OnmF-jGcGK4b_1R-ikzP832JoQ&e=3D
> for
> > +more details.
> > +
> >   Other Debugging Tips
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/documentation/ref-manual/features.rst
> b/documentation/ref-manual/features.rst
> > index dd14339bc..1320c3a58 100644
> > --- a/documentation/ref-manual/features.rst
> > +++ b/documentation/ref-manual/features.rst
> > @@ -161,6 +161,9 @@ metadata, as extra layers can define their own:
> >   -  *keyboard:* Include keyboard support (e.g. keymaps will be loaded
> >      during boot).
> >
> > +-  *minidebuginfo:* Add minimal debug symbols
> :ref:`(minidebuginfo)<dev-manual/debugging:enabling minidebuginfo>`
>
>
> Use "debugging symbols" as in the change above?
>
> > +   to binary files containing, allowing coredumpctl and gdb to show
> symbolicated stack traces.
>
>
> Use ``coredumpctl`` and ``gdb``.
> Thanks again
> Cheers
> Michael.
>
> --
>
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&d=3DDw=
ICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3DhQV-UWkUsNIhb4Pyow0-VyHqmNd6krcB7umcC1z9AOQiD=
kBhJM3XT-1O8-fB_Gik&s=3DrbqxBdiyaYg0d0YO9htyEO3uk_oMr48vN-X-L0UPwPE&e=3D
>
>

--000000000000982a8d060c391f41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi / bonjour Michael,<br><br>Thanks for your feedback,=C2=
=A0indeed it is meaningful that I learn the proper formatting for future pa=
tches. I changed everything according to your feedback, except &quot;debug =
symbol&quot; (I only removed the hyphen), my reasoning being:=C2=A0<br>- ev=
en though I find both &quot;debug symbol&quot; and &quot;debugging symbol&q=
uot; on google, the wikipedia article is called &quot;debug symbol&quot; (=
=C2=A0<a href=3D"https://en.wikipedia.org/wiki/Debug_symbol">https://en.wik=
ipedia.org/wiki/Debug_symbol</a> )<br>- yocto documentation uses both &quot=
;debug symbol&quot; and &quot;debugging symbol&quot;, however I find 5 hits=
 for &quot;debugging symbol&quot; vs 35 hits for &quot;debug symbol&quot;<b=
r>- I asked a native English speaker and he thought &quot;debug symbol&quot=
; sounded better<br><br>Etienne<br><br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 8, 2023 at 9:19=E2=80=AF=
AM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com"=
>michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Etienne,<br>
<br>
Many thanks for your contribution. Happy to learn about MiniDebugInfo!<br>
<br>
See my comments below, mostly about formatting issues. I could fix it by <b=
r>
myself if you lack time, but this way you know this for future patches :)<b=
r>
<br>
On 07.12.23 at 15:08, Etienne Cordonnier via <a href=3D"http://lists.yoctop=
roject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a>=
 wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/dev-manual/debugging.rst | 15 ++++++++++++++=
+<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/features.rst=C2=A0 |=C2=A0 3 +++<=
br>
&gt;=C2=A0 =C2=A02 files changed, 18 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/dev-manual/debugging.rst b/documentation/de=
v-manual/debugging.rst<br>
&gt; index fea2cb30a..12694b01b 100644<br>
&gt; --- a/documentation/dev-manual/debugging.rst<br>
&gt; +++ b/documentation/dev-manual/debugging.rst<br>
&gt; @@ -1173,6 +1173,21 @@ To support this kind of debugging, you need do =
the following:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Consider that this will reduce the application&#39=
;s performance and is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 recommended only for debugging purposes.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +Enabling Minidebuginfo<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; +<br>
&gt; +Enabling the DISTRO_FEATURES minidebuginfo adds a compressed ELF sect=
ion &quot;.gnu_debugdata&quot;<br>
<br>
<br>
Use :term:`DISTRO_FEATURES`<br>
and ``.gnu_debugdata``<br>
<br>
&gt; +to all binary files, containing only function names, and thus increas=
ing the size of the<br>
&gt; +binaries only by 5 to 10%. For comparison, full debug symbols can be =
10 times as big as<br>
&gt; +a stripped binary, and it is thus not always possible to deploy full =
debug symbols.<br>
&gt; +Minidebuginfo data allows, on the one side, to retrieve a call-stack =
using<br>
&gt; +gdb (command backtrace) without deploying full debug-symbols to the t=
arget. It also<br>
<br>
<br>
Use ``gdb`` (to refer to the command) or GDB (to refer to the program) <br>
as in other parts of the manual.<br>
<br>
Replace &quot;debug-symbols&quot; by &quot;debugging symbols&quot;?<br>
<br>
&gt; +allows to retrieve a symbolicated call-stack when using systemd-cored=
ump to manage<br>
<br>
<br>
Use ``systemd-coredump``<br>
<br>
&gt; +coredumps (commands &quot;coredumpctl list&quot; and &quot;coredumpct=
l info&quot;).<br>
<br>
Use ``coredumpctl list`` and ``coredumpctl info``<br>
<br>
&gt; +<br>
&gt; +This feature was created by Fedora, see <a href=3D"https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wiki_Features_MiniDe=
bugInfo&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&=
amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DhQV-UWkUsNIhb4P=
yow0-VyHqmNd6krcB7umcC1z9AOQiDkBhJM3XT-1O8-fB_Gik&amp;s=3DzTnO9U6vQxH0Thr-4=
OnmF-jGcGK4b_1R-ikzP832JoQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__fedoraproject.org_wik=
i_Features_MiniDebugInfo&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3DhQV-UWkUsNIhb4Pyow0-VyHqmNd6krcB7umcC1z9AOQiDkBhJM3XT-1O8-fB_Gik&amp;s=
=3DzTnO9U6vQxH0Thr-4OnmF-jGcGK4b_1R-ikzP832JoQ&amp;e=3D</a>=C2=A0 for<br>
&gt; +more details.<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0Other Debugging Tips<br>
&gt;=C2=A0 =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/documentation/ref-manual/features.rst b/documentation/ref=
-manual/features.rst<br>
&gt; index dd14339bc..1320c3a58 100644<br>
&gt; --- a/documentation/ref-manual/features.rst<br>
&gt; +++ b/documentation/ref-manual/features.rst<br>
&gt; @@ -161,6 +161,9 @@ metadata, as extra layers can define their own:<br=
>
&gt;=C2=A0 =C2=A0-=C2=A0 *keyboard:* Include keyboard support (e.g. keymaps=
 will be loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0 during boot).<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +-=C2=A0 *minidebuginfo:* Add minimal debug symbols :ref:`(minidebugin=
fo)&lt;dev-manual/debugging:enabling minidebuginfo&gt;`<br>
<br>
<br>
Use &quot;debugging symbols&quot; as in the change above?<br>
<br>
&gt; +=C2=A0 =C2=A0to binary files containing, allowing coredumpctl and gdb=
 to show symbolicated stack traces.<br>
<br>
<br>
Use ``coredumpctl`` and ``gdb``.<br>
Thanks again<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
<br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.c=
om&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DhQV-UWkUsNIhb4Pyow0-=
VyHqmNd6krcB7umcC1z9AOQiDkBhJM3XT-1O8-fB_Gik&amp;s=3DrbqxBdiyaYg0d0YO9htyEO=
3uk_oMr48vN-X-L0UPwPE&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&amp;d=3DDwICaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DhQV-UWkUsNIhb4Pyow0-VyHqmNd6krcB7umcC=
1z9AOQiDkBhJM3XT-1O8-fB_Gik&amp;s=3DrbqxBdiyaYg0d0YO9htyEO3uk_oMr48vN-X-L0U=
PwPE&amp;e=3D</a> <br>
<br>
</blockquote></div>

--000000000000982a8d060c391f41--

