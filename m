Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C1EC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:07:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23791.1786745254957199725
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 15:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=JAASmwxL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJh5AU2994258
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 22:07:33 GMT
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g26j6h9xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 22:07:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so15057795ad.1
        for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1786745252; x=1787350052; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNz5H93H8OAAKhKuzHNo+/jiylHDL9lkH4nwRfoFvNo=;
        b=JAASmwxLujouBRvqrvovM+/EO+Px2VcTDo8xnXNLStThp7qdUQYDqZ8hIeU2bRJMuH
         QziSk/HFLVv4ilcPBfQsDEKnrybIlPqKgIYzOmEo0RboxH9qmh6bcblvyZniic7jZM30
         oQpJyOyEPZQz1fI1Q455x8/z5biX+j5SfNRMZSKqv3Ay0IkXLtMVFm4Jcj+AyGKSDkWf
         RxaJiUp22J0/zphjeB8jgjXRIZCr6S/uDTHpLmuLpWX9nLbTrGslUkmIGZukexVsPQao
         XoIJ2t/i4W3Xpvnz4uh2p2ECTyYAA7C4CoBFptoWiNUIbVZkye1apP07YVpmOdcYuFww
         YHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786745252; x=1787350052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNz5H93H8OAAKhKuzHNo+/jiylHDL9lkH4nwRfoFvNo=;
        b=EMIhryjoFWd+xJo/Iwl/JQV62mEjOym9vqS+X7trFpyj85gChLw4xGRenXEDMhy1zG
         wLrMBvxaeSYOuR+VWF+zviPUtN20tzihE+pK4fJC9luJtNGANpM3BniB00BRNRkolW7K
         IZiin0xEUTPCKpcA6woZ9C8CLiblceyMgFlNuzAjtbN2VMnyAhuyk09RXNR7KwjOf+l6
         4MV+yez6qQpy+Z5c99BifW9DeyMyJAazNV2OA4r0rDBxrT7IY4A13dgOYvelPF1Nn0Kp
         q3u//cJ5kk/KKUiCjnxTJpU+mt+E0/F+OzS6oD25yceIO+9u1UBPG1ajeQCly/t3uP2h
         dYSg==
X-Gm-Message-State: AOJu0Yz+pHnuPkEQOALlHXf/TT10ADg+rmu1u3kmTE0CHWSzdeM0rxh5
	Z9UEe0kVL51h4hvtZEHsSY2mmPaZkWxpQBegBJzrlkIlTdWaVPcJsKuc4F3Nohg9aqZNlfswlsX
	XlEtoJlvKPDjAY0FHDYiLcr/2B35y/TX6+ztFKAFoUovBrIYg8N3uRFK+1RxqFn7hwFEaES1G
X-Gm-Gg: AR+sD10dazG523eGpqm4pPIDHomXfhCH6tTOOE4rXLvMGdYtOWr6kxBVEIrWx/oc9j/
	9+Co8+XoBYovoNde71LCm1i9joFHuyxg8bD7v9SLmwzxgW3ksWFzo++G2BfatJLJ+Ry9kRC1JhQ
	j96ZGB7c0QKZUiBmBOalSAQdBChwO/oPy3A0X9amC8hz5BcB6iAqmGkvOOCVO+2oYbyXlEa7EK/
	7enX8Hj5ti6zA1K+D37Ed12x+Bb8deDdem3Xo3LiwJw0mJ3TtdmrQKOs0/vV0wrX5MZpWLpOgXV
	RUc/YQsXWzA1fXFrhOb8n83JjXgGpghmdOJDFhbY7GaPAbWLN2oCBOpnPyXdX7ZMYC03/BLaaEf
	SOQjY+QGWJYlV9Hin2L9k8wSyyoJ1lRNeLRA8+pDf/tueXVaCzPoSYDPy8ouQPvoXz+mm8SVwpA
	==
X-Received: by 2002:a17:903:b43:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2d3b0aeea6emr108023635ad.3.1786745252441;
        Fri, 14 Aug 2026 15:07:32 -0700 (PDT)
X-Received: by 2002:a17:903:b43:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2d3b0aeea6emr108023255ad.3.1786745251947;
        Fri, 14 Aug 2026 15:07:31 -0700 (PDT)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm7181960eec.8.2026.08.14.15.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:07:31 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
X-Google-Original-From: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
To: docs@lists.yoctoproject.org
Cc: daiane.angolini@foundries.io,
        Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] docs-wide: fix manual names in cross references
