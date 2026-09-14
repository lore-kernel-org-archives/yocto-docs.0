Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315A1C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 16:08:48 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1383.1789402122419446184
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 09:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qio2ospp;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-805453b1c0cso2533268a34.1
        for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789402121; x=1790006921; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEDrRYTmQqo5wdWqm6gdLLM4eMFHZENFRr7j+KFawt8=;
        b=Qio2osppZU75W1bq8Ip5qjMlJAWUXLWyG1Dfwr2b/D0TpC52cVYaZWfJfglnL2ofYp
         axAWVM2X6dkrdtKQEQly+X4xDqoIXmdAsJTw27Ki1CEDgaU/eyFRRe2HSYpnoavV0U/f
         Nsd6xuV5wrQ8qp2PIUkLE/PSCB3yve/iA2CufLzOrRIf8XjK5UNfeJAzHvcUfuOF5TKe
         ION/bjYrBWfz8NlAQr9By3bv7oXMzNf8K0bljaLMGy302Uxcn1bIIjuyVa5ujOPC1uWr
         PJPKJdHXXcoQz+eFwC5O5JRMeGD/jKKb7nCbvQ85BuLKof0i7xJvwPwc93xQmBRZPcto
         jnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402121; x=1790006921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEDrRYTmQqo5wdWqm6gdLLM4eMFHZENFRr7j+KFawt8=;
        b=SnLKsLhXLicI9o2MZhtU9OhfzopU24wmtFeRvKtlgn6PcCBLrgVU0saZVR/fmeoZoN
         Tn99QJLuGMp1i8u0nzNDVaL6fBY0gKw3YJ5aPNiUPQ8igH0vHOPymhYQemjlJq1UrLVy
         k+DG8xRmuNr0GuFApGMZ4g6AhJCeqwLcfVnLvxUbloaFO6l6Tah1YHWJ+2QhmBlLq0Nl
         wsTwYFpUkCp/CTsKrUbzDLQ/aS22DwVclxV/0NkevME8lt5rLjJRyJTRIBqZX4HutdfU
         8w4uohdmZn30tAQIUvnwrVAnUnlWOoa17g9iv2PxYMUFYFWHGBf3XPz+/XtTk0Dw+zJ3
         kCxg==
X-Gm-Message-State: AFuF++mJx4DXUhyP4tipGBW6h0j0b1VahHEmfDEXgNvNY9FODm/UWUu1
	07pPH3sQE313FvHETS36YH+YHO0wUZLNFbLfpDzI0TcgXQBoJ6BqZHaiRDP8ZA==
X-Gm-Gg: AYBFou1nD3Dyy5MfaTcqrP11XVGbyT26WgbQqOSoATlElQPZDm1UfFzV70Kx8L8h/vp
	mDQfJm1qXYnxj8hWglw0IETAcWqhOFISPQRWrKSTOvRq5scZw6SnJ5NCdf9YuPbuf+ThrVl15z1
	1TpajmggXUaGxFb+T60MEwT03NM+tcaE/vUnDQEnbMSgW0Ze7kamx9DttNOmEc9WLUAeZjTkYIw
	0yANmEv1ivY5CmqqmliugCLuhsSMRrs5uC3oMtWowSDIv2/7SwCdsyYwfClo7qyPTwFL+wmmbe6
	KmtZNmthgnirXhMgsNE9YRvVfjeQ/CJETNbWf0GtMd7gUCXK1i4Y+XU47NFTM/ru2ACydcN4UG5
	6JRBoLKclG3DXXV8SdGmV6sCSfUDFVCPjJOJ4HLO2eALo3pHfshXeGT/GcNirCqP7PaByhGT/FO
	VOoMDwi0oaRI00fYrTK5etc1rGXfF5Z+0DRGezaKIUgN2z4qcFTzKvPxKVfP7Zehqs/Iad
X-Received: by 2002:a05:6820:4cca:b0:6a1:47c8:c86 with SMTP id 006d021491bc7-6c5400887f9mr1892453eaf.10.1789402121141;
        Mon, 14 Sep 2026 09:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::9413])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0990cc05fsm11012356eaf.3.2026.09.14.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:08:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH 1/2] ref-manual/variables.rst: Fix the documentation for the SPDX agent variables
Date: Mon, 14 Sep 2026 10:08:35 -0600
Message-ID: <20260914160836.1673868-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 16:08:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10497

The documentation for the SPDX variables related to agents was incorrect
and misdirected users about how these variables are intended to be used.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/variables.rst | 42 +++++++++-----------------
 1 file changed, 14 insertions(+), 28 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 83bc59efe..e1d3cd70f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9567,38 +9567,28 @@ system and gives an overview of their function and contents.
       PURLs.
 
    :term:`SPDX_IMAGE_SUPPLIER`
-      The name of an agent variable prefix describing the organization or
-      person who supplies the image SBOM. When set, the supplier is attached
-      to all root elements of the image SBOM using the ``suppliedBy`` property.
+      The variable prefix for describing the organization or person who
+      supplies the image SBOM. When set, the supplier is attached to all root
+      elements of the image SBOM using the ``suppliedBy`` property.
 
       The value of this variable is the base prefix used to look up the
       agent's details. The following sub-variables are read using that prefix:
 
-      -  ``<PREFIX>_name``: display name of the supplier (required)
-      -  ``<PREFIX>_type``: agent type: ``organization``, ``person``,
+      -  ``SPDX_IMAGE_SUPPLIER_name``: display name of the supplier (required)
+      -  ``SPDX_IMAGE_SUPPLIER_type``: agent type: ``organization``, ``person``,
          ``software``, or ``agent`` (optional, defaults to ``agent``)
