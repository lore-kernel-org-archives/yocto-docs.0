Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403CFC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 00:32:46 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.4095.1647563564527261923
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 17:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c5a47Jyc;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a8so14065842ejc.8
        for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 17:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/4Oaojhm9LqRyRvFM+2HUgrlpKpz+8uObloxxFxFZBs=;
        b=c5a47JycNWRIt8xot3WBVWBrHUbXIElnJsEBtAJYYEUZvuzTFW0G6ReZLs04cWJ7zf
         +YihGQn5MWbsJna7x6NStN6y0fREQPQywf4PSa/TaDh9VYidLRhnMFPEGmvbAGcjT87i
         g/D0r8lXgomxo/1c4uKQYCYx/9KsaPK6Bi8somHzxARPR6ykyDB/5jnm6FR066aP9ROn
         7YOnxNjqL/UbGsZlfo4miDTFdXguezRPaf0WTtshpTo8EV/lfBSe2w1KZF9Wym3rc5ZL
         ZrWtbsaLYa1Oxg1Vlnv2j8FjKQmWD34tR1deyi4TpQr9y4XXvVRQOtgArXZSYWPNGMwU
         A7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/4Oaojhm9LqRyRvFM+2HUgrlpKpz+8uObloxxFxFZBs=;
        b=XG9zfQECbwqCQlYcHZAv8VZORGwO3HSfNjcCu10thlDL0Ynqa+R97cNP3nInQ81krR
         +rs1BYotpSAJKl5d7TfEnw7g/V04HKhvTGXZm/vv6zVRnmJu7Ud2M24+p7vS+ld1oAqy
         +17vZoFr9ct2On9EmYIZhBSiiZY4qbtHrh3RFNdZT/qm2/oW2+rQhxmKaQP75olHSHao
         pp2l20IvgwbkeaYmBWCCyK7kKXZm3LmU7SaOrweca/P6XpcGFdIIQcAVeIj4q/zMcIpL
         Ei3VEOFkmVnoTwvizVjT2sbyKr0HHHUe/bPPi1so/+pS4l7PlAHOD4jYzoUnpy7Pt9nt
         NNxQ==
X-Gm-Message-State: AOAM530QrRnDSOC3rchhxWQ1kq5luGtqIX6QxZvJ9CfuvqYDgxm4OcQb
	c2nBFU2FlkHfnn05fWpjEPldXFyDcuMCmHonqAb6/w==
X-Google-Smtp-Source: 
 ABdhPJxu+M3bnh8hmDOmrGYm8w+cLNBUQUkcwVkY7jzqpy9gqHlXorCDzH3wE6eaiLIugusLrf6EZhoBC4/7axbJTYU=
X-Received: by 2002:a17:906:4fc8:b0:6d8:5059:f998 with SMTP id
 i8-20020a1709064fc800b006d85059f998mr6738201ejw.487.1647563562542; Thu, 17
 Mar 2022 17:32:42 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
In-Reply-To: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Mar 2022 14:32:31 -1000
Message-ID: 
 <CAOSpxda4QwAwJhie=FWiN_gYsGn-j4gMK2V+dP-d_W_1f9SbGQ@mail.gmail.com>
Subject: Re: [docs] Version bump before release
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 00:32:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2620

On Thu, Mar 17, 2022 at 2:04 PM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> Hello,
> In the past we've correctly bumped the versions in the yocto-docs release=
 branches before the release build and I only need to update the master bra=
nch to update the switcher on the website. This doesn't happen reliably tho=
ugh and we've been having to patch the build system to make the docs build =
correctly.

I've been confused about this too.  I always submit a docs patch prior
to the release, and until recently they were take pre-release.
However lately this has changed and I too am not sure why!

Steve

>
> Ideally all that would be needed at release time is a patch like https://=
git.yoctoproject.org/yocto-docs/commit/?id=3D78545b8f42657c21bc3cac96429d39=
50b07a3aca to update the website.
>
> Lately I've also had to make patches like these as well during release:
>
> https://git.yoctoproject.org/yocto-autobuilder-helper/commit/?id=3Dca8e95=
276d96b94d97e269b0f4f9ad306f8417d7
> https://git.yoctoproject.org/yocto-docs/commit/?h=3Dhonister&id=3D7980cfe=
942a1c8ceb3fd6b003ec6346d9bc11015  (honister branch)
>
> What process can we put in place to make sure these version bumps happen =
on the named branch before the release candidate builds?
>
> Richard suggested a test that would make RC builds fail if the docs versi=
on were outdated. Any idea how to write that test? What other ideas come to=
 mind?
>
> Thank you,
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2619): https://lists.yoctoproject.org/g/docs/message/=
2619
> Mute This Topic: https://lists.yoctoproject.org/mt/89858420/3620601
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [steve@sakoman.c=
om]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

