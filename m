Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC93EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:47:07 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.15477.1687877222170023207
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UiL3X4bZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so1927459e87.2
        for <docs@lists.yoctoproject.org>; Tue, 27 Jun 2023 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687877220; x=1690469220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pnHPlwY0AyGGcERvtlQerH4qRJESNkqTU/mqvx0FyE=;
        b=UiL3X4bZFCPgqDFXr9Xat9y+rI8aS1zjMFQTbNx3lanomiMheh8xFn2km4venJWKJa
         IDOb/fSVQY7x0BCSsxAgNOlITzyA3pMXvr06ey04VE/1icql0pWHXnJIkihcKJhQc3cb
         mV+MJDWkdUCVgVuDirCrMaPLmUdMlNC2Bbranrq+g7DOEG1fwe4pXVzHpO45ewZCKMVF
         2WDiPEAB4uPbGUMlJe5sBXZ0fyKuVJc5WPrwv80z++cJZkQ1T/4ThHLTWhtxMLZOqcoQ
         IW9vPQo02fEKGeSBm5mPntMadQ1jIgYyw7i9IZXCbOwmJSnBzWWIfNaDg4tqct+Wtd0U
         2lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687877220; x=1690469220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pnHPlwY0AyGGcERvtlQerH4qRJESNkqTU/mqvx0FyE=;
        b=PC0beIgsra1fk92cH9cqrQyuYwKcAI3yoA/9IHiGh5puXmL75OxfbCXsrCbigyqabj
         g0h2zf5tDAbeLMyT5nb1LGoxR8guBM9aoz6zSSykaztqk3c/ElhgK2LV5iMrXO5uBS0I
         URNzzYCyymO0wpASQRKGW7rzsJJt6ZWeosoOLEt3kCIHHes3S1btaVwHvTgda/rt9s3e
         K0M1t2QqZ1TthDxj+hgVgO6Po1Gw5866L54msw6EaX9Raq26JUVcZa4lGajWJ6zCc5aE
         M+ubRf94c3RTEJXSdbBq9rjvqQOqdm2l+8valnuRn1cpVnFnwedwPz5+MlynqBOBf2lc
         IoZA==
X-Gm-Message-State: AC+VfDzKSElv1HFGJtzVza6UupihWBg8vmV8Mz2xv9lqKt+8D9Bi/cyg
	iLQDwJ40vJRxV7GodypLQsAEiNC6FGFnvlhq5RU=
X-Google-Smtp-Source: ACHHUZ5u+xx538ng+I6EFFQDc3eaAVR0Xu3lG6uSuOFXV3IbRHQAzhHmsPVRBkyJHV9GQV/T3Z23Nn7gq9vma9nXIJ8=
X-Received: by 2002:ac2:58e4:0:b0:4fb:89f5:f6d2 with SMTP id
 v4-20020ac258e4000000b004fb89f5f6d2mr693036lfo.47.1687877219966; Tue, 27 Jun
 2023 07:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9kbo+WzKyAi98qeXcxW8PdNxUEk4_WyP+gzUfSLn_99i1Y6A@mail.gmail.com>
In-Reply-To: <CAO9kbo+WzKyAi98qeXcxW8PdNxUEk4_WyP+gzUfSLn_99i1Y6A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Jun 2023 16:46:49 +0200
Message-ID: <CANNYZj-ngVD=TtTBctUz2VhU4Gx_KJG+hoQRWPjATkSRWnFvRA@mail.gmail.com>
Subject: Re: [docs] First quick build of Yocto poky
To: jeremy.drezet@airbus.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:47:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4043

Hello Jeremy,

'airbus.com' address makes me wonder if your computer has restricted
access to the external Internet. What happens if you run 'wget
https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz' on the command
line? Do you need to set up proxy access to make it succeed?

Alex

On Tue, 27 Jun 2023 at 14:44, Jeremy DREZET via lists.yoctoproject.org
<jeremy.drezet=3Dairbus.com@lists.yoctoproject.org> wrote:
>
> Hello
>
>
> I send you this email because I am just trying to build a first version o=
f Poky in order to test basic capabilities of th OS, but when using "bitbak=
e" I have some warnings and errors of this kind :
>
> #########################################################################=
##
>
> WARNING: cmake-native-3.25.2-r0 do_fetch: Failed to fetch URL https://cma=
ke.org/files/v3.25/cmake-3.25.2.tar.gz, attempting MIRRORS if available
> ERROR: cmake-native-3.25.2-r0 do_fetch: Fetcher failure: Fetch command ex=
port PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/r=
un/user/1001/bus"; export SSH_AUTH_SOCK=3D"/run/user/1001/keyring/ssh"; exp=
ort PATH=3D"/home/adminj/poky/scripts/native-intercept:/home/adminj/poky/bu=
ild/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/adminj/poky/scripts:/=
home/adminj/poky/build/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-=
sysroot-native/usr/bin/x86_64-linux:/home/adminj/poky/build/tmp/work/x86_64=
-linux/cmake-native/3.25.2-r0/recipe-sysroot-native/usr/bin:/home/adminj/po=
ky/build/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroot-native=
/usr/sbin:/home/adminj/poky/build/tmp/work/x86_64-linux/cmake-native/3.25.2=
-r0/recipe-sysroot-native/usr/bin:/home/adminj/poky/build/tmp/work/x86_64-l=
inux/cmake-native/3.25.2-r0/recipe-sysroot-native/sbin:/home/adminj/poky/bu=
ild/tmp/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroot-native/bin:=
/home/adminj/poky/bitbake/bin:/home/adminj/poky/build/tmp/hosttools"; expor=
t HOME=3D"/home/adminj"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /hom=
e/adminj/poky/build/downloads/cmake-3.25.2.tar.gz.tmp -P /home/adminj/poky/=
build/downloads 'https://cmake.org/files/v3.25/cmake-3.25.2.tar.gz' --progr=
ess=3Ddot -v failed with exit code 4, no output
>
> ERROR: cmake-native-3.25.2-r0 do_fetch: Bitbake Fetcher Error: FetchError=
('Unable to fetch URL from any source.', 'https://cmake.org/files/v3.25/cma=
ke-3.25.2.tar.gz')
>
> ERROR: Logfile of failure stored in: /home/adminj/poky/build/tmp/work/x86=
_64-linux/cmake-native/3.25.2-r0/temp/log.do_fetch.330289
>
> ERROR: Task (/home/adminj/poky/meta/recipes-devtools/cmake/cmake-native_3=
.25.2.bb:do_fetch) failed with exit code '1'
>
> #########################################################################=
##
>
>
> Maybe something is wrong with sockets use... Could you please help me on =
this point ?
>
> Thanks in advance
>
>
> J=C3=A9r=C3=A9my Drezet
> APYT BU Cybersecurity Consulting
> The information in this e-mail is confidential. The contents may not be d=
isclosed or used by anyone other than the addressee. Access to this e-mail =
by anyone else is unauthorised.
> If you are not the intended recipient, please notify Airbus immediately a=
nd delete this e-mail.
> Airbus cannot accept any responsibility for the accuracy or completeness =
of this e-mail as it has been sent over public networks. If you have any co=
ncerns over the content of this message or its Accuracy or Integrity, pleas=
e contact Airbus immediately.
> All outgoing e-mails from Airbus are checked using regularly updated viru=
s scanning software but you should take whatever measures you deem to be ap=
propriate to ensure that this message and any attachments are virus free.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4041): https://lists.yoctoproject.org/g/docs/message/=
4041
> Mute This Topic: https://lists.yoctoproject.org/mt/99808390/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

