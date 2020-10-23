Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web08.10009.1603464249813071996
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Oct 2020 07:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GeNVUy8x;
 spf=pass (domain: linaro.org, ip: 209.85.219.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f196.google.com with SMTP id h196so1407421ybg.4
        for <docs@lists.yoctoproject.org>; Fri, 23 Oct 2020 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=urS06oiaBHTNyd7oFm7U34Z4lsIj6fgEidyDZIu7fFo=;
        b=GeNVUy8xYKGBImxMgwlhkb1RhuRABoy+pT3GuoxeMV9wgNpyLxvB6VHRbT1PM69YBx
         YPo3yZS2CwppzORQQgfP+d2lRUy8+fIz+iDTHNznQr8fi1MlICEe9xkXM/GGgmNDIMC6
         qrBUzcYPqgBeBNOZPOfjhMpePUkAudjpGiDdHghaHibpC9s2ttC0Tu4m6hWnd3WuMNxS
         UXeRs8kRIhxGq9jgMADj/bX2Ogmw7O7HGD6NkdjVRQu4ChCtwQ3yDjbWfgw5Lic4sT4F
         +vzKjUX2NwW+rUZoTFJjxl077PeVmi7LgKUMG+1mI52k6jv8AbHJP4eOAcpzyOHALQPr
         JRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=urS06oiaBHTNyd7oFm7U34Z4lsIj6fgEidyDZIu7fFo=;
        b=tuDh3Bdt3CgYO8qJRe1uKQat0OF2R22DhNVxtyRcAvQsg6wZSH3FL72VZpWmQc8o7q
         MU8Iyp9mbcA8PfYbMHLE7hJTn1RVey3GkgAdy30diMsuBIfDB4uvT7u3ADIlY1F6ecDl
         A0oCo6idQB5enlq1eMZE45SeiIkf+MX3uf954npyVvuseLxS2EDwEehdFwo3Pbktm/JV
         OAdptbK3jxhpyyohlhdGDjmKGXIjvewPjUx+GcsJ2lPRZYnB/U/XZkqbfDEl9drfgkjx
         A2jQ0RgUiyMC4aEraSrOaKMFRgu6f46jT8e0xlLSPTaz6lNAgYVBz3kF+JWhofcXzsU0
         dKbw==
X-Gm-Message-State: AOAM53246ai2V3rD8uAKnzVBfoqa5p6EyPKRx3+edaofbnL5NHI8kh0D
	QJ2QWmx4v+Pb1FjMjD1+C6n3/EVhhI/HOJWZR16aPA==
X-Google-Smtp-Source: ABdhPJy/dHz1DZUMgZcYb4m4w2T1mXUHjI+ob4eZt+teu+tWO2i4mVF52rE43oroX87N12+i3cjcXHZzKnuujqAMLQ4=
X-Received: by 2002:a25:c204:: with SMTP id s4mr3604484ybf.454.1603464248728;
 Fri, 23 Oct 2020 07:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
In-Reply-To: <20201012034255.2186713-1-leimaohui@cn.fujitsu.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 23 Oct 2020 16:43:57 +0200
Message-ID: <CAP71WjyWn6cPg2rZP0T8-iNDWH4KTaBULh4UgaGf9pyZ7FLg=g@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: Updated the status of spdx module.
To: leimaohui <leimaohui@cn.fujitsu.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

hey Lei,

On Mon, Oct 12, 2020 at 5:44 AM leimaohui <leimaohui@cn.fujitsu.com> wrote:
>
> - Deleted content about old spdx.bbclass.
> - Added usage of meta-spdxscanner.
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

this causes the following new warning:
WARNING: Enumerated list ends without a blank line; unexpected unindent.

I believe the code-block belongs to the #3 item in the list, in which
case this patch is needed:

--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -11487,26 +11487,23 @@ this function, you have to follow the following steps:
 2. Refer to the README in meta-spdxscanner to setup the environment (e.g,
    setup a fossology server) needed for the scanner.

-3. Meta-spdxscanner provids several methods within the bbclass to
create spdx files.
+3. Meta-spdxscanner provides several methods within the bbclass to
create spdx files.
    Please choose one that you want to use and enable the spdx task. You have to
-   add some config options in
-``local.conf`` file in your
-:term:`Build Directory`.
-The following is an example showing how to generate spdx files during bitbake
-using the fossology-python.bbclass:
-::
-
-   # Selet fossology-python.bbclass.
-   INHERIT += "fossology-python"
-   # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
-   # Fossology server, you have to create a token.
-   TOKEN = "eyJ0eXAiO..."
-   # The fossology server is necessary for fossology-python.bbclass.
-   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
-   # If you want to upload the source code to a special folder:
-   FOLDER_NAME = "xxxx" //Optional
-   # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
-   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
+   add some config options in ``local.conf`` file in your :term:`Build
+   Directory`. The following is an example showing how to generate spdx files
+   during bitbake using the fossology-python.bbclass::
+
+      # Selet fossology-python.bbclass.
+      INHERIT += "fossology-python"
+      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
+      # Fossology server, you have to create a token.
+      TOKEN = "eyJ0eXAiO..."
+      # The fossology server is necessary for fossology-python.bbclass.
+      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
+      # If you want to upload the source code to a special folder:
+      FOLDER_NAME = "xxxx" //Optional
+      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
+      SPDX_DEPLOY_DIR = "${DeployDir}" //Optional

Note: I fixed a typo as well.

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
> --
> 2.25.1
>
>
> 
>
