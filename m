Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1049C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 21:55:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.32614.1639518908484226061
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:55:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ODU2e/4X;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id o13so34713839wrs.12
        for <docs@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 13:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FBY/FeOcZ/vDpmCetgPziLKtL57qUoAsZmWDEkSJsYo=;
        b=ODU2e/4XJ5TtnaxebFCWO1VBN0wIAAAz13xYpQXPifa23meSAbuf8m9gOxa49WcXqm
         TiMYp08EVZnfmfMdsyfqU71GGoF1aZPU+fkghQioi137PJDoyAbV+dvtSWdMFsrxxSaf
         B2lWLdYl+ARZjfnBCBYPixDUrokAMGgK/MGHG8khmvEGTB4JJSHlj2dGgGiXRIrnPMru
         FtAnT38N/4zK1zmWAgwvuXRRil3TRq9TCecXNzZT7M/ANNngvx2qAFpJDFBVYmOoP+3k
         453XTGQsLw2V816ea/fDvNeIuM1bVXKjo2qy0p838pOCsdmr9FfpBJHwnslUH2A3HQhT
         eObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FBY/FeOcZ/vDpmCetgPziLKtL57qUoAsZmWDEkSJsYo=;
        b=xvQYnOi9jkNbxOo9xFfcRRlE/Hitu3Pa+Qzdez3Sntv7ZtV+QHasQbwK/tTVgng09k
         Uejwjhh9svTiNf2rVpRyoAy+4P/EGA88lpU0Vzlc4Dr1yTFYSkCx7xMBDO4LmXFIUjRT
         4dOCw66+92V4p1WVm+NlyqRStoXq1LyxXS8RnqyR+JmBzK3wyJ5HYimc5cTj/V1xafhi
         nbP03Z8rSlMKuOGP/oQTiNQWBnxQu4H+LfcX52UVViP1OqSvPVY9WHGRLpIvYpkMlE6b
         898tsUFtz5zB1yZIZ55tB0iAPR+ziWmx6Dl2KL7/TUf2+81b7O5TxOVWCb3IKuNk8kiJ
         E/bg==
X-Gm-Message-State: AOAM531DQ7rCImUIUst0iNjLcdPicJfEl1zhFGwTSimYP66vO5GddXJL
	rbv9P8i1MEytSyKemljxWSIaL/wwWzYyF7iKm4kAz8Rx
X-Google-Smtp-Source: 
 ABdhPJxxazLurWnCnP+bRl+UtDeGQ6kYwMI05W4PmmPRrvZeLya9sNPnDFpHBb3dIKXpRuRY6KKhpSkilhCrJkC9Fao=
X-Received: by 2002:adf:9d84:: with SMTP id p4mr1662455wre.188.1639518906949;
 Tue, 14 Dec 2021 13:55:06 -0800 (PST)
MIME-Version: 1.0
References: <01318822-37b6-b1aa-6235-ce0f6e6e28c3@bootlin.com>
In-Reply-To: <01318822-37b6-b1aa-6235-ce0f6e6e28c3@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 14 Dec 2021 15:54:56 -0600
Message-ID: 
 <CAJdd5GbLevnrtyN1JndsHjJHbzpHrS-nh7TjYFpfD8r2n54BhQ@mail.gmail.com>
Subject: Re: [bitbake-devel] How to start a read-only hash server?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
	BitBake developer list <bitbake-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Dec 2021 21:55:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2262

On Tue, Dec 14, 2021 at 3:42 PM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hello,
>
> In
> https://git.openembedded.org/bitbake/tree/lib/hashserv/server.py#n514, I
> see that it's possible to have a read-only hash server.
>
> Is running "bin/bitbake-hashserv --read-only" from the command-line the
> only way? I expected this to be possible through a BitBake variable too.

There is no reason to allow it from a bitbake variable because a
read-only local server isn't really useful

You would only start a read-only hash server if you are running it
standalone instead of having bitbake start it for you

>
> Anyway, this should be documented, right?
>
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13159): https://lists.openembedded.org/g/bitbake-devel/message/13159
> Mute This Topic: https://lists.openembedded.org/mt/87731843/3616693
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

