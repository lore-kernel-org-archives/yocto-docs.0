Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web08.9163.1605112072828686297
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Nov 2020 08:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=L48nCOWu;
 spf=pass (domain: konsulko.com, ip: 209.85.210.65, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f65.google.com with SMTP id 79so2668025otc.7
        for <docs@lists.yoctoproject.org>; Wed, 11 Nov 2020 08:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GviHEvMZtQcyr8KumE01iD4gw9nRJ8ev2v2mdlBgHVU=;
        b=L48nCOWulqLvCmJQms9oEw8VWl3rtfNGNTgZjDQNTwbpzDs4aReOvCQvOar5/DVnrI
         cZwxBjq1GWTLPYttlXg39y3cO1hhABxeOTkPKbeMA6U+Cv+9YYawtTLeVJpdigDrPxxG
         c9uzEN3jFZEEgTAFYXpcNL5FGtXy5OL4fHfgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GviHEvMZtQcyr8KumE01iD4gw9nRJ8ev2v2mdlBgHVU=;
        b=Va/CdQ+ju3OsSl4352kRotuwAyCEFbw7k/X8lphVaHVGQDcLE1W0Q+nN5s+p8Qx1lY
         u+523lwuso3/O+31BYdo7rZjlsRhw1i4IMdHAtjcpDeELFRMxrmU/I5AlSFMb8K8Tp3z
         5RzmQD+94VZCMOvgpLd4fcqDLEenOL0S+M/lZTkZQd9tikAPj8q4AqREFCjB4umZyuB6
         2nyu656LilMslYZ5bDUheRVAkSRoJsJ7Bq93aKOP1Wm/zgd7vDH72DNetfZttQF/beNk
         eiMy3TPXdmP/RWMCb4cZbv/f9ek2IWcQEJOEdzvs1JtdDUpdabT8Z0LFZFXN3LuzS4uH
         go7A==
X-Gm-Message-State: AOAM531XnkKHfloYz6P/GIVIFeUuFMQhNZaKyBJ7vB34sLo+yOtpq0yA
	Rn/DtMLaXabWdzNeDLqYdmjFIneH02qfz5nLKXM3JBltMAU=
X-Google-Smtp-Source: ABdhPJyY4cPnZMVfbj2R+ldBSrRBUsSpNwlLiUABx9e2jkyBOuD5vCPewRv8Vbh395JJQJdUrLKUWznDony1jX7uxtA=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr16587785otc.305.1605112071886;
 Wed, 11 Nov 2020 08:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20201111160800.5669-1-pbarker@konsulko.com>
In-Reply-To: <20201111160800.5669-1-pbarker@konsulko.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 11 Nov 2020 16:27:41 +0000
Message-ID: <CAM9ZRVsCBZ2E_-uu7835avmnvHSDaTn3wgxNvSoLeP4NjgS-_A@mail.gmail.com>
Subject: Re: [PATCH 1/8] dev-manual-common-tasks: Fix refs to testing branches
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2020 at 16:08, Paul Barker <pbarker@konsulko.com> wrote:
>
> After discussions on IRC with Ross we concluded that the `ross/mut`
> branch shouldn't really be listed in the docs as it's more of a personal
> test branch. Instead we should list the -next branches for
> openembedded-core and poky.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>

Cc: Ross.

> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 35 ++++++++++++-------
>  1 file changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 27aacde60..698b27377 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -10665,18 +10665,29 @@ to a contribution repository that is upstream. See the ":ref:`gs-git-workflows-a
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
> +   `openembedded-core <https://git.openembedded.org/openembedded-core/>`__
> +   repository on git.openembedded.org and contains proposed changes to the
> +   core metadata.
> +
> +-  *poky "master-next" branch:* This branch is part of the
> +   `poky <https://git.yoctoproject.org/cgit/cgit.cgi/poky/>`__
> +   repository on git.yoctoproject.org and combines proposed changes to
> +   bitbake, the core metadata and the poky distro.
> +
> +Similarly, stable branches maintained by the project may have corresponding
> +``-next`` branches which collect proposed changes. For example,
> +``dunfell-next`` and ``gatesgarth-next`` branches in both the
> +"openembdedded-core" and "poky" repositories.
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


-- 
Paul Barker
Konsulko Group
