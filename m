Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C71C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 14:09:32 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web08.12200.1636553371217152971
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 06:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mIEof5Fa;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id v65so2926435ioe.5
        for <docs@lists.yoctoproject.org>;
 Wed, 10 Nov 2021 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fR8JQCEqVVZRNDQANkMxpkmyfhtosoKr60tPQjBaEQk=;
        b=mIEof5FaWCCA/x3lzD1VCtm1a8mk7HNEOprKBUkMfhi+65hBl0282gTlV5oNaMQTRV
         gr71RcIBHhoGnFxXIic8jUJfVNk76ISaeXFNrrb65XccKHwRyytjYmYttvbf64WjRtKp
         +4hT5FNm5s6AuMXwQyrhxLN9TwEB2uFEiWHZR86g9z0TGl+IfR4an4nKLq6fzJmNTdi/
         5PWyIC7/zBpNwahZy41bPSbc4SPpmW6sQtQPpG5Jn+cF/zVLHEY2Ii0vKuXpXnxFoktd
         YyDMflyciN7P34y/QygHU5G3OnvrSs3POeOrhLn97UJLUF+gWeHgc6KmaA+B4EADomtu
         WBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fR8JQCEqVVZRNDQANkMxpkmyfhtosoKr60tPQjBaEQk=;
        b=QpbKbaaUT28rEcwvRUmnuEcxyHDTt5rXIRAdEUzI5hjFYvJ+1ODeb6ZyFs8oKZK+8E
         X2vJiquKWObZWvA0a8vMMj8Yo/pAwJde9VTrQHr2k/Lth0j6kqpMlH9Sv6rWq+LzxHfg
         OVXZ5Ykl0zR+HMK//p0tCczLXOnv/75aAKC6NDFf3wChEKTZmMWuzDJlM5hGbBsKFGSu
         ++PIbLmoxX0UoV5OQ45+YbqdYp/eJwhMtYvpGZ2RPVTeVEHuSP+9GipQtb0U5cDbmge4
         NBvlvb0AwAVBLdzq8nn2KafHl9SSaxWpE0ZhEklhD1GnD6Pi1A8T29+Fpvk8rmTLsENy
         UcZw==
X-Gm-Message-State: AOAM530vEYEy2/ttvxNpVU62TaYgcwHKu/76KGYgxse5KMAIQiGXR9XU
	/gMjJ4GSCKHuPTz7Qsb7cJ+dJkGbSkKvW95PlMk=
X-Google-Smtp-Source: 
 ABdhPJw7+uaXjcnEOwB5ckKMk+PiZlqEe/90ILt3ahj2kpSXMfpxa3rAWM6MCXslUmdP9pKjrUVkm+rU9VIYYzJ3ECU=
X-Received: by 2002:a6b:ed04:: with SMTP id n4mr10541707iog.83.1636553370531;
 Wed, 10 Nov 2021 06:09:30 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANx9H-AKb9xaP8B=X+ZYH4uX5DGNeR-gO4dXa5b3pJ=f7_iStg@mail.gmail.com>
 <945b31d3-4a79-b38b-2832-58806c01bc84@bootlin.com>
In-Reply-To: <945b31d3-4a79-b38b-2832-58806c01bc84@bootlin.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 10 Nov 2021 06:09:19 -0800
Message-ID: 
 <CANx9H-Bxod7ypGEY=_LH-a+uCphudTfWFY3o823_mMB=Q4iNZQ@mail.gmail.com>
Subject: Re: [docs] [RFC] Translating "Hands-on Kernel Lab" to Sphinx;
 updating
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004e7a3305d06fc662"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Nov 2021 14:09:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2113

