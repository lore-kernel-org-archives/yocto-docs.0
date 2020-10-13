Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.15784.1602605146103661609
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 09:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0Ave+p9G;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id g4so73074edk.0
        for <docs@lists.yoctoproject.org>; Tue, 13 Oct 2020 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ha5Q0RqyQXdpqPAIpsF58X9OBsFNtqyh9JhO4/gke9o=;
        b=0Ave+p9Gl24I63r3E4QJ/4rimJKCLtzLeydJTRThexmxPXDYyKO2h1hsRfoe6Eyrry
         PE5eNd4Gd3V8xyA5pChZmXazkpYWpN5LXkuAo47POZSVZewo1jEpsqfc2I4Y6GgUZeXF
         8QMMnmKNVRdLCjvxn/r7Gr0EcGRp/2JSm9XIS6uxdmwr1adawzQ7qWVXgNs/dpO2blqC
         UJ44vxOnCwRhPJMZNyS0BxivBoORdsyVt0zk4lLqHH4Liyr02nOu7s/N9a0+w8jXIDcq
         5fccHTxHEHQ1zzJduhHJG2N66svy3XAkhxY5EDEtJqwg0YpYlPMKbpy2euA/O+cZ7KFH
         73LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ha5Q0RqyQXdpqPAIpsF58X9OBsFNtqyh9JhO4/gke9o=;
        b=b5s0A2ITonheC5FxzHAf88Yv+Pa4e4R7TTHBTmyvp5tIonak1YaFNfjZjE7FjFuDfx
         tNLfwhwAE4KrHQvKt4d32p7HFSSMeBeTzQoyhCWaRX6pheqTPQIJnyVEKdrXwnoOMptO
         0lPB53fbeZT1bGiN52dVG47cbzgQYWary4RrgUuFCt+kxxHA2bUqUa9eeBeFV+xeD220
         1l7XKl/DboRGEQoAxcWGdpkfFVurJ/kb+iWLzbXWt8J2n4mGuft0I2t1BAtvwOZ37pVN
         S1NUjvzIHM2ZtS27rPPPR1PBXFe4Nhw2D07QZAM5dVoDKt+AgH3yYEWROdV7Rzx3EuL2
         4l1A==
X-Gm-Message-State: AOAM531/vl9RosiTbp2nK9JgTILv5pBGxcxuTHOdHVt4Wfy/bcxgWWdF
	LhNVkbbbf+zh8N9+PHYIyuS3U0Wsr2sJIhRa6nInEw==
X-Google-Smtp-Source: ABdhPJwkEzF0huWBDD+tuadJoCJ75YIbIH3C2FctcfJFARDJCRiOi/IGGWUEWBSBjg1ltdbmH5DVf1c/AE1+lLapUrE=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr202321edu.295.1602605144408;
 Tue, 13 Oct 2020 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
In-Reply-To: <CAP71WjwQv0xcp02tgARbHtbJ4=ucSFKBy3MVdEdBL4f=vonZww@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 13 Oct 2020 06:05:33 -1000
Message-ID: <CAOSpxdbSFZAnPAVYCbafzk-aKnKZkqy0FSvSDh+uF7Z+vAGcpA@mail.gmail.com>
Subject: Re: Sphinx for Dunfell
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2020 at 2:35 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:

> Which clearly indicates that the list of differences in yocto-docs
> between 3.1 and 3.2 is down to:
>
> cb92d16a6 ref-manual: examples: libxpm: add relative path to .inc
> 12457c241 ref-manual: examples: hello-autotools: upgrade to 2.10
> 3aeca3b34 ref-manual: Add documentation for kernel-fitimage
> 41ef4c9cb wic/bootimg-efi: Update docs for IMAGE_BOOT_FILES support in
> bootimg-efi
> 08e25f2b2 ref-system-requirements: update supported hosts lists
> afc290e85 virtual/libgbm is the provider of gbm.pc
> e187f0f85 poky.ent: Update XXX_HOST_PACKAGES_ESSENTIAL to include mesa
> for other distros
> 3003075b2 poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include
> mesa-dri-devel
> 7ed90c71c poky.ent: Update UBUNTU_HOST_PACKAGES_ESSENTIAL to match
> recent changes
> c5e4d575a ref-manual: add PACKAGE_ADD_METADATA documentation
> a50e0628f ref-manual: document new unlisted-pkg-lics insane-skip qa check

I think all of the above are fine for dunfell.

> Otherwise, what I can propose is to 'import' the sphinx files from the
> current master branch and 'undo' what's not needed for dunfell.

This seems reasonable. Thanks again for sorting through this!


Steve
