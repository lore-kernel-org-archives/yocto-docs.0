Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web12.8595.1598948413354849783
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 01:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AZkBdqp2;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id h126so274443ybg.4
        for <docs@lists.yoctoproject.org>; Tue, 01 Sep 2020 01:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHFM+ZTMsJ0B6LDR8XEiloqdXdn91KIix84l6gx0WFg=;
        b=AZkBdqp2ewGOs2Ltl73NPfheokG7veVkDqPlBMgyyz/B3owHVp8/D98nvP3ngWCsyO
         WcLkm4DM+gBAOdnuJIAV8YKZ6uEQ5BzwBr3cKz8e9zei0J93o26ThRxrEza1C/jH7ZPa
         jUVJCD1LxMr40Ls0TlToCYhjxsT08jv76ETxePG8va33GaccAAp0JSTCxw1bga09qOOU
         P3w6Oq1gO1WmPMXm/fpc+OdqRD/NiOkdqA0tPQFDWc9LUEM5fJ/5yJOvPISaIZOzY6HK
         W6RcgWgQDk+WZGuFIPlPV+/lr1MfOKmMoi7NwawUpJ3HvUu3ZfMfwev6RSfpjRaMv2AR
         DRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHFM+ZTMsJ0B6LDR8XEiloqdXdn91KIix84l6gx0WFg=;
        b=FpnYdaxcIq6pXi/8TJzOr/BzaTb+lEfcMfAhUkA09eSVSE5AS+XntAmJwjt6qR4Dvu
         s/WWNQifNWteRTEvB85KV4E37SYI/tZbJ+Aymo2blHuV6o9rhm6UckxbXSqDet3G/o01
         mWF2DAa6IEjN08ap4cMjSBYrYuumFmn2YRJQmgqrTGWd2ym0v8w1csNVYnNAhBQ/rA5p
         kEKHTmMe35W3yuDI4yRvjJ+uu6M7KMb87sV4MVyIWwiK+g8/Fb2cZExaP0wRy7hcMymM
         N31oM2CDlGJiAwvOLY4hN3dM0vUFTEBQrABq4J31XenKK4sNqhDNVVZ0JT9b0mmkNsli
         1f5w==
X-Gm-Message-State: AOAM531gf2SwggSApReub+rqrFwv08NyYhZKPT2qQxf53ARTxUW1yX/p
	xtd9zDLnQZoPOy0vk9AozH6y0nSM7vc891EO7sS/ew==
X-Google-Smtp-Source: ABdhPJzK4sr2YIN2bcP6SsWTe0xVB1HCmUZ00TtXNgw1PZdEgCcKoZehry5RCrztcs7DdrNMGTlyvhSDFlBr/YbJCYU=
X-Received: by 2002:a25:508c:: with SMTP id e134mr1102850ybb.371.1598948412261;
 Tue, 01 Sep 2020 01:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200831172553.35236-1-JPEWhacker@gmail.com>
In-Reply-To: <20200831172553.35236-1-JPEWhacker@gmail.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 1 Sep 2020 10:20:01 +0200
Message-ID: <CAP71WjxQODyEHUgebq7TdMYgkLsAe2XaPmuwHJUXO2WSo7gZMw@mail.gmail.com>
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

Thank you so much for sending it both versions of the doc patches
(docbook and sphinx). It's very much appreciated!

> +
>  Properly Versioning Pre-Release Recipes
>  ---------------------------------------
>
> --
> 2.28.0
>
> 
