Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45172C433EF
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:22:20 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.61516.1638195739623264517
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XKqkJvL1;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id c3so21693644iob.6
        for <docs@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lr475tN2JX84w2+wi8B1/M2lAiyw/nhI5TYOoOUXM2U=;
        b=XKqkJvL1eSNMH5PMjUHKz9dt8/M8UlMmPcEsNX73vUZ733K3osQtA466G0upLDyN9X
         H0onkluPMRYhxGXekhrps8f+b3BTEFFmKch9JWeolJSsXdOCmrxSbv53logqt3VFqQRG
         BcuBgOQ98bxQlqRyB1yy2tKPJaOOO+e1YSc2SquwuhzzTceiJH3sPfcNABAlAQVGQ3St
         gvxHHQYsD9PzJ3iLIMKnHZqZZgGyzH38+/xlqkYz5AmX4EbQnCsUyBDqav8PnJho5DfJ
         bil/7C8dXqvwpojlyMzSUSPHX3vZy3vrWwR0oLpDC84wZCKTSouCodyjCxU/ifdIO6mb
         +zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lr475tN2JX84w2+wi8B1/M2lAiyw/nhI5TYOoOUXM2U=;
        b=T08x5GlamKCm7aKzkeDytHR4R06Si7VyJ07/M4ipNOd3b4OvHHTtzLbXtAGLxrpjXl
         KTeF40c7pG7uG2jzwR8XEGmy8xZ5atEh7qF2qQd1dr04j1P8ILWx9pIP/N87OIKbLmyX
         ELmX5Il13L/QEnCu2a/qULuBcD6fMXqg+7wMHmc2woke9YKYL+IwAlfMqaccCTZDAwLN
         K6tjpfyGb+/Xv2PiV33p5v5pDwZyGXCcDq/CcmzQIpPEEWurw95ppCMytuWqE3KH945d
         GVADHPpD2huMblqIIHVsmX4jwgmaYNtR9T97mDBVshUdeUkJSImnXVl9hT6NMMVjGKhP
         0TpQ==
X-Gm-Message-State: AOAM531EfS079W+lR2ZZX8O+mt25BzDTHA1Noc7TnXdntLD2bKIa1Z3B
	/bXNt+MfZ6ja45n0mmZv/u99Do/vGCZrG3aUQKwe5jLI9sw=
X-Google-Smtp-Source: 
 ABdhPJw4HX98KUKJJqOSYoBEBCibjHoQP+p4ByRg+rLXpMlQYc8TqbhU9HlbiWcssrpB1K7/efiJSfJmox432iHp9kY=
X-Received: by 2002:a02:a489:: with SMTP id d9mr65606222jam.47.1638195737319;
 Mon, 29 Nov 2021 06:22:17 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 29 Nov 2021 06:22:06 -0800
Message-ID: 
 <CANx9H-C8xFhYQMJT5thuv6NuQ3nJN49zHAiMGhoQHhcZ=PNtLA@mail.gmail.com>
Subject: Documentation standard: considerations for accessibility
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000fedbcb05d1ee2ad2"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:22:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2208

--000000000000fedbcb05d1ee2ad2
Content-Type: text/plain; charset="UTF-8"

I know we have just begun to have some standards for our documentation [1].

As I am preparing the Hands-on Kernel Lab [2] for contribution, it came to
mind that my screen captures of qemu are not helpful to our visually
impaired colleagues using screen readers. I thought I would start this
thread so we can contemplate accessibility as part of our standards.

A quick search led to [3], which as I suspected suggests adding alt-text to
summarize what an image is trying to show. I doubt full-text of the qemu
log would be appropriate, but perhaps calling out the specific lines that
are of interest?

There are other suggestions in [3] about font styling and so on that are a
bit harder to see an easy path forward on. Perhaps an accessible rendering
that skips the fancy styling?

Obviously this is not a well-thought out proposal. I just thought we could
start a conversation.

[1] https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md
[2] https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab
[3] https://developers.google.com/style/accessibility

--000000000000fedbcb05d1ee2ad2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I know we have just begun to have some standards for our d=
ocumentation [1].<div><br></div><div>As I am preparing the Hands-on Kernel =
Lab [2] for contribution, it came to mind that my screen captures of qemu a=
re not helpful to our visually impaired=C2=A0colleagues using screen reader=
s. I thought I would start this thread so we can contemplate accessibility =
as part of our standards.</div><div><br></div><div>A quick search led to [3=
], which as I suspected suggests adding alt-text to summarize what an image=
 is trying to show. I doubt full-text of the qemu log would be appropriate,=
 but perhaps calling out the specific lines that are of interest?</div><div=
><br></div><div>There are other suggestions in [3] about font styling and s=
o on that are a bit harder to see an easy path forward on. Perhaps an acces=
sible rendering that skips the fancy styling?</div><div><br></div><div>Obvi=
ously this is not a well-thought out proposal. I just thought we could star=
t a conversation.</div><div><br></div><div>[1]=C2=A0<a href=3D"https://git.=
yoctoproject.org/yocto-docs/tree/documentation/standards.md">https://git.yo=
ctoproject.org/yocto-docs/tree/documentation/standards.md</a></div><div>[2]=
=C2=A0<a href=3D"https://github.com/moto-timo/yocto-docs/tree/timo/kernel-l=
ab">https://github.com/moto-timo/yocto-docs/tree/timo/kernel-lab</a></div><=
div>[3]=C2=A0<a href=3D"https://developers.google.com/style/accessibility">=
https://developers.google.com/style/accessibility</a></div></div>

--000000000000fedbcb05d1ee2ad2--

