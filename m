Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786ADC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:07:05 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web08.29430.1639505224239721686
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o/7G7p2p;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id k21so25696982ioh.4
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tt28yDXubLQiKui11y1hfucDWkje73OXUqMo6Jz6lSA=;
        b=o/7G7p2pWxeCxBUoFKBx7qCEZzbLgiAVxabPaS9Rh3dBn/AUC76s6acADuf08m1sxa
         kONZkuLllRnNB9ZqqYPgTjGwyDhneg04cRrNSOhfJ1uTYDnkVJukqCs5MC3JnXHJr9TD
         L60dd/lzCnxab1c4Z7J1MOjeNUzOn0tM4fT3THKBN/5pKAAkw16wQ6tufcqh6Ugc1KNg
         qvpDghR2tU95lcGtZQx9jmPgFmyr9dPDRL1GsEXbymVlpuXf0ixUMF4F3gdDqK7KL6yT
         ADHdyJzn84JK3u7XEq6oKIhMyyeJYy2Kyo9dLpt4WZsaUEPjxwt4msLHohrM7uMZH0+H
         hY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tt28yDXubLQiKui11y1hfucDWkje73OXUqMo6Jz6lSA=;
        b=Lq1Sta3CgsP/z9g8I25t2OlcPf3q4+JZ/G0O3hW/MkWD0CtR17TIhBDum76LsEXhaG
         XyX3jhLIz7POkLubKLAa3kOVzpQ2iULblEnD/+UP6GD6RA6IB6ay8sN+GaE1UQXH4DkE
         6cr4J/nEA7HpAY7zOOfstp2StlWCYXOwPYrvZg20rJaRFaBWPkjDhNjhf+DaOwbutzqI
         6L1SaTCqo9/iwP7b501OUzajY7PU/4Gn3ohrXU14pe8NMTnu7YqI8PnpxVwfXKvxU8Hn
         fjsDnIwls8zSIRox+H4CUyvVPU+JsMAUrxYjTqv1c+AUD0M0nr97dQv6HHSAc+oxRDct
         Hkuw==
X-Gm-Message-State: AOAM530NRZT2X8EBCP1B5S+6h4x+HQUpWBigKHDUfXuxuUDZWIKrpC/U
	0FzP7u6sm+OAX0zEXE/jB0bDTDMiUitFNXHuL7I=
X-Google-Smtp-Source: 
 ABdhPJz/rZFV2k/2NEByHf8jJYFEZ4us7DlQysOSlo01WIO6z5oBAtvp2HsVpV+FYS8UdCMuDdzI41zX6d0Z4DkbPSk=
X-Received: by 2002:a05:6602:3422:: with SMTP id
 n34mr4633574ioz.7.1639505223469;
 Tue, 14 Dec 2021 10:07:03 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANx9H-AKb9xaP8B=X+ZYH4uX5DGNeR-gO4dXa5b3pJ=f7_iStg@mail.gmail.com>
 <945b31d3-4a79-b38b-2832-58806c01bc84@bootlin.com>
 <CANx9H-Bxod7ypGEY=_LH-a+uCphudTfWFY3o823_mMB=Q4iNZQ@mail.gmail.com>
 <a394a2acd209de1ad44065295e11167899ca8335.camel@linuxfoundation.org>
 <fbcefb10-6b38-1dbd-864d-2d2661c190fd@bootlin.com>
In-Reply-To: <fbcefb10-6b38-1dbd-864d-2d2661c190fd@bootlin.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 14 Dec 2021 10:06:52 -0800
Message-ID: 
 <CANx9H-CY1B_EPy-rbMbE=_7fgUc0ts_PwgqhzdwhxsmwU+Xs+Q@mail.gmail.com>
Subject: Re: [docs] [RFC] Translating "Hands-on Kernel Lab" to Sphinx;
 updating
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000073d00005d31f0eb4"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 18:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2257

--00000000000073d00005d31f0eb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 8:09 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Tim
>
> On 11/10/21 3:12 PM, Richard Purdie wrote:
> > On Wed, 2021-11-10 at 06:09 -0800, Tim Orling wrote:
> >>
> >> On Wed, Nov 10, 2021 at 1:01 AM Michael Opdenacker
> >> <michael.opdenacker@bootlin.com> wrote:
> >>> Hi Tim,
> >>>
> >>> On 11/10/21 6:45 AM, Tim Orling wrote:
> >>>> In preparation for the Yocto Summit, I have begun translating the
> >>>> legacy "Hands-on Kernel Lab" to Sphinx/ReStructuredText.
> >>>>
> >>>> My WIP branch
> >>>> is https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab
> >>>> <https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab>
> >>>>
> >>>> I will be updating/rebasing multiple times in the coming days. Do no=
t
> >>>> expect this repository to completely stabilize until the day of the
> >>>> Yocto Summit.
> >>>>
> >>>> I would very much appreciate eye-balls on this branch and the
> >>>> corresponding content based on the 2.6 version [1][2] as well as som=
e
> >>>> unpublished updates for 3.3 [3].
> >>>>
> >>>> My proposal is to add the metadata layers as git submodules to an
> >>>> overall layer. Ideally this would be hosted at git.yoctoproject.org
> >>>> <http://git.yoctoproject.org>. This would allow the content to be
> >>>> updated via typical git/mailing list processes, rather than an awkwa=
rd
> >>>> tarball =3D> website workflow. I will lay out this structure on GitH=
ub
> >>>> as a proposal. Do not expect the corresponding layers/repos to be
> >>>> stable as they will be in extreme flux up until the day of the Yocto
> >>>> Summit. If you have other ideas for how to develop/maintain/share th=
is
> >>>> content, please speak up.
> >>>>
> >>>> NOTE: my initial focus is simply on translating to Sphinx and updati=
ng
> >>>> to the current Yocto Project release and Linux kernel(s). I will
> >>>> entertain other changes once these required steps are complete.
> >>>>
> >>>> Let the discussion begin!
> >>>
> >>> Thanks for starting this.
> >>> Is the plan to eventually add such labs to the main documentation?
> >>>
> >>
> >> Yes. I added a new =E2=80=9CHands-on Manuals=E2=80=9D section to the n=
avbar.
> >>
> >> The collateral metadata will need a different home however.
> >>
> > Repositories on git.yoctoproject.org are available! :)
> >
> > Cheers,
> >
> > Richard
>
> Do you plan to submit a patch for inclusion in the main documentation,
> now that you ran your lab?
>
Yes. But what i submit will be the qemux86 workflow of the original lab,
not the qemuarm64 workflow of the hands on Yocto Summit 2021.11 lab.


