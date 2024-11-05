Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD87DD1266E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 08:17:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.13194.1730794666539177894
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 00:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rJ7OD14g;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d3ecad390so3875934f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 00:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730794665; x=1731399465; darn=lists.yoctoproject.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhPw2BpHLd4mt8/jci2IN13FuofcRAAAABp7J7yqVgw=;
        b=rJ7OD14g7/vK28Ncrt14FawNouD0o/suMPwRAhbuuh/H28ATFCv5a8Z6Iky5d6slw/
         8d7Gve265aXGMH5WKT0zlZbxD2BSPEqU4u8OamOoienROl/LyQOFgduP9yx+RT0j84FT
         dLlDo2QAEOOGBiNFh94kLOdmqFleMaQnUHgoIcAgwKR/lGxPsTgbBaJs7Bx/xu+PchJ3
         ke7xfX9aG5LB8Hx3xi7X02XOfdQONW8cBYsVH3+qz2xawrM2VZWNAcWHkUNeVP5Yy2TB
         /X0NgOv3JWDq8xh9/bcIGg63VYqwZAsrlz5ipq5Skle91EFyxB5JJ8X9Y4sJbJlqqRWv
         m+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794665; x=1731399465;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhPw2BpHLd4mt8/jci2IN13FuofcRAAAABp7J7yqVgw=;
        b=Fqs/+ZSCmxWe0inN/aBifoS+1tBKTsJedR2+X1GvAeWuUl1iwf3VoVlKA1ObZoSJGO
         hT7tREjkxDlj7m46XHglB2XjYcRsUD6GGX9X8IFaqb6MM2obGH13muYqAjUzL7+wJnrn
         K4IIpypVzutNQmnvi06G4i6H5kdvxOz/EQeL1SHTHqHVRJp/E4TLSajC8i3Epa1/lKFZ
         MUv8V+SAbvXYxwGdo8eC3tNB/BNkfg05sHSffJGHPvxpT3l+HFJ62D3VUU64nmpkx035
         YYiwC51jSW8c7fOvMGTYaIDjTSK2EeTUP9sDGfBEZbTZM1uN7tw2l3ZOnfiDQLEN2b+G
         r3bQ==
X-Gm-Message-State: AOJu0YzdhxJarsshmXzdFNZuadRNjBzMyx800xqR7nky48QfqsojDV1H
	iehTn31AaYxbZ+Eg43HxlTIPYcSphHb7GcQN8G69khKzSvLx2Wie8GyR6R2f8Mg=
X-Google-Smtp-Source: AGHT+IFNHC93xiY8weJaSg0sm2t/jVQ2xiVk0qnMhc71EG8Sz7p+3A8ze/ojfmWYtI48dCYT7qLIUA==
X-Received: by 2002:a5d:64a1:0:b0:37d:34e7:6d24 with SMTP id ffacd0b85a97d-381c79e3cc5mr11838566f8f.18.1730794664524;
        Tue, 05 Nov 2024 00:17:44 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c38sm15318341f8f.24.2024.11.05.00.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:17:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 0/3] Add bblock documentation
Date: Tue, 05 Nov 2024 09:17:34 +0100
Message-Id: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ7UKWcC/43NSw6CMBSF4a2Qjq3pC6WO3Idx0MdFGqE1LTYSw
 t4tTEwcGIf/Tc53Z5QgOkjoVM0oQnbJBV+C7ypkOuVvgJ0tjRhhghJOsbIWa90Hc8c2mOcAflR
 jGWGh6rYxrTQHy1CZPyK07rXRl2vpzqUxxGn7lOl6/QPNFBPMmW4kkVxrq85aTb3TEfYmDGh1M
 /tYlIgfFisWORIBwtZSMvllLcvyBoc4fnwPAQAA
X-Change-ID: 20241031-add-bblock-documentation-4a5f8cf9c6d2
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 08:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5672

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
 documentation/ref-manual/structure.rst             |   8 ++
 documentation/ref-manual/variables.rst             |  47 ++++++++
 .../styles/config/vocabularies/Yocto/accept.txt    |   1 +
 5 files changed, 186 insertions(+)
---
base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
change-id: 20241031-add-bblock-documentation-4a5f8cf9c6d2

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


