Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A92CD1296
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:56:12 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.139243.1712674568207811511
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=224Jfh09;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-343f1957ffcso2254539f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712674566; x=1713279366; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxjACdCzi8quUtMiRRqNwp6AskQUBFlGm1zP1z39ulI=;
        b=224Jfh09WA7brcGDUwjBUXrpLr1jyr2v8LdjrkQaGISb+/LsPftimixYICqgN9dcSB
         FSqlGvQLx9p8MVS6ct2J1byVdUaR9iR9cMdgFtyVsLRzGly4DQvXwIcxa0bJA4y8q54R
         7U5FWECNZQHfqWzXEqP60FU642KLxPd8YDri5MJap4vsb/GgByTahl30LZf5d0CZd4Il
         Rtkc38tA0MMcOb+4i4XGPv8Lq957VZtDFmxj5c3XBNrLGHPmkffVUvUD8sgW2lEMayf/
         pFdLmUkjfnrP1CHbflVycoy8l8BEDkk27w8yIRb2YGrHxK+L7UM+hF2QeOXwfenk+P5j
         O6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674566; x=1713279366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxjACdCzi8quUtMiRRqNwp6AskQUBFlGm1zP1z39ulI=;
        b=JBqEbElE8Acd8T46EDpxSN6CAhQFdcFgOlHDfGhKByJzEeaHUUqhbRQVyFrhJFz1MK
         TQyn7LMkrRI34cUyZyxuyizhIebk08CNMtCquAlD6d4SAJuyvqv+XxPlOX1CZxAjZmQj
         m6M0wgAw/0zCqUTVKlSb+bJbOxsrT0A9ozT6Gq/ikIVJ6GqNrc/PXLF+P5C/Qe2Obnr0
         2MPfwvvdlFVXKo+9noTRBi8kEqD+D99lcRuHqe4sUBqqNzrsqcYSYCWZOrpHuPu66iJl
         py/GaeTOJBQuQebTbpNe66rhIgFPCjerPc0OPFZLoMR8DWszfCTEFNZBvQRSq8m5FV0Z
         BS8g==
X-Gm-Message-State: AOJu0YyLqmn1L4rdzLTVRwZOPBlnhcT0TROllD9rBbs1EGN2zTTR8Guz
	H9o+Mc0Lkp02lVWtWFXXsNQnMAkAZnCQtnFwIAMxgabhNCXYWOH6J0OeOsv1ZvUZWukRAj6EQRg
	z
X-Google-Smtp-Source: AGHT+IEJV7a66srsDhHi6cbw2yVbMnwFBXQYNDPh/+aMsiV0yvZFxrpbvHinel7+Om3wqK5tHmHSEg==
X-Received: by 2002:adf:e8ce:0:b0:343:7f4b:6da5 with SMTP id k14-20020adfe8ce000000b003437f4b6da5mr2664734wrn.17.1712674566419;
        Tue, 09 Apr 2024 07:56:06 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id r24-20020adfb1d8000000b00341b451a31asm11788693wra.36.2024.04.09.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:56:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/2] Documentation and 5.0 release notes for some of our work
Date: Tue,  9 Apr 2024 16:55:42 +0200
Message-Id: <20240409145544.3115398-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:56:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5092

This series documents and/or adds to release notes the commits coming
from @smile.fr emails addresses (from yocto-4.3 tag).

I considered all those commits (SHA1 from poky):

Documented:
* 789b10030c6 (cve-update-nvd2-native: remove rejected cve from database, 2024-03-15)
* 19f27037b2b (cve-update-nvd2-native: add an age threshold for incremental update, 2024-03-13)
* 6ce61b43570 (strace: disable bluetooth support by default, 2023-12-13)
* 381ef628fab (ref-manual: add documentation for the unimplemented-ptest qa warning, 2023-10-10)

Considered but not deemed documentation worthy (It seems we don't document
non-security fixes):
* ab6d3e3d645 (oeqa/selftest/devtool: fix test_devtool_add_git_style2, 2024-04-04)
* c698cf6723f (cve-update-nvd2-native: Fix CVE configuration update, 2024-03-15)
* 50e17197c6f (cve-update-nvd2-native: nvd_request_next: Improve comment, 2024-03-15)
* 64a54c9c399 (cve-update-nvd2-native: Remove duplicated CVE_CHECK_DB_FILE definition, 2024-03-15)
* 6243d7b8ce6 (cve-update-nvd2-native: Fix typo in comment, 2024-03-13)
* ef88dee4f77 (bitbake: prserv/serv: Fix a PID file removal race on prserv stop, 2024-02-29)
* 140edb96aa4 (waf: Improve version parsing to avoid failing on warnings, 2024-02-29)
* 6088f280dbb (ldconfig-native: Fix to point correctly on the DT_NEEDED entries in an ELF file, 2024-02-16)
* e898f65b339 (waf.bbclass: Print waf output on unparsable version, 2024-02-15)
* f441e63de9d (kexec-tools: Replace a submitted patch by the backported one, 2024-02-14)
* 56c7ea02d29 (systemd: add udev-bash-completion package, 2024-01-08)
* 7608ad08ae6 (image-live.bbclass: LIVE_ROOTFS_TYPE support compression, 2023-12-21)
* 2c59f5ad01a (lib/oe/patch: handle creating patches for CRLF sources, 2023-12-05)
* 93a9621df35 (meta-selftest/files: add xuser to static-passwd/-group, 2023-11-15)
* abeea5c797a (selftest/reproducible: Allow packages exclusion via config, 2023-11-15)
* cc2980ab7f3 (selftest/reproducible: Split a long line, 2023-11-15)

Yoann Congal (2):
  ref-manual: variables: document CVE_DB_INCR_UPDATE_AGE_THRES variable
  release-notes-5.0: Document some work

 .../migration-guides/release-notes-5.0.rst      | 17 +++++++++++++++++
 documentation/ref-manual/variables.rst          |  5 +++++
 2 files changed, 22 insertions(+)

-- 
2.39.2


