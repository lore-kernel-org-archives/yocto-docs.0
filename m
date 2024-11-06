Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B855D3E798
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 09:02:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.41556.1730883773952247757
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 01:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hq3RdwOR;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d447de11dso4929468f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 01:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730883772; x=1731488572; darn=lists.yoctoproject.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pAc8GBitDkFCFL0G55VsG02qvWV5JoMzNqMnEPiwtYI=;
        b=hq3RdwORJypEDeMmn3cGTpd6JUF081OrgHM3CGQO7TE93m92g52jEOxVrkvi5pkxHS
         KCwXZo71RW14K1bkDLYtX6pzZK17y6M045pxyUl5KWqdtjIfNgtARph2S5uH3ECExyok
         cOx0OJsaaOqDNxAjEvuDzV9zrvRwkXCXfEQO/7CReKUuE9hzoj6TzwWi6laYsne8VZul
         DB+c9hkK7PJXs5hh7lfTBdBijc9YHEGduaxqpb2naRxhyU4SUfBXScV6tfLckTUb58xv
         xrhbXjs8o9u9CVvkdlOHimGNYmJMtP8I7WG5+OB3VPbuGnUsj+fF3sgaGLis7Iab+keO
         5NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883772; x=1731488572;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAc8GBitDkFCFL0G55VsG02qvWV5JoMzNqMnEPiwtYI=;
        b=Ujdr9turIiB7Xh8o3RD4QcV1my01rxSg5ESP/8Y2F4Q34CZIsVdz5vaPO+RjIB7bet
         Zm21r0LyhDWFU/HhbZwPGVg334GlnmmsGFcCmEBgdXDoeka6u54+G2vkis2hCJsJoVtF
         fMZFEJ0RzeSGGeoBjHnFO4S9wpY6RTE/NAMaOJ4qdwKr7FfvlWsPSY2MZ6dLlCpnEhX3
         NyxqzIA5iTRAQg0Dy5Mzbx8AfXB2UHPeZ4FkVaW11X+Ld+07HT5EfH8NLb+wIep6mqYU
         nKZRlnG6dCTItqHVj+esK+pUZSxs7ncclhY1OsjPjEq0S6bF59tFY/m8LDxv/iUSBgFV
         SjDw==
X-Gm-Message-State: AOJu0YxgzUgONFpzv1ESIxe/YG8sdHeLA+8iHiJAuyN1sVLeRQbBUhk2
	6cqin6LHU6VWMXXcy+Gah2V61NIngTct+aqtNkPzLFyBTXqrkgXnbFkUZbF/Fps=
X-Google-Smtp-Source: AGHT+IEGA655EtEX/d2dC0tb2tPNRCQUUg3uTv2KMXdbNn4HWbyGoJd9HnwutSA/ZCD/1IjPkKGcsQ==
X-Received: by 2002:a5d:6c68:0:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-381bea1bfc4mr19102333f8f.45.1730883771841;
        Wed, 06 Nov 2024 01:02:51 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e694sm18671637f8f.86.2024.11.06.01.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:02:51 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 0/3] Add bblock documentation
Date: Wed, 06 Nov 2024 10:02:39 +0100
Message-Id: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK8wK2cC/43NTQrCMBCG4auUrI1MfqqNK+8hLpLM1AbbRtJaF
 OndjW4UEXH5DnzP3NhAKdDANsWNJZrCEGKfQy8K5hvbH4gHzM0kSC1ACW4RuXNt9EeO0Z876kc
 75hHXtqwrXxu/Qsny/JSoDpcnvdvnbsIwxnR9fprE4/oHOgkOXElXGTDKObRbZ69tcImWPnbs4
 U7yZQnQPyyZLViDJo2lMdJ8sdS7Vf6wVLZctQYkVMZK/LDmeb4Dz3qHQFsBAAA=
X-Change-ID: 20241031-add-bblock-documentation-4a5f8cf9c6d2
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 09:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5691

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