--0000000000004e7a3305d06fc662
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 1:01 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Tim,
>
> On 11/10/21 6:45 AM, Tim Orling wrote:
> > In preparation for the Yocto Summit, I have begun translating the
> > legacy "Hands-on Kernel Lab" to Sphinx/ReStructuredText.
> >
> > My WIP branch
> > is https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab
> > <https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab>
> >
> > I will be updating/rebasing multiple times in the coming days. Do not
> > expect this repository to completely stabilize until the day of the
> > Yocto Summit.
> >
> > I would very much appreciate eye-balls on this branch and the
> > corresponding content based on the 2.6 version [1][2] as well as some
> > unpublished updates for 3.3 [3].
> >
> > My proposal is to add the metadata layers as git submodules to an
> > overall layer. Ideally this would be hosted at git.yoctoproject.org
> > <http://git.yoctoproject.org>. This would allow the content to be
> > updated via typical git/mailing list processes, rather than an awkward
> > tarball =3D> website workflow. I will lay out this structure on GitHub
> > as a proposal. Do not expect the corresponding layers/repos to be
> > stable as they will be in extreme flux up until the day of the Yocto
> > Summit. If you have other ideas for how to develop/maintain/share this
> > content, please speak up.
> >
> > NOTE: my initial focus is simply on translating to Sphinx and updating
> > to the current Yocto Project release and Linux kernel(s). I will
> > entertain other changes once these required steps are complete.
> >
> > Let the discussion begin!
>
>
> Thanks for starting this.
> Is the plan to eventually add such labs to the main documentation?


Yes. I added a new =E2=80=9CHands-on Manuals=E2=80=9D section to the navbar=
.

The collateral metadata will need a different home however.

>
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000004e7a3305d06fc662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 10, 2021 at 1:01 AM Michael Opdenacker &lt;<a h=
ref=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">Hi Tim,<br>
<br>
On 11/10/21 6:45 AM, Tim Orling wrote:<br>
&gt; In preparation for the Yocto Summit, I have begun translating the<br>
&gt; legacy &quot;Hands-on Kernel Lab&quot; to Sphinx/ReStructuredText.<br>
&gt;<br>
&gt; My WIP branch<br>
&gt; is=C2=A0<a href=3D"https://github.com/moto-timo/yocto-docs/tree/timo/k=
ernel-lab" rel=3D"noreferrer" target=3D"_blank">https://github.com/moto-tim=
o/yocto-docs/tree/timo/kernel-lab</a><br>
&gt; &lt;<a href=3D"https://github.com/moto-timo/yocto-docs/tree/timo/kerne=
l-lab" rel=3D"noreferrer" target=3D"_blank">https://github.com/moto-timo/yo=
cto-docs/tree/timo/kernel-lab</a>&gt;<br>
&gt;<br>
&gt; I will be updating/rebasing multiple times in the coming days. Do not<=
br>
&gt; expect this repository to completely stabilize until the day of the<br=
>
&gt; Yocto Summit.<br>
&gt;<br>
&gt; I would very much appreciate eye-balls on this branch and the<br>
&gt; corresponding content based on the 2.6 version [1][2] as well as some<=
br>
&gt; unpublished updates for 3.3 [3].<br>
&gt;<br>
&gt; My proposal is to add the metadata layers as git submodules to an<br>
&gt; overall layer. Ideally this would be hosted at <a href=3D"http://git.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org<=
/a><br>
&gt; &lt;<a href=3D"http://git.yoctoproject.org" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org</a>&gt;. This would allow the conte=
nt to be<br>
&gt; updated via typical git/mailing list processes, rather than an awkward=
<br>
&gt; tarball =3D&gt; website workflow. I will lay out this structure on Git=
Hub<br>
&gt; as a proposal. Do not expect the corresponding layers/repos to be<br>
&gt; stable as they will be in extreme flux up until the day of the Yocto<b=
r>
&gt; Summit. If you have other ideas for how to develop/maintain/share this=
<br>
&gt; content, please speak up.<br>
&gt;<br>
&gt; NOTE: my initial focus is simply on translating to Sphinx and updating=
<br>
&gt; to the current Yocto Project release and Linux kernel(s). I will<br>
&gt; entertain other changes once these required steps are complete.<br>
&gt;<br>
&gt; Let the discussion begin!<br>
<br>
<br>
Thanks for starting this.<br>
Is the plan to eventually add such labs to the main documentation?</blockqu=
ote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. I added a new =E2=80=
=9CHands-on Manuals=E2=80=9D section to the navbar.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">The collateral metadata will need a diffe=
rent home however.</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--0000000000004e7a3305d06fc662--

