Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.4169.1607031535527805460
 for <docs@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 13:38:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EvQZOtyj;
 spf=pass (domain: linaro.org, ip: 209.85.128.53, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wm1-f53.google.com with SMTP id x22so3957621wmc.5
        for <docs@lists.yoctoproject.org>; Thu, 03 Dec 2020 13:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=punbcnoJ3DxenZHw7M80a9uUf04cABQg2ntLg8PEkfQ=;
        b=EvQZOtyjbwj6D97EPssWCVGVsKP3J9WfX65S+DDCKQoUt0Ap4QIVKq4jLvNa1kPURC
         wY2owMffy5Xt/HnmrjH92ZQw57PZp8IDFOAyg2tXzmxe03gE9aj1fi9HRhz1gN0riAWG
         jQBw55gSQr3yJdR2/sknW7Y3kEMDRpsWwNym9uceM9UroSqUDB+VQzRTuGvkKP/f7w7b
         DZ65n8kdN9+Njs0wJ/XXbwtbak0tgpNEjszBq1IABJePvPfFWfqXuRwPyVRUOLT0YHa+
         0rGgRxOD2xod8zHuhsGOhJofkmk8aHCGUbyuiBzsI/qZcGGDKfhyUCu6HHdbrrmTXb5l
         ijug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=punbcnoJ3DxenZHw7M80a9uUf04cABQg2ntLg8PEkfQ=;
        b=AAkg42EkNKM5FKlvNM9iltzmAN46Eb6C3pW4SQKqX0DyGB6eTzn5TH017JbWiGAkWA
         8Py+F5BaVkzXBroaNJxKxgxfhbPA3fLh5nqGveNuUysk4c5YFlZUv5cAieY/KpnA7ESR
         rEKi3ClvWjzOcyIDHnZiVPDrBFhYzGpLSVbmnjB/iMslFUEOLDTRzmGGscKYvAJh69LA
         wtyGP4o/zFX5mPTnHJypIvatarab7jwaXBH6pqN90B6CnwLFSLQ9JZSqo3Fyg9SB6dDh
         sc2Ux6T1JhPGcwAVfItxkN42MWoLTQn8VrBAknX/Ph2ytxxYXjz9yN+U+8UZH1Qaqm6a
         xeoQ==
X-Gm-Message-State: AOAM530rr8378KXzwM1yxM5Vt8NfPXz04F5p5VrYNaAk0vM0mo3uSqBu
	2pI2JxiAR2l3a3RsbEpVoA8v47x76bPiljgg
X-Google-Smtp-Source: ABdhPJySrIR6TPPFqt9SKOwPsqbAWlXs6YKSerhmweHU2snUB6ER8AMJJl+rSaaRZvQjn95ch1Nf8g==
X-Received: by 2002:a1c:3c4:: with SMTP id 187mr765714wmd.143.1607031533533;
        Thu, 03 Dec 2020 13:38:53 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id y7sm886214wrp.3.2020.12.03.13.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:38:52 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 00/10] Simplify file names
Date: Thu,  3 Dec 2020 22:38:33 +0100
Message-Id: <20201203213843.347671-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this series, I am proposing to simplify the filenames we use across
the whole documentation project. It wasn't so much of an issue up
until now, but with Sphinx we end using using filenames quite a bit,
in :doc: and :ref: references, so I am proposing simpler filenames.

The first patch is just about renaming each manual entry page
index.rst, to be consistent with most Sphinx uses I've seen.

In the second patch, I implemented something which was suggested on
the list by Robert. I had used relative links such as :doc:`../xxx`
when I made the initial conversion and I didn't realize I could have
use absolute paths instead. So I am doing that now.

Then it's one patch for each manual, where I rename all files to
shorten them. All files were <xxx-manual>/<xxx-manual-file.rst>, I
convert them all to <xxx-manual/file.rst>. That should make our
fingers and keyboards happier. In each patch the files are renamed,
and all references are fixed up throughout the doc tree.

The whole series is tested with:

$ git rebase -i origin/master --exec "make -C documentation clean html"

And I found no obvious error.

