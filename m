Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DB0F4484E
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154735.1775823479415923233
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Epoma9gj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9910707d82so252113966b.1
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823478; x=1776428278; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0w3Cu0UbjgyhVJINPhXxLR1olerhXx9ixzO2gYpDr4=;
        b=Epoma9gjFjKCAHse/t2LiDAJfsyOJv4MzPmK5y3Dgpa+hZIQh3T0YKAmi5NkvVobOo
         Qtm490qo6AQjGJhLBjlYD7bmRLAgDFn4PAfPGGgJo8dpEBScttgdS3duZDooKBsKxFFJ
         KpVVdFX9Hu6fEAr6dEPlLBdcoFuDKlQV8sRNKPzqrblPk3vFtvn5Bi5uP9xOPD9D5is2
         M8ahVVyWOxF1GTVXNJ/F+0nph1NCKt7OMH1jzv4HjVbffNNxu9inWvFawzmTVAZEqTuX
         zb7AU5NWIpN1gy1BdIQ/qz9iWnqwnTHbEflUXh5uoEtgHVdgl3kYBI9VHd8GxjPfozLY
         vo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823478; x=1776428278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r0w3Cu0UbjgyhVJINPhXxLR1olerhXx9ixzO2gYpDr4=;
        b=mxLj/hEQfkznAXMKLkPWoKmknTJZ1Y6+8FXRthF4jpRi0uBhOO1IHvSacTpSVhByNm
         pZV7DPvwE5Et1JFxtDTq4TZEKMFfASkVgKP1yy0yXifX7Bioekn81XC9bwvdqPErZk8G
         Z6lrRn/3ZsmfD0AIOrWpWBEGxfYfmhbosREuAMjYK7FWSd4MKi7qbvZv2uur2/qxTO2V
         Enw8DH3QN8y9S8e3Ruep4fkMd6cKcbEgfxeaztbAsYp1dnhdK9eLO93R2Xn5eLNutJ6F
         WAL+OKive6iSwlPMkIcAEzU1k7/1aWJXkBtGwCUAd8/jnBJe8mRxJ27Nu1WonnEBbdj1
         OM0A==
X-Gm-Message-State: AOJu0YxOPv1qQ5DXwmqR+2W4i7RQa2vs1U3SdOZNYiSZjUyUQ7a8pvSB
	kek5P7NEQWimKVK6OPt+UBE08tLFfKLOEFc2DureXwR786cO8awxj4Y6
X-Gm-Gg: AeBDiev67DJpbPeP7O8JJ0sIae7lr1sg1TaccL+8NiH+ZK+WYOWeSvqr1cAXi7RE2lR
	ag9r1ub16BvIlE4wOcaqSV1FGrUxJKik7Qw/7JksQ9yQIuVLfrLsFQb62y5B6aVFuPRuwvyCOI0
	kBFVxXHz49Np2tiB2+U6RsCJz0PJPMMFwVjjVmLicvSU5oEvKzGjXKWjHIleYxILzccgZUvyq4m
	07pcFwa6puuLmlsQ7KCB+wn3ret0SWXU22rEtUQyGFqPJwHlh7ZNkfMW2D9BP4uoTJg1TRYG7HM
	pM6btDHL9GP5Yq1EIegOrLFqRrBwMB5mvAwNigqHGal43oGbt971YMC2J6NCR3Cl6+eZ2dkYD9I
	jrWd5mluZze7CEYBzRX2hUxnj5W5QO6kmeaXUErE9KlTCmIt5DUQZR9Q1oL47AnWWNgA66zY5Nz
	kWwwaQclfkkNcnDvuhGq3xh9Xj23FJYQ==
X-Received: by 2002:a17:907:9615:b0:b9c:6178:6a77 with SMTP id a640c23a62f3a-b9d7297e1f6mr166992366b.25.1775823477480;
        Fri, 10 Apr 2026 05:17:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:17:56 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Apr 2026 14:17:46 +0200
Subject: [PATCH v2 3/6] ref-manual/variables.rst: update PKGDATA_DIR's
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-staging_and_packaging_vars-v2-3-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=1695;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=MDEniKvTQ95sg24jGXC/WFue3Yd2yMjWwlByI0AkIP8=;
 b=2HBiEDUbxakxlrM1tTcGeLxeTcQBEsM3svYpP8CWJHA9UKWn26GuhJTUQ/UHZwm041g8RQK9m
 QuurrbX55jyAGXjjG4RvVHogHeNr5U/CsWzztHf0+tLki/9TWGWHFAF
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9226

Don't refer to it as temporary. Update the default value.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e11294c6b..7d3aa8ccf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7493,19 +7493,17 @@ system and gives an overview of their function and contents.
       Points to a shared, global-state directory that holds data generated
       during the packaging process. During the packaging process, the
       :ref:`ref-tasks-packagedata` task packages data
-      for each recipe and installs it into this temporary, shared area.
+      for each recipe and installs it into this shared area.
       This directory defaults to the following, which you should not
       change::
 
-         ${STAGING_DIR_HOST}/pkgdata
+         ${TMPDIR}/pkgdata/${MACHINE}
 
       For examples of how this data is used, see the
       ":ref:`overview-manual/concepts:automatically added runtime dependencies`"
       section in the Yocto Project Overview and Concepts Manual and the
       ":ref:`dev-manual/debugging:viewing package information with ``oe-pkgdata-util```"
-      section in the Yocto Project Development Tasks Manual. For more
-      information on the shared, global-state directory, see
-      :term:`STAGING_DIR_HOST`.
+      section in the Yocto Project Development Tasks Manual.
 
    :term:`PKGDEST`
       Points to the parent directory for files to be packaged after they

-- 
2.43.0


