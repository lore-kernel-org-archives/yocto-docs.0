Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E543C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 18:22:19 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.912.1652379734820511864
 for <docs@lists.yoctoproject.org>;
 Thu, 12 May 2022 11:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VOMVM68j;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id i24so5548970pfa.7
        for <docs@lists.yoctoproject.org>;
 Thu, 12 May 2022 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=WbriWWpRwu718Hj/pzBNIjD0gmHKqSYKnGxFaa4ifI4=;
        b=VOMVM68jefiqBA7L7eeQ4aNfiS2Dz4XwAK5b14yI8Op2mFhydSFLi2r9WLP+/qFB+7
         TciJjjQMY/QW7IEpvXMi8EAPOw8QhZfNLCpsrds+fTcefV7nh3eCjHc5fDOorN2MBoCI
         TQwbJ6cArxbw70chqpvk5SKK5fO0EZ9TthOxgcosEM8bFH58udAbwF/8scXb7d5va/X/
         RhTVs3kssvOyOY4609hn6nJVPtmxNf4Ci1Iwvz6S13ksTQHZKxb6i5+Sv3kJcfsI66zl
         Snlz6gnnCx6EqNAJrSsVAFSR/Ya/LczRFqQoUdgJXFNyrZGuU3x4ggiOXbf5UjCMeN1E
         REIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=WbriWWpRwu718Hj/pzBNIjD0gmHKqSYKnGxFaa4ifI4=;
        b=XDsdKP5AzCpkrJmAp73RfnCiDUYpxoEUPMyu6y3Mi6OTBPvi5k5GqZ4pMK5+q+83HY
         eRpGUcsfk8dB+gWdsohW9UdofP6EAjelaZ24jjcInw7MlajFOHkRfb6gPN0dJgJWepnu
         sBYhJLvPzOde1GdxptvS7iPD4bH4Iz+IDomTptvfINUMEOG6B4IDfmtRXT11bhYwrLyf
         gTCNcBfS7y8MIo3c0W2r4aK1IIc7MuHkrWy+T7MvVSNNGpaH8n5wnP3JrUdo3pmbDewL
         OpRy1+L4bNkwmEUC+p9vHuWFUFRT5AYvHKZozX96pCLaM9Bl3yR9VG+4TjE2kjkpspQF
         c6AA==
X-Gm-Message-State: AOAM5339UkX5gYrl0AzeSkkuE6nLfd7gQPYZ1E2FomZHwuFfNKNPVTCB
	HxDXZH5oB5wRWdGq9Ni1GknQhR83Ngk9FoVQXxXFBvOm
X-Google-Smtp-Source: 
 ABdhPJxhhBD8B3Ysjz+SO55UPZjUzigAysc/ui8MdfgVsFnSfiAFwjNI9fdT59puRrEj2vJDvAzG7ugpeoyUZ4UylGg=
X-Received: by 2002:a05:6a00:179f:b0:50d:e311:7d5 with SMTP id
 s31-20020a056a00179f00b0050de31107d5mr997925pfg.64.1652379733675; Thu, 12 May
 2022 11:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <16EE6DF9D0155936.24517@lists.yoctoproject.org>
In-Reply-To: <16EE6DF9D0155936.24517@lists.yoctoproject.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 12 May 2022 11:22:01 -0700
Message-ID: 
 <CANx9H-AeaY7qMFYhJdL57fisv6_6dzsV7JDKA0Afyi9xOWMyGw@mail.gmail.com>
Subject: Fwd: [yocto] [RFC][WIP]{honister] kernel-lab manual
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000000f557205ded4a3cc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 May 2022 18:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2934

--0000000000000f557205ded4a3cc
Content-Type: text/plain; charset="UTF-8"

OOPS.

---------- Forwarded message ---------
From: Tim Orling via lists.yoctoproject.org <ticotimo=
gmail.com@lists.yoctoproject.org>
Date: Thu, May 12, 2022 at 11:10 AM
Subject: [yocto] [RFC][WIP]{honister] kernel-lab manual
To: Yocto (yocto@lists.yoctoproject.org) <yocto@lists.yoctoproject.org>


I have the restructured text conversion far enough along for the
'kernel-lab' to share it now. Because I was last working on this for Yocto
Project Summit 2021.11, the current qemux86 base is on 'honister' (although
I am upgrading it to honister-3.4.4 tag).

Please realize there is a lot of history to this material and some of it
was done by folks that have left this mortal coil and some respect for that
posterity is included in this work. We can change and morph in the future,
once it has been captured close to what it is here.

