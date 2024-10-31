Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0773AD767E8
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:56:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.17354.1730393791587271816
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=PSkW8Uks;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d495d217bso988403f8f.0
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393790; x=1730998590; darn=lists.yoctoproject.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+TBo7Jr5NMJATwRpFuTboFlCDEX0eQS8td2yQLJjCM=;
        b=PSkW8UksQKgk57Cx+SEpDAnIF88ZUnsxTAx9mHGPjEDehMeAXle5FEO2iGCFcpYJLp
         TngDlY6PCCQ9RUcFX2XwbwOKHgZ/I2z5K3h0/8oW6mlo2ZdaGdOEIpQED1mC8VmAUutL
         HaJe+Y54JiNwU7txCaudgY0WjSOeiff4PIzdbm0usJ7+D4Rd41bU5EjYu/lBYfkvIQ//
         f7gRFqcMuIvhnZRQdF5Pq75mfKkifD2MhEXqoXFAuors85FXwm8WN5dDj7T7SspdwMIG
         E/d6xvVLJ7lmWcY04YGpZ1ZEkCViYLyhKFkDqSalCRZLJzcFUox2KGV9yU7frhLXUt9j
         M7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393790; x=1730998590;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+TBo7Jr5NMJATwRpFuTboFlCDEX0eQS8td2yQLJjCM=;
        b=wm5r9OcL+o7ZUBCoTxU/xJTcX6H22tvOIIVKkew/3AcxK6jh9u/PAUSR3I2vLjW7vo
         1Wja/kheDNAMvun7KAYg7rEkkUoUw5niuTDI/II2jGIGVD0iJmBl/huzirm0/b3s42bp
         ZfIoM1R48v9wQSK+sH0nxuDPa31y7adCQHejw/VWcTAahVIIiTn/oPBWyfCbxJFd0E7V
         1V9x4e++FQrS/RJM9HljlV93LhK1RsLUSmUES2yX0cLftQY3ZcCl9QKsxEVLe31wKXKx
         bU/TIwrL2eYsW/Mer26VtBLIEGkY8oNNfNRpqpTuV18gcXZHRexhdNji9MF3EponGDz/
         XSyg==
X-Gm-Message-State: AOJu0Yx7zAU6s9LGBzRwyFrRcJfBNx9VJAWTiF4vYeiA8eTJ8O+9DVBx
	wI0rFOULYIF3blZPbsxZ9twjUUQKRRn/C201xKTZq0IVdGGqdfdtXzlDzGulPvmtwSaLU6vnbfG
	niyU=
X-Google-Smtp-Source: AGHT+IGKKDob4B9zAi9ScgB1ORUslt+eCBGsMnT2Ck2ZNgTTSJf7YL3VvLOUSoiXopROcz6sKU2JYg==
X-Received: by 2002:a05:6000:178c:b0:37c:c832:cf95 with SMTP id ffacd0b85a97d-381c7ae0874mr643576f8f.50.1730393790022;
        Thu, 31 Oct 2024 09:56:30 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e747csm2660525f8f.64.2024.10.31.09.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:56:29 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 0/5] Add bblock documentation
Date: Thu, 31 Oct 2024 17:56:15 +0100
Message-Id: <20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK+2I2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA2ND3cSUFN2kpJz85GzdlPzk0tzUvJLEEqAmXZNE0zSL5DTLZLMUIyW
 g9oKi1LTMCrDR0bG1tQDpZs/yagAAAA==
X-Change-ID: 20241031-add-bblock-documentation-4a5f8cf9c6d2
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:56:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5636

Hello,

The main purpose of this series is to add documentation for bblock.

bblock uses internally the 3 following variables: SIGGEN_LOCKEDSIGS,
SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and SIGGEN_LOCKEDSIGS_TYPE which are not
documentated, so adding them to the glossary.

This series also adds SPHINXLINTDOCS variable in documentation/Makefile to
help cheking subset of the documentation.

documentation/README is also updated to show how to use SHPHINXLINTDOCS and
VALEDOCS to help user sylecheck and lintcheck their own documentation file.

I also added "sstate" into the Yocto vocabulary to avoir error when running
Vale.

This series was built and checked with:

  $ make html
  $ make stylecheck VALEDOCS=dev-manual/bblock.rst
  $ make sphinx-lint SPHINXLINTDOCS=dev-manual/bblock.rst

I tried my best to make Vale happy, but I still have the following
warnings:

 dev-manual/bblock.rst
 1:1  warning     Try to keep the Coleman–Liau Index grade (10.29) below 9.                           Readability.ColemanLiau
 1:1  warning     Try to keep the Flesch reading ease score (57.51) above 70.                         Readability.FleschReadingEase
 1:1  warning     Try to keep the Flesch–Kincaid grade level (8.28) below 8.                          Readability.FleschKincaid
 1:1  warning     Try to keep the SMOG grade (11.42) below 10.                                        Readability.SMOG
 1:1  warning     Try to keep the LIX score (38.20) below 35.                                         Readability.LIX
 3:1  suggestion  Use sentence-style capitalization in 'Locking and Unlocking Recipes Using ******'.  RedHat.Headings

About the Readability, I am not sure I can do better ^^ But anyone with
better english skills than me can help here!

About the capitalization: I decided to ignore it to keep consistency with
all other headings of the reference manual.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (5):
      README: add instruction to run Vale on a subset
      documentation: Makefile: add SPHINXLINTDOCS to specify subset to sphinx-lint
      styles: vocabularies: Yocto: add sstate
      ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
      dev-manual: add bblock documentation

 documentation/Makefile                             |  23 ++--
 documentation/README                               |  16 ++-
 documentation/dev-manual/bblock.rst                | 129 +++++++++++++++++++++
 documentation/dev-manual/index.rst                 |   1 +
 documentation/ref-manual/variables.rst             |  33 ++++++
 .../styles/config/vocabularies/Yocto/accept.txt    |   1 +
 6 files changed, 191 insertions(+), 12 deletions(-)
---
base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


