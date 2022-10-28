Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB787C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 13:20:16 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.6157.1666963210806099954
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Oct 2022 06:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lkgEkaNz;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id sc25so12829592ejc.12
        for <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dGGR56G9WGK+/6rsaDjEYESM5MgRcX4A64d/E6dZPHs=;
        b=lkgEkaNzWtUTWNyPW40Em/mX90mDHS4ZPdpvIXvS6I0LNcR8jp90/GHZPCmlfCZ6Uz
         F+VrqF57XKes7iQbyG9ZN4LBosKDwLCAEXlMCGoggr4K2OMcUwLrGLssw5bt6Q9KFs0u
         aqPhP5akEvwsiO+/BwK1Hhg85QwFmLq0COUsE/rvv27jFyrpSjKfWQ317qyAYEiWguWW
         CSEzBJQHWb1GtpVw92X3yR/5/tPxG7QV3X0HTGOp+yzk491UI1WYqEO0TERUPRGqfjxN
         ElzglGpRBBeWfmhmlCD3E9yA57y2CKbzV1nIAHrBUAEIZ+K/v2X3VF5aKaS3DusTzdyI
         VEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGGR56G9WGK+/6rsaDjEYESM5MgRcX4A64d/E6dZPHs=;
        b=jzong++GU+F3j3qwo5+Eou0x0VQPF2eRcEarn27xryIz009jvDb7yzixaesAqPCATy
         tKOkTilzt48449/3sqAEuy0wSHe9vXDA3ggtSJNoxZI9v3dEiMq5rHjmtaZ1hA3QMaZE
         bKxbxxNVeVpUq9O2ezdjCHNfwFkLjP4FIvvIxNhBSoN0AbpIViasVYvJ1jKpWZ5rtQIj
         Dq566rIxtIOYsEL60+dduxDsNb6/K0tdUx4K4Q67MQ0v3Yr0sD3EK/LgxfjeDe1CwWgJ
         GhZay+zlXeanjKz6rz6Mt4ehjqxSF6D7Jdb/o2Lq60mbClsnYB//NyGmeUBQGtyCFDsh
         K8Yw==
X-Gm-Message-State: ACrzQf0NfvMoaaS/ogoTQCfUDiNeL9P0l42tZXaNc6geOxqIb0p2Y0Nl
	5uFnbHxnChrYgPwo+HhbhVKbogfnrhHhjPmSnNU=
X-Google-Smtp-Source: AMsMyM4jczEEows/Lme3rzgbR06PCuO/Z7G7EO5L4L4R7k6/dqmFkK0xYKbaEeg26FCOwxfu0w0IpgiAeC+MGHJvc+8=
X-Received: by 2002:a17:907:2c4a:b0:78d:ee99:a06b with SMTP id
 hf10-20020a1709072c4a00b0078dee99a06bmr45168841ejc.578.1666963209020; Fri, 28
 Oct 2022 06:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221028101939.93195-1-michael.opdenacker@bootlin.com> <20221028101939.93195-5-michael.opdenacker@bootlin.com>
In-Reply-To: <20221028101939.93195-5-michael.opdenacker@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 28 Oct 2022 08:19:57 -0500
Message-ID: <CAJdd5GZu3t8JFmg8U5HUHbxfh83mV_73gyTqoMKdsEdxYWgVTA@mail.gmail.com>
Subject: Re: [docs] [PATCH 4/5] ref-manual: classes.rst: expand documentation
 of create-spdx class
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Oct 2022 13:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3438

On Fri, Oct 28, 2022 at 5:19 AM Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index cce0269b9a..621cf9c8b6 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -373,8 +373,24 @@ support.
>  ``create-spdx.bbclass``
>  =======================
>
> -The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for automatically creating
> -SPDX SBoM documents based upon image and SDK contents.
> +The :ref:`create-spdx <ref-classes-create-spdx>` class provides support for
> +automatically creating :term:`SPDX` :term:`SBOM` documents based upon image
> +and SDK contents.
> +
> +This class is meant to be inherited globally from a configuration file::
> +
> +   INHERIT += "create-spdx"
> +
> +The output files are generated in ``tmp/deploy/spdx`` under the
> +:term:`Build Directory`.

Probably should mention the per-image output file here also

> +
> +The exact behaviour of this class, and the amount of output can be controlled
> +by the :term:`SPDX_PRETTY`, :term:`SPDX_ARCHIVE_PACKAGED`,
> +:term:`SPDX_ARCHIVE_SOURCES` and :term:`SPDX_INCLUDE_SOURCES` variables.
> +
> +See the description of these variables and the
> +":ref:`dev-manual/common-tasks:creating a software bill of materials`"
> +section in the Yocto Project Development Manual for more details.
>
>  .. _ref-classes-cross:
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3435): https://lists.yoctoproject.org/g/docs/message/3435
> Mute This Topic: https://lists.yoctoproject.org/mt/94623294/3616693
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

