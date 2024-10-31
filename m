Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B61D767E5
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:52:59 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.17401.1730393569500435482
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 09:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xfHAYvIU;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so665288f8f.1
        for <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730393568; x=1730998368; darn=lists.yoctoproject.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmZvTHoN/20T1OxjrCh2z56DJ5K89e4VPU0flItMhKs=;
        b=xfHAYvIUmjdnfOjTwfEoIcyatq2VUzVSearwZrSeFzqhLBW42UuxfoKAc3ugMLLVtT
         KF7zxKvPTQugmvgcVa5kt3ALkTg51c9XXviho/qHvk2KzHSifd4Pf1W56+U37i6fkJO3
         rhv42lzZ6fVuNSQ9V3E+6G6i6CcgVokaxmjL02Yb4Ahzlw/F50isdImbF9tyItGG4/Pv
         oWZ90VvqmjC62JGaGQZManG7LvTi/1+aSYizQ/pzYMG87C28lK6L1LrZnSatdMaETkg3
         eRO+fnMovjXukYlL1/3ZRW5vBbMC1kmAgAC+kb+Z7DkvfL/OOB9//v2IeoPe+NUs4BY5
         hZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393568; x=1730998368;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmZvTHoN/20T1OxjrCh2z56DJ5K89e4VPU0flItMhKs=;
        b=Bn6DXA+0kQvqT5j6KM1C9b+QHaXHugc2ZhK27vagNItTX3DFPxvp6/Q3wfpxH0aK7n
         JxnuO3/AE76xsIpMQnDG2SZgD/bWEfJw4m/PQD8GUWwDIXLnNz+Nfae6Ha2JAlfKWVqf
         UIbZ/mJ+Gs+s7AZBRfF7wlVpoV09h+2ZSESIHYRHFR+ytU4j1OslSHw9KrUle1CSMw4C
         F8etFleMX1C9x4knpTg93DxZG26SlmPizYD4NKjj+e7qZ82c7NfB7FjfIBtzRUx1fLRs
         WIn+8qLW6FIbuKcTjIt8f3xhzRDRDeoYW1X0E8osczruXdT3EuDRxNLhBcKgdE51T2+6
         FaQQ==
X-Gm-Message-State: AOJu0YyF6xEKF578Td2MXAWjx1dCMvV+Uy49ll//ucYb7y16UFfIGaU/
	pONhZ/YKbHqEaYCY8cssTv0QMxg9S09v2FlzlTe7zBqyxv5jOa1C4+gYCwJTa3Pp1oHWNVykaxD
	tqbo=
X-Google-Smtp-Source: AGHT+IHi2Mbh0bNg3gs12PU0HbGH9RzAtH7WJ3zCKPCe36f6RuffeIXBDXrPgN5TCPq6jnDIwxql6w==
X-Received: by 2002:a05:6000:1446:b0:37d:5276:69f0 with SMTP id ffacd0b85a97d-381c7aa65camr475180f8f.44.1730393567609;
        Thu, 31 Oct 2024 09:52:47 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e61f9sm2651949f8f.58.2024.10.31.09.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:52:47 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 17:52:29 +0100
Subject: [PATCH] conf.py: silence cve role already registered
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-fix-cve-add-role-warning-v1-1-68e44c7e8961@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMy1I2cC/x2MQQqAMAzAviI9W1inMPEr4mFsdRZkSgcqiH93e
 AwkeaCwChcYmweUTymy5wrUNhBWnxOjxMpgje3JdISL3BhORh8j6r4xXl6z5IREvQvWdm5wHmp
 +KFf3X0/z+36cO3RSagAAAA==
X-Change-ID: 20241031-fix-cve-add-role-warning-1147c223787a
To: docs@lists.yoctoproject.org
Cc: Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Oct 2024 16:52:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5635

Commit bd9add8a0 - conf.py: add macro for Mitre CVE links
added a new macro for mitre cve links called "cve_mitre" which conflicts
with the already existing "cve" role.

  WARNING: role 'cve' is already registered, it will be overridden [app.add_role]

The warning is turned into an error making "make html" fail, but
documentation is still successfully built.

Since documentation is still correctly built, just suppress the warning.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/conf.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index 35c5c14535ba67aae3554819b55f0fb52a9d0027..aaddf2c789196fc26a734f06dbe005f147b9bbd3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -118,6 +118,9 @@ intersphinx_mapping = {
 # Suppress "WARNING: unknown mimetype for ..."
 suppress_warnings = ['epub.unknown_project_files']
 
+# Suppress "WARNING: role 'cve' is already registered, it will be overridden [app.add_role]"
+suppress_warnings.append('app.add_role')
+
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for

---
base-commit: 9563855ccd92e21fb6f8320c96a3a83e115c947e
change-id: 20241031-fix-cve-add-role-warning-1147c223787a

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


