Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588D8C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 13:18:35 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.40716.1738847907508588924
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 05:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AijcGHAF;
 spf=pass (domain: smile.fr, ip: 209.85.208.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso3904745a12.0
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738847905; x=1739452705; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIcv9mnMozJmU98vJxxjWQXwmEds5SL9q2rGDbhoAs4=;
        b=AijcGHAFLlsadn855NFxpLHfB6HipdUn/pYERwgD9Jj1o7nhVy8lf/pGJmQAlYnHzD
         k+GCPJJ5ohPrFkabrCnQ4U8qBpk2HVr5wHeeD29MBXtfCzHJkzf9nVrOsiz90hWVpGOC
         OtyR2NHRs5RnN5mKLTUr+/6GP5EYiPGyKcIbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847905; x=1739452705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIcv9mnMozJmU98vJxxjWQXwmEds5SL9q2rGDbhoAs4=;
        b=FKw0aOCNsIewvQgipnUZtLG+WAi0jNbpJROPRguC+u9eqdbvyN6/5XAgORx6Dsl2x2
         DEZ2umvn7cEPSjLVdOrja3UcuGRB0Nm6J1UZcP6y9HYvpkUTYRIxUS66pznF4gj6CrQp
         3edoVhNMvWhIgTHQ9091NDnQ0+RgKMViYZ1/Q6gEEsgK+c4NzaVRw6vmF+EbfN9d9fs6
         0g7xdgTao2qGnjJBZcxcFdckgzHHffe0xxkK66RfNMYjcTmc7Be9jpNnm6BPUZ91waz2
         3ACuZCQQwEwG4q+dX7wnq0drSHAa92fAnkBAzuMyzp6ZuU6VC4xU8rsP+rSOrJLVvPzJ
         s12w==
X-Gm-Message-State: AOJu0YwxUnwfZg3uPTveIMd/bQeGsW2Z005F5RLEIrTWqRVzImyqtGgB
	cs8MG35L1MWj73ZzKncuemuaSu7G5EA1m0+ecK6XIyyu3EbGVnQHw3itvHMUIvCM9Hpl8zmMQzQ
	N
X-Gm-Gg: ASbGncu9e+cjYTs5QyywUueVJfZX3XXcWeKJ323sIhpAXEK+arRXBm9buMyICIbK/kH
	2HNpj9uGGyLIKcOdlVF7yAxZG3q5YKU256wOgayBg/aIufw1vJGy3lPVRFLCT+ndW0DZDFmnjWg
	WATI9ZIJFI3xDEZZ/9EGIWcEdaYp2brgc0/+DnODbjdTZBpdYXpsrztIdjyhfg3QuDTFrcG4MCa
	cLfbgQuScSsczH26jEsiZMEvBvr3nV7mElX16hCd0GokJhGky2ByhvJC//OkWNaLe3k2H8rI9Mu
	zrYYc2pZhH1IgKx5yn6OC/ZOvJDqGsxcziwHaVlSMykeOS+e7G+FU2bRDaX/44jKeUg9ztrJOUj
	6+K5mD1PRzyG89uoerX+BME0KyPEJ
X-Google-Smtp-Source: AGHT+IHV3Hu0n85hhy/jZV3klGUy7XFOnEOSBQtxRIgsBZOUrGAJGqAZ4CPaWT3Ki6Mknqket3ALsg==
X-Received: by 2002:a05:6402:2087:b0:5dc:c3c6:5826 with SMTP id 4fb4d7f45d1cf-5dcecca9240mr3233113a12.7.1738847905341;
        Thu, 06 Feb 2025 05:18:25 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b815c8sm898568a12.42.2025.02.06.05.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:18:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH 1/3] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Thu,  6 Feb 2025 14:18:09 +0100
Message-Id: <20250206131811.86935-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:18:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6258

From: Yoann Congal <yoann.congal@smile.fr>

This documents the variable used in the "automate testing a single
recipe's reproducibility" feature [YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..32e91b6db 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5802,6 +5802,11 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      Set build target for build reproducibility testing but activate
+      :ref:`shared state <overview-manual/concepts:shared state cache>` build
+      for most dependencies. See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`

