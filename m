Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D9FC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 19:40:49 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.655.1649786022228321989
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 10:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XNA6VDK4;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id s4so14345912qkh.0
        for <docs@lists.yoctoproject.org>;
 Tue, 12 Apr 2022 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w6IfTk16oCFYMY0xWYbp01OSn4fRAuDfFiOmR3Zm0nA=;
        b=XNA6VDK40ySJepiK4cgZ/DmKfI8iZ0LNA5NMFODkp7UE0qr/TSRiwuHyNcV8FD19GT
         8arotEEudKrI048rwzSQOrCQL+BYJFLUtVLxRo4nrAKbnPqozk0pTvOnPgp6Ou7cObsL
         Fg0mx6LD/SOKqePCZgcAQ1c95z7h0eItokfenA0Xi2w3/g3Qcx1B91blSSwIiLNYvi9n
         KjuT9oPTdaTOj1M5V0wvrI2N0KOekkhM5JMv+wkD7INh4yfYU+0udD15wTf8qeauoz0R
         r+PlRpU0yvjhiSYO7DXhn27FFngsZcoYtA+03tMDOc24jSw4ak/sX7gvsCIgYvF975H7
         aGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w6IfTk16oCFYMY0xWYbp01OSn4fRAuDfFiOmR3Zm0nA=;
        b=r+bImDvp+rTP193mYuq0AdhKqURZ5TbaKOkF5RPE3JwAKVEpdv6J/wuW9kTulyIr6T
         J0Ndluh+hquIEe08tPEEP/e7BzH9ORkj6+vL5UPRl/PgXqvV9vCmM5XdBsNy/YiY1DPI
         QilhX67zkQ9fK/zx0sWfPWmfwcWYfjRD3hFI0e573EPgC8Wt7ifveHh3hJhn4gsHfcB6
         lUtQkVbKJXJTLEPEzpGu4Upyh0A6OqovBMdmN52wTVoa6GQnPCgKCjPaKdxULdL3ZOVL
         AaGRbyPkWYvDtB/8t5T2HCkmhC9Obp8XFsDz3I01uGO3gj2J9Th0YveMC1SqS85c34O+
         4WXw==
X-Gm-Message-State: AOAM532dlmfdFGMmpNqrW4Enm7RxhZURXtSdzfx+y7s5VcN2uAdCZig3
	M7Bs2/F315Mc8MFyLMh/MYT3stQuzqZry4RzDT4JBP0briLK6w==
X-Google-Smtp-Source: 
 ABdhPJygmfYY2HFZcJPpuPclDhpdRNSy0FTO29SpS3hCfL6Qu5ZskYmj26+k81mIdMD0C+Ur+bIQXWV1iB6xhHIDzME=
X-Received: by 2002:a05:620a:460a:b0:69b:f4ce:e764 with SMTP id
 br10-20020a05620a460a00b0069bf4cee764mr3974351qkb.227.1649786021184; Tue, 12
 Apr 2022 10:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
In-Reply-To: <2fd29235-6c93-a911-944a-f78dd7a27904@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Apr 2022 10:53:15 -0700
Message-ID: 
 <CAMKF1srKX8PovgRGw9jjJM+X2+dADFcRav0RuxVLka7_m1NozQ@mail.gmail.com>
Subject: Re: [docs] YP Quick Build: errors/annoyances: ubu-22.04 docker
 container
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Apr 2022 19:40:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2762

On Tue, Apr 12, 2022 at 9:05 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
>
> Some things I noticed when using:
>
> https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html
>
> to setup a docker container running ubu-22.04-beta .
> $
>
> $ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essenti=
al chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianut=
ils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pyli=
nt3 xterm python3-subunit mesa-common-dev zstd liblz4-tool
>
> should be:
>
> $ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essenti=
al chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianut=
ils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pyli=
nt xterm python3-subunit mesa-common-dev zstd liblz4-tool
>
> i.e. s/pylint3/pylint/
>

perhaps good to update the pre-requisites section in docs.

>
> and I also see:
>
> $ bitbake libarchive-native
> ERROR: The following required tools (as specified by HOSTTOOLS) appear to=
 be unavailable in PATH, please install them in order to proceed:
>   file
>
> and
> $ sudo apt install file
>
> fixes that.

This perhaps needs to be added to pre-requisites too. Just ensure that
it works with older debian-like distros too.

>
>
> Finally, there's no explanation of how to deal with:
> $ bitbake libarchive-native
> ERROR:  OE-core's config sanity checker detected a potential misconfigura=
tion.
>     Either fix the cause of this error or at your own risk disable the ch=
ecker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>
>     Your system needs to support the en_US.UTF-8 locale.
>
> Should that be part of the quick start or is there a section of the docs =
that
> already covers it for supported distros? Likely many desktop installs alr=
eady
> configure a variety of locales.
>
>
> Should I create a bug for any of these issues?

yeah perhaps something like this in setting up the container might help

locale-gen en_US.UTF-8
update-locale LANG=3Den_US.UTF-8


>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2761): https://lists.yoctoproject.org/g/docs/message/=
2761
> Mute This Topic: https://lists.yoctoproject.org/mt/90421420/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [raj.khem@gmail.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

