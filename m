Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C095C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:38:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.15740.1672933126449336797
 for <docs@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 07:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=at39XxHu;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bq39so47727451lfb.0
        for <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 07:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bMWR2L4YnDuTo8cMxWd79Fx5UpE7ondvIyOrciclTfA=;
        b=at39XxHucm3cgGECw1vzr1wrFotVUV4q2nxzB+kaFlly1+gTyCcsd0icbzYSJKryDF
         QDrrbeVzZ8z/BnetoltYd5x72IyxSB78W11lmO9OZwDvBoxW7iqaQqgN2oUA6sUNlOWK
         19Ag/GTmSo6m1Eg74i2AaRE1qRqeJDJ3fGgJ9n6nKEz3LqsbKvAjDnzFlQrTceQNkxC4
         F8QrpgA09B0U7CDKXYaWVnuC03FtW2KIoLoc8arjT0cfW9RWszZxmD5dne5grX7+I5d1
         5JVcIDeqyrPacnHRnSN8G321SogmgvMqDmuVasnP9PN7tcgqLqX6ugkgZbIbJj8G3Lvw
         oHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMWR2L4YnDuTo8cMxWd79Fx5UpE7ondvIyOrciclTfA=;
        b=yGU86wDebd882MSlW8iWC4VP4vtNvDMwC2H1J6QTzEGu9mlIH1ZCjLvV5Od442rlEn
         Wm+qGBwLOTTUWHV500d9U67lIgon1QTKDPYbi5UpZ2Y9Ig6V7GUlmPm+UtLCYXoKoRIM
         UWtMvcRstUSonnO+aIzlHupG/6OzkyX1HtnkpcaP++uARlAXW/oMhG2XevA3zNE4Ovet
         HmQ0t6MRD9pIuy3hYC+gVDbIx5Phq/uI+x45ATBapQxbnrPC7mva87Vc9WyJEeeuiHuX
         PFByATlFzLKfZuAMMA/3lKHcsLBjEVF8Z1VYedM4oydk4K7N17WkOFN3v890jFM2aA79
         7wBQ==
X-Gm-Message-State: AFqh2krOqDE8EvNhfD9tzIGGpyqlIyFXq1oPkZJXGy38udyX8xl41DtZ
	uZyZk0AvPOe3jwo/USlMH2vqLQbqryR96lwULUE=
X-Google-Smtp-Source: AMrXdXu3Z8tlNXJ8rlY50hB2Hx9ftI8qeThE+0tYLPIRqQxi3B2QMm9nuDw0QErSMO4N5G2FdsqrfxjrH5uXVrxa6cs=
X-Received: by 2002:ac2:5c5a:0:b0:4cb:154d:2178 with SMTP id
 s26-20020ac25c5a000000b004cb154d2178mr1349593lfp.367.1672933124363; Thu, 05
 Jan 2023 07:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20230105152010.2318650-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230105152010.2318650-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jan 2023 16:38:32 +0100
Message-ID: <CANNYZj-TTDk_c4zEP1o+zhjZpC8P93pW0BKjeK4XH5HeNuYMjg@mail.gmail.com>
Subject: Re: [PATCH] ref-manual/system-requirements.rst: recommend buildtools
 for not supported distros
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 05 Jan 2023 15:38:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3595

Which is done by running scripts/install-buildtools and doing that has
its own section in the same system-requirements.rst
:-) A simple reference to it should be enough.

Alex

On Thu, 5 Jan 2023 at 16:20, <michael.opdenacker@bootlin.com> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Also minor correction to supported distribution notes
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  documentation/ref-manual/system-requirements.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
> index 1f9b3b1b58..2bb813b385 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -34,8 +34,7 @@ and conceptual information in the :doc:`/overview-manual/index`.
>  Supported Linux Distributions
>  =============================
>
> -Currently, the Yocto Project is supported on the following
> -distributions:
> +Currently, the Yocto Project is supported on the following distributions:
>
>  -  Ubuntu 18.04 (LTS)
>
> @@ -71,7 +70,11 @@ distributions:
>        has no plans to support rolling-releases or development
>        distributions due to their constantly changing nature. We welcome
>        patches and bug reports, but keep in mind that our priority is on
> -      the supported platforms listed below.
> +      the supported platforms listed above.
> +
> +   -  If your Linux distribution is not in the above list, we recommend to
> +      get the :term:`buildtools` or :term:`buildtools-extended` tarballs
> +      containing the host tools required by your Yocto Project release.
>
>     -  You may use Windows Subsystem For Linux v2 to set up a build host
>        using Windows 10 or later, or Windows Server 2019 or later, but validation
> --
> 2.37.2
>

