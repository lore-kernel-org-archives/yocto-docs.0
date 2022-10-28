Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3763FECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 11:06:06 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.4997.1666955164571219294
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 04:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S9wQd2me;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id d6so7683328lfs.10
        for <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 04:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHPdSk/zKDrhbeijwleoaVDcW4O2W5MIVS/4k1/xi38=;
        b=S9wQd2meh7q0nk3EFcaMBPeOaTp58Se/T/ngrXQnukGOZA99Jh2LJvT+2eX8GZ0BYE
         gfokYxGnBLsgQGWmMy6wNlp1na6+E5tXxNcxm5wYbzk9Vc2Kellv/DhH7gMsTg++RPgh
         vHhov5dHFdyMK+xNWpinnW5znci75yfHiAT0WxgigQCgPJIeF65xaOuHIZBDq2izhpaR
         iN669bzHWhJ4Ojvt5FYJEbF6dSJA8NJ8GGipqlff/VNLQPDc1Uv1jVZYS6qiZs2FNIbs
         kZEliFLkPDr/ga3amxjdCSd/aPJggSMv69qC3j9QKb9gO6g4rrP9mpmTJm0c/r2KCzTu
         WmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHPdSk/zKDrhbeijwleoaVDcW4O2W5MIVS/4k1/xi38=;
        b=cGZbJsjFawQ5a9OTk9y5ihKCkcAOCwlMmPbVaVbXFoqD5pu4oDW9XlSzI0cm2ksgL0
         abc1U+bfPR6dIOAmJ6GxFfXIl5numACcN3FILUSv4BulQyONhuF2RUcMYTt0xmWvsDYr
         GLt2ueWNru+wiA0V5wMepPWEcDsiOK5Bb77JJljGcNEKWBn/QmG0YlM2jgEBKW3AUgSZ
         MvTpFBDpGLb5PAnzweRA0NjECHtH6d0wIOxF2eoJOHV+zemseS/+s8bzl6cR0fg2V7Jp
         k0WtGiCBZOxpQYLWGZlpiKXu8ezG8csw6rB+SN7dL/IJts7d1DFM71GG1tQQd0BSjn9f
         PNog==
X-Gm-Message-State: ACrzQf2PD2uCJG3NeZi/McLL173vE+vCg8bFFiHsfqB0oU8VzHKsd0nb
	8OCo5ULYsAZf2zx29XlsIKP2dg==
X-Google-Smtp-Source: AMsMyM5mJOP+qkmfLLUeanUgZFBmWASZqwftM8vYe+Lb31KvnZtPMSKzI3oe8aKBl/ehZJ7R0XO/CQ==
X-Received: by 2002:a05:6512:39cd:b0:4a2:ff7:12ef with SMTP id k13-20020a05651239cd00b004a20ff712efmr22402393lfu.643.1666955162332;
        Fri, 28 Oct 2022 04:06:02 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id p8-20020ac24ec8000000b00494a1b242dasm521431lfr.14.2022.10.28.04.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 04:06:01 -0700 (PDT)
Date: Fri, 28 Oct 2022 14:05:45 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/5] dev-manual: common-tasks.rst: add section
 about SPDX / SBOM generation
Message-ID: <Y1u3iSS1h8PUJp6y@nuoska>
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com>
 <20221028101939.93195-4-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028101939.93195-4-michael.opdenacker@bootlin.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 11:06:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3437

Hi,

On Fri, Oct 28, 2022 at 12:19:37PM +0200, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Also stop refering to the meta-spdxscanner class, no longer
> relevant.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 96 ++++++++++++++---------
>  1 file changed, 61 insertions(+), 35 deletions(-)
> 
> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
> index 25d7edbc29..263a1d302b 100644
> --- a/documentation/dev-manual/common-tasks.rst
> +++ b/documentation/dev-manual/common-tasks.rst
> @@ -11236,8 +11236,6 @@ to be covered by assuming that there are three main areas of concern:
>  -  Compilation scripts and modifications to the source code must be
>     provided.
>  
> --  spdx files can be provided.
> -
>  There are other requirements beyond the scope of these three and the
>  methods described in this section (e.g. the mechanism through which
>  source code is distributed).
> @@ -11429,39 +11427,6 @@ layers (recipes, configuration files, and so forth) enables you to meet
>  your requirements to include the scripts to control compilation as well
>  as any modifications to the original source.
>  
> -Providing spdx files
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> -The spdx module has been integrated to a layer named meta-spdxscanner.
> -meta-spdxscanner provides several kinds of scanner. If you want to enable
> -this function, you have to follow the following steps:
> -
> -1. Add meta-spdxscanner layer into ``bblayers.conf``.
> -
> -2. Refer to the README in meta-spdxscanner to setup the environment (e.g,
> -   setup a fossology server) needed for the scanner.
> -
> -3. Meta-spdxscanner provides several methods within the bbclass to create spdx files.
> -   Please choose one that you want to use and enable the spdx task. You have to
> -   add some config options in ``local.conf`` file in your :term:`Build
> -   Directory`. Here is an example showing how to generate spdx files
> -   during BitBake using the fossology-python.bbclass::
> -
> -      # Select fossology-python.bbclass.
> -      INHERIT += "fossology-python"
> -      # For fossology-python.bbclass, TOKEN is necessary, so, after setup a
> -      # Fossology server, you have to create a token.
> -      TOKEN = "eyJ0eXAiO..."
> -      # The fossology server is necessary for fossology-python.bbclass.
> -      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
> -      # If you want to upload the source code to a special folder:
> -      FOLDER_NAME = "xxxx" //Optional
> -      # If you don't want to put spdx files in tmp/deploy/spdx, you can enable:
> -      SPDX_DEPLOY_DIR = "${DEPLOY_DIR}" //Optional
> -
> -For more usage information refer to :yocto_git:`the meta-spdxscanner repository
> -</meta-spdxscanner/>`.
> -
>  Compliance Limitations with Executables Built from Static Libraries
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> @@ -11711,6 +11676,67 @@ When analyzing CVEs, it is recommended to:
>  -  follow public `open source security mailing lists <https://oss-security.openwall.org/wiki/mailing-lists>`__ for
>     discussions and advance notifications of CVE bugs and software releases with fixes.
>  
> +Creating a Software Bill of Materials
> +=====================================
> +
> +Once you are able to build an image for your project, once the licenses for
> +each software component are all identified (see
> +":ref:`dev-manual/common-tasks:working with licenses`") and once vulnerability
> +fixes are applied (see ":ref:`dev-manual/common-tasks:checking
> +for vulnerabilities`"), the OpenEmbedded build system can generate
> +a description of all the components you used, their licenses, their dependencies,
> +the changes that were applied and the known vulnerabilities that were fixed.
> +
> +This description is generated in the form of a *Software Bill of Materials*
> +(:term:`SBOM`), using the :term:`SPDX` standard.
> +
> +When you release software, this is the most standard way to provide information
> +about the Software Supply Chain of your software image and SDK, and allow your
> +users and customers to perform vulnerability and license compliance assessments,
> +using the tools of their choice.

I'd mention also something like this:

"The :term:`SBOM` tooling is often used to ensure open source license compliance
by providing the license texts used in the product which legal departments and end
users can read in standardized format."

Then I'd somehow link this to the features which create source code tar
balls, since those are needed to fulfill "source code access" license
requirements.

Cheers,

-Mikko

