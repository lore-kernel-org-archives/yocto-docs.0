Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web09.22516.1605698624961319453
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 03:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DxRLCYLt;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id x17so1325838ybr.8
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2PFv9njB8VY+up5AksRp5O2+ZV0+W0mEiyIuD8+8iP0=;
        b=DxRLCYLtnYz9zTFSm79f/PRMf9pZGGIiF2AwQKCxpZJzqvitrzXcPoAyQZy4CAr4zC
         v6fnQQ/fwragOQzafTQ6dMCe/6C8yxyvq7tZ+y4McJn31yzvLs/NUWNoQMgMGQoqDP8D
         0uIZF9iT0bIf6AcFvN+QeHF3j4hyHYMzqqQyUWy+FoGRogcBDdsdGT03oEPe0DegpYOc
         8gCU3BsqoYc8JpcaArpZ1qtkG9aluQNj18eidiWBPW286PirLR732r0SCqlcJ0sW3SAv
         TcPBTSx+A7sOU9VvPeogsyeM6aXmBbgpp849blQLrkVnyXxdKmrl9O4xS5g1+FM1U4QD
         AroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PFv9njB8VY+up5AksRp5O2+ZV0+W0mEiyIuD8+8iP0=;
        b=arKAzIChDInbp2zhavba8azbQcvDVHQLgVBIw02Rt7aSfcfjYoQ5wcxBIbMs8Ai/Uh
         h/HiKB847NqkgdGQCq9ECACVkUxjweD7Hw/uxGd9U+zTT0hOUAt+9sr8PHR2yNmXouVF
         IqgEkXsK749OAbNYRK+8nvE6e+sGhxjY0ovQHMc/8dWay+ePA/cauwnZJRe6W+xvNMoO
         1ZdS968AH9aKPn2jdRqoqdforkcYRSzGrb3/5862vxv2+kIOXfRXGrjgB8mgN/RfmmV1
         VSjoZwreqBWDJK4vZmS/8cKZAfnHiZUB2zUkmUqFNMhpWvO5vEXf7NmCl0MZVfCBQoRI
         YxXQ==
X-Gm-Message-State: AOAM532LrzShStDChNnAfmf9DAYfpUQtCPFYjk0hMKbqcEiaMEzOzRTZ
	oIHFPODQNXxGk/mzEbv0nEK5Ye3E9wUJhj5kXgPcCQ==
X-Google-Smtp-Source: ABdhPJxwxOwWBTSs9Bk9xoeBv3+WsJNYf1jyrL7UysPxf7RTvQTP7nZDM8KTivaOF2uQ1Nr874aUYwunK/S7Z0WSN2g=
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr6566281ybc.273.1605698623360;
 Wed, 18 Nov 2020 03:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20201118100705.3656-1-pbarker@konsulko.com> <20201118100705.3656-2-pbarker@konsulko.com>
In-Reply-To: <20201118100705.3656-2-pbarker@konsulko.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 18 Nov 2020 12:23:32 +0100
Message-ID: <CAP71Wjw449WP=VZncMDF5c+GtYYMbAssWMLtYK6E-=3+J8qzaA@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 2/9] dev-manual-common-tasks: Fix refs to testing branches
To: Paul Barker <pbarker@konsulko.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2020 at 11:07 AM Paul Barker <pbarker@konsulko.com> wrote:
>
> After discussions on IRC with Ross we concluded that the `ross/mut`
> branch shouldn't really be listed in the docs as it's more of a personal
> test branch. Instead we should list the -next branches for
> openembedded-core and poky.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 33 ++++++++++++-------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 27aacde60..6f526c203 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -10665,18 +10665,27 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
>  section in the Yocto Project Overview and Concepts Manual for additional
>  concepts on working in the Yocto Project development environment.
>
> -Two commonly used testing repositories exist for OpenEmbedded-Core:
> -
> --  *"ross/mut" branch:* The "mut" (master-under-test) tree exists in the
> -   ``poky-contrib`` repository in the
> -   :yocto_git:`Yocto Project source repositories <>`.
> -
> --  *"master-next" branch:* This branch is part of the main "poky"
> -   repository in the Yocto Project source repositories.
> -
> -Maintainers use these branches to test submissions prior to merging
> -patches. Thus, you can get an idea of the status of a patch based on
> -whether the patch has been merged into one of these branches.
> +Maintainers commonly use ``-next`` branches to test submissions prior to
> +merging patches. Thus, you can get an idea of the status of a patch based on
> +whether the patch has been merged into one of these branches. The commonly
> +used testing branches for OpenEmbedded-Core are as follows:
> +
> +-  *openembedded-core "master-next" branch:* This branch is part of the
> +   :oe_git:`openembedded-core </openembedded-core/>` repository contains
> +   proposed changes to the core metadata.
> +
> +-  *poky "master-next" branch:* This branch is part of the
> +   :yocto_git:`poky </cgit/cgit.cgi/poky/>` repository and combines proposed
> +   changes to bitbake, the core metadata and the poky distro.
> +
> +Similarly, stable branches maintained by the project may have corresponding
> +``-next`` branches which collect proposed changes. For example,
> +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> +"openembdedded-core" and "poky" repositories.

Perhaps using DISTRO_NAME_NO_CAP and DISTRO_NAME_NO_CAP_MINUS_ONE
here, so that the documentation stays 'current' over the years?
I think it's a good idea to keep 'dunfell-next' though (since it's
LTS), so perhaps we can add DISTRO_NAME_NO_CAP_LTS variable which
points to latest LTS, and use it and DISTRO_NAME_NO_CAP here.

> +
> +Other layers may have similar testing branches but there is no formal
> +requirement or standard for these so please check the documentation for the
> +layers you are contributing to.
>
>  .. note::
>
> --
> 2.20.1
>
>
> 
>
