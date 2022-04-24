Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4063C46467
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.13402.1650764298750676834
 for <docs@lists.yoctoproject.org>;
 Sat, 23 Apr 2022 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ea68rMak;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id n18so19324147plg.5
        for <docs@lists.yoctoproject.org>;
 Sat, 23 Apr 2022 18:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=PZyD/YVNc8ESDjYrgl9xfDGAl5OeEUb2ePCt+zaIHDE=;
        b=ea68rMakH3MmbT16Lx9E4yBSTJ7UXENXOC4Jcy9nWUDSfVi4YYO414rmRAzDfUGPBL
         05QxCufdH5LXO/eihRpN12x8EAmZXiTCR+kp8ORJPeTAU4z9pNzxDn8j+KGotnx/z4l1
         4tiQeOlY+T4ZiyxoOeX9RCRz7SsuJyTreY2XfyyiYHo+tyZd6QYcfCe6naqGwFD9hAn/
         YdmOBvxPgsE0zq3pntWNI3QgnXEycKzHU2HFMWp3I0qx9CnD0oJYwPAVZLdpzVPVZV4a
         ONOS/ETZuU8EnQMp+2loOX+ILJ33giO8QiNjRoB+ubtGQPGUuS8xzyxwVsVLvM5Sd5OH
         lKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=PZyD/YVNc8ESDjYrgl9xfDGAl5OeEUb2ePCt+zaIHDE=;
        b=WFpKUER4WogCgJwPH7BZ+A2lYfzQTtkxMdkPFa9Rob/2Q7Pll8J1LntwULhQaVpyD8
         E1arei5F8xYrDh03RtoVpUv+KEyNLBBt/UGVMB5x6tIl5m0VJF3q/TKzBqwm8byzgCOC
         Ltsnns9L59r2/bXX/Wf7SnBoP3OM9NHfd7wEGIdYMWM5Xgxzvk/u3hNYPGl9qw4zXoMw
         GwIHMiKrbx4OrCEAvPYxmjEy2ZQVLLLDK9JEW56RmycyZ3TX4M5fyV/3u1uK48Rj2q8g
         4+KzpAs7wZUVAngyr5TzqngyjEwWSC/ABPdIoAxcXma7rk9pmXIRw4eJSd86FqrRugQ/
         Vm6g==
X-Gm-Message-State: AOAM532IAG/ED5m059PBcdaJpi6AVE6L5dqIevx2SjSPfbfguoKV8vlD
	CdAYXix41jVqzZj+FpJ5Cj7gTviIIWfUbV2bK5CQ5/qFpFc=
X-Google-Smtp-Source: 
 ABdhPJxHiVA+YVAg62Lff1cI8035YSwFFyrJ4GbNYo1yxKJ1J7YnS78RZqipYYLXF2dgKijFLjB0FMPpHBBHaMhm0lI=
X-Received: by 2002:a17:902:8f86:b0:15b:4dfa:ba7b with SMTP id
 z6-20020a1709028f8600b0015b4dfaba7bmr11576805plo.43.1650764297673; Sat, 23
 Apr 2022 18:38:17 -0700 (PDT)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 23 Apr 2022 18:38:06 -0700
Message-ID: 
 <CANx9H-Ai+s8euDAX4nf1kt16DC5Jya6a0ygQO=6Ryv48Z1de3Q@mail.gmail.com>
Subject: Alphabetize the Required Packages for Build Host?
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000009221ab05dd5c8341"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2856

--0000000000009221ab05dd5c8341
Content-Type: text/plain; charset="UTF-8"

Historically, new requirements have just been added to the end of the lists
in:
http://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host

This makes it tricky to see if you have the correct packages installed,
e.g. in a Docker container.

Thoughts?

--0000000000009221ab05dd5c8341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Historically, new requirements have just been added to the=
 end of the lists in:<div><a href=3D"http://docs.yoctoproject.org/ref-manua=
l/system-requirements.html#required-packages-for-the-build-host">http://doc=
s.yoctoproject.org/ref-manual/system-requirements.html#required-packages-fo=
r-the-build-host</a><br></div><div><br></div><div>This makes it tricky to s=
ee if you have the correct packages installed, e.g. in a Docker container.<=
/div><div><br></div><div>Thoughts?</div></div>

--0000000000009221ab05dd5c8341--