Nicolas Dechesne (10):
  sphinx: rename top level document in each manual
  sphinx: use absolute paths for :doc: references
  test-manual: remove 'test-manual' from filenames
  toaster-manual: remove 'toaster-manual' from filenames
  dev-manual: remove 'dev-manual' from filenames
  kernel-dev: remove 'kernel-dev' from filenames
  profile-manual: remove 'profile-manual' from filenames
  overview-manual: remove 'overview-manual' from filenames
  sdk-manual: remove 'sdk' from filenames
  ref-manual: remove 'ref' from filenames

 .../{brief-yoctoprojectqs.rst => index.rst}   |  28 +--
 documentation/bsp-guide/bsp.rst               |  56 ++---
 .../bsp-guide/{bsp-guide.rst => index.rst}    |   0
 ...nual-common-tasks.rst => common-tasks.rst} | 136 ++++++------
 .../dev-manual/{dev-manual.rst => index.rst}  |   8 +-
 .../{dev-manual-intro.rst => intro.rst}       |   6 +-
 .../{dev-manual-qemu.rst => qemu.rst}         |   4 +-
 .../{dev-manual-start.rst => start.rst}       |  56 ++---
 documentation/index.rst                       |  20 +-
 .../{kernel-dev-advanced.rst => advanced.rst} |  24 +--
 .../{kernel-dev-common.rst => common.rst}     |  82 +++----
 ...ev-concepts-appx.rst => concepts-appx.rst} |  20 +-
 .../{kernel-dev-faq.rst => faq.rst}           |  10 +-
 .../kernel-dev/{kernel-dev.rst => index.rst}  |  12 +-
 .../{kernel-dev-intro.rst => intro.rst}       |  26 +--
 ...rnel-dev-maint-appx.rst => maint-appx.rst} |   2 +-
 ...rview-manual-concepts.rst => concepts.rst} |  46 ++--
 ...onment.rst => development-environment.rst} |  34 +--
 .../{overview-manual.rst => index.rst}        |   8 +-
 .../{overview-manual-intro.rst => intro.rst}  |  12 +-
 ...rview-manual-yp-intro.rst => yp-intro.rst} |  42 ++--
 .../{profile-manual-arch.rst => arch.rst}     |   0
 ...ofile-manual-examples.rst => examples.rst} |   0
 .../{profile-manual.rst => index.rst}         |   8 +-
 .../{profile-manual-intro.rst => intro.rst}   |   0
 .../{profile-manual-usage.rst => usage.rst}   |  18 +-
 .../{ref-classes.rst => classes.rst}          |  56 ++---
 ...ol-reference.rst => devtool-reference.rst} |  14 +-
 documentation/ref-manual/faq.rst              |  12 +-
 .../{ref-features.rst => features.rst}        |  12 +-
 .../ref-manual/{ref-images.rst => images.rst} |   4 +-
 .../ref-manual/{ref-manual.rst => index.rst}  |  26 +--
 .../{ref-kickstart.rst => kickstart.rst}      |   2 +-
 documentation/ref-manual/migration-1.4.rst    |   2 +-
 documentation/ref-manual/migration-1.5.rst    |   6 +-
 documentation/ref-manual/migration-1.6.rst    |   8 +-
 documentation/ref-manual/migration-1.7.rst    |   8 +-
 documentation/ref-manual/migration-2.1.rst    |  14 +-
 documentation/ref-manual/migration-2.3.rst    |   6 +-
 documentation/ref-manual/migration-2.5.rst    |   2 +-
 documentation/ref-manual/migration-2.6.rst    |   2 +-
 .../{ref-qa-checks.rst => qa-checks.rst}      |   0
 ...elease-process.rst => release-process.rst} |  10 +-
 documentation/ref-manual/resources.rst        |  22 +-
 .../{ref-structure.rst => structure.rst}      |  26 +--
 ...quirements.rst => system-requirements.rst} |  10 +-
 .../ref-manual/{ref-tasks.rst => tasks.rst}   |  56 ++---
 .../ref-manual/{ref-terms.rst => terms.rst}   |  30 ++-
 .../{ref-variables.rst => variables.rst}      | 202 +++++++++---------
 .../{ref-varlocality.rst => varlocality.rst}  |   0
 ....rst => appendix-customizing-standard.rst} |   0
 ...stomizing.rst => appendix-customizing.rst} |   2 +-
 ...ppendix-obtain.rst => appendix-obtain.rst} |  10 +-
 .../{sdk-extensible.rst => extensible.rst}    |   2 +-
 .../sdk-manual/{sdk-manual.rst => index.rst}  |  14 +-
 .../sdk-manual/{sdk-intro.rst => intro.rst}   |   2 +-
 .../sdk-manual/{sdk-using.rst => using.rst}   |   0
 ...king-projects.rst => working-projects.rst} |   2 +-
 .../{test-manual.rst => index.rst}            |   6 +-
 .../{test-manual-intro.rst => intro.rst}      |  10 +-
 ...nual-test-process.rst => test-process.rst} |   0
 ...builder.rst => understand-autobuilder.rst} |  12 +-
 .../{toaster-manual.rst => index.rst}         |   8 +-
 .../{toaster-manual-intro.rst => intro.rst}   |   2 +-
 ...ter-manual-reference.rst => reference.rst} |  12 +-
 ...al-setup-and-use.rst => setup-and-use.rst} |  10 +-
 .../{toaster-manual-start.rst => start.rst}   |   2 +-
 .../transitioning-to-a-custom-environment.rst |  12 +-
 documentation/what-i-wish-id-known.rst        |  24 +--
 69 files changed, 657 insertions(+), 661 deletions(-)
 rename documentation/brief-yoctoprojectqs/{brief-yoctoprojectqs.rst => index.rst} (93%)
 rename documentation/bsp-guide/{bsp-guide.rst => index.rst} (100%)
 rename documentation/dev-manual/{dev-manual-common-tasks.rst => common-tasks.rst} (98%)
 rename documentation/dev-manual/{dev-manual.rst => index.rst} (75%)
 rename documentation/dev-manual/{dev-manual-intro.rst => intro.rst} (93%)
 rename documentation/dev-manual/{dev-manual-qemu.rst => qemu.rst} (99%)
 rename documentation/dev-manual/{dev-manual-start.rst => start.rst} (93%)
 rename documentation/kernel-dev/{kernel-dev-advanced.rst => advanced.rst} (97%)
 rename documentation/kernel-dev/{kernel-dev-common.rst => common.rst} (95%)
 rename documentation/kernel-dev/{kernel-dev-concepts-appx.rst => concepts-appx.rst} (95%)
 rename documentation/kernel-dev/{kernel-dev-faq.rst => faq.rst} (85%)
 rename documentation/kernel-dev/{kernel-dev.rst => index.rst} (68%)
 rename documentation/kernel-dev/{kernel-dev-intro.rst => intro.rst} (87%)
 rename documentation/kernel-dev/{kernel-dev-maint-appx.rst => maint-appx.rst} (99%)
 rename documentation/overview-manual/{overview-manual-concepts.rst => concepts.rst} (97%)
 rename documentation/overview-manual/{overview-manual-development-environment.rst => development-environment.rst} (95%)
 rename documentation/overview-manual/{overview-manual.rst => index.rst} (69%)
 rename documentation/overview-manual/{overview-manual-intro.rst => intro.rst} (88%)
 rename documentation/overview-manual/{overview-manual-yp-intro.rst => yp-intro.rst} (96%)
 rename documentation/profile-manual/{profile-manual-arch.rst => arch.rst} (100%)
 rename documentation/profile-manual/{profile-manual-examples.rst => examples.rst} (100%)
 rename documentation/profile-manual/{profile-manual.rst => index.rst} (74%)
 rename documentation/profile-manual/{profile-manual-intro.rst => intro.rst} (100%)
 rename documentation/profile-manual/{profile-manual-usage.rst => usage.rst} (99%)
 rename documentation/ref-manual/{ref-classes.rst => classes.rst} (97%)
 rename documentation/ref-manual/{ref-devtool-reference.rst => devtool-reference.rst} (97%)
 rename documentation/ref-manual/{ref-features.rst => features.rst} (96%)
 rename documentation/ref-manual/{ref-images.rst => images.rst} (97%)
 rename documentation/ref-manual/{ref-manual.rst => index.rst} (54%)
 rename documentation/ref-manual/{ref-kickstart.rst => kickstart.rst} (98%)
 rename documentation/ref-manual/{ref-qa-checks.rst => qa-checks.rst} (100%)
 rename documentation/ref-manual/{ref-release-process.rst => release-process.rst} (94%)
 rename documentation/ref-manual/{ref-structure.rst => structure.rst} (96%)
 rename documentation/ref-manual/{ref-system-requirements.rst => system-requirements.rst} (96%)
 rename documentation/ref-manual/{ref-tasks.rst => tasks.rst} (91%)
 rename documentation/ref-manual/{ref-terms.rst => terms.rst} (93%)
 rename documentation/ref-manual/{ref-variables.rst => variables.rst} (97%)
 rename documentation/ref-manual/{ref-varlocality.rst => varlocality.rst} (100%)
 rename documentation/sdk-manual/{sdk-appendix-customizing-standard.rst => appendix-customizing-standard.rst} (100%)
 rename documentation/sdk-manual/{sdk-appendix-customizing.rst => appendix-customizing.rst} (99%)
 rename documentation/sdk-manual/{sdk-appendix-obtain.rst => appendix-obtain.rst} (96%)
 rename documentation/sdk-manual/{sdk-extensible.rst => extensible.rst} (99%)
 rename documentation/sdk-manual/{sdk-manual.rst => index.rst} (72%)
 rename documentation/sdk-manual/{sdk-intro.rst => intro.rst} (99%)
 rename documentation/sdk-manual/{sdk-using.rst => using.rst} (100%)
 rename documentation/sdk-manual/{sdk-working-projects.rst => working-projects.rst} (99%)
 rename documentation/test-manual/{test-manual.rst => index.rst} (75%)
 rename documentation/test-manual/{test-manual-intro.rst => intro.rst} (97%)
 rename documentation/test-manual/{test-manual-test-process.rst => test-process.rst} (100%)
 rename documentation/test-manual/{test-manual-understand-autobuilder.rst => understand-autobuilder.rst} (95%)
 rename documentation/toaster-manual/{toaster-manual.rst => index.rst} (66%)
 rename documentation/toaster-manual/{toaster-manual-intro.rst => intro.rst} (97%)
 rename documentation/toaster-manual/{toaster-manual-reference.rst => reference.rst} (97%)
 rename documentation/toaster-manual/{toaster-manual-setup-and-use.rst => setup-and-use.rst} (98%)
 rename documentation/toaster-manual/{toaster-manual-start.rst => start.rst} (95%)

-- 
2.29.2

