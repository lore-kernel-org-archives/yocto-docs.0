Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D997CC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:28:32 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.10165.1647613711220862806
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7Zh8e2o6;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id h13so10486653ede.5
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EFcHxoLkMlEPYCaimmQTqao1tJlxu76/WZRc4cHrROs=;
        b=7Zh8e2o634e7U9OMRsMq91yR7tfcOZOFEGYgyre5xvKhFhXNv1L+0ScO/tpY8y9hKE
         mWs+jE4VPV2eKw/BcdMExFOQrogcWmp+jYG2aNiw9GwmtUpq2ytAR6r9Gq64Y/rRPcwc
         6zhSzakTVKrdcL1d+tJqWt/TU7LicTclVBULRxf0KN2U78q8FZw757Yh7a3VTqOEKG+j
         qW9NbCg5i2PiVIsPz7TDi2l4DicvEh5s1c6MjqQD7BZbVHBOqpON2rvAoApL4Cfz4Wcq
         B/xkVyaM7Kn6bdvUY7Ai1R+JmgkGIl7sAHu/UkkAauvsyom7A8mOw7oca8ieOpFoal+M
         er0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EFcHxoLkMlEPYCaimmQTqao1tJlxu76/WZRc4cHrROs=;
        b=uy5G4QtjeLxT5N3wsDq/s9fKCtmy8XalnHFKoy2NCVIkHAr4pkqfnYlcnkGUkRmUtk
         X1ZRcDWj0g6s0KTcvH9Wi9yzyqEqCxiios2PYkDJ1XI4tXSIe10aS8G6v1voTMy8b0Ah
         DTnYbLXTXeVu8tIFzjM2EOtLcX2ZqQk9z1ajnfTsxjGRp3ED0P5y7ddOdt9IrJ/10vx0
         FKiB05oq9hcGzWtv+B9NAfNVjjz+Y3nRANUa9kKLfe8wOH6omU9Fj5kylUVait5nkUlG
         8V/BCJXZX3+eeWswqgmcv/RfkSBYEWvv7iewx2PVihp+aVDuVU+BamwKNxrSuQQjrwwy
         ShGA==
X-Gm-Message-State: AOAM530hLX7c46e06r682kHS5olv0TfwYVQSWEVYE2TvI/EKBGcGam8b
	7qonxHld4bF3mC1IUNC+nGIMH+Sl2/QzybTYQSnnZw==
X-Google-Smtp-Source: 
 ABdhPJy/o/r5yqJwhj2TvJ60NaOr1AnaF4pTK8MnYQgaa+UAW4kArnyz+zzl1yRXWh1Zjaa1DyDxNZywjcg/gQBng+w=
X-Received: by 2002:a05:6402:42c6:b0:416:541:4be1 with SMTP id
 i6-20020a05640242c600b0041605414be1mr9860362edc.238.1647613709280; Fri, 18
 Mar 2022 07:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220318142052.1068988-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220318142052.1068988-1-richard.purdie@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 18 Mar 2022 04:28:18 -1000
Message-ID: 
 <CAOSpxdYTM+mHCusod6NoUCgZ5tLL+RWQVohr5xn6MfvrgFsHPQ@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] conf.py/set_versions/poky.yaml: Set version in
 conf.py from poky.yaml
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:28:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2632

On Fri, Mar 18, 2022 at 4:20 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Allow conf.py to read the versions it needs from poky.yaml and have
> set_versions.py write this out. This means we don't have to change as
> many files when making new releases.

+1 - this series is a great idea!

