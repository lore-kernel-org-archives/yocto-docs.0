Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39828D44D70
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:54:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.46221.1730901288854679499
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 05:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xycrqm2y;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso5620477f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730901287; x=1731506087; darn=lists.yoctoproject.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJQTXgB/7yiTmaXcRgoBvIaZpfbl55tI1oRRaCdmGfI=;
        b=xycrqm2y3iabD97CgZH+h3IBGnYBZnWn4Ph/xIgRW1HNRICB+HstI6ypXPnxnrHASd
         fY+Xk10uwRxAmBLiV/HN6BUJsk9KtY6mOoTp0jXBYfwG7xjPgdKUIDxjLI7tIbDGohUd
         tlglsMZ/HBFAyQG2lw1cvppcr/fDIa8oxjicQLR2p6LGirJsljEKLxqPV1lPAqhleNqf
         0ZQr2H8Sde4t6yurWGxw96hRnL9a9Ejcs3uolI+aBzxuziDr0lADib+4WhrPmj+ToHjy
         9Si1OWlTK/vyWIjW/mEwf5REBWWSdE28qn3VmYDFuDhhW0gBKmjdohtHowsnKOHWkdgF
         oqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901287; x=1731506087;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJQTXgB/7yiTmaXcRgoBvIaZpfbl55tI1oRRaCdmGfI=;
        b=jWLnKoxVlEjASp8aLdaBAwnRlMqVy/8vsSbFgdk4zCKL/tEGrkz9EE2AORnKc3zwC8
         11sGmT4tH+DAGx+USKRIIHLjvYd5jXK+gewEHwlASIuKDqXGUCbLo8XPacSuv9ipXotr
         XkpU8kdLboylDobAH6E/dh7Bjxj/AE1EJyoSEpsNhgho/ALjh3+5UizsamR4ABA1Jt4d
         M2Fn04dkcv6hu31pPwoIrZM8S+jhhiiWAt9H6xSN4ZM5YR9eLsL/q2Puaa611NooUvG7
         mMYTT3Y54wgIsXfWihjoMatU7jOld97RDTSnuL85krXrX2YGogTcazI8SVeNaFPpZuxT
         Sz2A==
X-Gm-Message-State: AOJu0Yx5b1MZPs0FIikSIGaZX7Fsd8Rg7sxbc1F4YoU9v46dPAjTPsti
	hJ9TOLkKst5GvEqWTaQrKBH1rqVZv1lMRuwaAYmr8aV05Bwjq5U0SmN0MPoAdneZZ5e0PdRAGv/
	ECXY=
X-Google-Smtp-Source: AGHT+IGSxFknPwfHV6SP6OtdAeE503nWzWfuS1VHP8bjcIUb+O58BSVmtNE1mT1aW/yoLMAapolc0A==
X-Received: by 2002:a05:6000:1a8a:b0:37d:5296:4b37 with SMTP id ffacd0b85a97d-381c7a5e746mr20613997f8f.24.1730901287061;
        Wed, 06 Nov 2024 05:54:47 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm19402750f8f.70.2024.11.06.05.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:54:46 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 0/3] Add bblock documentation
Date: Wed, 06 Nov 2024 14:54:44 +0100
Message-Id: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACR1K2cC/43NQW7CMBCF4asgr3FljychZtV7VCxsz7hYQFw5a
 QRCuXsNGxBCUZf/SO+bqxi4JB7EdnUVhac0pNzXaNYrEfau/2aZqLYABaiV0dIRSe+PORwk5fB
 74n50Yx1JdE3sQrShJRB1/lM4pvOd/trV3qdhzOVy/zTp2/Uf6KSlkgZ8Z5U13pP79O5yTL7wR
 8gncXMneFha4YIF1VIbhYzUWAv2jWWerWbBMtXy3UYRk7EO6I2Fz1a7YGG1bASkyK0FNC/WPM9
 /h6citKcBAAA=
X-Change-ID: 20241031-add-bblock-documentation-4a5f8cf9c6d2
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 13:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5698

Hello,

The main purpose of this series is to add documentation for bblock.

bblock uses internally the 3 following variables: SIGGEN_LOCKEDSIGS,
SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and SIGGEN_LOCKEDSIGS_TYPE which are not
documentated, so adding them to the glossary.

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
 29:49  suggestion  Consider wrapping this Pascal or Camel case term ('TipsAndTricks') in backticks.    RedHat.PascalCamelCase
 39:60  suggestion  Use simple language. Consider using 'many' rather than 'multiple'.                  RedHat.SimpleWords
 39:60  warning     'multiple' is too wordy.                                                            write-good.TooWordy
 57:62  warning     'multiple' is too wordy.                                                            write-good.TooWordy
 76:43  error       Use 'BitBake' instead of 'bitbake'.                                                 Vale.Terms
 76:58  error       Use 'OpenEmbedded' instead of 'openembedded'.                                       Vale.Terms
 76:71  warning     Use either 'or' or 'and' in 'core/tree'                                             RedHat.Slash
 76:81  warning     Use either 'or' or 'and' in 'meta/conf'                                             RedHat.Slash
 76:91  error       Use 'BitBake' instead of 'bitbake'.                                                 Vale.Terms

About the Readability, I am not sure I can do better ^^ But anyone with
better english skills than me can help here!

About the capitalization: I decided to ignore it to keep consistency with
all other headings of the reference manual.

Suggestion and errors/warnings on lines 29 and 76 are false positive, we may need
to add some rule to ignore these check on :oe_git: directives
Also ignore the warning about 'multiple' as 'many' does not fit well in
this case.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Changes in v5:
- add missing "tmp" in stamps file path in SIGGEN_LOCKEDSIGS
  documentation
- reword a sentence in SIGGEN_LOCKEDSIGS  documentation
- Link to v4: https://lore.kernel.org/r/20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com

Changes in v4:
- use "the sstate cache" everywhere for consistency
- fix some typo
- add comment to explain that bblock.conf does not exist by default
- Link to v3: https://lore.kernel.org/r/20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com

Changes in v3:
- Fix missing typos reported by Ulrich Olmann in v1
- Link to v2: https://lore.kernel.org/r/20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com

Changes in v2:
- Fixed various typos reported by Ulrich Ölmann and Antonin Godard
- Splited the series in two: the Readme/Makefile changes related to Vale
  and SPHINXLINT and bblock documentation
- Added a bblock.conf file in `documentation/ref-manual/structure.rst`
- Link to v1: https://lore.kernel.org/r/20241031-add-bblock-documentation-v1-0-32b89093bbda@baylibre.com

---
Julien Stephan (3):
      styles: vocabularies: Yocto: add sstate
      ref-manual: variables: add SIGGEN_LOCKEDSIGS* variables
      dev-manual: add bblock documentation

 documentation/dev-manual/bblock.rst                | 129 +++++++++++++++++++++
 documentation/dev-manual/index.rst                 |   1 +
 documentation/ref-manual/structure.rst             |   9 ++
 documentation/ref-manual/variables.rst             |  47 ++++++++
 .../styles/config/vocabularies/Yocto/accept.txt    |   1 +
 5 files changed, 187 insertions(+)
---
base-commit: 7b40c7b73a360a1ec383c4c9f00c3e126208320b
change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


