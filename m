Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F70C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 20:54:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.2437.1663707243160144756
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 13:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=heDTTNKc;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id s6so5888189lfo.7
        for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RAPXycPy1Uah+UWc2EsnY1AoAiO5p2AmjKEvPNjm4Zo=;
        b=heDTTNKcCFkUE4qFL1/3U5TfcZ6nuUpNkbhYDCGbDoy72DtlPxuiTdCXalGX2ZzvjY
         v5FPNLl6Xm9YItgsnLRQ/HLoU8v+ZXv03tfyadjVbJ4p37hlIuTx+IF0V5fG1EZuKcsK
         GEpPZPtjUZiN9N3shSg57Xq2ono4hVGHAzbe1BLTUmXrgoN+QK1z2blycPENcyizC3yE
         sAQr6EyTYlJJPiZFdvpivdPPN/g4hAWCZqogQ0q9WHeMlSqy6sO2oauCLd/WzHrttfWa
         y9l+Hlzuj/mU+xOEuZ7/amZPMuaoIldJih3lz35g4oqyzrDcRbolO0U+ALNELOXaF8Z0
         As+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RAPXycPy1Uah+UWc2EsnY1AoAiO5p2AmjKEvPNjm4Zo=;
        b=GH01MxSi19sTwowUh3lA9qCpORpYF/lJjFIQeZv00xGGTlf59Y1I0LU1HR8okc1bDU
         j11uBnw+FnLbaUmZdswRZKnVotfX5Om5dO4o3jwxm93zxwqIrZb1ccRpekFmppJ19ys7
         Fsa1SZdEtWmuc4HlWmpVGeEnmH/YftGEGPhtaMjMmxG7H1tOL15C21wB6p6WAfyB/YWy
         BbZVjz73Te7gH1/U+3eFJXoYIXKCfMFIWa0CnE3lh4Es6yCsM7eMRpIiuh4ePOzUZO1R
         1Db2ziqp6amh6N/ZF6lzroJOecXa3z0VzT0h7tiOm9E66tiEp2wmaubdK6GknZxqLJgC
         tL2w==
X-Gm-Message-State: ACrzQf26NXbZvgHgaaof6cjeVvjHeRleMbJO8BjxUEazY32dQro+Gi2r
	k8ydgHY/Z3QcX6Mi47IPB0xaUQTFi9ukBB+GtQA=
X-Google-Smtp-Source: 
 AMsMyM5U2j3kFO1mx+upcHaj9/Ncgy+s1Ssdh+oBer4IMsBpBCUcS7asvDVerl2LQzMlYCZ/HotDjR7TxhsTI/Vh52k=
X-Received: by 2002:a05:6512:950:b0:497:c41e:3d0c with SMTP id
 u16-20020a056512095000b00497c41e3d0cmr9444670lft.673.1663707241211; Tue, 20
 Sep 2022 13:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220911172608.2542076-1-alex@linutronix.de>
 <20220911172608.2542076-5-alex@linutronix.de>
 <f20e7ca0158e49329b2ed2d7685ef945@axis.com>
 <CANNYZj_mTijA18UCxpTVa9V0k7pPakqvAGBLWBS39UDBCHS8RA@mail.gmail.com>
 <0c6e4dbbf24d4221ba58543cfc48a498@axis.com>
 <CANNYZj-L_TKTv6tniiRw5-d+Nd9LqpKRcHxcbjN4_f3tgN3ahg@mail.gmail.com>
 <eaad5849-ff56-f3d6-9db7-113f4d7ae489@bootlin.com>
In-Reply-To: <eaad5849-ff56-f3d6-9db7-113f4d7ae489@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Sep 2022 21:53:50 +0100
Message-ID: 
 <CANNYZj9WBpaRaXBiaXedSm3esD2pKYyt3KYgKpoJw-3VpqbExw@mail.gmail.com>
Subject: Re: [docs] [PATCH 5/5] common-tasks.rst: rewrite the section about
 configuration templates
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001f6b4d05e9220712"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 20:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3191

--0000000000001f6b4d05e9220712
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It=E2=80=99s not a need-for-consensus situation. It=E2=80=99s correcting so=
mething that
should have never been added in the first place.

Alex

On Tue 20. Sep 2022 at 21.46, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> On 14.09.22 06:50, Alexander Kanavin wrote:
> > On Wed, 14 Sept 2022 at 01:59, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> >> And I think he documented it exactly as it was intended to be used. Se=
e
> >> Paul Eggleton's comment:
> >>
> >>    One way to do it is to set TEMPLATECONF (an environment variable,
> not a
> >>    bitbake variable) to point to a directory where the custom
> conf-notes.txt
> >>    can be found. In a repository this can be set within a .templatecon=
f
> file -
> >>    hopefully we document that somewhere as well."
> > Paul didn't think it through either when he wrote this. Specifically,
> > .templateconf must be directly next to oe-init-build-env, which means
> > it cannot simply be 'in a repository'.
> >
> > You can't have it both ways: demand that this is kept in the docs, but
> > without explaining how to actually make it work (using standard
> > tooling). Also, your setup
> > is unnecessarily complicated to begin with: just skip the template
> > assembly altogether, and write directly to build/conf. Eventually
> > you'll be able to do it in a structured, supported
> > way with fragments, which is what we should *actually* be talking about=
.
>
>
> It's obvious we don't have a consensus yet here.
> Can anyone else jump in and contribute to this discussion?
>
> The other patches in this series have been merged into master-next.
>
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000001f6b4d05e9220712
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">It=E2=80=99s not a need-for-consensus situation. It=E2=80=
=99s correcting something that should have never been added in the first pl=
ace.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 20.=
 Sep 2022 at 21.46, Michael Opdenacker &lt;<a href=3D"mailto:michael.opdena=
cker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">Greetings,<br>
<br>
On 14.09.22 06:50, Alexander Kanavin wrote:<br>
&gt; On Wed, 14 Sept 2022 at 01:59, Peter Kjellerstedt<br>
&gt; &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">p=
eter.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;&gt; And I think he documented it exactly as it was intended to be used=
. See<br>
&gt;&gt; Paul Eggleton&#39;s comment:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 One way to do it is to set TEMPLATECONF (an environme=
nt variable, not a<br>
&gt;&gt;=C2=A0 =C2=A0 bitbake variable) to point to a directory where the c=
ustom conf-notes.txt<br>
&gt;&gt;=C2=A0 =C2=A0 can be found. In a repository this can be set within =
a .templateconf file -<br>
&gt;&gt;=C2=A0 =C2=A0 hopefully we document that somewhere as well.&quot;<b=
r>
&gt; Paul didn&#39;t think it through either when he wrote this. Specifical=
ly,<br>
&gt; .templateconf must be directly next to oe-init-build-env, which means<=
br>
&gt; it cannot simply be &#39;in a repository&#39;.<br>
&gt;<br>
&gt; You can&#39;t have it both ways: demand that this is kept in the docs,=
 but<br>
&gt; without explaining how to actually make it work (using standard<br>
&gt; tooling). Also, your setup<br>
&gt; is unnecessarily complicated to begin with: just skip the template<br>
&gt; assembly altogether, and write directly to build/conf. Eventually<br>
&gt; you&#39;ll be able to do it in a structured, supported<br>
&gt; way with fragments, which is what we should *actually* be talking abou=
t.<br>
<br>
<br>
It&#39;s obvious we don&#39;t have a consensus yet here.<br>
Can anyone else jump in and contribute to this discussion?<br>
<br>
The other patches in this series have been merged into master-next.<br>
<br>
Thanks in advance<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000001f6b4d05e9220712--

