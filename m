Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B7C61DC6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:32 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3467.1787708127327608792
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FjKSdNat;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93695893ac1so28631885a.0
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708126; x=1788312926; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p0aQDObWFMDMNe10rbAPhiA5pWkQZtN+vnjchCYiaiA=;
        b=FjKSdNatVIW3k18NywYylCExsIBGAzp+HpUi6IXVZ3PhCtV3GK9JD5W8QKIjw3J5gM
         91lxE6wDwKbYPqtVGl8GL4c3m58mKGOFPjRljB5C5VovCS9BAb9TnHoZ5W71V9mD7Owq
         Y7UpcyUEBVdQ5ZPcPXOrRputxjidpusToM6efCTQzXQnjc+trfOmwlh6+VJMeOOK+6/R
         ZApV94LZTtbkMAE3Q7+SUMVpYdUHEQKuK6MPZLSfS7TTr9dCjBCG3SWi47T4jy1aejYN
         bJWck3+G2+2XLcdbXFVnK5WG3CoDiyK5n9YfRXrB5Ip1pDcIDTxIXtg2ruMOB9ac0Nkn
         IDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708126; x=1788312926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p0aQDObWFMDMNe10rbAPhiA5pWkQZtN+vnjchCYiaiA=;
        b=mvRPKiRB33cjyH8UDIUBOj1Xhxp4FvsW9p91tdQztsEUzFoRPP2SamWP4qx9BGMf9W
         96ddHsLiFd916POEFRJMM5B9faKegXwO51tt/Y0RTyd8s6YORNPh0+GMlXJKND5LQFWg
         ifswO1RsdG+7Gc4ferhCpl7mJRY1Ohi6mSlNjuLPqM1JSdGWGI1otp/QnHb+izT/VsT7
         jfv0aJqPQdLOXnPHRD70UlSoSZhQdfCUYYqoexSVUsHm/mi7+6u2TZelC3zGtkPfmVSf
         E1dfMOI5oQ0N/FayWeuAQvBpEtggfjxPxVK38VDrXo1RofkuDIYIpLi41H/TyF3RtN87
         AahA==
X-Gm-Message-State: AFuF++mvoo+q+cF7SBUp4X6YcUbV9LwdJRoyvuL53bfSqkoEgqnov4Lo
	2GaHTaNISsa9s93LB7tkGfOaH4pk3HtXCFKK+06sew6Xb1BlS12g333Z05GQElLa
X-Gm-Gg: AR+sD12KEY+MiK69ibYVXWi2B34VUN9mkdhzkNe0v7L6S2Kg0BldvbPHh+rViVvnBxa
	onL2L21Z41aYc0wdirgAOOWPwlKK9S+jilP0eOkXjVgU1PHwvmgAr84JopSzPmux/JEkmMEgKGK
	fPZjU0DvES0odVrp05FoXFH1nC6UJ54UU53anMJa2rcGyrf9Fvq0T7v/9qKT5pmx+QpWH0haOZR
	3W5CEvmiv3PN3BOEj0Om2nzXs3u40GjXC0PF2jE1V/G+EQ7N1/pn/RYbBBzOfKvt3yCVVTaH4tf
	X2uu/9uzTTayziUwsqkOFb3IICw2uNkg/axyxkfBw0Kfpga+DCZ+vrhHberb84uM68XKNQMYK5B
	5hIqUL4/9c5qwrtPWbO022pz94PMMSXWbV17znFn5WTbtWQQrDL1c0vERkhJWjeDbB2bnvZnvJU
	IQtaKvYfGcQNg7V7b9hxaFS0Abm1bitvLYqqWLvuSsGjn+FaIq77wx87+52kek4WdoheDD1SVPi
	jnC6vMqLRTxWgdTbDJ00tlf+rXC/a8=
X-Received: by 2002:a05:620a:818e:b0:936:e8e6:a4df with SMTP id af79cd13be357-937800f692amr225621585a.7.1787708126202;
        Tue, 25 Aug 2026 18:35:26 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.22
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:24 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 09/10] sdk-manual: use the bitbake code-block language
Date: Tue, 25 Aug 2026 21:34:54 -0400
Message-ID: <20260826013502.2674000-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260826013502.2674000-1-twoerner@gmail.com>
References: <20260826013502.2674000-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10354

