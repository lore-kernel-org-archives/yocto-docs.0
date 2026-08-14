Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CBCC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:07:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23789.1786745253083838111
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Aug 2026 15:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=C/zMjOve;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: foundries.io, ip: 205.220.180.131, mailfrom: daiane.angolini@foundries.io)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EJrvML2613495
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 22:07:31 GMT
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g29k48fxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 22:07:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so1302272a91.0
        for <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 15:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1786745250; x=1787350050; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNz5H93H8OAAKhKuzHNo+/jiylHDL9lkH4nwRfoFvNo=;
        b=C/zMjOveNs3XoTQXccrgtyM4RTg3fY53jTnxR8FA8aJ5YyqKCyxDyBTBFWwsKKP29c
         AyckdQVqA//cZPtAAUm2iAl4YH+rvTCruS38ehdkbzCURd8fqm4gIbjRgDY78z9yIJps
         xoJxXJlbo2Iys9reAjdN7WV41URVGwDxDqm4iXz7Swhgm4CH3CkaAYPLX62S4Z17bvlZ
         RpBUtnNGsElzSJciNIYapEFEJVDeC9X/J4j0fZCcPy9wcrjh1Pge/8dkvvmjIK2HNBJO
         Eqc2/MllSNNTv3G06iY/gmKx35nKBtJCuovE1B88b/t8Wh2Nb5E1ORdwv23hZEa/ZQk+
         +L3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786745250; x=1787350050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNz5H93H8OAAKhKuzHNo+/jiylHDL9lkH4nwRfoFvNo=;
        b=XFSS43WELIdPUw4zTp81AK9X+BVmuLOQ86fKb2VsrEJ3Y46hhd+5YJgUpBXAVPfpL1
         nIgAq3jkWFxrhshISjAh88LNDqIm18aLwYfrxDlBoMj8qC/m2RMrKDx5VN9gjAliq+7t
         jqzifEtf99V51nNOxEzb1R3c0Jn7OgJaH29nroVJzdWTRZGI4ISEeqkoEQWB2yP8gEMf
         DeM7FA4lLYi1pPv/a6wqvHgoX2c0H99ye0aI6Q8jV4swbmESqd3OBqEHjW2t/8mGMwEI
         IJVQUolxmG0DOrMeNXDe67aSr6GgDJRFZgzQBUc4gKz+c/yW3TAweYrP8KxGV/c9S8Pj
         yhYg==
X-Gm-Message-State: AOJu0YxpNxQ2nOp8/sf4h1rQlRf5VwetUoBnV1E5C+KYPIi+e5qOMEI9
	023L6hFflpNiVwo+3jbczKQ+vB8oAQ8OLyndCWSHrLx974B9iiCPRv8113YXGfEdfxlEL05OouJ
	9+TxwMBt4tgiCnMOEwzVv9CvqlmCSuyO1BKPwrM9C7GdVpF3AsZIw0fvSNPfe0IlrFhs3b4n9
X-Gm-Gg: AR+sD10mhcmh6yXouaqUm8ngdsfB3u6MMR1oU3mNMqgCswKv31Sj9kUAM+JEzFFyEwe
	94X2vOn042VFnUru37lCAF8gaak/oaS6mTsm27LQwnaj0wBty189zhjzPo8hs3r9+/yVtPqPtRo
	vJtrZdve5Og1nl2fr+5pX1Dx4sMpzTs6ZTeN1BHctDCH6sxal19b7sXEb5/VQOloXKnhbhBlIvL
	0pBlxCvKOmJ3L/r/BmvJ9XhxSFFJG+t76Az1vRvHL6gG40uLGDs3XHSVkZpvYVPIldVd44zAwtv
	t8afOEFbf74RJp83Ci6E9jzMcWyfLU2Tksl2V9xjb2N9OcjRN74ZLup8EpD6bTSTVtFxNA34rpA
	DhZZq+HX7vIT2XhPJ/n8WjE30Zq5goPXMW/cKBJY/t4EBmVHKFw2qWAkp0fvuJVH1SDmI0Z8gAw
	==
X-Received: by 2002:a17:90b:274c:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-3931f583a5amr12183460a91.10.1786745250444;
        Fri, 14 Aug 2026 15:07:30 -0700 (PDT)
X-Received: by 2002:a17:90b:274c:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-3931f583a5amr12183424a91.10.1786745249907;
        Fri, 14 Aug 2026 15:07:29 -0700 (PDT)
Received: from lola.lan ([187.183.40.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm7181960eec.8.2026.08.14.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:07:29 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
X-Google-Original-From: Daiane Angolini <daiane.angolini@oss.qualcomm.com>
To: docs@lists.yoctoproject.org
Cc: daiane.angolini@foundries.io,
        Daiane Angolini <daiane.angolini@oss.qualcomm.com>
Subject: [PATCH] docs-wide: fix manual names in cross references
Date: Fri, 14 Aug 2026 19:07:19 -0300
Message-Id: <20260814220720.1115397-1-daiane.angolini@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE3MCBTYWx0ZWRfX42D5S3uolmor
 vHu7A6nHRoCZOguSebr3rFZ4n2WDdN1X54h/hAmQwI9QLT0CIZ+Sa3MW0QbGdWEuQIwgpZ/HWwj
 ELjs1P5vQF83F0JED5RRWgn/ZpQxgX8=
X-Authority-Analysis: v=2.4 cv=R6Mz39RX c=1 sm=1 tr=0 ts=6a7f91a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PIITv4rVe324bgT4salBLw==:17
 a=Sv0fKeRqtYgA:10 a=9UA2AVYIz8kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=hCNRlGYDnA9NzR-SBikA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4noT4MG5zHAvGGUCTXujOyRDqCmrjOgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE3MCBTYWx0ZWRfX/6tjT1D4nAAX
 yfOU24ngBZ935mE/+t/itsIrAS+PsuOZ7F3QEdXPSVRdMCnjL07U+zz5Hsi7mOqQSBrNyM8E/vX
 Og8tjCXJafdwmJ1pr4ZDhgxj3w6eCwMhm6KfwpPjxSvnsSPKSoBUWVt37AQw1A/AdJtw4O5ZdZ7
 oU2xXj00ZuA0IpQiToZQ6pO9LbZsJGn1GajGwCSrHiXwo3k/DwUXRtzVM1Geb18Y8J6XUIJZ3qF
 iRikMpGw5LouUkhTeQNTZQTqmQx6Ca807FyGlqmE08YGXUo/QHB512F4qvAtMqdZsOCUSVPwkYk
 5MtJCj5UH0laKRoPi3gF42g2cBe3sP4zXXkcxfL6pFUlHv8XGgAN30WPIjbRla7tmFmWQaEBoCV
 PwixGB/i+Aw6RDwCfDSf33C+frElSoBvO2PzJFCb7ibZpuJ6freA+BTKfBH2ye93g7vWIsnfhRG
 zBdME0/pGkTC9oHcF2Q==
X-Proofpoint-ORIG-GUID: 4noT4MG5zHAvGGUCTXujOyRDqCmrjOgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140170
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Aug 2026 22:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10292

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


