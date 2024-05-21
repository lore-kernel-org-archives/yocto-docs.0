Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111F2C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:02:14 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.16931.1716289328740515492
 for <docs@lists.yoctoproject.org>;
 Tue, 21 May 2024 04:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=JakDzblT;
 spf=pass (domain: snapchat.com, ip: 209.85.167.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51ffff16400so8562881e87.2
        for <docs@lists.yoctoproject.org>; Tue, 21 May 2024 04:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1716289327; x=1716894127; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oaqcY0oAkLVLzXEqV3weAG0pwY+W02PTG5YbWAfIsmM=;
        b=JakDzblT3c58oK0aIaJAb4m5lCRRo+NLZr6v67RFAz77GpbMbPk7yhiodSmHBlAMY7
         e2TgCbHOgMWSjgkR05mEtgAldVOHIqYjluNe8dSyX68lFU7HOxbtyICILH4QUb5zfd2i
         hL5OHZ9zzNB8I7ZZFbq2gFFvyqJPVmYqlw/o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289327; x=1716894127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oaqcY0oAkLVLzXEqV3weAG0pwY+W02PTG5YbWAfIsmM=;
        b=AuLR9J56dHsHWaxmTXS12no8tpKWpDbkwi7nbS9uA1v7vbCH5wxmNkVBxgzHoNZMX7
         W0XNJ5BxbNxFa2CoMnRgqoMXzTDiDuJuzpl0KS6cGTvcd209KvEVOwYl8ZZQ3kPGjG8Y
         e0/GDzkeU8kRrbEsfK0uFJsYMY91rN2d4DKHeTeN3Vl2+18ghtva25tbzVRFtque1j5I
         U7BSA7PZ+TKZUJq/7/ly6Y+jZPtVOtiZsCkJPkSTJoi3ZvkYp8z3hq8bZPSANxkSasfh
         Dor3ioFFgrUEa51N996zsSeEf0/SU7oK8FA+2RatTHqaMqBoKnflcRBPXTR1BV0XggQY
         5dYA==
X-Forwarded-Encrypted: i=1; AJvYcCUjfyf5veHPPevHCne4MFrwkiY6ljYv+iNtqT1SRl2nZkMB3GL7A8bo17p7nGaoiUR4oSS87/2XhN0vdSn65v/HyRW8th6SRdYQQMo=
X-Gm-Message-State: AOJu0Yzf3/KZbIm8y7A7nfR7OM4OBKuc2lIx3w6Sa+yiD/Tg+Qm3SN5W
	QIPgG7dLUrctRo6l2MsYOTYBfRdFBsJ3ViihzMVOic94h5LOJYatnDCd/p2gEemKE2kXR1YQcOI
	QT+9fMnat6ky4koH4xD2jlVYdAzRoRZO///X5qg==
X-Google-Smtp-Source: AGHT+IEI8aIb/dSKzhdCpoz3QPNrCwheOHhsqumBDBRWmjE0eFOxMVQIGi56LY3l1Hg8PMcJb0M9PMAWT9gK8BfFsFU=
X-Received: by 2002:a05:6512:2250:b0:523:97bc:ea88 with SMTP id
 2adb3069b0e04-52397bcef31mr19710477e87.51.1716289326638; Tue, 21 May 2024
 04:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUKmYbx81srtVGCh1iyts893T7d7Sf44fgq+MTaxDSwMsXzZg@mail.gmail.com>
 <c21a8c13-98e1-41fd-8c05-d6f25023ed45@cherry.de>
In-Reply-To: <c21a8c13-98e1-41fd-8c05-d6f25023ed45@cherry.de>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 21 May 2024 13:01:55 +0200
Message-ID: <CAHUKmYbp8K0J0UkVToq=6Aiw-mB9hzotO1_Xd05V7QB=v2Ev8w@mail.gmail.com>
Subject: Re: [yocto] Workaround for uid_map error on Ubuntu 24.04
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: yocto@lists.yoctoproject.org, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a5e2730618f4bf1c"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 May 2024 11:02:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5225

--000000000000a5e2730618f4bf1c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The way I see to patch this at the moment is to print instructions for the
users to run this command manually when this specific error happens (we
can't run it automatically as part of bitbake since it needs sudo, and also
it decreases the security on the machine so end-users should be aware of
it). I can send a patch if you want, but this isn't really a clean solution=
.

Ubuntu 24.04 is not yet supported by yocto officially, and I hope the
Ubuntu bug will be fixed before yocto officially supports 24.04. What
people could do to help at this point is add themselves to the Ubuntu
launchpad bug as "affected user". This would raise the "Bug heat" score and
hopefully will increase the bug priority as well.

=C3=89tienne

On Tue, May 21, 2024 at 11:14=E2=80=AFAM Quentin Schulz <quentin.schulz@che=
rry.de>
wrote:

> Hi =C3=89tienne,
>
> On 5/19/24 10:34 PM, Etienne Cordonnier via lists.yoctoproject.org wrote:
> > You don't often get email from ecordonnier=3D
> snap.com@lists.yoctoproject.org. Learn why this is important<
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__aka.ms_LearnAboutS=
enderIdentification&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckf=
diw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DGa0g6vPBDqWTMnWmWWI=
azScsZWPKVOhI7TR0ntkOIUAfiCK4D92zWowI7OILY9uW&s=3D8-K5zsaLTjQfdiX6dZWibW4qt=
BSeCPRFCT8bsdcVt6o&e=3D
> >
> > Hi all,
> > in order to build poky on Ubuntu 24.04, I have needed this workaround t=
o
> fix the error "Errno 1 Operation not permitted" when disable_network (fro=
m
> bitbake/lib/bb/utils.py) attempts to write to the file /proc/self/uid_map=
:
> >
> > $ sudo apparmor_parser -R /etc/apparmor.d/unprivileged_userns
> >
> > For details, see
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugs.launchpad.net=
_ubuntu_-2Bsource_dash_-2Bbug_2056555&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4=
vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DG=
a0g6vPBDqWTMnWmWWIazScsZWPKVOhI7TR0ntkOIUAfiCK4D92zWowI7OILY9uW&s=3D8JSB9Fr=
Pu6_NMAVAgwB3Hg4iqe-SJiMTXyvR18KEmcs&e=3D
> >
>
> Thanks for bringing this up. I think we should have this documented in
> yocto-docs? So adding the mailing list in Cc
>
> @Michael do you have some idea on how and where to integrate this? (Or
> maybe you have some suggestion/patch ready =C3=89tienne?).
>
> Thanks,
> Quentin
>

--000000000000a5e2730618f4bf1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The way I see to patch this at the=C2=A0moment is to print=
 instructions for the users to run this command manually when this specific=
 error happens (we can&#39;t run it automatically as part of bitbake since =
it needs=C2=A0sudo, and also it decreases the security on the machine so=C2=
=A0end-users should be aware of it). I can send a patch if you want, but th=
is isn&#39;t really a clean solution.<br><br>Ubuntu 24.04 is not yet suppor=
ted by yocto officially, and I hope the Ubuntu bug will be fixed before yoc=
to officially supports 24.04. What people could do to help at this point is=
 add themselves to the Ubuntu launchpad bug as &quot;affected user&quot;. T=
his would raise the &quot;Bug heat&quot; score and hopefully will increase =
the bug priority as well.<br><br>=C3=89tienne</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 21, 2024 at 11:14=
=E2=80=AFAM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de">=
quentin.schulz@cherry.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi =C3=89tienne,<br>
<br>
On 5/19/24 10:34 PM, Etienne Cordonnier via <a href=3D"http://lists.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> =
wrote:<br>
&gt; You don&#39;t often get email from ecordonnier=3D<a href=3D"mailto:sna=
p.com@lists.yoctoproject.org" target=3D"_blank">snap.com@lists.yoctoproject=
.org</a>. Learn why this is important&lt;<a href=3D"https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__aka.ms_LearnAboutSenderIdentification&amp;d=
=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DGa0g6vPBDqWTMnWmWWIazScsZWPK=
VOhI7TR0ntkOIUAfiCK4D92zWowI7OILY9uW&amp;s=3D8-K5zsaLTjQfdiX6dZWibW4qtBSeCP=
RFCT8bsdcVt6o&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__aka.ms_LearnAboutSenderIdentificat=
ion&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DGa0g6vPBDqWTMnWmWWI=
azScsZWPKVOhI7TR0ntkOIUAfiCK4D92zWowI7OILY9uW&amp;s=3D8-K5zsaLTjQfdiX6dZWib=
W4qtBSeCPRFCT8bsdcVt6o&amp;e=3D</a> &gt;<br>
&gt; Hi all,<br>
&gt; in order to build poky on Ubuntu 24.04, I have needed this workaround =
to fix the error &quot;Errno 1 Operation not permitted&quot; when disable_n=
etwork (from bitbake/lib/bb/utils.py) attempts to write to the file /proc/s=
elf/uid_map:<br>
&gt; <br>
&gt; $ sudo apparmor_parser -R /etc/apparmor.d/unprivileged_userns<br>
&gt; <br>
&gt; For details, see <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__bugs.launchpad.net_ubuntu_-2Bsource_dash_-2Bbug_2056555&amp;d=
=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbN=
onVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DGa0g6vPBDqWTMnWmWWIazScsZWPK=
VOhI7TR0ntkOIUAfiCK4D92zWowI7OILY9uW&amp;s=3D8JSB9FrPu6_NMAVAgwB3Hg4iqe-SJi=
MTXyvR18KEmcs&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldef=
ense.proofpoint.com/v2/url?u=3Dhttps-3A__bugs.launchpad.net_ubuntu_-2Bsourc=
e_dash_-2Bbug_2056555&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgG=
kICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DG=
a0g6vPBDqWTMnWmWWIazScsZWPKVOhI7TR0ntkOIUAfiCK4D92zWowI7OILY9uW&amp;s=3D8JS=
B9FrPu6_NMAVAgwB3Hg4iqe-SJiMTXyvR18KEmcs&amp;e=3D</a> <br>
&gt; <br>
<br>
Thanks for bringing this up. I think we should have this documented in <br>
yocto-docs? So adding the mailing list in Cc<br>
<br>
@Michael do you have some idea on how and where to integrate this? (Or <br>
maybe you have some suggestion/patch ready =C3=89tienne?).<br>
<br>
Thanks,<br>
Quentin<br>
</blockquote></div>

--000000000000a5e2730618f4bf1c--