Date: Fri, 14 Aug 2026 19:07:20 -0300
Message-Id: <20260814220720.1115397-2-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814220720.1115397-1-daiane.angolini@oss.qualcomm.com>
References: <20260814220720.1115397-1-daiane.angolini@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kTFVevnIjZm6v-MmGmkg2Ii7krAIcKB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE3MCBTYWx0ZWRfX6uZQ1+1j6vhU
 9zflaD35tnyisWOSEcPVbneRR/VNRkwnJWm3HcSy/sXXH93KcKw7BZU++eCEhr9aOZzUzRyxS6T
 +rYI3yqNyKWkRyrJx5i29JTItBL7K3iX+ZDbEAbPkkAPu11dBo5vhrJzidCqex7EkyCwE9M7B7+
 pkXnUtuEXr9Oy5PQ8t43/UvBnfgMQdyHSXorkX817joj0pABVgEzKH8sIVmIE9WbdDWyXEgh0se
 u6IAsv8pY6z6agTE8xar/S8f++41T6YTaO642l7nxArRjKSMKrwXqGazc3GCeVBOQfe26+nfGfr
 p9cUUrkytsH8o2nLPEpWlegdrtRlhuEhKFVNjGjPr3oQh3g86LQq/m5IcB9a7tvgg0RTreC72Dn
 aja6kPyjx5JLgmUh6nO+N/AF1Q1My6eadm83kNE2DUmBLBhonwp8IEjaJ+0qterLWBg00U0IyOC
 NFiBOW1nYaH/RXHYtlg==
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a7f91a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=Sv0fKeRqtYgA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hCNRlGYDnA9NzR-SBikA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: kTFVevnIjZm6v-MmGmkg2Ii7krAIcKB7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE3MCBTYWx0ZWRfX/q5J99ftMw6/
 2UKLkiBLV4Jl0nXVvdcuEZS3wy1pkersZua4t9eAz3pFJKiH4OoNgUrYridk+PUHuGBx0JfNOoK
 8fd9g2eS4oScovNpFMbqfsjFP4Q0Fpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140170
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 22:07:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10293

The text naming the target manual did not match the manual the cross
reference points to.

AI-Generated: Uses Claude Opus 5
Signed-off-by: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
---
 documentation/ref-manual/classes.rst   | 6 +++---
 documentation/ref-manual/qa-checks.rst | 2 +-
 documentation/ref-manual/variables.rst | 8 +++++---
 documentation/test-manual/intro.rst    | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index f3d1aa64e..4b542b7b1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -564,7 +564,7 @@ starting with ``SPDX_``.
 
 See the description of these variables and the
 ":ref:`dev-manual/sbom:creating a software bill of materials`"
-section in the Yocto Project Development Manual for more details.
+section in the Yocto Project Development Tasks Manual for more details.
 
 .. _ref-classes-cross:
 
@@ -2434,7 +2434,7 @@ This class is intended to be inherited by individual recipes. However,
 the class' functionality is largely disabled unless "ptest" appears in
 :term:`DISTRO_FEATURES`. See the
 ":ref:`test-manual/ptest:testing packages with ptest`"
-section in the Yocto Project Development Tasks Manual for more information
+section in the Yocto Project Test Environment Manual for more information
 on ptest.
 
 .. _ref-classes-ptest-cargo:
@@ -2458,7 +2458,7 @@ have tests intended to be executed with ``gnome-desktop-testing``.
 
 For information on setting up and running ptests, see the
 ":ref:`test-manual/ptest:testing packages with ptest`"
-section in the Yocto Project Development Tasks Manual.
+section in the Yocto Project Test Environment Manual.
 
 .. _ref-classes-ptest-python-pytest:
 
diff --git a/documentation/ref-manual/qa-checks.rst b/documentation/ref-manual/qa-checks.rst
index 09b0f628a..8e1ce4438 100644
--- a/documentation/ref-manual/qa-checks.rst
+++ b/documentation/ref-manual/qa-checks.rst
@@ -919,7 +919,7 @@ the variable if it is not needed.
 This check will detect if the source of the package contains some
 upstream-provided tests and, if so, that ptests are implemented for this
 recipe.  See the ":ref:`test-manual/ptest:testing packages with ptest`"
-section in the Yocto Project Development Tasks Manual. See also the
+section in the Yocto Project Test Environment Manual. See also the
 ":ref:`ref-classes-ptest`" section.
 
 .. _qa-check-unknown-configure-option:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index fa0dfdfb8..df913ba47 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2929,7 +2929,7 @@ system and gives an overview of their function and contents.
         - "read-only-rootfs" --- creates an image whose root filesystem is
           read-only. See the
           ":ref:`security-manual/read-only-rootfs:creating a read-only root filesystem`"
-          section in the Yocto Project Development Tasks Manual for more
+          section in the Yocto Project Security Manual for more
           information
         - "tools-debug" --- adds debugging tools such as gdb and strace.
         - "tools-sdk" --- adds development tools such as gcc, make,
@@ -11210,7 +11210,8 @@ system and gives an overview of their function and contents.
       For background information on cross-development toolchains in the
       Yocto Project development environment, see the
       ":ref:`sdk-manual/intro:the cross-development toolchain`"
-      section in the Yocto Project Overview and Concepts Manual. For
+      section in the Yocto Project Application Development and Software
+      Development Kits (SDK/eSDK) Manual. For
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
 
@@ -11270,7 +11271,8 @@ system and gives an overview of their function and contents.
       For background information on cross-development toolchains in the
       Yocto Project development environment, see the
       ":ref:`sdk-manual/intro:the cross-development toolchain`"
-      section in the Yocto Project Overview and Concepts Manual. For
+      section in the Yocto Project Application Development and Software
+      Development Kits (SDK/eSDK) Manual. For
       information on setting up a cross-development environment, see the
       :doc:`/sdk-manual/index` manual.
 
diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index 0868abe8c..e152abf98 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -142,7 +142,7 @@ the following types of tests:
    built by the OpenEmbedded build system on the target machine. See the
    :ref:`Testing Packages With
    ptest <test-manual/ptest:Testing Packages With ptest>` section
-   in the Yocto Project Development Tasks Manual and the
+   in the Yocto Project Test Environment Manual and the
    ":yocto_wiki:`Ptest </Ptest>`" Wiki page for more
    information on Ptest.
 
-- 
2.34.1


