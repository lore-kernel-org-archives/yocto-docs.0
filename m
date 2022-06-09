Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AB4C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 13:01:12 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.12854.1654779668963254638
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 06:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=csJR56aw;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id y187so21788680pgd.3
        for <docs@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3Di4rtM8BAfWcDHVM+tdZNkBDD34bJhm5XtMAzub4w=;
        b=csJR56awgcJwhIPbLI/YeW44TWR8bW5k1HOkzF+N6IppVK2pQVe3HsvhwYfC1U7hkV
         k84ntZRrhh7bHBiTj5bjqJ3tPCVHbGaQ0DprowcgOqPNRmjyDD20630VKE5k6NKV0ZrM
         j6jySwidTbuDX80K6G+ZWpbicqpfvrJW8fjNvJ4uR+pWIcsauJNXyF2HG4dmbFijsxVp
         E0lg4EQak7MrlgeEknYcYGa5kNEi3kPp+jFj51ifwNgMiV3RDer/g4V8i80lqD7otspc
         26ab/8iqkJic187RujQAmJ+x9CTUGBr2K8Wb3bAIW+/L0WvMcTJkdt8J5MWLWb+WdayF
         JjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3Di4rtM8BAfWcDHVM+tdZNkBDD34bJhm5XtMAzub4w=;
        b=wIV7Do9Jv4IzYYbDi+aQz8OWhT92m04EgxCeEjvJ+n0zEIghzVixHTZPBTfUiCnhuG
         +mf7VWneDXhXdL+Nii4+WAU+K4Qlm4JnVahk0xBpRJNlCgA7F4oRZZ8G8VagLi1UsRQ7
         H36RLrXiIqXYbaLOOj20+m1R/SExTZLtOQVol8Z3IcVwAOJnOSFy6X1ISrZGhCBKp0EC
         Gl0rogAsaxWNNSK+EO/AS2kW17Pr+ips55v1giwuXdsTPiQyl5BkNF+5AAugMHNZQBu2
         QJHTKGp/sFcA6BdIU6ulIhqkwPpFG/RVsYfq14LLQUb1aQ6RSJDY+ptF6hu+K4VCewUK
         TbCA==
X-Gm-Message-State: AOAM533eF9Hg5WhVlN/eB1Zl9ifTewVs8pZOsj4S8CxDjyltk/9ci466
	C06ScEAIJ1HeTXnUdXt+0qX3PNKUwelBj6MSFF4=
X-Google-Smtp-Source: 
 ABdhPJyVeoGqNVi8cG3zfD7Uu8mrxrMCx/lzRqpk5bnD6N4saQWjTzTJZgtn5brLGM6YVV7ZDUQzhDsom1NaLmM3P3k=
X-Received: by 2002:a65:694a:0:b0:3fb:9d3b:431b with SMTP id
 w10-20020a65694a000000b003fb9d3b431bmr35218183pgq.276.1654779668012; Thu, 09
 Jun 2022 06:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220609094044.41131-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220609094044.41131-1-richard.purdie@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 9 Jun 2022 15:00:55 +0200
Message-ID: 
 <CAApg2=SWjpDKiWvbBZbXGV9HfxseH2UL_y=-sm3AqFCsFuwg3w@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref/dev-manual: Update multiconfig documentation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Jun 2022 13:01:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2976

On Thu, Jun 9, 2022 at 11:40 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Multiconfigs now work from layers. Update the documentation to match this change.
> Also fix a incorrect reference to different distros working within the same TMPDIR,
> that is incorrect.
>
> [YOCTO #13566]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/dev-manual/common-tasks.rst | 31 ++++++++++++-----------
>  documentation/ref-manual/variables.rst    |  9 ++++---
>  2 files changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index ca6d59438..7d17f8d65 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -3704,7 +3704,7 @@ Setting Up and Running a Multiple Configuration Build
>
>  To accomplish a multiple configuration build, you must define each
>  target's configuration separately using a parallel configuration file in
> -the :term:`Build Directory`, and you
> +the :term:`Build Directory` or configuration directory within a layer, and you
>  must follow a required file hierarchy. Additionally, you must enable the
>  multiple configuration builds in your ``local.conf`` file.
>
> @@ -3712,16 +3712,19 @@ Follow these steps to set up and execute multiple configuration builds:
>
>  -  *Create Separate Configuration Files*: You need to create a single
>     configuration file for each build target (each multiconfig).
> -   Minimally, each configuration file must define the machine and the
> -   temporary directory BitBake uses for the build. Suggested practice
> -   dictates that you do not overlap the temporary directories used
> -   during the builds. However, it is possible that you can share the
> -   temporary directory
> -   (:term:`TMPDIR`). For example,
> -   consider a scenario with two different multiconfigs for the same
> +   The configuration definitions are implmentation dependency but often

A typo: implmentation -> implementation

Kind regards,
Marta