BitBake snippets here render as unhighlighted text. A reStructuredText
literal block carries no language, and Sphinx falls back to a default
that cannot recognise BitBake metadata.

Pygments 2.21 added a BitBake lexer, so tag these 9 blocks
explicitly. Variable names, assignment operators, override chains,
expansions and shell or Python task bodies are then highlighted.

Blocks that only look like BitBake are left alone, as are blocks
already tagged "none" where the content is deliberately unhighlighted.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../sdk-manual/appendix-customizing-standard.rst |  4 +++-
 .../sdk-manual/appendix-customizing.rst          | 16 ++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/documentation/sdk-manual/appendix-customizing-standard.rst b/documentation/sdk-manual/appendix-customizing-standard.rst
index 90b73dc20d7a..e0437270d1dd 100644
--- a/documentation/sdk-manual/appendix-customizing-standard.rst
+++ b/documentation/sdk-manual/appendix-customizing-standard.rst
@@ -27,7 +27,9 @@ Adding API Documentation to the Standard SDK
 
 You can include API documentation as well as any other documentation
 provided by recipes with the standard SDK by adding "api-documentation"
-to the :term:`DISTRO_FEATURES` variable::
+to the :term:`DISTRO_FEATURES` variable:
+
+.. code-block:: bitbake
 
    DISTRO_FEATURES:append = " api-documentation"
 
diff --git a/documentation/sdk-manual/appendix-customizing.rst b/documentation/sdk-manual/appendix-customizing.rst
index 467c5c10c32c..497db2fb9f50 100644
--- a/documentation/sdk-manual/appendix-customizing.rst
+++ b/documentation/sdk-manual/appendix-customizing.rst
@@ -149,7 +149,7 @@ The
 class defines the default value of the :term:`SDK_TITLE` variable as
 follows:
 
-.. code-block:: none
+.. code-block:: bitbake
 
    SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
@@ -163,7 +163,7 @@ does the default "poky" distribution. If so, you could update the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
 form:
 
-.. code-block:: none
+.. code-block:: bitbake
 
    SDK_TITLE = "your_title"
 
@@ -220,7 +220,7 @@ within the
 :ref:`populate_sdk_base <ref-classes-populate-sdk-*>`
 class as follows:
 
-.. code-block:: none
+.. code-block:: bitbake
 
    SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
 
@@ -239,7 +239,7 @@ does the default "poky" distribution. If so, you could update the
 ``~/meta-mydistro/conf/distro/mydistro.conf`` file using the following
 form:
 
-.. code-block:: none
+.. code-block:: bitbake
 
    SDKEXTPATH = "some_path_for_your_installed_sdk"
 
@@ -275,7 +275,7 @@ source, you need to do a number of things:
    to find the configuration. The variable you need to set is
    :term:`SSTATE_MIRRORS`:
 
-   .. code-block:: none
+   .. code-block:: bitbake
 
       SSTATE_MIRRORS = "file://.* https://example.com/some_path/sstate-cache/PATH"
 
@@ -290,7 +290,7 @@ source, you need to do a number of things:
       configuration file. You can then pass the variable to the SDK by
       adding the following:
 
-      .. code-block:: none
+      .. code-block:: bitbake
 
          ESDK_LOCALCONF_ALLOW = "SSTATE_MIRRORS"
 
@@ -315,7 +315,7 @@ more in size. If the size of this file causes a problem, you can build
 an SDK that has just enough in it to install and provide access to the
 ``devtool command`` by setting the following in your configuration:
 
-.. code-block:: none
+.. code-block:: bitbake
 
    SDK_EXT_TYPE = "minimal"
 
@@ -339,7 +339,7 @@ results.
 To facilitate this wider range of information, you would need to set the
 following:
 
-.. code-block:: none
+.. code-block:: bitbake
 
    SDK_INCLUDE_PKGDATA = "1"
 