> When you have time, of course...
>
That is the issue right now. Lab 3 and 4 need a bit more work. Power outage
over the weekend took out my internet gateway and I just switched
employers. "Soon".


> Cheers,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000073d00005d31f0eb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 13, 2021 at 8:09 AM Micha=
el Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael=
.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Tim<br>
<br>
On 11/10/21 3:12 PM, Richard Purdie wrote:<br>
&gt; On Wed, 2021-11-10 at 06:09 -0800, Tim Orling wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Nov 10, 2021 at 1:01 AM Michael Opdenacker<br>
&gt;&gt; &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com" target=3D"_b=
lank">michael.opdenacker@bootlin.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Hi Tim,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 11/10/21 6:45 AM, Tim Orling wrote:<br>
&gt;&gt;&gt;&gt; In preparation for the Yocto Summit, I have begun translat=
ing the<br>
&gt;&gt;&gt;&gt; legacy &quot;Hands-on Kernel Lab&quot; to Sphinx/ReStructu=
redText.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; My WIP branch<br>
&gt;&gt;&gt;&gt; is=C2=A0<a href=3D"https://github.com/moto-timo/yocto-docs=
/tree/timo/kernel-lab" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/moto-timo/yocto-docs/tree/timo/kernel-lab</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"https://github.com/moto-timo/yocto-docs/tre=
e/timo/kernel-lab" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
moto-timo/yocto-docs/tree/timo/kernel-lab</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I will be updating/rebasing multiple times in the coming d=
ays. Do not<br>
&gt;&gt;&gt;&gt; expect this repository to completely stabilize until the d=
ay of the<br>
&gt;&gt;&gt;&gt; Yocto Summit.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I would very much appreciate eye-balls on this branch and =
the<br>
&gt;&gt;&gt;&gt; corresponding content based on the 2.6 version [1][2] as w=
ell as some<br>
&gt;&gt;&gt;&gt; unpublished updates for 3.3 [3].<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; My proposal is to add the metadata layers as git submodule=
s to an<br>
&gt;&gt;&gt;&gt; overall layer. Ideally this would be hosted at <a href=3D"=
http://git.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">git.yocto=
project.org</a><br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"http://git.yoctoproject.org" rel=3D"norefer=
rer" target=3D"_blank">http://git.yoctoproject.org</a>&gt;. This would allo=
w the content to be<br>
&gt;&gt;&gt;&gt; updated via typical git/mailing list processes, rather tha=
n an awkward<br>
&gt;&gt;&gt;&gt; tarball =3D&gt; website workflow. I will lay out this stru=
cture on GitHub<br>
&gt;&gt;&gt;&gt; as a proposal. Do not expect the corresponding layers/repo=
s to be<br>
&gt;&gt;&gt;&gt; stable as they will be in extreme flux up until the day of=
 the Yocto<br>
&gt;&gt;&gt;&gt; Summit. If you have other ideas for how to develop/maintai=
n/share this<br>
&gt;&gt;&gt;&gt; content, please speak up.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; NOTE: my initial focus is simply on translating to Sphinx =
and updating<br>
&gt;&gt;&gt;&gt; to the current Yocto Project release and Linux kernel(s). =
I will<br>
&gt;&gt;&gt;&gt; entertain other changes once these required steps are comp=
lete.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Let the discussion begin!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks for starting this.<br>
&gt;&gt;&gt; Is the plan to eventually add such labs to the main documentat=
ion?<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes. I added a new =E2=80=9CHands-on Manuals=E2=80=9D section to t=
he navbar.=C2=A0<br>
&gt;&gt;<br>
&gt;&gt; The collateral metadata will need a different home however.<br>
&gt;&gt;<br>
&gt; Repositories on <a href=3D"http://git.yoctoproject.org" rel=3D"norefer=
rer" target=3D"_blank">git.yoctoproject.org</a> are available! :)<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
Do you plan to submit a patch for inclusion in the main documentation,<br>
now that you ran your lab?<br></blockquote><div>Yes. But what i submit will=
 be the qemux86 workflow of the original lab, not the qemuarm64 workflow of=
 the hands on Yocto Summit 2021.11 lab.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
When you have time, of course...<br></blockquote><div>That is the issue rig=
ht now. Lab 3 and 4 need a bit more work. Power outage over the weekend too=
k out my internet gateway and I just switched employers. &quot;Soon&quot;.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000073d00005d31f0eb4--

