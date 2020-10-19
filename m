Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.13209.1603114567132706153
 for <docs@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 06:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oyf2EA/M;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id o70so8920358ybc.1
        for <docs@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLxhJsZPSTq2FqE18MMEK7IFbRGSN8CfV/X80Exbozk=;
        b=oyf2EA/MIBADDu96fAo4vXdINmOy0mxYtbGI2eCuv7qkVVxh2+Qo1H2+bE1NLh2ujy
         ge47f6BT0tJthBoi5L5y5Bj6usBeCe/IGLjZ4xBIZHkhZH9jDn4LSRo5/LM7ycSLOX1W
         5qX4zkVzUjekE1o9665grFF/x+7+lJq6iJ9jw1C745vP5rMmLxqF8yl2StjaT2Nt+heU
         9nX1TgvIGx9dvdk5sFotaA2DQTienDzp4RGPx/q+KBIPvzyMtn+C38z4hPKcqnPfkuuG
         KBdrj8FfAxSxNFL9OovV0+90nf8TdlV3a5trYdLGDwinVKdIRTKJWheBAgeIt/0Hn7SG
         Wkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLxhJsZPSTq2FqE18MMEK7IFbRGSN8CfV/X80Exbozk=;
        b=TbKbnvD7BKWwU/MLECjFnrYvLlpe75sd/TCwO7puI5j1rBtyy4B3hW8ZYrYGIbnuU1
         X1t75B/HgZ39I7Qzo994iTWGfXASviKNUBOLxAFRwfnuKTqVLpLUsAZrczI8dNCq4g0K
         ul65ZwlCVfv6el1FevmLbwqwHw+kcA2JfY1ZOYre+fnwaNof291tnnmo8GRjZHZcLPQT
         YupUbokPrnkpYFbASIQH2h6R82Ba4VmqQNYRI6xhfwl18kBe76PfqM4bx94qIu42zJ3z
         U4Aaa48veRzbZ8/IITrEUF6tcRnPEv1kbPKg0gmt2rVaCVH6VUBuwhpxBjErVfogrBHm
         MmjA==
X-Gm-Message-State: AOAM5325PwZeUgcFDPIvfPCUl/JG4bL6MD96PIuwVNpTHqujiQAccg40
	GZ2I52YNHPcBwSbqs0+k+FYVLTcOUQ2ZdXvHtRQTmrzpKck=
X-Google-Smtp-Source: ABdhPJyBaI7l/jJQegcOpGOhjRI2W9hNiGYls/upPFSlelcwBXLu73MbBuPBVgoPl/xtHhh5yMJBhNPiwW+vo/7GI7g=
X-Received: by 2002:a25:a521:: with SMTP id h30mr21025817ybi.201.1603114566258;
 Mon, 19 Oct 2020 06:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201018175712.23800-1-foss@0leil.net> <20201018175712.23800-3-foss@0leil.net>
In-Reply-To: <20201018175712.23800-3-foss@0leil.net>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Mon, 19 Oct 2020 15:35:55 +0200
Message-ID: <CAP71WjzE30zvGOmtL229jDg8M5mPsgyhg10mtoc+VkTE3Vbz3Q@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/3] docs: dev-manual-common-tasks: update python webserver example to python3
To: Quentin Schulz <foss@0leil.net>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 18, 2020 at 7:58 PM Quentin Schulz <foss@0leil.net> wrote:
>
> SimpleHTTPServer is python2 only, the module in python3 is http.server.
>
> Let's use this one since everything in Yocto Project is using python3
> nowadays.
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  documentation/dev-manual/dev-manual-common-tasks.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index 75ef5c98c..79595d58a 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -7164,11 +7164,11 @@ Host or Server Machine Setup
>
>  Although other protocols are possible, a server using HTTP typically
>  serves packages. If you want to use HTTP, then set up and configure a
> -web server such as Apache 2, lighttpd, or SimpleHTTPServer on the
> +web server such as Apache 2, lighttpd, or Python web server on the
>  machine serving the packages.
>
>  To keep things simple, this section describes how to set up a
> -SimpleHTTPServer web server to share package feeds from the developer's
> +Python web server to share package feeds from the developer's
>  machine. Although this server might not be the best for a production
>  environment, the setup is simple and straight forward. Should you want
>  to use a different server more suited for production (e.g. Apache 2,
> @@ -7183,7 +7183,7 @@ setting of "package_rpm":
>  ::
>
>     $ cd ~/poky/build/tmp/deploy/rpm
> -   $ python -m SimpleHTTPServer
> +   $ python3 -m http.server
>
>  .. _runtime-package-management-target:
>
> --
> 2.26.2
>
>
> 
>