Steve

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/conf.py         | 11 +++++++++--
>  documentation/poky.yaml.in    |  2 ++
>  documentation/set_versions.py | 22 +++++++++++++++++++++-
>  3 files changed, 32 insertions(+), 3 deletions(-)
>
> v2 - fix typo of BITBAKE_VERSION -> BITBAKE_SERIES
>
> diff --git a/documentation/conf.py b/documentation/conf.py
> index 3015892d2..4bbe9b574 100644
> --- a/documentation/conf.py
> +++ b/documentation/conf.py
> @@ -16,8 +16,15 @@ import os
>  import sys
>  import datetime
>
> -current_version = "dev"
> -bitbake_version = "" # Leave empty for development branch
> +# current_version = "dev"
> +# bitbake_version = "" # Leave empty for development branch
> +# Obtain versions from poky.yaml instead
> +with open("poky.yaml") as data:
> +    for line in data.readlines():
> +        if line.startswith("DOCCONF_VERSION"):
> +            current_version = line.split(":")[1].strip().replace('"', '')
> +        if line.startswith("BITBAKE_SERIES"):
> +            bitbake_version = line.split(":")[1].strip().replace('"', '')
>
>  # String used in sidebar
>  version = 'Version: ' + current_version
> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
> index 89a059ef1..a346b7623 100644
> --- a/documentation/poky.yaml.in
> +++ b/documentation/poky.yaml.in
> @@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>  YOCTO_DOC_VERSION : "3.4.2"
>  DISTRO_REL_TAG : "yocto-3.4.2"
> +DOCCONF_VERSION : "dev"
> +BITBAKE_SERIES : ""
>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
> diff --git a/documentation/set_versions.py b/documentation/set_versions.py
> index cdcfd6bb0..26705469d 100755
> --- a/documentation/set_versions.py
> +++ b/documentation/set_versions.py
> @@ -25,9 +25,20 @@ release_series["hardknott"] = "3.3"
>  release_series["gatesgarth"] = "3.2"
>  release_series["dunfell"] = "3.1"
>
> +bitbake_mapping = {
> +    "langdale" : "2.2",
> +    "kirkstone" : "2.0",
> +    "honister" : "1.52",
> +    "hardknott" : "1.50",
> +    "gatesgarth" : "1.48",
> +    "dunfell" : "1.46",
> +}
> +
>  ourversion = None
>  ourseries = None
>  ourbranch = None
> +bitbakeversion = None
> +docconfver = None
>
>  # Test tags exist and inform the user to fetch if not
>  try:
> @@ -45,18 +56,23 @@ if ourversion:
>      # We're a tagged release
>      components = ourversion.split(".")
>      baseversion = components[0] + "." + components[1]
> +    docconfver = ourversion
>      for i in release_series:
>          if release_series[i] == baseversion:
>              ourseries = i
>              ourbranch = i
> +            bitbakeversion = bitbake_mapping[i]
>  else:
>      # We're floating on a branch
>      branch = subprocess.run(["git", "branch", "--show-current"], capture_output=True, text=True).stdout.strip()
>      ourbranch = branch
> -    if branch == "master":
> +    if branch == "master" or branch == "master-next":
>          ourseries = devbranch
> +        docconfver = "dev"
> +        bitbakeversion = ""
>      elif branch in release_series:
>          ourseries = branch
> +        bitbakeversion = bitbake_mapping[branch]
>      else:
>          sys.exit("Unknown series for branch %s" % branch)
>
> @@ -70,6 +86,8 @@ else:
>          ourversion = previoustags[-1] + ".999"
>      else:
>          ourversion = release_series[ourseries] + ".999"
> +    if not docconfver:
> +        docconfver = ourversion
>
>  series = [k for k in release_series]
>  previousseries = series[series.index(ourseries)+1:]
> @@ -86,6 +104,8 @@ replacements = {
>      "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
>      "YOCTO_DOC_VERSION" : ourversion,
>      "DISTRO_REL_TAG" : "yocto-" + ourversion,
> +    "DOCCONF_VERSION" : docconfver,
> +    "BITBAKE_SERIES" : bitbakeversion,
>  }
>
>  with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2630): https://lists.yoctoproject.org/g/docs/message/2630
> Mute This Topic: https://lists.yoctoproject.org/mt/89868949/3620601
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

