Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139B5E776CC
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:31:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123716.1766593912136379981
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eZhJ3zMk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A28001A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 784E26073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9CAA10AB133F;
	Wed, 24 Dec 2025 17:31:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qX9C/5S9UJSUDWPqJhesQtWAkgVaF+BvPRkULXzbZIw=;
	b=eZhJ3zMkGDlXK7QBjl/L2dkDKdtBo++H9isLSwYyCHPQL2QLPhURcDE8cLxJrGE58Fmooj
	VpO6ik8VGzzF9ABAsGn8oFJpa6GUFAy7+NRNQP1njVkb5/H1SL14SQPbZOYMwvywoBwifJ
	gelGgvR5kSqu9wDgnFbRtAU24mkIDImSc1MuoBrJyK3TIRMWuTif/ewyChhfGyuLkNugEf
	/wA6hARqfnJjkVpOmhPU1Aw2xDLcnJeJT1YS9J3B02wB+TJFuaRxOQie8eNlPPWY8mFpXO
	PKo2fRdfn8kAwDim7WjwybJw44MoSdAuxfLnhEh9sKNl36LcwHlaXCG0Adi7Gg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:32 +0100
Subject: [PATCH 06/53] contributor-guide/submit-changes.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-6-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4790;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=OD0nP/H8yBmEwQY7ixfPUgCLYMfamZTW6lLBevy0S+A=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVnSNXFLPo9HjaGiCUkE32pf09jeZEMe+xcC
 TkCJdXLDmyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVZwAKCRDRgEFAKaOo
 NhcKD/4wPnFnzJyzcbgNPCRIrdfH2m8n/MrmqzekAzIuGyP9xQgYob/Pt3v5A1KzQxSAC2M/bUR
 TdzsESU7vQ0py5e2SVIM5uhv8bcENXb/+DcO3Gw9+hK4ns9GjuYlXZRhONBbAJ0mm2Tw6xQEFYf
 VyjCCMcuVy1TVxEEFs6dvxjCPCmIC/J7+aoLCwcUL5QO3QLzXdmYBpYzfUWoGf2i7357KXtR9xN
 YYEKCenuDc3pvXHTXlY2EJPqq3Le/SPfZ48vkNwVs1NMU2583Ns/8ha7vJjQeXdn+OFqyBec/tF
 ECWYmn39UB6xlGck/fjCvlnWNDQBgNYH2aS9+gc6Fr0EjvYgMVdezUW+JfUDrwTPf/FRS3SLejH
 eGoksuBWiULOBhhwt29O/MKkXqJFJPVFs0YJLNyoVvqO/My9hD8JQVYn1ePFdt/ZMPr7kEWCyLn
 GIeKimq57PRUsBnCpnzKs22oMc1tLAwaOE4d/Jg/HevEQffbUEfvr0Kf7BSy/wl4US2QJn+agHw
 sZtOozg/e6c4agUPOXidCThHbvvDBwngjtu77ZWhGqElJtaYUEi0S7O7X96o7gmz3JK+3CDfQYK
 cywBm2R5F41adkEUn2fwbpRVDlsVu3g0wBnkbjynsfZzMPHejzWDMyKbe57BEGxNIs7iRjfdx8p
 2PxalFl55GG27fw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8335

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 29 +++++++++-------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 6306ed45b..d282cdf75 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -429,11 +429,7 @@ and then based on successful testing, merges them.
 In general, each component (e.g. layer) should have a ``README`` file
 that indicates where to send the changes and which process to follow.
 
-The "poky" repository, which is the Yocto Project's reference build
-environment, is a hybrid repository that contains several individual
-pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
-the combo-layer tool. The upstream location used for submitting changes
-varies by component:
+The upstream location used for submitting changes varies by component:
 
 -  *Core Metadata:* Send your patches to the
    :oe_lists:`openembedded-core </g/openembedded-core>`
@@ -620,7 +616,7 @@ have been followed:
    methods to find out:
 
    -  *Maintenance File:* Examine the ``maintainers.inc`` file, which is
-      located in the :term:`Source Directory` at
+      located in :term:`OpenEmbedded-Core (OE-Core)` at
       ``meta/conf/distro/include``, to see who is responsible for code.
 
    -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
@@ -645,9 +641,8 @@ have been followed:
    The Yocto Project provides two scripts that conveniently let you
    generate and send pull requests to the Yocto Project. These scripts
    are ``create-pull-request`` and ``send-pull-request``. You can find
-   these scripts in the ``scripts`` directory within the
-   :term:`Source Directory` (e.g.
-   ``poky/scripts``).
+   these scripts in the ``scripts`` directory within
+   :term:`OpenEmbedded-Core (OE-Core)`.
 
    Using these scripts correctly formats the requests without
    introducing any whitespace or HTML formatting. The maintainer that
@@ -660,7 +655,7 @@ have been followed:
    directory into which you pushed the change, and provides a subject
    line in the created patch files::
 
-      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
+      $ ./scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
 
    Running this script forms ``*.patch`` files in a folder named
    ``pull-``\ `PID` in the current directory. One of the patch files is a
@@ -673,7 +668,7 @@ have been followed:
    and email address. In this example, the email address is a mailing
    list::
 
-      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
+      $ ./scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
 
    You need to follow the prompts as the script is interactive.
 
@@ -682,8 +677,8 @@ have been followed:
       For help on using these scripts, simply provide the ``-h``
       argument as follows::
 
-              $ poky/scripts/create-pull-request -h
-              $ poky/scripts/send-pull-request -h
+              $ ./scripts/create-pull-request -h
+              $ ./scripts/send-pull-request -h
 
 Submitting Changes to Stable Release Branches
 =============================================
@@ -857,14 +852,14 @@ used testing branches for OpenEmbedded-Core are as follows:
    :oe_git:`openembedded-core </openembedded-core/>` repository and contains
    proposed changes to the core metadata.
 
--  *poky "master-next" branch:* This branch is part of the
-   :yocto_git:`poky </poky/>` repository and combines proposed
-   changes to BitBake, the core metadata and the poky distro.
+-  *meta-yocto "master-next" branch:* This branch is part of the
+   :yocto_git:`meta-yocto </meta-yocto/>` repository and combines proposed
+   changes to meta-yocto.
 
 Similarly, stable branches maintained by the project may have corresponding
 ``-next`` branches which collect proposed changes. For example,
 ``&DISTRO_NAME_NO_CAP;-next`` and ``&DISTRO_NAME_NO_CAP_MINUS_ONE;-next``
-branches in both the "openembdedded-core" and "poky" repositories.
+branches in both the "openembedded-core" and "meta-yocto" repositories.
 
 Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the

-- 
2.51.0