I also have a separate workflow going for the Yocto Project Summit 2022.05
which is in Google Slides and is qemuarm64 based ('kirkstone'). Eventually
I will find the time to update the kernel-lab manual to follow suit, but
our collective discussion may impact that.

You can take a look at YP Summit 2021.11 to see a preview of what is coming
for YP Summit 2022.05 (once I figure out the pesky printk/pr_info issue):
https://elinux.org/images/b/be/Yps2021.11-handson-kernel.pdf

Current working branch of kernel-lab manual:
https://github.com/moto-timo/yocto-docs/tree/timo/honister/kernel-lab

And the accompanying metadata training materials:
https://github.com/moto-timo/kernel-lab-layers/tree/wip-honister

The intent is that for a given release of the docs, we would have exercises
for  LTS, Stable and Mainline (really this means current-stable, not -dev).
Currently, LTS would be 5.10, Stable would be 5.15 and Mainline would be
5.17.

--Tim

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#57084):
https://lists.yoctoproject.org/g/yocto/message/57084
Mute This Topic: https://lists.yoctoproject.org/mt/91064347/924729
Group Owner: yocto+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
ticotimo@gmail.com]
-=-=-=-=-=-=-=-=-=-=-=-

--0000000000000f557205ded4a3cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OOPS.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong=
 class=3D"gmail_sendername" dir=3D"auto">Tim Orling via <a href=3D"http://l=
ists.yoctoproject.org">lists.yoctoproject.org</a></strong> <span dir=3D"aut=
o">&lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail=
.com@lists.yoctoproject.org</a>&gt;</span><br>Date: Thu, May 12, 2022 at 11=
:10 AM<br>Subject: [yocto] [RFC][WIP]{honister] kernel-lab manual<br>To: Yo=
cto (<a href=3D"mailto:yocto@lists.yoctoproject.org">yocto@lists.yoctoproje=
ct.org</a>) &lt;<a href=3D"mailto:yocto@lists.yoctoproject.org">yocto@lists=
.yoctoproject.org</a>&gt;<br></div><br><br><div dir=3D"ltr">I have the rest=
ructured text conversion far enough along for the &#39;kernel-lab&#39; to s=
hare it now. Because I was last working on this for Yocto Project Summit 20=
21.11, the current qemux86 base is on &#39;honister&#39; (although I am upg=
rading it to honister-3.4.4 tag).<div><br></div><div>Please realize there i=
s a lot of history to this material and some of it was done by folks that h=
ave left this mortal coil and some respect for that posterity is included i=
n this work. We can change and morph in the future, once it has been captur=
ed close to what it is here.<br><div><br></div><div>I also have a separate=
=C2=A0workflow going for the Yocto Project Summit 2022.05 which is in Googl=
e Slides and is qemuarm64 based (&#39;kirkstone&#39;). Eventually I will fi=
nd the time to update the kernel-lab manual to follow suit, but our collect=
ive discussion may impact that.</div><div><br></div><div><div>You can take =
a look at YP Summit 2021.11 to see a preview of what is coming for YP Summi=
t 2022.05 (once I figure out the pesky printk/pr_info issue):</div><div><a =
href=3D"https://elinux.org/images/b/be/Yps2021.11-handson-kernel.pdf" targe=
t=3D"_blank">https://elinux.org/images/b/be/Yps2021.11-handson-kernel.pdf</=
a></div></div><div><br></div><div>Current working branch of kernel-lab manu=
al:<br><a href=3D"https://github.com/moto-timo/yocto-docs/tree/timo/honiste=
r/kernel-lab" target=3D"_blank">https://github.com/moto-timo/yocto-docs/tre=
e/timo/honister/kernel-lab</a><br></div><div><br></div><div>And the accompa=
nying metadata training materials:</div><div><a href=3D"https://github.com/=
moto-timo/kernel-lab-layers/tree/wip-honister" target=3D"_blank">https://gi=
thub.com/moto-timo/kernel-lab-layers/tree/wip-honister</a><br></div><div><b=
r></div><div>The intent is that for a given release of the docs, we would h=
ave exercises for=C2=A0 LTS, Stable and Mainline (really this means current=
-stable, not -dev). Currently, LTS would be 5.10, Stable would be 5.15 and =
Mainline would be 5.17.</div><div><br></div><div>--Tim</div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#57084): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/57084" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/57084</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/91064347/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
91064347/924729</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@g=
mail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></div>

--0000000000000f557205ded4a3cc--

