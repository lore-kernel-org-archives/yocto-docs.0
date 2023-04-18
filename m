Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587A7C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 12:12:43 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.6950.1681819955741810822
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 05:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bytesatwork-ch.20221208.gappssmtp.com header.s=20221208 header.b=M8p06Vm1;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.218.48, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ej1-f48.google.com with SMTP id xd13so38663177ejb.4
        for <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20221208.gappssmtp.com; s=20221208; t=1681819953; x=1684411953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igOfnMGH/kZLYnXA9X/aaQiDtBtkckcr9DrRduUa9rk=;
        b=M8p06Vm1KCGJhkN1tex24qKJWUsbVH7hV+KQXD9EYNTQBRxCkXdccwJTYXXr0Ycs8A
         TtuyO8VLY2K4GoyiGoZ+eLZKiQGoewjnqTry/p5xx/U4vHHPVEA4vGYDUoE+wn1TxMnx
         5tH1s3pbqtl1GkYQ4WgmtqWC+m7VEKHU1KnLYl22J7zHgdChdvL+9LdZLjAcYlMhz+ou
         pfgENEkz+Nk+tUsFesIDJtvyZU8Qt1BIt0OEXC643Pmohs0141pbvNpNpmklka4P67Ce
         gNH829rxurjVzev3lpAy+lPHZ/zyNWKaiBDm5642Ip+aatdYpC9bZMKInlaoLmmngWk2
         9JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819953; x=1684411953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igOfnMGH/kZLYnXA9X/aaQiDtBtkckcr9DrRduUa9rk=;
        b=lCelSCHxI2si8+WuLND/z2RhZ3TPCOtoY8OsNPZsox8IOHznsrG3RqQcM/4pa6jP3f
         AmGuM7+TvvqIjCwx79IV1uR7ctcCJpKaBX5jo7d1120NChEqPfdHQqxRMHirBO7Xdl+2
         katKtXpyuJGVwvB3BAz/+g2PpRZciAkNOj3P2b1qAwu3lgdvH00qtuAHEGC6eF7fCILP
         1N0RBdtHzoAZzcN3tgVYOPncHZzyiM82oUXGq35NvtgE1OC1aVq9kNFMFMt28I7+POg7
         oYvPjqOsqDQxPDya8cjri40+UyF1rwNBuRYGLRWLFltqGQ4lSTJWnurtkcD5qZuyIMyP
         47cA==
X-Gm-Message-State: AAQBX9cx37ivLLwhu9A5F9erYyZwPhjCSqFiiPKnhoSnMMoN3PHlVo6w
	rDDFJEShpKN1mJxKEN0MDGlJug==
X-Google-Smtp-Source: AKy350aAc/mVBzJ8tTgKx4ljliPjMcEG+UaODYjXfqZqdT6K/AoOfTdjT1o3ArpJJ7sVI9qAzroY6g==
X-Received: by 2002:a17:906:b190:b0:94a:785e:6a46 with SMTP id w16-20020a170906b19000b0094a785e6a46mr12818801ejy.24.1681819953209;
        Tue, 18 Apr 2023 05:12:33 -0700 (PDT)
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090601ce00b0094a671c2298sm2542559ejj.62.2023.04.18.05.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 05:12:32 -0700 (PDT)
Message-ID: <1a0a5493-8234-c12c-000d-39827867b948@bytesatwork.ch>
Date: Tue, 18 Apr 2023 14:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [docs] [PATCH] manuals: document SPDX_CUSTOM_ANNOTATION_VARS
Content-Language: en-US
To: michael.opdenacker@bootlin.com
Cc: Saul Wold <Saul.Wold@windriver.com>, Joshua Watt <JPEWhacker@gmail.com>,
 docs@lists.yoctoproject.org
References: <20230418090909.1282106-1-michael.opdenacker@bootlin.com>
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
In-Reply-To: <20230418090909.1282106-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Apr 2023 12:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3842



