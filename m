Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
 by mx.groups.io with SMTP id smtpd.web11.1212.1600271728531499255
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Sep 2020 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CPGW714E;
 spf=pass (domain: linaro.org, ip: 209.85.219.195, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f195.google.com with SMTP id a2so5793133ybj.2
        for <docs@lists.yoctoproject.org>; Wed, 16 Sep 2020 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSrnlVociEYuiod6COZItNDP9emzb1vYpSuihFO0hBg=;
        b=CPGW714EdJE0D4YGhVx1qg4kIzQMOmvcjnfHca57AW9MubajgVh91k4kFu0vz2sNi0
         CXIhFCoxVTEUD1FOrOgtbuWXTKUhEULYfdkB0tMUETgIkgNs1mWBPUw0Qys/R3fD5r/8
         mma54VvZEcS0JP8s6f0UvsPboND+zhSm2J5PpUIa6ShicNXz+wzptzvr6UkawF95Pmuv
         nP+DQTRz+Wfl6xVnvUjdGF/iPPhmgXHFEpHzVJo4V+BEx9zXrNUwuQdf/vjUtU6I6dDy
         ewfg0Y3a92v66aQJVXylqcaYGIlH0vtiPj0HSPG1zBl239PVy7DlLnG5akxz1cmR6AeN
         u5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSrnlVociEYuiod6COZItNDP9emzb1vYpSuihFO0hBg=;
        b=YDEG+y14BlZWjmSOdSlrShVryqqkE0w/mCmcsXD7qn9jdhygwHOEjjC8Dr4X3ZCuuS
         q/M0pfLpF8fJ5peu3krbJ8V/jwaPry8gkaZvCRjV2JRNCr41GdJSSpjUG66DdRsTcvgc
         DzYj7IqN4XzO/MNBRWXYNWvU44bKDA0QEbEilwe/05Gs84HlHw7plTCFKzTVJuu/v5uA
         q/deBNSerW1rFlcEwZZs/MtHxd9ccQUrevFd8A7zfHxkJZtHisZgcecTgiFFbHjBfvXb
         44AGg5Pchqy2NDa5+5HnsyuN4St4SbrEu5qxvYl2XeA83K+maiUCJGqp94u2FA99H807
         Ahuw==
X-Gm-Message-State: AOAM5331GrpOT3g5Jb4fJroeEcVwFmI9KeM7N8EWg0oYI0OC+EstWnQJ
	n5n3pVhnNm4Zd6BACi/oWlIkpVxPb0gcH5ZxF9iOUA==
X-Google-Smtp-Source: ABdhPJzEuIk8PsgcySe7Ocx57YuETpBY82MpdI9IJ4HQ/NmFo4fTvGp1Ww8cSmA6Uk7WbIJEtQqhku40IgoKdzP4RZU=
X-Received: by 2002:a05:6902:4cf:: with SMTP id v15mr35266475ybs.373.1600271727562;
 Wed, 16 Sep 2020 08:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200831172553.35236-1-JPEWhacker@gmail.com>
In-Reply-To: <20200831172553.35236-1-JPEWhacker@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 16 Sep 2020 17:55:16 +0200
Message-ID: <CAP71WjxT3OAePYhtY0KqQz7O-8Kk1Xv-DzTGbBGT3nr2KM4WcA@mail.gmail.com>
Subject: Re: [docs][sphinx][PATCH] sphinx: dev-manual: Clarify that virtual providers do not apply to runtime dependencies
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: docs@lists.yoctoproject.org, Joshua Watt <Joshua.Watt@garmin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 31, 2020 at 7:25 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> From: Joshua Watt <Joshua.Watt@garmin.com>
>
> Clarifies that virtual providers are only used for build time
> dependencies specified with PROVIDES and DEPENDS, and do not apply to
> runtime dependencies specified with RPROVIDES and RDEPENDS.
>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>

thanks. Pulled into the sphinx branch. It will be included in the next
release, once we merge in master.

> ---
>  documentation/dev-manual/dev-manual-common-tasks.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index c9b8a834c..a54379fef 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -2000,6 +2000,12 @@ The following lists specific examples of virtual providers:
>
>  -  ``virtual/libgles2``: Provides ``glesv2.pc`` (i.e. libGLESv2).
>
> +.. note::
> +
> +   Virtual providers only apply to build time dependencies specified with
> +   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
> +   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
> +
>  Properly Versioning Pre-Release Recipes
>  ---------------------------------------
>
> --
> 2.28.0
>
> 
