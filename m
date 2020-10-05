Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web10.30754.1601888201876821790
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 01:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U4S6WCRO;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id h6so6116912ybi.11
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2020 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f8HESkRcnmnRSuoPuYDDfz26uR3rRkR3Oct69Pf94ck=;
        b=U4S6WCROsnwplXV7iZ5k5RfNXu38rYAze+Oib8f+6Rf/lRI5wkQIOCensBRrrBG/fc
         eOv1t3uNnZxrBFg6arpShix9FJVU4sZ7rPKyCCuEmbjFClXJ83BSrVRdhIZU92cTjj3V
         1QaQ17RadjOjjasoUgFa51hPUeYc3wYsw8KpCfojk2vvW2zS59JF0OfSSnWEhJYRf0z0
         tBQ6GaF0pcsad4fdYKJpN951cELBdf/E86h3n8+jHqdZ3B9HPPppuis/qNrP/j16MiyL
         yQcDnwV6I9AuRFQXjLMz3zBmtCKSbRB+cZugvXu3ZafbAyxefiN4aI5bqG7/0I0kUngU
         2Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f8HESkRcnmnRSuoPuYDDfz26uR3rRkR3Oct69Pf94ck=;
        b=nDM9UQ//TSzvdMogyt+WuIuNZty66cb0174ph5UNc2WRsj8LMuSeEPvOXSMauyma69
         wserbgPe5+i7Xu69XfsSC+0UAdi78skxbuufyAIBzN0EU6cObdRqjHwOgES5OaJrU1lz
         nmGxdKkiclA2ck5n8X2j6lzmJvgH5ZX4Xd6IhAYyGUL8SP8gCjdoHxVX/W0iIonYzmXq
         dJ7WD6XI1GJuTR4gvL9P3auw5UVMmqwZRmCd2T6+ePRWQ10wNiVdS1nirxcsdlnoyLH1
         kRILKoZzVadagQVvy2Y9bhYYeCjWTGLSejIOjZf+91QQ/hcK35kGrz7IaZt5RoZbcUjs
         wz6g==
X-Gm-Message-State: AOAM5336fWnAch/uTssklY2DIkF5r4KKkPl8oY9biA7cMueEsNcos29J
	7OyDrH/ZmngHKyvuZVJaY/07McUqU+6SWIolnCxP6w==
X-Google-Smtp-Source: ABdhPJymjkuDpFL0EpR9r9qBQmZyuLv5c89mo/54nT5A6ttNuXU5q4AH2/Pwf0DXXmTuvo3y5TMtQUsWsldaHAm/4zA=
X-Received: by 2002:a25:bfcf:: with SMTP id q15mr17062214ybm.133.1601888200777;
 Mon, 05 Oct 2020 01:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201004131242.61278-1-foss@0leil.net> <20201004131242.61278-3-foss@0leil.net>
In-Reply-To: <20201004131242.61278-3-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 5 Oct 2020 10:56:29 +0200
Message-ID: <CAP71Wjze76+Z9Vurh2c3ZMUpvhzuNMH53s7OPEN-L=k=LAm+vQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/3] docs: poky.yaml: fix identation in host packages variables
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 4, 2020 at 3:22 PM Quentin Schulz <foss@0leil.net> wrote:
>
> This unfortunately makes the variables probably unusable for proper
> replacement in other indentation blocks.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>

For the whole series:

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

really good addition to yocto-vars.py..

> ---
>  documentation/poky.yaml | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
> index 946387795..fc2adb357 100644
> --- a/documentation/poky.yaml
> +++ b/documentation/poky.yaml
> @@ -71,18 +71,18 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>  OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>       diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>       python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel
> -     $ sudo pip3 install GitPython"
> +     \n\      $ sudo pip3 install GitPython"
>  CENTOS7_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> -     $ sudo yum makecache
> -     $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
> +     \n\      $ sudo yum makecache
> +     \n\      $ sudo yum install gawk make wget tar bzip2 gzip python3 unzip perl patch \
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
>       perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python36-pip xz \
>       which SDL-devel xterm mesa-libGL-devel
> -     $ sudo pip3 install GitPython jinja2"
> +     \n\      $ sudo pip3 install GitPython jinja2"
>  CENTOS8_HOST_PACKAGES_ESSENTIAL : "-y epel-release
> -     $ sudo dnf config-manager --set-enabled PowerTools
> -     $ sudo dnf makecache
> -     $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
> +     \n\      $ sudo dnf config-manager --set-enabled PowerTools
> +     \n\      $ sudo dnf makecache
> +     \n\      $ sudo dnf install gawk make wget tar bzip2 gzip python3 unzip perl patch \
>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath ccache \
>       socat perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3-pip \
>       python3-GitPython python3-jinja2 python3-pexpect xz which SDL-devel xterm \
> --
> 2.26.2
>
>
> 
>
