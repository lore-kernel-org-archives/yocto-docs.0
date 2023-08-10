Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE68C41513
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:38:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.22305.1691685498676139398
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 09:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Re8FVL79;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so1693037e87.3
        for <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691685497; x=1692290297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tRu2YRtpPWGRUR0hyCJwrByZqvXiuAQM5BXKTnRhzv4=;
        b=Re8FVL79C/vZnHgY9rSQH5xNcanbSKAsnMjjZxVD4HdtFllUcXKGw33FReh7wTXSuj
         Ca9vvd1ly8krzVfzCccVU7GqBurhruGiZW7IFb7KND9sdnNGVttOFW3EZVNeDXAZMwuR
         DxbibXmGtE/X1RBF02m5MhI253TtVXi77+NaqiZ+0vF7GxQrfsXNkzp7trgJV4i85QvA
         +Nc4JQNwOh6y7duKlDG/QPkitqgQf3T8g3iF6a78SQHdi7gA7swtZ/gffkQBq/4WWDNc
         JykuciX8syB5m0mimlWnzopKkxabPO/fdF4AuVNq8Baos40F1KNHyXDxhNewBNUg6QoX
         WiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685497; x=1692290297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRu2YRtpPWGRUR0hyCJwrByZqvXiuAQM5BXKTnRhzv4=;
        b=BA3iXZt3VHpR4nubI/1iwHEulp4CvpnMw1/wD5ORQ7t839WlaqwX3jLXrFfGuoYVhK
         TmaqcurtnVmkXgEQ/tWbY1rFynO8vaq5IcqyDIZeU9xoiGAKiTm1fwLH6pzIA7p3thXp
         UekPaTNmxn6QCp1J0ntdbE5cVfjgNs5/m0SAZBEvhmokN56cBdEyBfgxBm3LuezW+Xlg
         6OWeDwFXVsKFJR7/CFHfYjoMT6k7wQC7tKqx/8pdm+FbxLQbaw9IAULnP22FIzT8cQHc
         fzOudjVx9fhqbJrp8eoy7irrykYUTCUs723xPwxF0I3D57jxoYZOFrtkhdiW8d27h/k8
         1g3w==
X-Gm-Message-State: AOJu0Yx4BVuzhcsGiTXZy4MtL66Y6GcgSH14+h4oKyjO2SeArXyzmPEy
	prgB+Eutr0s7bnPOp4M0BOTuqV3NsxJyGStgQmo=
X-Google-Smtp-Source: AGHT+IGqrN822JqGO46UvARz8pWbqIJ3gve6jSSKQgcLXdQ3uueyipJDivMEOTLiePXoS6K9lq/LIUzv4qaFWcLlzxQ=
X-Received: by 2002:a05:6512:1d0:b0:4fb:9469:d659 with SMTP id
 f16-20020a05651201d000b004fb9469d659mr2096076lfp.23.1691685496615; Thu, 10
 Aug 2023 09:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
 <d03b0041-978c-40c0-8905-f4f3d62729be@bec-systems.com> <b2efe736-0613-a3cb-020c-2cba3562420f@bootlin.com>
In-Reply-To: <b2efe736-0613-a3cb-020c-2cba3562420f@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Aug 2023 18:38:05 +0200
Message-ID: <CANNYZj9J2eqBup4zFYWsjWxD5iDBGdeauY9iqLPcRfCURPA6Og@mail.gmail.com>
Subject: Re: [docs] [OE-core] Keep scripts/create-pull-request and
 send-pull-request ?
To: michael.opdenacker@bootlin.com
Cc: Cliff Brake <cbrake@bec-systems.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 16:38:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4141

On Thu, 10 Aug 2023 at 18:36, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> All things considered, since scripts/create-pull-request is still in
> use, in particular by Steve and Bruce, I'm leaning towards documenting
> both variants:
>
>   * Creating a simple pull request using the standard git tools, as
>     several of us are doing. Richard doesn't seem to mind. At least in
>     my case, this applies to changes I previously submitted through the
>     lists.
>   * Creating a more elaborate pull request from a branch containing
>     commits that haven't been shared yet, typically like what Steve
>     does. This way, people can review each patch individually by e-mail.
>
> Unless we want to standardize our pull requests, and make sure each
> commit is submitted (sometimes once again) as a separate patch. In that
> case, we'd only document the use of scripts/create-pull-request.

FWIW, I haven't used either tool for years, and I do send large
patchsets. Standard git tooling is fully adequate, except for
management of cover letters which I'd like to get help with.

Alex

