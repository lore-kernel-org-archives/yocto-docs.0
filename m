Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.2440.1602519792816637322
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 09:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jXGcbU31;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id h2so8851046pll.11
        for <docs@lists.yoctoproject.org>; Mon, 12 Oct 2020 09:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4TsFpiiamlkGwkW5saWSR54Ka/7KdDLhLyd2EHCFps4=;
        b=jXGcbU31QMAM3aFntk0MXoIaaXHeRofCOkhnU5d9kW10xg+FUx2k2GwzOzS054GJfE
         8B9LPToqtUH3qyFmTBIzj7PSu1nU99NUkWQBW61CYDoWp2OUjel9L1iOYlixm8yw47Zg
         9D4BguerzL6OlkfyY9qQn3y8v5zMVqAkkRTEPisKAkjQT7ErhHGg1wAFosiF4I2Qe8KT
         CmhDf9Osms3XFaS2gBXWSnU+7PqZU7Pr83cKaHeXRaNg+EKEnFYBDUDBGEZOuA4biESt
         dd7rdP8XjlufZVAU6Cfj9JmdmRLOZPMElnfjo+pHWlg2oKOWXx1DFKtk9jmN91h2aDBh
         9tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4TsFpiiamlkGwkW5saWSR54Ka/7KdDLhLyd2EHCFps4=;
        b=WEvgeiptS9yjhMk6SwjV//N8YY0VTKeJgO5A7VNdrB/wnEzNy/CNh+bCIY4Bk3+3KU
         gKFEvH9DE6ZekCMvDNPzoT9sAoq1a15KZFtiw1pu17nKywT3T+uWjMgatw5puFGeV3CU
         roLK6xZuAvawV6986ZLfVrd+8syDItpAFmLyeYl8IkLGn5aixozd5Y2xZvCrvAJ7Gls4
         blHV+VH3S5MZ5Dp9AezRAuRhTdgwtAbxTYH8dchCsJm/+wWJ+Ld/1fLgS0FeCA2yAWt9
         3WkQIqTjzx3E9F+2skWMLxJgi0ZEc0QxjzCwxVnn2B+Wea54GBl2e4QJwY+UX3kDOJyN
         z+2w==
X-Gm-Message-State: AOAM532UG5WX4ylWaISbv0YF4vk1c7RnP+5LgDggRf5qJI5S/0gVTigJ
	Ou6aBoWJCK06bEcKMfz3yI8FvPBNBgc=
X-Google-Smtp-Source: ABdhPJwO9YzTGHYsf9fMtPjy2A05/MU503xFz8oyBHJj26fduZgjqVLy4+d7SVMGYag+l9JEDrfedQ==
X-Received: by 2002:a17:902:c254:b029:d4:c2d4:15f with SMTP id 20-20020a170902c254b02900d4c2d4015fmr14659831plg.18.1602519791866;
        Mon, 12 Oct 2020 09:23:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:d58b:c80e:7cac:2737? ([2601:202:4180:a5c0:d58b:c80e:7cac:2737])
        by smtp.gmail.com with ESMTPSA id u27sm19737735pgm.60.2020.10.12.09.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 09:23:11 -0700 (PDT)
Subject: Re: [docs] [PATCH] docs: Updated the status of spdx module.
To: leimaohui <leimaohui@cn.fujitsu.com>, docs@lists.yoctoproject.org
References: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <906c0783-9cb6-0cd2-7bc2-ee73fc4d810f@gmail.com>
Date: Mon, 12 Oct 2020 09:23:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/11/20 8:42 PM, leimaohui wrote:
> - Deleted content about old spdx.bbclass.
> - Added usage of meta-spdxscanner.

Do we want to go down this road? Will we be adding other scanning layers
in YP docs?  It seems out of scope for the Yocto Project.

