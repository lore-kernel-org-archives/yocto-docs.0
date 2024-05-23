Return-Path: <amurray@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619F7C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 14:15:31 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.18191.1716473724734210734
 for <docs@lists.yoctoproject.org>;
 Thu, 23 May 2024 07:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.s=20230601 header.b=SJ71kz+F;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.215.178, mailfrom: amurray@thegoodpenguin.co.uk)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-65c5a29f7f0so3114095a12.1
        for <docs@lists.yoctoproject.org>; Thu, 23 May 2024 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1716473724; x=1717078524; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=37ZIn9gzJCOF8XgwK/gqDCauzQulN85MvsU6mjoXm4w=;
        b=SJ71kz+FPmqwFXADPKkS9aBbsY4BgvDzxYMgaCnnskeETWZ3R8A7fnviMFyvhCsUlE
         pNkAwGdd4aI4smKDV62bRu0LpiayRiWLKSDi60/ZLsSx1G+kSZZ/3WfiNVlvDhV5JgR9
         YiUk8PEft4tSnOXpz4SVcnTL+F3uuuHHUzSzzrbAkfzVIwriA4NGrQLOLfayQe/2SLY/
         tRB2xumnRIdnovQlaIuy1BngdT+nfikWFlPJvalzcpnL2in1+DpXcm1NXbCs7LsvKgUE
         lhUtmVQUmY4vW7pE5jd4IMPAifOFsWz08s1APH9F5E5BryqP9mAs0uCdPRxAx6GJjkVa
         Fzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716473724; x=1717078524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37ZIn9gzJCOF8XgwK/gqDCauzQulN85MvsU6mjoXm4w=;
        b=pFswZ59GbP6SdjfCiz+r5AeqkGGh9EfmntpciwaH1HaUIJ28jK3G4rT13TgHHjRa53
         WtXGMVXsgEzSuwKgfW8SlbnbPh4AYRU6rt7OkH0EcddYYdl4fzh9UT0J9961MQwE19Id
         HcQRCGYOTqu8OegVexK66e6zXHG0lDIM99H12UcOMGCyxqrLQi/EbEMGLfeVXr11w0if
         9jIzy8iBGG2+70nKCX5I34IhybQlRudaZtS2zSxr/1PXqXJSKYKODYg3l7GrJq6w26PT
         uJot7xuETLroz4raj5VpW/pxJKOhqsAzwgjII5cT9nAyxD02gu4pYabRv/G2kFOxHuHA
         RrXA==
X-Gm-Message-State: AOJu0Yx0tTdtGeCjcqBe3fBEg/HWtwlfcYFLLw8SYrDsTSAMYvcP+6xF
	z53M4LvaQxQ2WmD5cZbe2fXditnOb/oH2g899ChXCLyF6waxCV5Zv5G23uxoqSqs0u66LZnK+D7
	3BkR57MICSBAq+OHzoZd3MbPjI5f4lRJ40au9Ebo34SMS81ZX
X-Google-Smtp-Source: AGHT+IFDR1DtYqRG/GMc3Rp3GcACOnfm0jonDkisRauF+72QfRox4awn+PkOXTa2JXtzMOMkzXzEJQv+DTQQ0B2O24s=
X-Received: by 2002:a17:90a:af88:b0:2bd:92c3:6b93 with SMTP id
 98e67ed59e1d1-2bd9f49bda2mr5832479a91.34.1716473724039; Thu, 23 May 2024
 07:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240523135628.3076018-1-michael.opdenacker@bootlin.com> <20240523135628.3076018-2-michael.opdenacker@bootlin.com>
In-Reply-To: <20240523135628.3076018-2-michael.opdenacker@bootlin.com>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 23 May 2024 15:15:12 +0100
Message-ID: <CALqELGzk_0CS4LU_TEwzg1=vrNZcdnNNGOTEZH2T7hhLYM-NWQ@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] ref-manual: introduce UNPACKDIR variable
To: michael.opdenacker@bootlin.com
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 May 2024 14:15:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5247

Hi Michael,

On Thu, 23 May 2024 at 14:56, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Note that this doesn't touch the "Source Fetching" section
> in overview-manual/concepts.rst yet, as the unpack implementation
> may not be finalized yet.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/tasks.rst     | 8 ++++----
>  documentation/ref-manual/variables.rst | 5 +++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
> index 2e4b23408d..70c0dea3bb 100644
> --- a/documentation/ref-manual/tasks.rst
> +++ b/documentation/ref-manual/tasks.rst
> @@ -412,12 +412,12 @@ them. You can learn more by looking at the
>  -------------
>
>  Unpacks the source code into a working directory pointed to by
> -``${``\ :term:`WORKDIR`\ ``}``. The :term:`S`
> -variable also plays a role in where unpacked source files ultimately
> -reside. For more information on how source files are unpacked, see the
> +``${``\ :term:`UNPACKDIR`\ ``}``. Another, legacy way to specify
> +this directory is through the :term:`S` and :term:`WORKDIR` variables.

I find this sentence a little confusing to read.

"Another, legacy" suggests you've already given a method that was
legacy. But here you're really saying "Another way, which is legacy".
Perhaps this could be phrased differently, e.g. "A legacy way to
specify this directory is through..."

Also it doesn't really tell you how to use S and WORKDIR. I wonder if
you need to mention these at all, given they'll be described elsewhere
in the document. Why point a user to something legacy?

Thanks,

Andrew Murray