On 4/18/23 11:09, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Saul Wold <Saul.Wold@windriver.com>
> CC: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   documentation/dev-manual/sbom.rst             |  3 +++
>   .../migration-guides/release-notes-4.2.rst    |  9 ++++---
>   documentation/ref-manual/variables.rst        | 26 +++++++++++++++++++
>   3 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/dev-manual/sbom.rst b/documentation/dev-manual/sbom.rst
> index 448c071c55..f51d08f84d 100644
> --- a/documentation/dev-manual/sbom.rst
> +++ b/documentation/dev-manual/sbom.rst
> @@ -63,6 +63,9 @@ generated files are available in ``tmp/deploy/spdx/MACHINE`` too, such as:
>      (when :term:`SPDX_ARCHIVE_SOURCES` is set). Those are needed to fulfill
>      "source code access" license requirements.
>   
> +See also the :term:`SPDX_CUSTOM_ANNOTATION_VARS` variable which allows
> +to associate custom notes to a recipe.
> +
>   See the `tools page <https://spdx.dev/resources/tools/>`__ on the :term:`SPDX`
>   project website for a list of tools to consume and transform the :term:`SPDX`
>   data generated by the OpenEmbedded build system.
> diff --git a/documentation/migration-guides/release-notes-4.2.rst b/documentation/migration-guides/release-notes-4.2.rst
> index 4cf1974d4f..eb75dec6dc 100644
> --- a/documentation/migration-guides/release-notes-4.2.rst
> +++ b/documentation/migration-guides/release-notes-4.2.rst
> @@ -45,9 +45,12 @@ New Features / Enhancements in 4.2
>   
>   -  New variables:
>   
> -   - :term:`VOLATILE_TMP_DIR` allows to specify
> -     whether ``/tmp`` should be on persistent storage
> -     or in RAM.
> +   -  :term:`VOLATILE_TMP_DIR` allows to specify
> +      whether ``/tmp`` should be on persistent storage
> +      or in RAM.
> +
> +   -  :term:`SPDX_CUSTOM_ANNOTATION_VARS` allows to add
> +      specific comments to the :term:`SPDX` description of a recipe.
>   
>   -  Rust improvements:
>   
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 62f28bd278..26ed1f29ae 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7629,6 +7629,32 @@ system and gives an overview of their function and contents.
>         (+ 0.07\% with the tested image), compared to just enabling
>         :term:`SPDX_INCLUDE_SOURCES`.
>   
> +   :term:`SPDX_CUSTOM_ANNOTATION_VARS`
> +      This option allows to associate `SPDX annotations
> +      <https://spdx.github.io/spdx-spec/v2.3/annotations/>`__ to a recipe,
> +      using the values of variables in the recipe::
> +
> +         ANNOTATION1 = "First annotation for recipe"
> +         ANNOTATION1 = "Second annotation for recipe"
                       ^
I can't comment on the rest, but this seems to be a typo.

> +         SPDX_CUSTOM_ANNOTATION_VARS = "ANNOTATION1 ANNOTATION2"
> +
> +      This will add a new block to the recipe ``.sdpx.json`` output::
> +
> +         "annotations": [
> +           {
> +             "annotationDate": "2023-04-18T08:32:12Z",
> +             "annotationType": "OTHER",
> +             "annotator": "Tool: oe-spdx-creator - 1.0",
> +             "comment": "ANNOTATION1=First annotation for recipe"
> +           },
> +           {
> +             "annotationDate": "2023-04-18T08:32:12Z",
> +             "annotationType": "OTHER",
> +             "annotator": "Tool: oe-spdx-creator - 1.0",
> +             "comment": "ANNOTATION2=Second annotation for recipe"
> +           }
> +         ],
> +
>      :term:`SPDX_INCLUDE_SOURCES`
>         This option allows to add a description of the source files used to build
>         the host tools and the target packages, to the ``spdx.json`` files in
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3841): https://lists.yoctoproject.org/g/docs/message/3841
> Mute This Topic: https://lists.yoctoproject.org/mt/98339958/3616718
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [daniel.ammann@bytesatwork.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

