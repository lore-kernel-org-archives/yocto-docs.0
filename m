Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E967C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 00:04:46 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.3971.1647561885038775836
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 17:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IhOMBoHy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id s25so9355554lji.5
        for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=P9L0KyTLoGoVyePiY/QK4LOH/G7Y8Bz2U+ik2wCWnjY=;
        b=IhOMBoHyag+gPHNo9FwFetioeaHkRBPydjS6LTuEtS/3iuUsPr7kfQ7tqakkLa82sA
         lxEYJzc61xyZ/eY2WnAdDu4jMnJKLaKd5RmpsYgJ+Dfbdm+2+s7FwGw8+buJNVY3NqQ/
         dn1i70k8T3EbZzgwsOJyK9raKefavbdqMcvHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=P9L0KyTLoGoVyePiY/QK4LOH/G7Y8Bz2U+ik2wCWnjY=;
        b=JV80+pqh7aO9CiBUe541uRQFb5IZB1ypW3DYarCoJfZRjHF+6DkQew7nSB37sgsTp8
         zfF9IA9U5AQD72D2hmkbf8dBrFfqxicOXfafMqnvNBmAmzdQHp7fq74XE9sLd2RvXJmO
         aqHDBkug4oWhAgVrHcQaEQmvHzpPZmyqVrWfhbE38n1VcamHkulBNmhYqUWLks1CaixF
         6J0LJKVPnhtB8q24tcWjDvnBrD5J6BnxRIvx+ZJLjyRpUzLbV0dS0EDmq+1uqut5mNsX
         TM6JjjMGtR+aVvDugOTsFp00AnDnMGtkBMPG+lF5UvaQHI6Wjdfkh2I4SFofFJyuV2yc
         Ft2A==
X-Gm-Message-State: AOAM533Ztn5HA4CM78V1XIFPt3s8EXgn42NcLcG8i8RkFW0sIV9abGoz
	XJl3dqXSj6nrjHoHAFf5W+2d1SdK58Pm3uB2v3NiJCFmitqbww==
X-Google-Smtp-Source: 
 ABdhPJyhEWymgz11Z51d9TIrB1330Idcqbk1HFoj8lxNd/KvtyDaRSKUuSABAuMw1nJyNQnRjo4ytPTzVuxizrhtHi0=
X-Received: by 2002:a2e:9844:0:b0:244:c274:10db with SMTP id
 e4-20020a2e9844000000b00244c27410dbmr4576758ljj.120.1647561882820; Thu, 17
 Mar 2022 17:04:42 -0700 (PDT)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 17 Mar 2022 17:04:32 -0700
Message-ID: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
Subject: Version bump before release
To: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c5754205da72e474"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 00:04:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2619

--000000000000c5754205da72e474
Content-Type: text/plain; charset="UTF-8"

Hello,
In the past we've correctly bumped the versions in the yocto-docs release
branches before the release build and I only need to update the master
branch to update the switcher on the website. This doesn't happen reliably
though and we've been having to patch the build system to make the docs
build correctly.

Ideally all that would be needed at release time is a patch like
https://git.yoctoproject.org/yocto-docs/commit/?id=78545b8f42657c21bc3cac96429d3950b07a3aca
to update the website.

Lately I've also had to make patches like these as well during release:

https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=ca8e95276d96b94d97e269b0f4f9ad306f8417d7
https://git.yoctoproject.org/yocto-docs/commit/?h=honister&id=7980cfe942a1c8ceb3fd6b003ec6346d9bc11015
(honister branch)

What process can we put in place to make sure these version bumps happen on
the named branch before the release candidate builds?

Richard suggested a test that would make RC builds fail if the docs version
were outdated. Any idea how to write that test? What other ideas come
to mind?

Thank you,
-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000c5754205da72e474
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>In the past we&#39;ve correctly bumped the vers=
ions in the yocto-docs release branches before the release build and I only=
 need to update the master branch to=C2=A0update the=C2=A0switcher on the w=
ebsite.=C2=A0This doesn&#39;t happen reliably though and we&#39;ve been hav=
ing to patch the build system to make the docs build correctly.</div><div><=
br></div><div>Ideally all that would be needed at release time is a patch l=
ike=C2=A0<a href=3D"https://git.yoctoproject.org/yocto-docs/commit/?id=3D78=
545b8f42657c21bc3cac96429d3950b07a3aca">https://git.yoctoproject.org/yocto-=
docs/commit/?id=3D78545b8f42657c21bc3cac96429d3950b07a3aca</a> to update th=
e website.</div><div><br></div><div>Lately I&#39;ve also had to make patche=
s like these as well during release:</div><div><br></div><div><a href=3D"ht=
tps://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=3Dca8e95276d=
96b94d97e269b0f4f9ad306f8417d7">https://git.yoctoproject.org/yocto-autobuil=
der-helper/commit/?id=3Dca8e95276d96b94d97e269b0f4f9ad306f8417d7</a></div><=
div><a href=3D"https://git.yoctoproject.org/yocto-docs/commit/?h=3Dhonister=
&amp;id=3D7980cfe942a1c8ceb3fd6b003ec6346d9bc11015">https://git.yoctoprojec=
t.org/yocto-docs/commit/?h=3Dhonister&amp;id=3D7980cfe942a1c8ceb3fd6b003ec6=
346d9bc11015</a>=C2=A0 (honister=C2=A0branch)<br clear=3D"all"><div><br></d=
iv><div>What process can we put in place to make sure these version bumps h=
appen on the named=C2=A0branch before the release candidate=C2=A0builds?=C2=
=A0</div><div><br></div><div>Richard suggested a test that would make RC bu=
ilds fail if the docs version were outdated. Any idea how to write that tes=
t? What other ideas come to=C2=A0mind?</div><div><br></div><div>Thank you,<=
/div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yoc=
to Project</div><div>Systems Operations Engineer</div></div></div></div></d=
iv>

--000000000000c5754205da72e474--

