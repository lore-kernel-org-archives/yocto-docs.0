Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7184.1605779926641676956
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 01:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IHCzCxHD;
 spf=pass (domain: linaro.org, ip: 209.85.221.50, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f50.google.com with SMTP id l1so5720767wrb.9
        for <docs@lists.yoctoproject.org>; Thu, 19 Nov 2020 01:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3GyxsJOKX8aULCaLfQQmbKoGW+6tHa2vgt4nqmEuPDQ=;
        b=IHCzCxHDNrtiWVVpa4vvd09nDqMzPY431hz6Z3ysOlnHKVaR985rmlXxbSUD2dM9+U
         aeN3RTiy4Ra0zOmRh+GR2YZFArmUYL7qiR0BYpMCu1kDFCfks4aruX0YYnQgara2KG+i
         Fm1kviIWry4VKbyprpSr2Mlg+hArfChIOW69fRFZ4rXo7Jf/HZe18uAmN/pprzZt34UX
         56t5+3g60VPkgTZVgAU6tACYe23IRz2JmPnPPZXsnkVZX62ZNJ0x2Bv0jEzLlJw13rQC
         FwJyUKkw6tWa4BGJetp0eHARLfSpm/CXMP2JG0//AVCA/tytSF9xRMY7DfUfu7SsOSy7
         2JSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3GyxsJOKX8aULCaLfQQmbKoGW+6tHa2vgt4nqmEuPDQ=;
        b=hOwlMaVfECd9jCd7dJyKHmLQakjkrtmi963+HbLyUKkILLQX8zuFA8PFADpIwQZ0Ro
         OXU9stCyweLmT9o/3W/3WcNL/ubePXOa6Z7jAsFc1Rgu3Iy1Pa270Z82hzRvUYXw79lB
         httrXcw1cfFhaMYxICXyEMM7Wk4OcJaPym7iEl9sCQmPlbGPkxigPUZc8mOdpXSVpiMB
         aHR0Zu6sbp3+OB4Pp7Xzgvf5QM/iijwYicsor836wXhPtSqV1d1pvIg31GFNqtDGv2cC
         N9JqlRjUf7OdkKF9yYWS44rkun71QUMNarzCtUEC0FaGblvPjPVyPT2XxRu/taALK8ho
         K5+w==
X-Gm-Message-State: AOAM5315jsy8oqFzZmt6cRrrGzRpW729UYHaqvL28El3pIHIsdGpN16J
	ewsUO0Cf9x97CsrZE9BA8VdQ7UnYXQdAzecO
X-Google-Smtp-Source: ABdhPJz9V+tNSKafiBLfLP56RqBRpO4QT+vM87MG/dVoJBjEKODBHr/BZoVX2YaTWtKxyzLcdyRDyA==
X-Received: by 2002:adf:f441:: with SMTP id f1mr9265156wrp.225.1605779924787;
        Thu, 19 Nov 2020 01:58:44 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id o14sm34725288wrw.4.2020.11.19.01.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:58:44 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 00/11] A first pass at removing labels
Date: Thu, 19 Nov 2020 10:58:23 +0100
Message-Id: <20201119095834.284864-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the initial (automated) migration from Docbook to Sphinx with
pandoc, a custom label was created for each section, since these
labels were used when referencing sections. However with Sphinx, we
have enable autosectionlabel extention which allows us to refer
sections its title. So the vast majority of the labels are not used,
not needed, and use valuable space in our editors ;)

This is a first pass at removing the labels. I am dealing with the
'simple' ones for now, I wanted to have all of them done before
sending the patches, but for the ref-manual, dev-manual and
overview-manual we still use many labels, so it's taking more time. I
am hoping we can merge this first series, while I continue to fix the
last manuals!

This series is made of 2 parts: first I replace some documents which
use references to a label, with their corresponding 'autosection'
label, then I am removing all labels.

All patches in the second part of this series are generated with this
command:

sed -i '/{\n/{:a;N;/\n}/!ba};/^\.\. _.*/,+1d' *.rst

And the whole series is tested with:

git rebase -i origin/master --exec "make -C documentation clean html"

And has no warnings/errors..

Nicolas Dechesne (11):
  what-i-wish-id-known: replace labels with references to section title
  sdk-manual: replace labels with references to section title
  ref-manual: replace labels with references to section title
  dev-manual: replace labels with references to section title
  kernel-dev: replace labels with references to section title
  test-manual: remove unused labels
  bsp-guide: remove unused labels
  kernel-dev: remove unused labels
  profile-manual: remove unused labels
  sdk-manual: remove unused labels
  toaster-manual: remove unused labels

 documentation/bsp-guide/bsp.rst               | 20 --------
 .../dev-manual/dev-manual-common-tasks.rst    | 15 +++---
 .../kernel-dev/kernel-dev-advanced.rst        | 12 +----
 .../kernel-dev/kernel-dev-common.rst          |  2 -
 .../kernel-dev/kernel-dev-concepts-appx.rst   |  2 -
 documentation/kernel-dev/kernel-dev-faq.rst   |  2 -
 documentation/kernel-dev/kernel-dev-intro.rst | 10 ++--
 .../profile-manual/profile-manual-intro.rst   |  4 --
 .../profile-manual/profile-manual-usage.rst   | 46 -------------------
 documentation/ref-manual/faq.rst              |  4 +-
 .../ref-manual/ref-devtool-reference.rst      |  2 +-
 .../sdk-manual/sdk-appendix-obtain.rst        |  4 +-
 documentation/sdk-manual/sdk-extensible.rst   | 44 ------------------
 documentation/sdk-manual/sdk-intro.rst        |  4 --
 documentation/sdk-manual/sdk-using.rst        |  6 ---
 .../test-manual/test-manual-intro.rst         | 22 ---------
 .../test-manual/test-manual-test-process.rst  |  2 -
 .../test-manual-understand-autobuilder.rst    | 20 --------
 .../toaster-manual/toaster-manual-intro.rst   |  4 --
 .../toaster-manual-reference.rst              | 22 ---------
 .../toaster-manual-setup-and-use.rst          | 16 -------
 .../toaster-manual/toaster-manual-start.rst   |  6 ---
 documentation/what-i-wish-id-known.rst        |  2 +-
 23 files changed, 19 insertions(+), 252 deletions(-)

-- 
2.29.2