-armin
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 38 +++++++++++++++++++
>  documentation/ref-manual/ref-classes.rst      | 13 -------
>  documentation/ref-manual/ref-tasks.rst        | 14 -------
>  3 files changed, 38 insertions(+), 27 deletions(-)
>
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
> index bef8bf840f..80fd23e960 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -11401,6 +11401,8 @@ to be covered by assuming that three main areas of concern exist:
>  -  Compilation scripts and modifications to the source code must be
>     provided.
>  
> +-  spdx files can be provided.
> +
>  There are other requirements beyond the scope of these three and the
>  methods described in this section (e.g. the mechanism through which
>  source code is distributed).
> @@ -11595,6 +11597,42 @@ layers (recipes, configuration files, and so forth) enables you to meet
>  your requirements to include the scripts to control compilation as well
>  as any modifications to the original source.
>  
> +Providing spdx files
> +~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The spdx module has been integrated to a layer named meta-spdxscanner.
> +meta-spdxscanner provides several kinds of scanner. If you want to enable
> +this function, you have to do the following steps:
> +
> +1. Added meta-spdxscanner layer into ``bblayers.conf``. 
> +
> +2. Reference to README of meta-spdxscanner, setup the environment(e.g, 
> +   setup a fossology server) of scanner.
> +
> +3. Meta-spdxscanner provids several methods(bbclass) to create spdx files.
> +   Please choose one that you want to use and enable the spdx task. You have to
> +   add some config options in 
> +``local.conf`` file in your
> +:term:`Build Directory`.
> +The following is an example about how to get spdx files during bitbake 
> +by fossology-python.bbclass:
> +::
> +
> +   # Selet fossology-python.bbclass.
> +   INHERIT += "fossology-python"
> +   # For fossology-python.bbclass, TOKEN is necessary, so, after setup a 
> +   # Fossology server, you have to create a token.
> +   TOKEN = "eyJ0eXAiO..."
> +   # The fossology server is necessary for fossology-python.bbclass.
> +   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo" //Optional
> +   # If you want to upload the source code to a special folder.
> +   FOLDER_NAME = "xxxx" //Optional
> +   # If you don't want to put spdx files in tmp/deploy/spdx, you can change.
> +   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
> +
> +More usage of meta-spdxscanner, which you can find at:
> +https://git.yoctoproject.org/cgit/cgit.cgi/meta-spdxscanner/.
> +
>  Copying Licenses that Do Not Exist
>  ----------------------------------
>  
> diff --git a/documentation/ref-manual/ref-classes.rst b/documentation/ref-manual/ref-classes.rst
> index 756df2a60f..7277c6bb9d 100644
> --- a/documentation/ref-manual/ref-classes.rst
> +++ b/documentation/ref-manual/ref-classes.rst
> @@ -2380,19 +2380,6 @@ Autotools automatically picks up.
>  The class also provides variables like ``SITEINFO_ENDIANNESS`` and
>  ``SITEINFO_BITS`` that can be used elsewhere in the metadata.
>  
> -.. _ref-classes-spdx:
> -
> -``spdx.bbclass``
> -================
> -
> -The ``spdx`` class integrates real-time license scanning, generation of
> -SPDX standard output, and verification of license information during the
> -build.
> -
> -.. note::
> -
> -   This class is currently at the prototype stage in the 1.6 release.
> -
>  .. _ref-classes-sstate:
>  
>  ``sstate.bbclass``
> diff --git a/documentation/ref-manual/ref-tasks.rst b/documentation/ref-manual/ref-tasks.rst
> index 2569306fc5..ea145644f7 100644
> --- a/documentation/ref-manual/ref-tasks.rst
> +++ b/documentation/ref-manual/ref-tasks.rst
> @@ -859,17 +859,3 @@ sure that the machine and metadata branches as specified by the
>  branches. If these branches do not exist and
>  :term:`AUTOREV` is not being used, the
>  ``do_validate_branches`` task fails during the build.
> -
> -Miscellaneous Tasks
> -===================
> -
> -The following sections describe miscellaneous tasks.
> -
> -.. _ref-tasks-spdx:
> -
> -``do_spdx``
> ------------
> -
> -A build stage that takes the source code and scans it on a remote
> -FOSSOLOGY server in order to produce an SPDX document. This task applies
> -only to the :ref:`spdx <ref-classes-spdx>` class.
>
> 
>

