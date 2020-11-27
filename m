Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.20373.1606490355674603525
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Nov 2020 07:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rqJ/RUkE;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id t4so5912196wrr.12
        for <docs@lists.yoctoproject.org>; Fri, 27 Nov 2020 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o87on76xHOESwNcl9yTCXK7Z+tgpba3Cj2C97D3Ekjc=;
        b=rqJ/RUkEPrVdGuh8U9GPCgBlvtTsM4K5jz3Hh/fOKMp4bVD+cZWF6S00vOF7c6+AFv
         5s5KtSaK3D8jxxj3GGRqVIrI1ATxVwIW7tpDIUuTywSCowREQJnmGj17M15wgYZMyNCI
         vEkkBVDrukaO60n3zzYvJaOaCKrL5tDAo0J24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o87on76xHOESwNcl9yTCXK7Z+tgpba3Cj2C97D3Ekjc=;
        b=Kl2Rhc2HwdODBLebi4LX+SJOc1LAcYb5Sf5vbmR0fT10+BwPL1rNckIslFiz3WK9bn
         vKucPreT+i4Q9JszWShXfRmWm0d3cntcSVlPuuA58dZMBA3Ud9FYa1SekLcy1xWvDJZ9
         gP1JpUTfZGwNXpTKqZj7CAM1vtQnAEK32CMeXOkmxp+P+PqRSkkrjNLkJSHnzQulSnGn
         AjQ3sMCu6j5M+gi0AOc2w26SSs4UVUokoXf9/OH7zM/wcUqTJbc63UcqJSkGQ+cejVVW
         1UE2e5ISREruyJBrAgSELjJvtLixE3MJ7Rg2FtRNERVxoCJU2FteSYCHTIfAAtOu9erQ
         XftA==
X-Gm-Message-State: AOAM533ra1iZ79jG9zzCrI/d3atMSpiCTBkav1ZxK5Wanhky0rPsl2LC
	EVRmuzocFmiBXDzJXU1IusUobLpteoUp6w==
X-Google-Smtp-Source: ABdhPJzGy/ju1EBJS7UEy6+UshPx70+GADscwrpWQzwj9j1AexEGVt57LWH10XtbHs+Q0OD45/QF2Q==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr11311637wrv.181.1606490353854;
        Fri, 27 Nov 2020 07:19:13 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id n123sm8326596wmn.7.2020.11.27.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 07:19:13 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 0/3] Simplify links using yocto_wiki, yocto_git and oe_git directives
Date: Fri, 27 Nov 2020 15:19:07 +0000
Message-Id: <20201127151910.6397-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes simplify use of the yocto_wiki and yocto_git directives. All
links in the text which can use these directives are tidied up.

Note that these patches are based on top of Nicolas' recent series to remove
labels [1] to simplify applying them together (assuming that series is ok).
The combined patches can be pulled from:

  https://gitlab.com/pbarker.dev/staging/yocto-docs.git
  tag: labels-and-links_2020-11-27

[1]: https://lists.yoctoproject.org/g/docs/topic/patch_0_7_a_second_pass_at/78526569

Paul Barker (3):
  documentation: Simplify yocto_wiki links
  documentation: Simplify yocto_git links
  ref-manual: Simplify oe_git links

 .../brief-yoctoprojectqs.rst                  |  2 +-
 documentation/bsp-guide/bsp.rst               | 23 ++++----
 documentation/conf.py                         |  4 +-
 .../dev-manual/dev-manual-common-tasks.rst    | 53 +++++++++----------
 documentation/dev-manual/dev-manual-start.rst |  6 +--
 .../kernel-dev/kernel-dev-advanced.rst        |  4 +-
 .../kernel-dev/kernel-dev-common.rst          |  4 +-
 .../kernel-dev/kernel-dev-maint-appx.rst      |  4 +-
 .../overview-manual-concepts.rst              | 17 +++---
 ...verview-manual-development-environment.rst |  7 ++-
 .../overview-manual-yp-intro.rst              | 12 ++---
 documentation/ref-manual/faq.rst              |  4 +-
 documentation/ref-manual/migration-1.3.rst    |  2 +-
 documentation/ref-manual/migration-1.5.rst    |  2 +-
 documentation/ref-manual/migration-1.6.rst    |  2 +-
 documentation/ref-manual/migration-1.7.rst    |  4 +-
 documentation/ref-manual/migration-1.8.rst    |  2 +-
 documentation/ref-manual/migration-2.2.rst    |  4 +-
 documentation/ref-manual/migration-2.3.rst    |  2 +-
 documentation/ref-manual/migration-2.5.rst    |  6 +--
 documentation/ref-manual/migration-3.0.rst    |  2 +-
 documentation/ref-manual/migration-3.2.rst    |  2 +-
 documentation/ref-manual/ref-classes.rst      |  2 +-
 .../ref-manual/ref-devtool-reference.rst      |  4 +-
 .../ref-manual/ref-release-process.rst        |  4 +-
 .../ref-manual/ref-system-requirements.rst    |  2 +-
 documentation/ref-manual/ref-tasks.rst        |  2 +-
 documentation/ref-manual/ref-terms.rst        |  4 +-
 documentation/ref-manual/ref-variables.rst    |  6 +--
 documentation/ref-manual/resources.rst        |  9 ++--
 .../test-manual/test-manual-intro.rst         |  6 +--
 .../test-manual/test-manual-test-process.rst  |  8 +--
 .../test-manual-understand-autobuilder.rst    |  2 +-
 .../toaster-manual-reference.rst              | 15 +++---
 .../toaster-manual-setup-and-use.rst          |  4 +-
 35 files changed, 113 insertions(+), 123 deletions(-)

-- 
2.26.2

