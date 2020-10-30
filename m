Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.11279.1604052042834416603
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 03:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RI6bCLtO;
 spf=pass (domain: linaro.org, ip: 209.85.219.171, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f171.google.com with SMTP id m188so4650152ybf.2
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2020 03:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ep7mjEMROgtrEDHGmMi32W2eLRfzfJRHkZj8Rhni9JA=;
        b=RI6bCLtOcCUEStuwxWH5A/ZvNNUL0R38J2uZFCQtO6RaGztSRBRfkxBhrXzTP4yMwW
         oOthiFbvgXiNGS0IvbjKwkrbKIKR5QuOHWXawAtuLxxrK6WlYjL+NzImyS/Stmtu2RPr
         1g+EPp7Hc72AqUpXzORwqnn3eUdi0WXcJMXlkOrG8dZX/gvsqCd32iVbf8DCUIFy7p11
         fYBo8r4bUjWNk6q4OvUUgfTx7cH1GrHN5wxMeozEbIh65BLU1tHm4+kdTp0vW89hpppn
         vKr/CHBxJqDV1xOt4V3/Mas5sQ2UeUK8yOhEme2bveZmMlI7ayp8H9D360W+xZ7a3nQ/
         +qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ep7mjEMROgtrEDHGmMi32W2eLRfzfJRHkZj8Rhni9JA=;
        b=MjwMjQnE+RBdBLTQ3dh+0Yk4wqskl02ZI5BaaFL164xvWIaqwtS5s+ERVX/dJ+ZP8d
         avm1m/7rOHKL5b47odJNF5Am9zze38YiK5I9HnpVJzrL+7oWqBsBSoIr0vYCS3k17uEd
         z3bTs6SbF5nt78HCeuiYLO8HNaky2xOiIgPjINTpOsGf8ShDkhlbxTDdGFaHzvBrPH9l
         nPk8mRTff/AI0+SYIOfh3xZ3lyP/5sRaKkrYZFW05otxoVEusz2ePqdUKLcnDg7UZmkt
         8867cD/unoGI0D47btdDE4eDnteLF+4q4qqhwz9ftt8JuPddm3DSDv1hmz3T1LZzg4g5
         g0aA==
X-Gm-Message-State: AOAM531c4OXVgBGnJ50j2lQmD6tq2mCtTl2yvnzd24bH325XkcfEEWZD
	1jiWmGcN5KIB8/syImLhmpBVnQBsbIqE96yLGxiW3g==
X-Google-Smtp-Source: ABdhPJyoksnMW0ifaq+kuGd3jMvS7MwGDFZYJ+b2GtUPkBvYnkCy0GjEuQgmtqGd5LC/1Sje8uUWWwUJUd7fEMclzK8=
X-Received: by 2002:a25:80cd:: with SMTP id c13mr2594913ybm.371.1604052041866;
 Fri, 30 Oct 2020 03:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <f3de44-4ef9-806c-7c59-e8223c86d5c2@crashcourse.ca>
In-Reply-To: <f3de44-4ef9-806c-7c59-e8223c86d5c2@crashcourse.ca>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 30 Oct 2020 11:00:31 +0100
Message-ID: <CAP71WjyXQd2YuyTfU2R_R+-tLmsioHBdUv1OWUdM0yn2+9ZfAQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] README: "yocto-project-qs" -> "brief-yoctoprojectqs"
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 10:22 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
> Directory has been renamed, so fix README and add a bit more white
> space to keep everything lined up.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

>
> ---
>
> diff --git a/documentation/README b/documentation/README
> index fe86876ee..534ae66f8 100644
> --- a/documentation/README
> +++ b/documentation/README
> @@ -34,15 +34,15 @@ Manual Organization
>
>  Folders exist for individual manuals as follows:
>
> -* sdk-manual       - The Yocto Project Software Development Kit (SDK) Developer's Guide.
> -* bsp-guide        - The Yocto Project Board Support Package (BSP) Developer's Guide
> -* dev-manual       - The Yocto Project Development Tasks Manual
> -* kernel-dev       - The Yocto Project Linux Kernel Development Tasks Manual
> -* ref-manual       - The Yocto Project Reference Manual
> -* yocto-project-qs - The Yocto Project Quick Start
> -* profile-manual   - The Yocto Project Profile and Tracing Manual
> -* toaster-manual   - The Toaster Manual
> -* test-manual      - The Test Environment Manual
> +* sdk-manual           - The Yocto Project Software Development Kit (SDK) Developer's Guide.
> +* bsp-guide            - The Yocto Project Board Support Package (BSP) Developer's Guide
> +* dev-manual           - The Yocto Project Development Tasks Manual
> +* kernel-dev           - The Yocto Project Linux Kernel Development Tasks Manual
> +* ref-manual           - The Yocto Project Reference Manual
> +* brief-yoctoprojectqs - The Yocto Project Quick Start
> +* profile-manual       - The Yocto Project Profile and Tracing Manual
> +* toaster-manual       - The Toaster Manual
> +* test-manual          - The Test Environment Manual
>
>  Each folder is self-contained regarding content and figures.
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                          http://crashcourse.ca
>
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> 
>
