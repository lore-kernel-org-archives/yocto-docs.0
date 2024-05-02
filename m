Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31136C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 20:23:11 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.4904.1714681384379207327
 for <docs@lists.yoctoproject.org>;
 Thu, 02 May 2024 13:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gorx1vqT;
 spf=pass (domain: konsulko.com, ip: 209.85.208.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so108857091fa.1
        for <docs@lists.yoctoproject.org>; Thu, 02 May 2024 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1714681382; x=1715286182; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L9lnk8wf1G8Qi4rsl7QbsjNAxC9Lz0cVYVMdvS3LKE8=;
        b=gorx1vqTqssNAFYEClu1ETeRmmp2UdotcnnnRPut5//3KdObdx1y84XBu6SW9jlGhy
         5aaBTDup/UtFPY5MasDZQJTtrvL6b/aNWPr4icfuu/oZyeqriLLRgQuNTlCs2ZS4eImG
         kMnqRYw8tkcvTncV50rDZSnyJrp3R0zbfHymk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714681382; x=1715286182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9lnk8wf1G8Qi4rsl7QbsjNAxC9Lz0cVYVMdvS3LKE8=;
        b=A1VM4r2zzIGQXS2ERsxvz4Sa/PD8uXXsSNgnTSeCiy693hbZrbJP08+4rx+Je9OF/R
         WVhWC+7RuCQ+lTRkF0vd2PvCjlTOZwROGKUvRIaRMexH9JoUcnVINa6OXh4Qs7woBLcV
         sa6yw9P+xuXDxeIAe0sATjvp53OrDPvfT8vGp3FvF3oMoTPiEHYRS8i8wrGJ4zrohzfw
         6+zlkyHpDpneamO4g+nrB8h/ehfwCr9HS5hDUxU1iY5myKxKz3MWMOXwe8mAYs/fDngN
         v5F+h2c2xnacw8ZFWX5BWXENjFR4yr/08bM/N0ND7sIits68KPRXswgZxe06vp5dqdMe
         xTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9NXJKjDb2SwfPm3sm6X+cCMezEVJGDjuJHwZHsR0W+IoCtWYmIkyLR5/gFRGrETevk1o4+TCxsmYa0CgClG+Ereh9TFpXcRXOvw=
X-Gm-Message-State: AOJu0YxDE4Cr3/6i+poqUoL3bcAjVxkA11dVi/8+njNk9nZmSGnnGXG7
	q9Gt/4R/MsSvfmZPM8EBsxNkcuFrr7PVd+YEoDEsAL85tov5e4XvcKDN9SWOeA4gR6gcM0WWjgH
	9vSAFe+hne1hAjG+fhKNY97+HF2zDd/ZGcfw7rg==
X-Google-Smtp-Source: AGHT+IEDv2pYm6+JzunC66pJRSe685kgkvGPxasCP4GndhxOcODcqhueUBlo1ybNzthLMhE6NfJUcXcFVCIQ+c682Qg=
X-Received: by 2002:a2e:80d4:0:b0:2d7:17e0:ff56 with SMTP id
 r20-20020a2e80d4000000b002d717e0ff56mr513299ljg.18.1714681382374; Thu, 02 May
 2024 13:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240502152701.1798568-2-tim.orling@konsulko.com>
 <20240502191839a351b43b@mail.local> <CAJdd5GbY+WkMHOsMnv0U+WOLfOk=FM0OFH=yxqRNMGwxV5cDDg@mail.gmail.com>
 <202405021945001e34cffa@mail.local> <CANNYZj9GuMZFpbCdYd0kQSJ9fK2isT9rDQzpP3P2YzPpD9s8vA@mail.gmail.com>
In-Reply-To: <CANNYZj9GuMZFpbCdYd0kQSJ9fK2isT9rDQzpP3P2YzPpD9s8vA@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 2 May 2024 13:22:51 -0700
Message-ID: <CAOyo-84Y6B9kzzwq6MV9zUs55POsmXzt4uwNOk+YQ14+p1rxCg@mail.gmail.com>
Subject: Re: [docs] [PATCH] contributor-guide: recommend format.forceInBodyFrom
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: alexandre.belloni@bootlin.com, Joshua Watt <jpewhacker@gmail.com>, 
	docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b3380706177e5e5c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 May 2024 20:23:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5209

--000000000000b3380706177e5e5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 1:16=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> I have to agree with Alexandre: forceInBodyFrom is not necessary. My
> setup for poky is:
>
> [user]
>     email =3D alex@linutronix.de
>     name =3D Alexander Kanavin
> [sendemail]
>     smtpEncryption =3D tls
>     smtpServer =3D smtp.gmail.com
>     smtpUser =3D alex.kanavin@gmail.com
>     smtpServerPort =3D 587
>
>     from =3D Alexander Kanavin <alex.kanavin@gmail.com>
>     to =3D openembedded-core@lists.openembedded.org
>
>
> So patches are made with the linutronix identity, but emails are made
> with gmail identity, and then git send-email adds the extra From: into
> the email body automatically. No need to force stuff.
>
> You guys need to double check your setup, I think.
>

The reason for this thread was a comment from RP during the YP Bug Triage
meeting that things were different recently, so we are trying to make sure
we get this correct.
Either something changed in groups.io or somewhere else, because my setup
only added either of these settings today.
I have just sent three emails with the same exact patch but different
settings to test-list
(1) both sendemail.from and format.forceInBodyFrom
(2) only sendemail.from
(3) neither sendemail.from nor format.forceInBodyFrom

#3 is also the same conditions I used to send the original patch to the
oe-core list.

I would have expected to have heard from Alexandre Belloni previously that
there was an issue with my setup in #3.




>
> Alex
>
>
> On Thu, 2 May 2024 at 21:45, Alexandre Belloni via
> lists.yoctoproject.org
> <alexandre.belloni=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >
> > On 02/05/2024 13:25:54-0600, Joshua Watt wrote:
> > > On Thu, May 2, 2024 at 1:18=E2=80=AFPM Alexandre Belloni via
> > > lists.yoctoproject.org
> > > <alexandre.belloni=3Dbootlin.com@lists.yoctoproject.org> wrote:
> > > >
> > > > On 02/05/2024 08:27:02-0700, Tim Orling wrote:
> > > > > We are seeing a lot of patches failing when the From:
> > > > > line is not contained in the message body. It is probably
> > > > > better to just recommend to force the in-body From: to be
> > > > > present globally.
> > > > >
> > > > > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > > > > ---
> > > > >  documentation/contributor-guide/submit-changes.rst | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/documentation/contributor-guide/submit-changes.rst
> b/documentation/contributor-guide/submit-changes.rst
> > > > > index 47a416b24..c292a143a 100644
> > > > > --- a/documentation/contributor-guide/submit-changes.rst
> > > > > +++ b/documentation/contributor-guide/submit-changes.rst
> > > > > @@ -65,6 +65,11 @@ use to identify your commits::
> > > > >     git config --global user.name "Ada Lovelace"
> > > > >     git config --global user.email "ada.lovelace@gmail.com"
> > > > >
> > > > > +To ensure that your patches are formatted properly, it is also
> > > > > +recommended to set::
> > > > > +
> > > > > +   git config --global format.forceInBodyFrom true
> > > > > +
> > > >
> > > > I do believe the current documentation already points to a working
> > > > solution:
> > > >
> > > >
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixin=
g-your-from-identity
> > > >
> > > > Doesn't that work for you?
> > >
> > > Empirically, that is insufficient. I've had that set and it mangled m=
y
> > > From line anyway. I beleive that only affects the SMTP header From,
> > > when you actually need the "correct" From in the message body as a Gi=
t
> > > header (which is what format.forceInBodyFrom does). Besides, most
> > > people probably already set that anyway because I think it prompts if
> > > you don't have it set
> >
> > I'm pretty sure this has ensured the From: was in the body for us at
> > Bootlin.
> >
> > >
> > > >
> > > > >  Clone the Git repository for the component to modify
> > > > >  ----------------------------------------------------
> > > > >
> > > > > --
> > > > > 2.43.2
> > > > >
> > > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > > >
> > > >
> > > >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#5207):
> https://lists.yoctoproject.org/g/docs/message/5207
> > Mute This Topic: https://lists.yoctoproject.org/mt/105864996/1686489
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b3380706177e5e5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 2, 2024 at 1:16=E2=80=AFP=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kana=
vin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">I have to agree with Alexandre: forceInBodyFrom is not necessa=
ry. My<br>
setup for poky is:<br>
<br>
[user]<br>
=C2=A0 =C2=A0 email =3D <a href=3D"mailto:alex@linutronix.de" target=3D"_bl=
ank">alex@linutronix.de</a><br>
=C2=A0 =C2=A0 name =3D Alexander Kanavin<br>
[sendemail]<br>
=C2=A0 =C2=A0 smtpEncryption =3D tls<br>
=C2=A0 =C2=A0 smtpServer =3D <a href=3D"http://smtp.gmail.com" rel=3D"noref=
errer" target=3D"_blank">smtp.gmail.com</a><br>
=C2=A0 =C2=A0 smtpUser =3D <a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a><br>
=C2=A0 =C2=A0 smtpServerPort =3D 587<br>
<br>
=C2=A0 =C2=A0 from =3D Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin=
@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 to =3D <a href=3D"mailto:openembedded-core@lists.openembedded=
.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<br>
<br>
So patches are made with the linutronix identity, but emails are made<br>
with gmail identity, and then git send-email adds the extra From: into<br>
the email body automatically. No need to force stuff.<br>
<br>
You guys need to double check your setup, I think.<br></blockquote><div><br=
></div><div>The reason for this thread was a comment from RP during the YP =
Bug Triage meeting that things were different recently, so we are trying to=
 make sure we get this correct.</div><div>Either something changed in <a hr=
ef=3D"http://groups.io">groups.io</a> or somewhere else, because my setup o=
nly added either of these settings today.</div><div>I have just sent three =
emails with the same exact patch but different settings to test-list</div><=
div>(1) both sendemail.from and format.forceInBodyFrom</div><div>(2) only s=
endemail.from<br>(3) neither sendemail.from nor format.forceInBodyFrom</div=
><div><br></div><div>#3 is also the same conditions I used to send the orig=
inal patch to the oe-core list.</div><div><br></div><div>I would have expec=
ted to have heard from Alexandre Belloni previously that there was an issue=
 with my setup in #3.</div><div><br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
<br>
On Thu, 2 May 2024 at 21:45, Alexandre Belloni via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;alexandre.belloni=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.or=
g" target=3D"_blank">bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 02/05/2024 13:25:54-0600, Joshua Watt wrote:<br>
&gt; &gt; On Thu, May 2, 2024 at 1:18=E2=80=AFPM Alexandre Belloni via<br>
&gt; &gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.yoctoproject.org</a><br>
&gt; &gt; &lt;alexandre.belloni=3D<a href=3D"mailto:bootlin.com@lists.yocto=
project.org" target=3D"_blank">bootlin.com@lists.yoctoproject.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 02/05/2024 08:27:02-0700, Tim Orling wrote:<br>
&gt; &gt; &gt; &gt; We are seeing a lot of patches failing when the From:<b=
r>
&gt; &gt; &gt; &gt; line is not contained in the message body. It is probab=
ly<br>
&gt; &gt; &gt; &gt; better to just recommend to force the in-body From: to =
be<br>
&gt; &gt; &gt; &gt; present globally.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orl=
ing@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 documentation/contributor-guide/submit-changes.rs=
t | 5 +++++<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/documentation/contributor-guide/submit-cha=
nges.rst b/documentation/contributor-guide/submit-changes.rst<br>
&gt; &gt; &gt; &gt; index 47a416b24..c292a143a 100644<br>
&gt; &gt; &gt; &gt; --- a/documentation/contributor-guide/submit-changes.rs=
t<br>
&gt; &gt; &gt; &gt; +++ b/documentation/contributor-guide/submit-changes.rs=
t<br>
&gt; &gt; &gt; &gt; @@ -65,6 +65,11 @@ use to identify your commits::<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0git config --global <a href=3D"http:=
//user.name" rel=3D"noreferrer" target=3D"_blank">user.name</a> &quot;Ada L=
ovelace&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0git config --global user.email &quot=
;<a href=3D"mailto:ada.lovelace@gmail.com" target=3D"_blank">ada.lovelace@g=
mail.com</a>&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +To ensure that your patches are formatted properly, it=
 is also<br>
&gt; &gt; &gt; &gt; +recommended to set::<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0git config --global format.forceInBodyFro=
m true<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I do believe the current documentation already points to a w=
orking<br>
&gt; &gt; &gt; solution:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://docs.yoctoproject.org/contributor-guide/s=
ubmit-changes.html#fixing-your-from-identity" rel=3D"noreferrer" target=3D"=
_blank">https://docs.yoctoproject.org/contributor-guide/submit-changes.html=
#fixing-your-from-identity</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Doesn&#39;t that work for you?<br>
&gt; &gt;<br>
&gt; &gt; Empirically, that is insufficient. I&#39;ve had that set and it m=
angled my<br>
&gt; &gt; From line anyway. I beleive that only affects the SMTP header Fro=
m,<br>
&gt; &gt; when you actually need the &quot;correct&quot; From in the messag=
e body as a Git<br>
&gt; &gt; header (which is what format.forceInBodyFrom does). Besides, most=
<br>
&gt; &gt; people probably already set that anyway because I think it prompt=
s if<br>
&gt; &gt; you don&#39;t have it set<br>
&gt;<br>
&gt; I&#39;m pretty sure this has ensured the From: was in the body for us =
at<br>
&gt; Bootlin.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 Clone the Git repository for the component to mod=
ify<br>
&gt; &gt; &gt; &gt;=C2=A0 -------------------------------------------------=
---<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.43.2<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt; &gt; Embedded Linux and Kernel engineering<br>
&gt; &gt; &gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D=
"_blank">https://bootlin.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#5207): <a href=3D"https://lists.yoctoproject.org/g=
/docs/message/5207" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/docs/message/5207</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10586499=
6/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/mt/105864996/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" ta=
rget=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" r=
el=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/u=
nsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000b3380706177e5e5c--