-      -  ``<PREFIX>_comment``: free-text comment (optional)
-      -  ``<PREFIX>_id_email``: contact e-mail address (optional)
-
-      The simplest approach is to use the variable itself as its own prefix,
-      so the sub-variable names follow directly from
-      ``SPDX_IMAGE_SUPPLIER``.
+      -  ``SPDX_IMAGE_SUPPLIER_comment``: free-text comment (optional)
+      -  ``SPDX_IMAGE_SUPPLIER_id_email``: contact e-mail address (optional)
 
       Example (set in the image recipe or in a :term:`configuration file`)::
 
-         SPDX_IMAGE_SUPPLIER = "SPDX_IMAGE_SUPPLIER"
          SPDX_IMAGE_SUPPLIER_name = "Acme Corp"
          SPDX_IMAGE_SUPPLIER_type = "organization"
 
-      Alternatively, you can use any other prefix name, which is useful for
-      sharing an agent definition across multiple supplier variables::
-
-         MY_COMPANY_name = "Acme Corp"
-         MY_COMPANY_type = "organization"
-         SPDX_IMAGE_SUPPLIER = "MY_COMPANY"
-         SPDX_SDK_SUPPLIER = "MY_COMPANY"
+      Alternatively, it is also possible to reference an agent created by
+      another variable prefix, using ``SPDX_IMAGE_SUPPLIER_ref``. For example::
 
-      If not set, no supplier information is added to the image SBOM.
+        SPDX_IMAGE_SUPPLIER_ref = "SPDX_PACKAGE_SUPPLIER"
 
       See also :term:`SPDX_PACKAGE_SUPPLIER` and :term:`SPDX_SDK_SUPPLIER`.
 
@@ -9737,7 +9727,7 @@ system and gives an overview of their function and contents.
          already fixed upstream (warning: this can be large and slow).
 
    :term:`SPDX_INVOKED_BY`
-      The base variable name describing the agent that invoked the build.
+      The variable prefix describing the agent that invoked the build.
       Each ``Build`` object in the SPDX output is linked to this agent with an
       ``invokedBy`` relationship. Requires
       :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
@@ -9751,7 +9741,6 @@ system and gives an overview of their function and contents.
       Example (CI pipeline invoking the build)::
 
          SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
-         SPDX_INVOKED_BY = "SPDX_INVOKED_BY"
          SPDX_INVOKED_BY_name = "GitLab CI"
          SPDX_INVOKED_BY_type = "software"
 
@@ -9792,7 +9781,7 @@ system and gives an overview of their function and contents.
       ``http://spdx.org/spdxdoc``.
 
    :term:`SPDX_ON_BEHALF_OF`
-      The base variable name describing the agent on whose behalf the invoking
+      The variable prefix describing the agent on whose behalf the invoking
       agent (:term:`SPDX_INVOKED_BY`) is running the build. Requires
       :term:`SPDX_INCLUDE_BITBAKE_PARENT_BUILD` to be set to ``"1"``.
       Has no effect if :term:`SPDX_INVOKED_BY` is not also set.
@@ -9806,10 +9795,8 @@ system and gives an overview of their function and contents.
       Example (CI system building on behalf of a customer organization)::
 
          SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
-         SPDX_INVOKED_BY = "SPDX_INVOKED_BY"
          SPDX_INVOKED_BY_name = "GitLab CI"
          SPDX_INVOKED_BY_type = "software"
-         SPDX_ON_BEHALF_OF = "SPDX_ON_BEHALF_OF"
          SPDX_ON_BEHALF_OF_name = "Acme Corp"
          SPDX_ON_BEHALF_OF_type = "organization"
 
@@ -9822,7 +9809,7 @@ system and gives an overview of their function and contents.
       :term:`SPDX_INVOKED_BY`, and :term:`SPDX_BUILD_HOST`.
 
    :term:`SPDX_PACKAGE_SUPPLIER`
-      The base variable name describing the agent who supplies the artifacts
+      The variable prefix describing the agent who supplies the artifacts
       produced by the build. Works identically to :term:`SPDX_IMAGE_SUPPLIER`
       but applies to individual packages rather than the image SBOM.
 
@@ -9831,7 +9818,6 @@ system and gives an overview of their function and contents.
       to apply only to packages of that recipe. Recipe-level overrides
       (``SPDX_PACKAGE_SUPPLIER:pn-<recipe>``) are also supported::
 
-         SPDX_PACKAGE_SUPPLIER = "SPDX_PACKAGE_SUPPLIER"
          SPDX_PACKAGE_SUPPLIER_name = "Acme Corp"
          SPDX_PACKAGE_SUPPLIER_type = "organization"
 
@@ -11480,7 +11466,7 @@ system and gives an overview of their function and contents.
       configuration must define the :term:`UBOOT_MACHINE` variable.
       Additional control variables are: :term:`UBOOT_CONFIG_BINARY`,
       :term:`UBOOT_CONFIG_FRAGMENTS`, :term:`UBOOT_CONFIG_IMAGE_FSTYPES`, and
-      :term:`UBOOT_CONFIG_MAKE_OPTS`. 
+      :term:`UBOOT_CONFIG_MAKE_OPTS`.
 
       Here is an updated example from the ``meta-freescale`` layer. ::
 
-- 
2.55.0


