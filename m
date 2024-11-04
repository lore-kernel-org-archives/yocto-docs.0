Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B798AD111A1
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:55:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.60974.1730735704141859067
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=en9Fe6lf;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so38127185e9.3
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735702; x=1731340502; darn=lists.yoctoproject.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgcT+9nWW6bh92lFn1I1vi8LDQbFZZdL25tgXLFYJ6Q=;
        b=en9Fe6lf8kfiYX8x7+P3fwqwzVH9OrRsXrVpYKHsGn3HMoF+6s2gZ7bflx16jU3AZc
         HUfH5uTwjdTPGCU2MnFWqi2MwxsmWMgeV3NWNwCjQScCdpCYbyJTOFRpbDGyCqBie5jX
         SRV/y6s8x84BS1Iv+wGBtcDR3eCVbj+tCe9dNud1aqoiyMOJ4xwibmvRglktEWf42oE8
         BUNJjH4akYu6aO6UJcod0awguM4D4EcrPOtuVjfA+2XsMU+PwGUnstZ+MQMqaaBtGuuD
         MghdsRv69nmWjLfsiA6uuRiWv1yJk/c4ooBCKUHzSzctRd6JMR/djnX5u4lfPP/49e7t
         fb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735702; x=1731340502;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgcT+9nWW6bh92lFn1I1vi8LDQbFZZdL25tgXLFYJ6Q=;
        b=O4/5f8l5Oy1nn1LRRB8Jqj+WZORBkD4cT8WDdEunP4Zi6BuU2RjKT/5R3ah9hKs5uR
         HXiB3+GQ47nxmIK3cwLYBGmNzkP38wSb1XtQOULfIngoKmFIv0HmFw/ERIqk9D1RQFwO
         trn2ZoN+YVcVCTcH6aTqGki+VJnz9MIqsJKcwTzIfqVmi+m9VrAVePgUXCpVY3f+cc+Q
         UBePcjwDfdhOZ45D5cWamXum96OnfOm7HWTQyyqvbcI23VbRfnNVH3mlxRLGb8awAegw
         A5IhDqWqJg1NGIRqRv9ntRM4oEQ4yuI9SfHl3TwaOmZdyXOR84CRYodFx10xMBW7In1l
         i5QQ==
X-Gm-Message-State: AOJu0Yxt9hCgXo/t9MVCzivSYyohOqyZ4C8Cg8PG9PjCRqjGLBLAu/FE
	nRSugJaiojJBacT675KF9gHKRM333gjmwPkHeDdlZDDXG8c0c279xeJWOOsYKMM=
X-Google-Smtp-Source: AGHT+IEJ6KI/n89d9Q3G3B2PfnW5NAIEounkB3oBmEE7WpUFz/6jnCwVWKNQzhauIChg5RPsmtSwfg==
X-Received: by 2002:adf:e644:0:b0:374:cd3e:7d98 with SMTP id ffacd0b85a97d-38061127a00mr22636687f8f.19.1730735702303;
        Mon, 04 Nov 2024 07:55:02 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm13472315f8f.100.2024.11.04.07.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:55:01 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 0/3] Add bblock documentation
Date: Mon, 04 Nov 2024 16:54:58 +0100
Message-Id: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFLuKGcC/42NQQ6CMBBFr0Jm7Zi2oAFX3sOw6LSDTERqWiQSw
 t2tnMDl+8l7f4XEUTjBpVgh8ixJwpjBHApwvR3vjOIzg1Gm0qrUaL1HoiG4B/rg3k8eJztlCSt
 76mrXNe7sDWT9FbmTz56+tZl7SVOIy/4069/6R3TWqLA0VDeqKYm8vZJdBqHIRxee0G7b9gXvg
 2h3wwAAAA==
X-Change-ID: 20241031-add-bblock-documentation-4a5f8cf9c6d2
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5663

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


